#include "trap/tfoffset.h"
#include "processor.h"
#include "asm/csr.h"
/**
 * @brief `ktrap_enter`是`SBI`的陷入入口函数, C语言描述为`void ktrap_enter(void)`
 * 
 * @note `ktrap_enter`函数的作用:
 *  1. 保存现场: 将通用寄存器和一些csr寄存器保存到陷入栈中
 *  2. 读取中断/异常号, 以作为参数调用`ktrap_dispatcher`函数处理异常
 * 
 * @note 
 *  1. `ktrap_enter`的地址将保存到`stvec`寄存器中, 具体由`ktrap.c`的`ktrap_init`函数实现
 *  2. `stvec`的直接模式`mode = 0`要求`ktrap_enter`的地址要4字节对齐, 这里是8字节对齐
 *  3. 在`ktrap_init`将`stvec`的中断向量值设置为`ktrap_enter`的地址后, 未来发生了异常就会进入到该`ktrap_enter`函数中运行
 *  4. 但是`RISC-V`的异常默认是在`M模式`下处理的, 异常处理涉及到的寄存器只能在`M模式`下设置和访问;
 *     如果`S模式`想要使用某个功能，需要再`M模式`下先对指定的中断和异常委托到`S模式`, 而当指定的中断和异常发生时, 就会进入到`S模式`中进行处理
 *     从而实现了`S模式`调用`M模式`提供的功能
 */
.align 3
.global ktrap_enter
ktrap_enter:

	csrrw tp,sscratch,tp/*从sscratch寄存器中读取tp*/
	bnez tp,_save_user_sp

_save_kernel_sp:
	csrr tp,sscratch
	sd sp,TASK_TI_KERNEL_SP(tp)
_save_user_sp:
	
	sd sp,TASK_TI_USER_SP(tp)
	ld sp,TASK_TI_KERNEL_SP(tp)/*读取内核栈栈底指针*/


	addi sp, sp, -(KTF_SIZE)
	/*保存中断栈帧 trampframe_t*/
	sd x1,  KTF_RA(sp)
	sd x3,  KTF_GP(sp)
	sd x5,  KTF_T0(sp)
	sd x6,  KTF_T1(sp)
	sd x7,  KTF_T2(sp)
	sd x8,  KTF_S0(sp)
	sd x9,  KTF_S1(sp)
	sd x10, KTF_A0(sp)
	sd x11, KTF_A1(sp)
	sd x12, KTF_A2(sp)
	sd x13, KTF_A3(sp)
	sd x14, KTF_A4(sp)
	sd x15, KTF_A5(sp)
	sd x16, KTF_A6(sp)
	sd x17, KTF_A7(sp)
	sd x18, KTF_S2(sp)
	sd x19, KTF_S3(sp)
	sd x20, KTF_S4(sp)
	sd x21, KTF_S5(sp)
	sd x22, KTF_S6(sp)
	sd x23, KTF_S7(sp)
	sd x24, KTF_S8(sp)
	sd x25, KTF_S9(sp)
	sd x26, KTF_S10(sp)
	sd x27, KTF_S11(sp)
	sd x28, KTF_T3(sp)
	sd x29, KTF_T4(sp)
	sd x30, KTF_T5(sp)
	sd x31, KTF_T6(sp)

	//ld s0, TASK_TI_USER_SP(tp)
	//sd s0, KTF_SP(sp)

	/*读取此时sstatus寄存器的值保存到ktrapfram*/
	csrr s1, sstatus
	sd s1, KTF_SSTATUS(sp)

	/*保存sepc*/
	csrr s2, sepc
	sd s2, KTF_SEPC(sp)
	
	/*保存sbadaddr*/
	csrr s3, sbadaddr
	sd s3, KTF_SBADADDR(sp)

	/*保存scause*/
	csrr s4, scause
	sd s4, KTF_SCAUSE(sp)

	/*保存ssratch*/
	csrr s5, sscratch
	sd s5, KTF_TP(sp)

	/*保存SP*/
	addi s0, sp, KTF_SIZE 
	sd s0, KTF_SP(sp)

	csrw sscratch, x0

	la ra, ktrap_exit

	mv a0, sp /* pt_regs */
	mv a1, s4

	/*行为一摸一样*/
	tail ktrap_dispatcher


