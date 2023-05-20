#include "sched.h"
#include "string.h"
#include "string.h"
#include "asm/csr.h"
#include "mm.h"
#include "types.h"
#include "trap/trapframe.h"
#include "current.h"
#include "irq.h"
#include "stdlist.h"
// extern struct task_struct* intr_cur;
/* 定义一个全局的就绪队列*/
static ktrapframe_t* task_ktrapframe(struct task_struct* tsk){
	unsigned long p;
	p=(unsigned long)tsk+THREAD_SIZE-sizeof(ktrapframe_t);
	return(ktrapframe_t*)p;
}

extern char idmap_pg_dir[];

struct ready_queue_base g_rq;

struct task_struct* oncpu;

struct task_struct *_pick_next_task(struct ready_queue_base *rq,
		struct task_struct *prev)
{
	const struct sched_class *class = &simple_sched_class;

	return class->pick_next_task(rq, prev);
}

void dequeue_task(struct ready_queue_base *rq, struct task_struct *p)
{
	const struct sched_class *class = &simple_sched_class;

	return class->dequeue_task(rq, p);
}

void enqueue_task(struct ready_queue_base *rq, struct task_struct *p)
{

	const struct sched_class *class = &simple_sched_class;

	return class->enqueue_task(rq, p);
}

void task_tick(struct ready_queue_base *rq, struct task_struct *p)
{
	const struct sched_class *class = &simple_sched_class;

	return class->task_tick(rq, p);
}

struct task_struct * switch_to(struct task_struct *prev,
		struct task_struct *next)
{
	if (prev == next)
		return NULL;
	
	return cpu_switch_to(prev, next);
}

/*
 * 处理调度完成后的一些收尾工作，由next进程来收拾
 * prev进程的烂摊子
 *
 * Note: 新创建进程第一次运行也会调用该函数来处理
 * prev进程的烂摊子
 * ret_from_fork->schedule_tail
 */
void schedule_tail(struct task_struct *prev)
{
	/* 打开中断 */
	raw_local_irq_enable();
}

void tick_handle_periodic(void)
{
	struct ready_queue_base *rq = &g_rq;

	task_tick(rq, oncpu);
	//kprintf("trrrrrrrrrrrrrrrrrrrrrr\n");
}

/* 检查是否在中断上下文里发生了调度，这是一个不好
 * 的习惯。因为中断上下文通常是关中断的，若发生
 * 调度了，CPU选择了next进程运行，CPU就运行在
 * next进程中，那么可能长时间处于关中断状态，这样
 * 时钟tick有可能丢失，导致系统卡住了
 */
static void schedule_debug(struct task_struct *p)
{
	if (in_atomic_preempt_off())
		kprintf("BUG: scheduling while atomic: %d, 0x%x\n",
				p->pid, preempt_count());
}

static void __schedule(void)
{
	struct task_struct *prev, *next, *last;
	struct ready_queue_base *rq = &g_rq;
	
	prev = oncpu;
	
	/* 检查是否在中断上下文中发生了调度 */
	
	schedule_debug(prev);

	/* 关闭中断包含调度器，以免中断发生影响调度器 */
	raw_local_irq_disable();
	
	//如果当前线程不是处在运行态，那么就将其直接从run_list中删除
	if (prev->state)
		dequeue_task(rq, prev);
	
	next = _pick_next_task(rq, prev);
	
	clear_task_resched(prev);
	
	if (next != prev) {
		oncpu=next;
		// kprintf("prev=0x%x,prev=0x%x\n",prev,get_phy_addr_by_virt((unsigned long)prev));
		// intr_cur=next;
		if(next->private_pgdir){
			reset_pgdir( get_phy_addr_by_virt(next->private_pgdir));
			kprintf("next pid[%d] reset pgdir\n",next->pid);
		}
		else{
			reset_pgdir(idmap_pg_dir);
		}
		unsigned long val = read_csr(sstatus);
	
		kprintf("schedule val=0b%b\n",val);
		kprintf("prev sstatus=0b%b,next sstatus=0b%b\n",task_ktrapframe(prev)->sstatus,task_ktrapframe(next)->sstatus);
		last = switch_to(prev, next);
		//kprintf("last=0x%x!!!!!!!!!!!!\n",last);
		//return;
		/*
		 * switch_to函数是用来切换prev进程到next进程。
		 * switch_to函数执行完成之后，已经切换到next
		 * 进程,整个栈和时空都发生变化了,不能使用这
		 * 里的prev变量来表示prev进程，只能通过risc-v
		 * 的a0寄存器来获取prev进程的task_struct。
		 *
		 * 在switch_to函数使用a0寄存器来传递prev进程
		 * task_struct,返回值也是通过a0寄存器，因此
		 * 这里last变量表示prev进程的task_struct
		 */
		rq->switches_num++;
		rq->curr = oncpu;
		//printk("%s current:%d, last %d\n", __func__, current->pid, last->pid);
		/* 由next进程来收拾last(prev进程)的现场 */
		
		schedule_tail(last);
	}
	else{
		//next->counter=(next->counter-1)/2;
		//kprintf("[[[[[[[[[[[[[[]]]]]]]]]]]]]]");
		/**
		 * 这里增加了切换线程的时候的策略
		 * 
		*/
		kprintf(":-> to be complished\n");
	}
}

/* 普通调度 */
void schedule(void)
{
	/* 关闭抢占，以免嵌套发生调度抢占*/
	preempt_disable();
	__schedule();
	preempt_enable();
}

/* 抢占调度
 *
 * 中断返回前会检查是否需要抢占调度
 */
void preempt_schedule_irq(void)
{
	/* this must be preemptible now*/
	if (preempt_count())
		kprintf("BUG: %s incorrect preempt count: 0x%x\n",
				__func__, preempt_count());

	/* 关闭抢占，以免嵌套发生调度抢占*/
	preempt_disable();
	/*
	 * 这里打开中断，处理高优先级中断，
	 * 中断比抢占调度优先级高。
	 *
	 * 若这里发生中断，中断返回后，前面关闭抢占
	 * 不会嵌套发生抢占调度
	 */
	raw_local_irq_enable();
	__schedule();
	raw_local_irq_disable();
	preempt_enable();
}

//将线程pcb指针加入就绪队列
void wake_up_process(struct task_struct *p)
{
	struct ready_queue_base *rq = &g_rq;

	p->state = TASK_RUNNING;

	enqueue_task(rq, p);
}


/**
 * 
 * struct ready_queue_base{
	list_t ready_list;
	uint64_t ready_task_num;
	uint64_t switches_num;
	struct task_struct* curr;
};
*/
void sched_init(void)
{
	// struct run_queue *rq = &g_rq;

	// INIT_LIST_HEAD(&rq->rq_head);
	// rq->nr_running = 0;
	// rq->nr_switches = 0;
	// rq->curr=NULL;
	
	struct ready_queue_base* rq=&g_rq;
	list_init(&rq->ready_list);
	rq->ready_task_num=0;
	rq->switches_num=0;
	rq->curr=NULL;
}
