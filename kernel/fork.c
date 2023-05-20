#include "sched.h"
#include "string.h"
#include "string.h"
#include "asm/csr.h"
#include "mm.h"
#include "stdlist.h"
#include "types.h"
#include "trap/trapframe.h"
#include "current.h"
#include "irq.h"
extern int TASK_READY;

/**
 * 把0号进程的内核栈 编译链接到.data.init_task段中 
 * 这段代码是一个预处理宏，它使用 'GCC' 编译器的 attribute 特性来将被注释的数据放置在最终可执行文件的特定段中。
 * 具体来说，该宏将 __init_task_data 定义为位于 .data.init_task 段中的属性。
 * 这意味着使用 __init_task_data 注释的任何数据变量或对象都将被放置在最终二进制文件的 .data.init_task 段中。
 * 
*/
#define __init_task_data __attribute__((__section__(".data.init_task")))

/* 0号进程为init进程 */
union task_union init_task_union __init_task_data
			= {INIT_TASK(init_task_union.task)};

/* 定义一个全局的task_struct数组来存放进程的PCB*/
struct task_struct *g_task[NR_TASK] = {&init_task_union.task,};

unsigned long total_forks;


/*找到一个g_task中空闲的任务*/
static int find_empty_task(void)
{
	int i;

	for (i = 0 ; i < NR_TASK; i++) {
		if (!g_task[i])
			return i;
	}

	return -1;
}


static ktrapframe_t* task_ktrapframe(struct task_struct* tsk){
	unsigned long p;
	p=(unsigned long)tsk+THREAD_SIZE-sizeof(ktrapframe_t);
	return(ktrapframe_t*)p;
}

/*
 * 设置子进程的上下文信息
 */
static int copy_thread(unsigned long clone_flags, struct task_struct *p,
		unsigned long fn, unsigned long arg)
{
    ktrapframe_t *childregs;
	
	//获取栈帧位置
	childregs = task_ktrapframe(p);
	
	memset(childregs, 0, sizeof(ktrapframe_t));

	memset(&p->cpu_context, 0, sizeof(struct cpu_context));
	
	if (clone_flags & PF_KTHREAD) {
		const register unsigned long gp __asm__ ("gp");
		//childregs->gp = gp;
		childregs->gregisters.gp=gp;

		childregs->sstatus = SR_SPP | SR_SPIE;

		p->cpu_context.s[0] = fn; /* fn */
		p->cpu_context.s[1] = arg;

		p->cpu_context.ra = (unsigned long)ret_from_kernel_thread;
	} else {
		*childregs = *task_ktrapframe(oncpu);
		childregs->gregisters.a0 = 0;
		if (fn)
			childregs->gregisters.sp = fn;

		p->cpu_context.ra = (unsigned long)ret_from_fork;
	}

	p->cpu_context.sp = (unsigned long)childregs; /* kernel sp */

	return 0;
}

/*
 * fork一个新进程
 * 1. 新建一个task_strut。 分配4KB页面用来存储内核栈,
 * task_struct在栈底。
 * 2. 分配PID
 * 3. 设置进程的上下文
 */
int do_fork(unsigned long clone_flags, unsigned long fn, unsigned long arg)
{
	struct task_struct *p;
	int pid;
	/*1.分配一个4KB的内存页*/
	//修改代码，修改为malloc_a_page而不是直接获取物理页
	p = (struct task_struct *)malloc_pages(1,1);
	
	if (!p)
		goto error;
	/*初始化该页面*/
	
	memset(p, 0, sizeof(*p));
	// for(int i=0;i<sizeof(*p);i++){
	// 	*((uint8_t*)(p)+i)=0;
	// }
	/*2.开始分配一个pid给该线程*/
	pid = find_empty_task();
	kprintf("fetch a pid=%d\n",pid);
	TASK_READY++;
	//kprintf("pid=%d\n",pid);
	if (pid < 0)
		goto error;

	/*赋值进程的上下文信息*/
	if (copy_thread(clone_flags, p, fn, arg))
		goto error;
	kprintf("!!------------------!!\n");
	p->state = TASK_RUNNING;
	p->pid = pid;


	p->need_resched = 0;
	p->preempt_count = 0;
	p->priority = 2;
	total_forks++;
	
	/*自此建立pid和pcb的联系*/
	g_task[pid] = p;
	//create_user_vaddr_bitmap(p);
	if ((clone_flags & PF_KTHREAD)){
		kprintf("ok start to move to user space\n");
		
		//move_to_user_space(fn,p);
		
		kprintf("*pid[%d]*: move to user space success,pgdir vaddr=0x%x\n",p->pid,p->private_pgdir);
	}

	kprintf("---thread pid[%d] bitmap alloc successfully!!!---\n",pid);

	SET_LINKS(p);
	
	wake_up_process(p);

	return pid;

error:
	return -1;
}


