#include "test/test_thread.h"
#include "sched.h"
#include "string.h"

#define DELAY_TIME 80000

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
		kprintf("%s: %ld\n", __func__, i++);
	}
}

void user_thread2(void)
{
	unsigned long y = 0;
	while (1) {
		delay(DELAY_TIME);
		kprintf("%s: %s + %llu\n", __func__, "abcde", y++);
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
    kprintf("here!\n");
    int pid = do_fork(PF_KTHREAD, (unsigned long)&move_thread1, 0);
	if (pid < 0)
		kprintf("create thread fail\n");
	kprintf("*****************pid %d created sccessful****************\n\n", pid);

	pid = do_fork(PF_KTHREAD, (unsigned long)&move_thread2, 0);
	if (pid < 0)
		kprintf("create thread fail\n");
	
	kprintf("***************pid %d created successful ****************\n\n", pid);

	pid = do_fork(PF_KTHREAD, (unsigned long)&user_thread, 0);
       if (pid < 0)
               kprintf("create thread fail\n");

	kprintf("***********pid %d created successful***************\n\n", pid);
	//schedule();
    kprintf("\t******************test of create thread sccuessfully finished************\n\n");
	return 0;
}