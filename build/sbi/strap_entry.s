# 0 "sbi/strap_entry.S"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "sbi/strap_entry.S"
# 1 "include/trap/tfoffset.h" 1
# 15 "include/trap/tfoffset.h"
# 1 "include/constrains.h" 1
# 16 "include/trap/tfoffset.h" 2
# 2 "sbi/strap_entry.S" 2
# 19 "sbi/strap_entry.S"
.align 3
.global strap_enter
strap_enter:
    # 从mscratch获取M模式的sp，把先前模式(S模式)的sp保存到mscratch寄存器中, 即交换M模式的栈顶指针和先前模式的栈顶指针
 # 此后, sp寄存器保存的是M模式的栈顶指针
 csrrw sp, mscratch, sp

    # 栈顶指针向上移动一个trap frame
 addi sp, sp, -(264)

    # 存储trap frame具体的值, 具体先保存通用寄存器, 然后保存 csr 寄存器
 sd x1, 8(sp)
 sd x3, 24(sp)
 sd x5, 40(sp)
 sd x6, 48(sp)
 sd x7, 56(sp)
 sd x8, 64(sp)
 sd x9, 72(sp)
 sd x10, 80(sp)
 sd x11, 88(sp)
 sd x12, 96(sp)
 sd x13, 104(sp)
 sd x14, 112(sp)
 sd x15, 120(sp)
 sd x16, 128(sp)
 sd x17, 136(sp)
 sd x18, 144(sp)
 sd x19, 152(sp)
 sd x20, 160(sp)
 sd x21, 168(sp)
 sd x22, 176(sp)
 sd x23, 184(sp)
 sd x24, 192(sp)
 sd x25, 200(sp)
 sd x26, 208(sp)
 sd x27, 216(sp)
 sd x28, 224(sp)
 sd x29, 232(sp)
 sd x30, 240(sp)
 sd x31, 248(sp)

    # 保存csr寄存器: mepc 寄存器
 csrr t0, mepc
 sd t0, 0(sp)

    # 保存csr寄存器: mstatus 寄存器
 csrr t0, mstatus
 sd t0, 265(sp)






    # 让t0指向M模式的栈底部, 注意此时sp指向的还是M模式的栈顶指针
 addi t0, sp, 264
    # 此时的sp寄存器保存的是M模式的栈顶指针, mscratch保存的是S模式的SP
 # 下面这句话把S模式的栈顶指针保存到t0寄存器中, 而后把M模式的栈顶指针(t0中的而非sp中的)保存到mscratch寄存器中
 csrrw t0, mscratch, t0
    # 然后把S模式的栈顶指针保存到陷入帧中
 sd t0, 16(sp)

    # 跳转到strap.c的strap_dispatcher函数处理不同的异常/中断
    # RISC-V的传参方式, 前几个参数存入argument 0~7 寄存器, 这里把M模式SP, 即strapframe_t给strap_dispatcher函数
 mv a0, sp
 call strap_dispatcher
    j strap_exit
# 95 "sbi/strap_entry.S"
.global strap_exit
strap_exit:

 ld t0, 265(sp)
 csrw mstatus, t0

 ld t0, 0(sp)
 csrw mepc, t0

 ld x1, 8(sp)
 ld x3, 24(sp)
 ld x5, 40(sp)
 ld x6, 48(sp)
 ld x7, 56(sp)
 ld x8, 64(sp)
 ld x9, 72(sp)
 ld x10, 80(sp)
 ld x11, 88(sp)
 ld x12, 96(sp)
 ld x13, 104(sp)
 ld x14, 112(sp)
 ld x15, 120(sp)
 ld x16, 128(sp)
 ld x17, 136(sp)
 ld x18, 144(sp)
 ld x19, 152(sp)
 ld x20, 160(sp)
 ld x21, 168(sp)
 ld x22, 176(sp)
 ld x23, 184(sp)
 ld x24, 192(sp)
 ld x25, 200(sp)
 ld x26, 208(sp)
 ld x27, 216(sp)
 ld x28, 224(sp)
 ld x29, 232(sp)
 ld x30, 240(sp)
 ld x31, 248(sp)

 ld sp, 16(sp)
 mret