/**
 * @brief `ktrap_exit`是`SBI`的陷入入口函数, C语言描述为`void ktrap_exit(void)`
 * 
 * @note `ktrap_exit`函数的作用:
 *  1. 恢复现场: 将`ktrap_enter`中得到的到陷入栈中的通用寄存器和一些csr寄存器的值加载到对应的寄存器中
 */
.global ktrap_exit
ktrap_exit:/*相当于ret_from_exception*/
	ld s0, KTF_SSTATUS(sp)


	csrc sstatus,SR_SIE/*将状态寄存器sstatus中的SR_SIE位清零，禁止中断*/
	
	/*判断此时是否是内核态触发的中断：*/

	andi s0,s0,SR_SPP/*安装位与操作*/

	bnez s0,ret_to_kernel

	/*SR_SPP:1内核态，0用户态*/

ret_to_user:
	lw s0,TASK_TI_NEED_RESCHED(tp)
	andi s0,s0,_TIF_NEED_RESCHED
	bnez s0,work_resched

no_work_pending:
	/* 这里马上要返回到用户态了
	   1. 要把内核态的sp保存到task_struct->kernel_sp
	   2. 把task_struct的指针保存到sscratch，下回从用户态陷入到
	      内核态时候，就能获取task_struct的指针
	 */
	addi s0, sp, KTF_SIZE
    sd s0, TASK_TI_KERNEL_SP(tp)
	csrw sscratch, tp
	j restore_all

work_resched:
	call schedule
	j no_work_pending 

ret_to_kernel:
        /*判断当前内核是否 处于 不可抢占状态，
	  preempt_count > 0表示不可抢占状态*/
	lw s0, TASK_TI_PREEMPT_COUNT(tp)
	bnez s0, restore_all

need_resched:
	/*判断是否要抢占当前进程*/
	lw s0, TASK_TI_NEED_RESCHED(tp)
	andi s0, s0, _TIF_NEED_RESCHED
	beqz s0, restore_all
	/*准备抢占当前进程*/
	call preempt_schedule_irq
	j need_resched
restore_all:
	/*恢复中断现场*/
	/*kernel_exit*/
	ld a0, KTF_SSTATUS(sp)
	csrw sstatus, a0

	ld a2, KTF_SEPC(sp)
	csrw sepc, a2

	ld x1,  KTF_RA(sp)
	ld x3,  KTF_GP(sp)
	ld x4,  KTF_TP(sp)
	ld x5,  KTF_T0(sp)
	ld x6,  KTF_T1(sp)
	ld x7,  KTF_T2(sp)
	ld x8,  KTF_S0(sp)
	ld x9,  KTF_S1(sp)
	ld x10, KTF_A0(sp)
	ld x11, KTF_A1(sp)
	ld x12, KTF_A2(sp)
	ld x13, KTF_A3(sp)
	ld x14, KTF_A4(sp)
	ld x15, KTF_A5(sp)
	ld x16, KTF_A6(sp)
	ld x17, KTF_A7(sp)
	ld x18, KTF_S2(sp)
	ld x19, KTF_S3(sp)
	ld x20, KTF_S4(sp)
	ld x21, KTF_S5(sp)
	ld x22, KTF_S6(sp)
	ld x23, KTF_S7(sp)
	ld x24, KTF_S8(sp)
	ld x25, KTF_S9(sp)
	ld x26, KTF_S10(sp)
	ld x27, KTF_S11(sp)
	ld x28, KTF_T3(sp)
	ld x29, KTF_T4(sp)
	ld x30, KTF_T5(sp)
	ld x31, KTF_T6(sp)

	ld x2,  KTF_SP(sp)
	sret
	






