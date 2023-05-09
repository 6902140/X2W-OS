
#include "types.h"


long sys_open(const char *filename, int flags, int mode)
{
	kprintf("%s\n", __func__);

	return 0;
}

long sys_close(unsigned int fd)
{
	kprintf("%s\n", __func__);

	return 0;
}

int sys_read(unsigned int fd, char *buf, size_t count)
{
	kprintf("%s\n", __func__);

	return 0;
}

int sys_write(unsigned int fd, char *buf, size_t count)
{
	kprintf("%s\n", __func__);

	return 0;
}