/**
 * 这段代码定义了一个名为 start_user_thread 的函数，用于启动一个新的用户线程。
 * 函数的参数包括一个指向 pt_regs 结构体的指针 regs，以及用户线程的起始地址 pc 和堆栈指针 sp。
 * 首先，函数调用 memset 函数将 regs 指向的 pt_regs 结构体的所有成员都清零，以便在之后的操作中正确地初始化这些成员。
 * 然后，函数将 pc 和 sp 的值分别赋值给 pt_regs 结构体中的 sepc 和 sp 成员。sepc 表示程序计数器的值，即用户线程的起始地址，而 sp 则表示用户线程的堆栈指针。
 * 接下来，函数调用 read_csr 函数读取当前 CPU 的状态寄存器的值，并将其赋值给 pt_regs 结构体中的 sstatus 成员。然后，函数将 sstatus 成员的 SR_SPP 位清零，
 * 以便将 CPU 的特权级设置为用户级别。这是因为用户线程在运行时需要在用户级别下执行，而不是在内核级别下执行。
 * 最后，函数调用 kprintf 函数打印输出 sstatus、sp 和 sepc 三个成员的值，以便在调试时检查它们是否正确设置。
 * 
*/
static void start_user_thread(ktrapframe_t *regs, unsigned long pc,
		unsigned long sp,struct task_struct* tsk)
{
	unsigned long val;
	memset(regs, 0, sizeof(*regs));
	regs->sepc = pc;
	regs->gregisters.sp = sp;

	val = read_csr(sstatus);
	regs->sstatus = val &~ SR_SPP;
	create_user_vaddr_bitmap(tsk);
	tsk->private_pgdir=create_page_dir();
	kprintf("sstatus 0x%llx sp 0x%llx  pc 0x%llx\n", regs->sstatus, regs->gregisters.sp, regs->sepc);
}


/**
 * 这段代码定义了一个名为 move_to_user_space 的函数，用于将当前进程切换到用户空间运行。函数的参数 pc 是用户线程的起始地址，也就是用户程序的入口点。
 * 函数首先调用 task_pt_regs 函数获取当前进程的 pt_regs 结构体，然后调用 get_free_page 函数分配一个空闲页面，用于作为用户线程的内核栈。
 * 如果分配页面失败，则函数返回 -1，表示切换到用户空间失败。否则，函数调用 memset 函数将新分配的页面清零，以便在之后的操作中正确地初始化这些页面。
 * 接着，函数调用 start_user_thread 函数，将当前进程的 pt_regs 结构体、用户线程的起始地址 pc 和用户线程的内核栈地址 stack + PAGE_SIZE 作为参数传递给 start_user_thread 函数。函数返回 0，表示切换到用户空间成功。
 * 总的来说，这段代码的作用是为当前进程分配一个新的内核栈，并将当前进程切换到用户空间运行。通过将 pt_regs 结构体、用户线程的起始地址和内核栈地址传递给 start_user_thread 函数，可以在用户空间运行新的用户线程。
 * 
*/
int move_to_user_space(unsigned long pc,struct task_struct* tsk)
{
	ktrapframe_t *regs;
	unsigned long stack;

	regs = task_ktrapframe(tsk);

	stack = malloc_pages(1,1);
	//to do

	if (!stack)
		return -1;

	memset((void *)stack, 0, PAGE_SIZE);
	
	start_user_thread(regs, pc, stack + PAGE_SIZE,tsk);

	return 0;
}
