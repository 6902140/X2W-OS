#ifndef __CURRENT_H
#define __CURRENT_H

static struct task_struct *get_current(void)
{
	register struct task_struct *tp __asm__("tp");
	return tp;
}

#define current get_current()

#endif