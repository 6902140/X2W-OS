#include "test/test_thread.h"
#include "sched.h"
#include "string.h"

#define DELAY_TIME 8000

static int record=0;

static inline void delay(unsigned int n)
{
	while(n--)
		;
}




void user_thread1(void)
{
	unsigned long i = 0;
	while (1) {
		delay(DELAY_TIME);
		kprintf("\n\t***%s: %ld***\t\n", __func__, i++);
		record++;
		if(record>15){
			 kprintf("\n******test thread and switch successful\n");
			return;
		}
		if(i>3){
			schedule();
		}
	}
}

void user_thread2(void)
{
	unsigned long y = 0;
	while (1) {
		delay(DELAY_TIME);
		record++;
		if(record>15){
			kprintf("\n******test thread and switch successful******\n");
			return;
		}
		kprintf("\n\t***%s: %s + %llu***\t\n", __func__, "abcde", y++);
		if(y>5){
			schedule();
		}
	}
}

int run_new_clone_thread(void *arg)
{
	unsigned long i = 0;

	while (1) {
		delay(DELAY_TIME);
		kprintf("%s %llu\n", __func__, i++);
	}
	return 0;
}


int run_user_thread(void)
{
	unsigned long child_stack;
	//int ret;
	unsigned long i = 0;

	child_stack = (unsigned long)malloc_a_page();
	if (child_stack < 0) {
		kprintf("cannot allocate memory\n");
		return -1;
	}

	kprintf("malloc success 0x%x\n", child_stack);

	child_stack = (unsigned long)malloc_a_page();
	if (child_stack < 0)
		kprintf("cannot allocate memory\n");

	memset((void *)child_stack, 0, PAGE_SIZE);

	kprintf("child_stack 0x%x\n", child_stack);

	// ret = clone(&run_new_clone_thread,
	// 		(void *)(child_stack + PAGE_SIZE), 0, NULL);
	// if (ret < 0) {
	// 	kprintf("%s: error while clone\n", __func__);
	// 	return ret;
	// }

	// kprintf("clone done, 0x%llx 0x%llx\n", &run_new_clone_thread, child_stack + PAGE_SIZE);

	while (1) {
		delay(DELAY_TIME);
		kprintf("%s: %llu\n", __func__, i++);
	}

	return 0;
}

void user_thread(void)
{

       if (move_to_user_space((unsigned long)&run_user_thread))
               kprintf("error move_to_user_space\n");
}

void move_thread1(void)
{

       if (move_to_user_space((unsigned long)&user_thread1))
               kprintf("error move_to_user_space\n");
}

void move_thread2(void)
{

       if (move_to_user_space((unsigned long)&user_thread2))
               kprintf("error move_to_user_space\n");
}

int test_thread(void){
    kprintf("here! start test thread\n");
    int pid1 = do_fork(PF_KTHREAD, (unsigned long)&user_thread1, 0);
	
	if (pid1 < 0)
		kprintf("create thread fail\n");
	kprintf("*****************pid %d created sccessful****************\n\n", pid1);

	int pid2 = do_fork(PF_KTHREAD, (unsigned long)&user_thread2, 0);
	if (pid2 < 0)
		kprintf("create thread fail\n");
	
	kprintf("***************pid %d created successful ****************\n\n", pid2);

	
	struct task_struct *next = g_task[pid2];

	//schedule();
    kprintf("\t******************test of create thread sccuessfully finished************\n\n");
	switch_to(current,next);
	//int pid1=do_fork(PF_KTHREAD,(unsigned long)&user_thread1,0);
	return 0;
}