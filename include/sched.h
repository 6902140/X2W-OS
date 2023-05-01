
#ifndef __SCHED_H

#include "mm.h"
#include "list.h"
#include "types.h"
#include "trap/trapframe.h"
#include "current.h"



#define THREAD_SIZE  (1 * PAGE_SIZE)
#define NR_TASK 128

/**
 * @brief 'cpu_context' 是进程/线程切换时的保存的上下文
 * 
 * @note 保存的寄存器主要有ra，sp以及12个通用寄存器
 * 
 */
struct cpu_context {
	unsigned long ra;
	unsigned long sp;	/* 栈指针 */

	/* 函数调用必须要保存的通用寄存器 */
	unsigned long s[12];	/* s[0] 是FP */
};



struct task_struct;
struct run_queue;


/**
 * 使用类似C语言的函数指针实现一个调度类
*/
struct sched_class {
	const struct sched_class *next;
	void (*task_fork)(struct task_struct *p);
	void (*enqueue_task)(struct run_queue *rq, struct task_struct *p);
	void (*dequeue_task)(struct run_queue *rq, struct task_struct *p);
	void (*task_tick)(struct run_queue *rq, struct task_struct *p);
	struct task_struct * (*pick_next_task)(struct run_queue *rq,
			struct task_struct *prev);
};

struct run_queue {
	struct list_head rq_head;
	unsigned int nr_running;
	uint64_t nr_switches;
	struct task_struct *curr;
};






/**
 * @brief 'task_state' 是一个用来表征进程/线程状态的枚举类型
 * 
 * @note 主要有TASK_RUNNING = 0,TASK_INTERRUPTIBLE = 1,TASK_UNINTERRUPTIBLE = 2,TASK_ZOMBIE = 3,TASK_STOPPED = 4,
 *      TASK_RUNNING：表示任务正在运行。
 *      TASK_INTERRUPTIBLE：表示任务正在等待某些事件的发生，如果事件发生，它会被唤醒。
 *      TASK_UNINTERRUPTIBLE：表示任务正在等待某些事件的发生，如果事件发生，它不会被唤醒。
 *      TASK_ZOMBIE：表示任务已经终止，但是它的父进程还没有处理完它的退出状态。
 *      TASK_STOPPED：表示任务已经停止
 * 
 */
enum task_state {
	TASK_RUNNING = 0,
	TASK_INTERRUPTIBLE = 1,
	TASK_UNINTERRUPTIBLE = 2,
	TASK_ZOMBIE = 3,
	TASK_STOPPED = 4,
};



enum task_flags {
	PF_KTHREAD = 1 << 0,
};





/* 进程PCB */
struct task_struct {
	struct cpu_context cpu_context;

	/*preempt_count 是一个表示内核抢占计数的变量。
	在 Linux 内核中，抢占是指内核可以强制剥夺当前进程的 CPU 使用权，将 CPU 分配给其他更高优先级的进程或者内核线程使用。
	这种强制剥夺发生的原因可能是时钟中断或者其他事件的发生。
	
	preempt_count 也用于防止嵌套的抢占。如果当前进程被抢占时，
	内核会增加 preempt_count 的值，并将抢占标志设置为真。如果在被抢占的代码段中有新的抢占事件发生，
	内核将不会再次抢占当前进程，从而避免出现嵌套抢占的情况，提高代码的可靠性和稳定性。*/
	int preempt_count;
	
	/*need_resched 是一个表示当前进程是否需要被调度的标志。当 need_resched 被设置为非零值时，表示当前进程需要被调度，
	调度器会尽快将 CPU 分配给其他进程执行。*/
	int need_resched;

	unsigned long kernel_sp;
	unsigned long user_sp;
	enum task_state state;
	enum task_flags flags;
	int pid;
	struct list_head run_list;
	int counter;
	int priority;
	struct task_struct *next_task;
	struct task_struct *prev_task;

};


/*
 * task_struct数据结构存储在内核栈的底部
 */
union task_union {
	struct task_struct task;
	unsigned long stack[THREAD_SIZE/sizeof(long)];
};



#define DEF_COUNTER 10

/* 0号进程即init进程 */
#define INIT_TASK(task) \
{                      \
	.state = 0,     \
	.priority = 10,   \
	.counter = DEF_COUNTER, \
	.flags = PF_KTHREAD,   \
	.pid = 0,     \
	.preempt_count = 0, \
	.need_resched = 0, \
	.next_task = (struct task_struct *)&task, \
	.prev_task = (struct task_struct *)&task, \
}



extern struct task_struct *g_task[];

//定义一个外部初始任务·
extern union task_union init_task_union;

#define init_task (init_task_union.task)

#define SET_LINKS(p) do { \
	(p)->next_task = &init_task; \
	(p)->prev_task = init_task.prev_task; \
	init_task.prev_task->next_task = (p); \
	init_task.prev_task = (p); \
	} while (0)


#define for_each_task(p) \
	for (p = &init_task; (p = p->next_task) != &init_task; )

extern const struct sched_class simple_sched_class;

extern void ret_from_kernel_thread(void);
extern void ret_from_fork(void);

int do_fork(unsigned long clone_flags, unsigned long fn, unsigned long arg);

struct task_struct * switch_to(struct task_struct *prev,
		struct task_struct *next);

/*cpu_switch*/
extern struct task_struct *cpu_switch_to(struct task_struct *prev,
					 struct task_struct *next);

void sched_init(void);

void schedule(void);

void task_tick(struct run_queue *rq, struct task_struct *p);

void enqueue_task(struct run_queue *rq, struct task_struct *p);

struct task_struct *_pick_next_task(struct run_queue *rq,
		struct task_struct *prev);

void tick_handle_periodic(void);

void wake_up_process(struct task_struct *p);

int move_to_user_space(unsigned long pc);

static inline void clear_task_resched(struct task_struct *p)
{
	p->need_resched = 0;
}



#define need_resched() (current->need_resched == 1)

#define PREEMPT_BITS	8
#define HARDIRQ_BITS	4

#define PREEMPT_SHIFT	0
#define HARDIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)

#define PREEMPT_OFFSET	(1UL << PREEMPT_SHIFT)
#define HARDIRQ_OFFSET	(1UL << HARDIRQ_SHIFT)

#define __IRQ_MASK(x)	((1UL << (x))-1)
#define PREEMPT_MASK	(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
#define HARDIRQ_MASK	(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)

#define preempt_count() (current->preempt_count)

#define hardirq_count()	(preepmt_count() & HARDIRQ_MASK)

#define in_atomic_preempt_off() \
	(preempt_count() != 1)

static inline void preempt_disable(void)
{
	current->preempt_count++;
}

static inline void preempt_enable(void)
{
	current->preempt_count--;
}

static inline void preempt_add(int val)
{
	current->preempt_count += val;
}

static inline void preempt_sub(int val)
{
	current->preempt_count -= val;
}

#define __irq_enter() preempt_add(HARDIRQ_OFFSET)
#define __irq_exit() preempt_sub(HARDIRQ_OFFSET)

#endif  /* __ASSEMBLY__ */
