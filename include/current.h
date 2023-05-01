#ifndef __CURRENT_H
#define __CURRENT_H

static struct task_struct *get_current(void)
{
	kprintf("heeeeeeeeeeeeeerebb!\n");
	register struct task_struct *tp __asm__("tp");
	kprintf("tp=%u\n",tp);
	return tp;
}

#define current get_current()

#endif