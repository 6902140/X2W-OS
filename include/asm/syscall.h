#ifndef _ASM_SYSCALL_H
#define _ASM_SYSCALL_H

#include"trap/trapframe.h"

typedef long (*syscall_fn_t)(ktrapframe_t*);

extern const syscall_fn_t syscall_table[];

void riscv_svc_handle(ktrapframe_t* regs);

#endif