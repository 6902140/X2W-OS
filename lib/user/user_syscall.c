

#include "user/syscall.h"


extern unsigned long syscall(int nr, ...);

unsigned long malloc(void);

extern int __clone(int (*fn)(void *arg), void *child_stack,
		int flags, void *arg);
extern unsigned long syscall(int nr, ...);

int clone(int (*fn)(void *arg), void *child_stack,
		int flags, void *arg);


int clone(int (*fn)(void *arg), void *child_stack,
		int flags, void *arg)
{

	return __clone(fn, child_stack, flags, arg);
}

unsigned long malloc(void)
{
	return syscall(__NR_malloc);
}
