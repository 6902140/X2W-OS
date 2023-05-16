#ifndef __CURRENT_H
#define __CURRENT_H
#include "types.h"
extern size_t kprintf(const char* format, ...);

static struct task_struct *get_current(void)
{
	
	register struct task_struct *tp __asm__("tp");
	// kprintf("current pcb is 0x%x\n",tp);
	return tp;
}

#define current get_current()

#endif