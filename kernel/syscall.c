#include"trap/trapframe.h"
#include"asm/syscall.h"
#include "user/syscall.h"
#define __SYSCALL(nr, sym) [nr] = (syscall_fn_t)__riscv_##sym,



static long sys_ni_syscall(ktrapframe_t* regs){

    return -1;

}

static void invoke_syscall(
    ktrapframe_t*regs,
    int syscall_no,
    int syscall_nr,
    const syscall_fn_t syscall_table[])
{
    long ret;
	syscall_fn_t fn;

	if (syscall_no < syscall_nr) {
		fn = syscall_table[syscall_no];
		ret = fn(regs);
	} else {
		ret = sys_ni_syscall(regs);
	}

	regs->gregisters.a0 = ret;
}

static void riscv_syscall_common(ktrapframe_t *regs, int syscall_no,
		int syscall_nr, const syscall_fn_t syscall_table[])
{
	regs->origin_a0 = regs->gregisters.a0;//a0;

	invoke_syscall(regs, syscall_no, syscall_nr, syscall_table);
}


void riscv_svc_handler(ktrapframe_t*regs)
{
	return riscv_syscall_common(regs, regs->gregisters.a7,
			__NR_syscalls, syscall_table);
}

long __riscv_sys_open(ktrapframe_t*regs)
{
	return sys_open((const char *)regs->gregisters.a0,
			regs->gregisters.a1, regs->gregisters.a2);

}

long __riscv_sys_close(ktrapframe_t*regs)
{
	return sys_close(regs->gregisters.a0);

}

long __riscv_sys_read(ktrapframe_t*regs)
{
	return sys_read(regs->gregisters.a0, (char *)regs->gregisters.a1,
			regs->gregisters.a2);

}

long __riscv_sys_write(ktrapframe_t*regs)
{
	return sys_write(regs->gregisters.a0, (char *)regs->gregisters.a1,
			regs->gregisters.a2);

}

long __riscv_sys_clone(ktrapframe_t*regs)
{
	return do_fork(regs->gregisters.a0, regs->gregisters.a1,
			regs->gregisters.a2);
}

long __riscv_sys_malloc(ktrapframe_t*regs)
{
	unsigned long addr;

	addr = get_free_page();//暂时没有写在用户空间分配页的函数，暂且先内核页表做测试
	if (!addr)
		return -1;

	return addr;
}



/*
 * 创建一个系统调用表syscall_table
 * 每个表项是一个函数指针syscall_fn_t
 */
const syscall_fn_t syscall_table[__NR_syscalls] = {
	__SYSCALL(__NR_open, sys_open)
	__SYSCALL(__NR_close, sys_close)
	__SYSCALL(__NR_read, sys_read)
	__SYSCALL(__NR_write, sys_write)
	__SYSCALL(__NR_clone, sys_clone)
	__SYSCALL(__NR_malloc, sys_malloc)
};



