	.file	"trapret.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "kernel/trapret.c"
	.align	2
	.type	supervisor_interrupt_disable, @function
supervisor_interrupt_disable:
.LFB1:
	.file 1 "include/kernel/ktrap.h"
	.loc 1 44 54
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
.LBB2:
	.loc 1 45 22
	li	a5,2
	sd	a5,8(sp)
	.loc 1 45 60
	ld	a5,8(sp)
 #APP
# 45 "include/kernel/ktrap.h" 1
	csrc sstatus, a5
# 0 "" 2
 #NO_APP
.LBE2:
	.loc 1 46 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	supervisor_interrupt_disable, .-supervisor_interrupt_disable
	.section	.rodata
	.align	3
.LC0:
	.string	"===================== Error Message =====================%c"
	.align	3
.LC1:
	.string	"filename: %s, at line %d\n"
	.align	3
.LC2:
	.string	"unsatisfied condition: %s\n"
	.align	3
.LC3:
	.string	"assert check failed in function: %s\n"
	.align	3
.LC4:
	.string	"info message: %s\n"
	.text
	.align	2
	.type	kpanic_spin, @function
kpanic_spin:
.LFB10:
	.file 2 "include/kernel/kdebug.h"
	.loc 2 28 119
	.cfi_startproc
	addi	sp,sp,-1136
	.cfi_def_cfa_offset 1136
	sd	ra,1096(sp)
	.cfi_offset 1, -40
	sd	a0,40(sp)
	sd	a2,24(sp)
	sd	a3,16(sp)
	sd	a4,8(sp)
	sd	a5,1112(sp)
	sd	a6,1120(sp)
	sd	a7,1128(sp)
	mv	a5,a1
	sw	a5,36(sp)
	.loc 2 29 5
	call	supervisor_interrupt_disable
	.loc 2 30 5
	li	a1,10
	lla	a0,.LC0
	call	kprintf
	.loc 2 31 5
	lw	a5,36(sp)
	mv	a2,a5
	ld	a1,40(sp)
	lla	a0,.LC1
	call	kprintf
	.loc 2 32 5
	ld	a1,16(sp)
	lla	a0,.LC2
	call	kprintf
	.loc 2 33 5
	ld	a1,24(sp)
	lla	a0,.LC3
	call	kprintf
	.loc 2 34 10
	sd	zero,64(sp)
	addi	a5,sp,72
	li	a4,1016
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 36 5
	addi	a5,sp,1136
	sd	a5,0(sp)
	ld	a5,0(sp)
	addi	a5,a5,-24
	sd	a5,56(sp)
	.loc 2 37 5
	ld	a4,56(sp)
	addi	a5,sp,64
	mv	a2,a4
	ld	a1,8(sp)
	mv	a0,a5
	call	vsprintf
	.loc 2 38 5
	addi	a5,sp,64
	mv	a1,a5
	lla	a0,.LC4
	call	kprintf
.L3:
	.loc 2 39 11 discriminator 1
	nop
	j	.L3
	.cfi_endproc
.LFE10:
	.size	kpanic_spin, .-kpanic_spin
	.align	2
	.type	r_sstatus, @function
r_sstatus:
.LFB15:
	.file 3 "include/riscv.h"
	.loc 3 53 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 55 3
 #APP
# 55 "include/riscv.h" 1
	csrr a5, sstatus
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 3 56 10
	ld	a5,8(sp)
	.loc 3 57 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	r_sstatus, .-r_sstatus
	.align	2
	.type	w_sstatus, @function
w_sstatus:
.LFB16:
	.loc 3 61 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 3 62 3
	ld	a5,8(sp)
 #APP
# 62 "include/riscv.h" 1
	csrw sstatus, a5
# 0 "" 2
	.loc 3 63 1
 #NO_APP
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	w_sstatus, .-w_sstatus
	.align	2
	.type	w_sepc, @function
w_sepc:
.LFB23:
	.loc 3 121 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 3 122 3
	ld	a5,8(sp)
 #APP
# 122 "include/riscv.h" 1
	csrw sepc, a5
# 0 "" 2
	.loc 3 123 1
 #NO_APP
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	w_sepc, .-w_sepc
	.align	2
	.type	r_sepc, @function
r_sepc:
.LFB24:
	.loc 3 127 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 129 3
 #APP
# 129 "include/riscv.h" 1
	csrr a5, sepc
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 3 130 10
	ld	a5,8(sp)
	.loc 3 131 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	r_sepc, .-r_sepc
	.align	2
	.type	w_stvec, @function
w_stvec:
.LFB29:
	.loc 3 167 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 3 168 3
	ld	a5,8(sp)
 #APP
# 168 "include/riscv.h" 1
	csrw stvec, a5
# 0 "" 2
	.loc 3 169 1
 #NO_APP
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE29:
	.size	w_stvec, .-w_stvec
	.align	2
	.type	r_satp, @function
r_satp:
.LFB35:
	.loc 3 214 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 216 3
 #APP
# 216 "include/riscv.h" 1
	csrr a5, satp
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 3 217 10
	ld	a5,8(sp)
	.loc 3 218 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE35:
	.size	r_satp, .-r_satp
	.align	2
	.type	r_scause, @function
r_scause:
.LFB37:
	.loc 3 229 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 231 3
 #APP
# 231 "include/riscv.h" 1
	csrr a5, scause
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 3 232 10
	ld	a5,8(sp)
	.loc 3 233 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE37:
	.size	r_scause, .-r_scause
	.align	2
	.type	r_stval, @function
r_stval:
.LFB38:
	.loc 3 238 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 240 3
 #APP
# 240 "include/riscv.h" 1
	csrr a5, stval
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 3 241 10
	ld	a5,8(sp)
	.loc 3 242 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE38:
	.size	r_stval, .-r_stval
	.align	2
	.type	intr_on, @function
intr_on:
.LFB42:
	.loc 3 271 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 3 272 13
	call	r_sstatus
	mv	a5,a0
	.loc 3 272 3
	ori	a5,a5,2
	mv	a0,a5
	call	w_sstatus
	.loc 3 273 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	intr_on, .-intr_on
	.align	2
	.type	intr_off, @function
intr_off:
.LFB43:
	.loc 3 278 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 3 279 13
	call	r_sstatus
	mv	a5,a0
	.loc 3 279 3
	andi	a5,a5,-3
	mv	a0,a5
	call	w_sstatus
	.loc 3 280 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE43:
	.size	intr_off, .-intr_off
	.align	2
	.type	intr_get, @function
intr_get:
.LFB44:
	.loc 3 285 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 3 286 16
	call	r_sstatus
	sd	a0,8(sp)
	.loc 3 287 13
	ld	a5,8(sp)
	andi	a5,a5,2
	.loc 3 287 29
	snez	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	.loc 3 288 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE44:
	.size	intr_get, .-intr_get
	.align	2
	.type	r_tp, @function
r_tp:
.LFB46:
	.loc 3 302 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 304 3
 #APP
# 304 "include/riscv.h" 1
	mv a5, tp
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 3 305 10
	ld	a5,8(sp)
	.loc 3 306 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE46:
	.size	r_tp, .-r_tp
	.section	.rodata
	.align	3
.LC5:
	.string	"\"usertrap: not from user mode %d\\n\""
	.align	3
.LC6:
	.string	"(r_sstatus() & SSTATUS_SPP) == 0"
	.align	3
.LC7:
	.string	"kernel/trapret.c"
	.align	3
.LC8:
	.string	"here for syscalls\n"
	.align	3
.LC9:
	.string	"usertrap(): unexpected scause %p pid=%d\n"
	.align	3
.LC10:
	.string	"            sepc=%p stval=%p\n"
	.text
	.align	2
	.globl	usertrap
	.type	usertrap, @function
usertrap:
.LFB51:
	.file 4 "kernel/trapret.c"
	.loc 4 10 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 4 15 10
	call	r_sstatus
	mv	a5,a0
	.loc 4 15 22
	andi	a5,a5,256
	.loc 4 15 8
	beq	a5,zero,.L24
	.loc 4 15 53 discriminator 1
	li	a5,0
	lla	a4,.LC5
	lla	a3,.LC6
	lla	a2,__func__.1
	li	a1,15
	lla	a0,.LC7
	call	kpanic_spin
.L24:
	.loc 4 18 3
	lla	a5,kernelvec
	mv	a0,a5
	call	w_stvec
	.loc 4 20 23
	call	myproc
	sd	a0,8(sp)
	.loc 4 23 4
	ld	a5,8(sp)
	ld	s0,80(a5)
	.loc 4 23 23
	call	r_sepc
	mv	a5,a0
	.loc 4 23 21
	sd	a5,24(s0)
	.loc 4 25 6
	call	r_scause
	mv	a4,a0
	.loc 4 25 5
	li	a5,8
	bne	a4,a5,.L25
	.loc 4 32 6
	ld	a5,8(sp)
	ld	a5,80(a5)
	.loc 4 32 17
	ld	a4,24(a5)
	.loc 4 32 6
	ld	a5,8(sp)
	ld	a5,80(a5)
	.loc 4 32 23
	addi	a4,a4,4
	sd	a4,24(a5)
	.loc 4 36 5
	call	intr_on
.L26:
	.loc 4 40 7 discriminator 1
	lla	a0,.LC8
	call	kprintf
	j	.L26
.L25:
	.loc 4 47 5
	call	r_scause
	mv	a4,a0
	ld	a5,8(sp)
	lw	a5,40(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC9
	call	kprintf
	.loc 4 48 5
	call	r_sepc
	mv	s0,a0
	call	r_stval
	mv	a5,a0
	mv	a2,a5
	mv	a1,s0
	lla	a0,.LC10
	call	kprintf
	.loc 4 49 5
	ld	a0,8(sp)
	call	setkilled
	.loc 4 52 6
	ld	a0,8(sp)
	call	killed
	mv	a5,a0
	.loc 4 52 5
	beq	a5,zero,.L27
.L28:
	.loc 4 53 10 discriminator 1
	nop
	j	.L28
.L27:
	.loc 4 61 3
	call	usertrapret
	.loc 4 62 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE51:
	.size	usertrap, .-usertrap
	.align	2
	.globl	usertrapret
	.type	usertrapret, @function
usertrapret:
.LFB52:
	.loc 4 69 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.loc 4 70 23
	call	myproc
	sd	a0,40(sp)
	.loc 4 75 3
	call	intr_off
	.loc 4 78 82
	lla	a4,uservec
	lla	a5,trampoline
	sub	a4,a4,a5
	.loc 4 78 71
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	add	a5,a4,a5
	.loc 4 78 12
	sd	a5,32(sp)
	.loc 4 79 3
	ld	a0,32(sp)
	call	w_stvec
	.loc 4 83 4
	ld	a5,40(sp)
	ld	s0,80(a5)
	.loc 4 83 31
	call	r_satp
	mv	a5,a0
	.loc 4 83 29
	sd	a5,0(s0)
	.loc 4 84 30
	ld	a5,40(sp)
	ld	a3,56(a5)
	.loc 4 84 4
	ld	a5,40(sp)
	ld	a5,80(a5)
	.loc 4 84 39
	li	a4,4096
	add	a4,a3,a4
	.loc 4 84 27
	sd	a4,8(a5)
	.loc 4 85 4
	ld	a5,40(sp)
	ld	a5,80(a5)
	.loc 4 85 31
	lla	a4,usertrap
	.loc 4 85 29
	sd	a4,16(a5)
	.loc 4 86 4
	ld	a5,40(sp)
	ld	s0,80(a5)
	.loc 4 86 33
	call	r_tp
	mv	a5,a0
	.loc 4 86 31
	sd	a5,32(s0)
	.loc 4 92 21
	call	r_sstatus
	sd	a0,24(sp)
	.loc 4 93 5
	ld	a5,24(sp)
	andi	a5,a5,-257
	sd	a5,24(sp)
	.loc 4 94 5
	ld	a5,24(sp)
	ori	a5,a5,32
	sd	a5,24(sp)
	.loc 4 95 3
	ld	a0,24(sp)
	call	w_sstatus
	.loc 4 98 11
	ld	a5,40(sp)
	ld	a5,80(a5)
	.loc 4 98 3
	ld	a5,24(a5)
	mv	a0,a5
	call	w_sepc
	.loc 4 101 46
	ld	a5,40(sp)
	ld	a5,72(a5)
	.loc 4 101 59
	srli	a4,a5,12
	.loc 4 101 12
	li	a5,-1
	slli	a5,a5,63
	or	a5,a4,a5
	sd	a5,16(sp)
	.loc 4 106 82
	lla	a4,userret
	lla	a5,trampoline
	sub	a4,a4,a5
	.loc 4 106 71
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	add	a5,a4,a5
	.loc 4 106 12
	sd	a5,8(sp)
	.loc 4 107 4
	ld	a5,8(sp)
	ld	a0,16(sp)
	jalr	a5
.LVL0:
	.loc 4 108 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE52:
	.size	usertrapret, .-usertrapret
	.section	.rodata
	.align	3
.LC11:
	.string	"\"kerneltrap: not from supervisor mode\\n\""
	.align	3
.LC12:
	.string	"((sstatus & SSTATUS_SPP) == 0)"
	.align	3
.LC13:
	.string	"intr_get()==0"
	.align	3
.LC14:
	.string	"scause %p\n"
	.text
	.align	2
	.globl	kerneltrap
	.type	kerneltrap, @function
kerneltrap:
.LFB53:
	.loc 4 114 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	.loc 4 116 19
	call	r_sepc
	sd	a0,24(sp)
	.loc 4 117 22
	call	r_sstatus
	sd	a0,16(sp)
	.loc 4 118 21
	call	r_scause
	sd	a0,8(sp)
	.loc 4 119 17
	ld	a5,16(sp)
	andi	a5,a5,256
	.loc 4 119 6
	beq	a5,zero,.L31
	.loc 4 119 49 discriminator 1
	li	a5,0
	lla	a4,.LC11
	lla	a3,.LC12
	lla	a2,__func__.0
	li	a1,119
	lla	a0,.LC7
	call	kpanic_spin
.L31:
	.loc 4 122 8
	call	intr_get
	mv	a5,a0
	.loc 4 122 7
	beq	a5,zero,.L32
	.loc 4 122 32 discriminator 1
	li	a5,0
	lla	a4,.LC11
	lla	a3,.LC13
	lla	a2,__func__.0
	li	a1,122
	lla	a0,.LC7
	call	kpanic_spin
.L32:
	.loc 4 127 6
	ld	a1,8(sp)
	lla	a0,.LC14
	call	kprintf
	.loc 4 138 3
	ld	a0,24(sp)
	call	w_sepc
	.loc 4 139 3
	ld	a0,16(sp)
	call	w_sstatus
	.loc 4 140 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE53:
	.size	kerneltrap, .-kerneltrap
	.section	.rodata
	.align	3
	.type	__func__.1, @object
	.size	__func__.1, 9
__func__.1:
	.string	"usertrap"
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 11
__func__.0:
	.string	"kerneltrap"
	.text
.Letext0:
	.file 5 "include/types.h"
	.file 6 "include/kernel/locks.h"
	.file 7 "include/stdarg.h"
	.file 8 "include/process.h"
	.file 9 "include/stdfmt.h"
	.file 10 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x8dd
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x1a
	.4byte	.LASF72
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x6
	.4byte	.LASF9
	.byte	0x5
	.byte	0x1a
	.byte	0x17
	.4byte	0x4f
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0xf
	.4byte	0x56
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1b
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x6
	.4byte	.LASF10
	.byte	0x5
	.byte	0x23
	.byte	0x17
	.4byte	0x2e
	.byte	0x6
	.4byte	.LASF11
	.byte	0x5
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x6
	.4byte	.LASF12
	.byte	0x5
	.byte	0x3b
	.byte	0x13
	.4byte	0x9b
	.byte	0x7
	.4byte	0x43
	.byte	0x10
	.4byte	.LASF17
	.byte	0x10
	.byte	0x6
	.byte	0x1b
	.byte	0x10
	.4byte	0xc8
	.byte	0x2
	.4byte	.LASF13
	.byte	0x6
	.byte	0x1d
	.byte	0xa
	.4byte	0x77
	.byte	0
	.byte	0x2
	.4byte	.LASF14
	.byte	0x6
	.byte	0x1f
	.byte	0xb
	.4byte	0xc8
	.byte	0x8
	.byte	0
	.byte	0x7
	.4byte	0x56
	.byte	0x6
	.4byte	.LASF15
	.byte	0x6
	.byte	0x20
	.byte	0x3
	.4byte	0xa0
	.byte	0x7
	.4byte	0x5d
	.byte	0x6
	.4byte	.LASF16
	.byte	0x7
	.byte	0x22
	.byte	0x1b
	.4byte	0xea
	.byte	0x1c
	.byte	0x8
	.4byte	.LASF73
	.byte	0x10
	.4byte	.LASF18
	.byte	0x70
	.byte	0x8
	.byte	0x28
	.byte	0x8
	.4byte	0x19a
	.byte	0x1
	.string	"ra"
	.byte	0x29
	.byte	0xc
	.4byte	0x43
	.byte	0
	.byte	0x1
	.string	"sp"
	.byte	0x2a
	.byte	0xc
	.4byte	0x43
	.byte	0x8
	.byte	0x1
	.string	"s0"
	.byte	0x2d
	.byte	0xc
	.4byte	0x43
	.byte	0x10
	.byte	0x1
	.string	"s1"
	.byte	0x2e
	.byte	0xc
	.4byte	0x43
	.byte	0x18
	.byte	0x1
	.string	"s2"
	.byte	0x2f
	.byte	0xc
	.4byte	0x43
	.byte	0x20
	.byte	0x1
	.string	"s3"
	.byte	0x30
	.byte	0xc
	.4byte	0x43
	.byte	0x28
	.byte	0x1
	.string	"s4"
	.byte	0x31
	.byte	0xc
	.4byte	0x43
	.byte	0x30
	.byte	0x1
	.string	"s5"
	.byte	0x32
	.byte	0xc
	.4byte	0x43
	.byte	0x38
	.byte	0x1
	.string	"s6"
	.byte	0x33
	.byte	0xc
	.4byte	0x43
	.byte	0x40
	.byte	0x1
	.string	"s7"
	.byte	0x34
	.byte	0xc
	.4byte	0x43
	.byte	0x48
	.byte	0x1
	.string	"s8"
	.byte	0x35
	.byte	0xc
	.4byte	0x43
	.byte	0x50
	.byte	0x1
	.string	"s9"
	.byte	0x36
	.byte	0xc
	.4byte	0x43
	.byte	0x58
	.byte	0x1
	.string	"s10"
	.byte	0x37
	.byte	0xc
	.4byte	0x43
	.byte	0x60
	.byte	0x1
	.string	"s11"
	.byte	0x38
	.byte	0xc
	.4byte	0x43
	.byte	0x68
	.byte	0
	.byte	0x10
	.4byte	.LASF19
	.byte	0xd8
	.byte	0x8
	.byte	0x7b
	.byte	0x8
	.4byte	0x24e
	.byte	0x2
	.4byte	.LASF20
	.byte	0x8
	.byte	0x7c
	.byte	0xe
	.4byte	0xcd
	.byte	0
	.byte	0x2
	.4byte	.LASF21
	.byte	0x8
	.byte	0x7f
	.byte	0x12
	.4byte	0x3f9
	.byte	0x10
	.byte	0x2
	.4byte	.LASF22
	.byte	0x8
	.byte	0x80
	.byte	0x9
	.4byte	0x430
	.byte	0x18
	.byte	0x2
	.4byte	.LASF23
	.byte	0x8
	.byte	0x81
	.byte	0x7
	.4byte	0x69
	.byte	0x20
	.byte	0x2
	.4byte	.LASF24
	.byte	0x8
	.byte	0x82
	.byte	0x7
	.4byte	0x69
	.byte	0x24
	.byte	0x1
	.string	"pid"
	.byte	0x83
	.byte	0x7
	.4byte	0x69
	.byte	0x28
	.byte	0x2
	.4byte	.LASF25
	.byte	0x8
	.byte	0x86
	.byte	0x10
	.4byte	0x437
	.byte	0x30
	.byte	0x2
	.4byte	.LASF26
	.byte	0x8
	.byte	0x89
	.byte	0xc
	.4byte	0x43
	.byte	0x38
	.byte	0x1
	.string	"sz"
	.byte	0x8a
	.byte	0xc
	.4byte	0x43
	.byte	0x40
	.byte	0x2
	.4byte	.LASF27
	.byte	0x8
	.byte	0x8b
	.byte	0xf
	.4byte	0x8f
	.byte	0x48
	.byte	0x2
	.4byte	.LASF28
	.byte	0x8
	.byte	0x8c
	.byte	0x15
	.4byte	0x43c
	.byte	0x50
	.byte	0x2
	.4byte	.LASF18
	.byte	0x8
	.byte	0x8d
	.byte	0x12
	.4byte	0xf0
	.byte	0x58
	.byte	0x2
	.4byte	.LASF14
	.byte	0x8
	.byte	0x90
	.byte	0x8
	.4byte	0x441
	.byte	0xc8
	.byte	0
	.byte	0x7
	.4byte	0x19a
	.byte	0x1d
	.4byte	.LASF28
	.2byte	0x120
	.byte	0x8
	.byte	0x51
	.byte	0x8
	.4byte	0x3f9
	.byte	0x2
	.4byte	.LASF29
	.byte	0x8
	.byte	0x52
	.byte	0x16
	.4byte	0x43
	.byte	0
	.byte	0x2
	.4byte	.LASF30
	.byte	0x8
	.byte	0x53
	.byte	0x16
	.4byte	0x43
	.byte	0x8
	.byte	0x2
	.4byte	.LASF31
	.byte	0x8
	.byte	0x54
	.byte	0x16
	.4byte	0x43
	.byte	0x10
	.byte	0x1
	.string	"epc"
	.byte	0x55
	.byte	0x16
	.4byte	0x43
	.byte	0x18
	.byte	0x2
	.4byte	.LASF32
	.byte	0x8
	.byte	0x56
	.byte	0x16
	.4byte	0x43
	.byte	0x20
	.byte	0x1
	.string	"ra"
	.byte	0x57
	.byte	0x16
	.4byte	0x43
	.byte	0x28
	.byte	0x1
	.string	"sp"
	.byte	0x58
	.byte	0x16
	.4byte	0x43
	.byte	0x30
	.byte	0x1
	.string	"gp"
	.byte	0x59
	.byte	0x16
	.4byte	0x43
	.byte	0x38
	.byte	0x1
	.string	"tp"
	.byte	0x5a
	.byte	0x16
	.4byte	0x43
	.byte	0x40
	.byte	0x1
	.string	"t0"
	.byte	0x5b
	.byte	0x16
	.4byte	0x43
	.byte	0x48
	.byte	0x1
	.string	"t1"
	.byte	0x5c
	.byte	0x16
	.4byte	0x43
	.byte	0x50
	.byte	0x1
	.string	"t2"
	.byte	0x5d
	.byte	0x16
	.4byte	0x43
	.byte	0x58
	.byte	0x1
	.string	"s0"
	.byte	0x5e
	.byte	0x16
	.4byte	0x43
	.byte	0x60
	.byte	0x1
	.string	"s1"
	.byte	0x5f
	.byte	0x16
	.4byte	0x43
	.byte	0x68
	.byte	0x1
	.string	"a0"
	.byte	0x60
	.byte	0x16
	.4byte	0x43
	.byte	0x70
	.byte	0x1
	.string	"a1"
	.byte	0x61
	.byte	0x16
	.4byte	0x43
	.byte	0x78
	.byte	0x1
	.string	"a2"
	.byte	0x62
	.byte	0x16
	.4byte	0x43
	.byte	0x80
	.byte	0x1
	.string	"a3"
	.byte	0x63
	.byte	0x16
	.4byte	0x43
	.byte	0x88
	.byte	0x1
	.string	"a4"
	.byte	0x64
	.byte	0x16
	.4byte	0x43
	.byte	0x90
	.byte	0x1
	.string	"a5"
	.byte	0x65
	.byte	0x16
	.4byte	0x43
	.byte	0x98
	.byte	0x1
	.string	"a6"
	.byte	0x66
	.byte	0x16
	.4byte	0x43
	.byte	0xa0
	.byte	0x1
	.string	"a7"
	.byte	0x67
	.byte	0x16
	.4byte	0x43
	.byte	0xa8
	.byte	0x1
	.string	"s2"
	.byte	0x68
	.byte	0x16
	.4byte	0x43
	.byte	0xb0
	.byte	0x1
	.string	"s3"
	.byte	0x69
	.byte	0x16
	.4byte	0x43
	.byte	0xb8
	.byte	0x1
	.string	"s4"
	.byte	0x6a
	.byte	0x16
	.4byte	0x43
	.byte	0xc0
	.byte	0x1
	.string	"s5"
	.byte	0x6b
	.byte	0x16
	.4byte	0x43
	.byte	0xc8
	.byte	0x1
	.string	"s6"
	.byte	0x6c
	.byte	0x16
	.4byte	0x43
	.byte	0xd0
	.byte	0x1
	.string	"s7"
	.byte	0x6d
	.byte	0x16
	.4byte	0x43
	.byte	0xd8
	.byte	0x1
	.string	"s8"
	.byte	0x6e
	.byte	0x16
	.4byte	0x43
	.byte	0xe0
	.byte	0x1
	.string	"s9"
	.byte	0x6f
	.byte	0x16
	.4byte	0x43
	.byte	0xe8
	.byte	0x1
	.string	"s10"
	.byte	0x70
	.byte	0x16
	.4byte	0x43
	.byte	0xf0
	.byte	0x1
	.string	"s11"
	.byte	0x71
	.byte	0x16
	.4byte	0x43
	.byte	0xf8
	.byte	0xc
	.string	"t3"
	.byte	0x72
	.4byte	0x43
	.2byte	0x100
	.byte	0xc
	.string	"t4"
	.byte	0x73
	.4byte	0x43
	.2byte	0x108
	.byte	0xc
	.string	"t5"
	.byte	0x74
	.4byte	0x43
	.2byte	0x110
	.byte	0xc
	.string	"t6"
	.byte	0x75
	.4byte	0x43
	.2byte	0x118
	.byte	0
	.byte	0x1e
	.4byte	.LASF74
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x8
	.byte	0x78
	.byte	0x6
	.4byte	0x430
	.byte	0x8
	.4byte	.LASF33
	.byte	0
	.byte	0x8
	.4byte	.LASF34
	.byte	0x1
	.byte	0x8
	.4byte	.LASF35
	.byte	0x2
	.byte	0x8
	.4byte	.LASF36
	.byte	0x3
	.byte	0x8
	.4byte	.LASF37
	.byte	0x4
	.byte	0x8
	.4byte	.LASF38
	.byte	0x5
	.byte	0
	.byte	0x1f
	.byte	0x8
	.byte	0x20
	.4byte	.LASF75
	.byte	0x7
	.4byte	0x432
	.byte	0x7
	.4byte	0x253
	.byte	0xa
	.4byte	0x56
	.4byte	0x451
	.byte	0x11
	.4byte	0x4f
	.byte	0xf
	.byte	0
	.byte	0xa
	.4byte	0x56
	.4byte	0x45c
	.byte	0x21
	.byte	0
	.byte	0x12
	.4byte	.LASF39
	.byte	0xd
	.4byte	0x451
	.byte	0x12
	.4byte	.LASF40
	.byte	0x1b
	.4byte	0x451
	.byte	0x12
	.4byte	.LASF41
	.byte	0x26
	.4byte	0x451
	.byte	0x13
	.4byte	.LASF42
	.byte	0x9
	.byte	0x5b
	.byte	0x8
	.4byte	0x83
	.4byte	0x49a
	.byte	0x9
	.4byte	0xc8
	.byte	0x9
	.4byte	0xd9
	.byte	0x9
	.4byte	0xde
	.byte	0
	.byte	0x13
	.4byte	.LASF23
	.byte	0x8
	.byte	0x21
	.byte	0x5
	.4byte	0x69
	.4byte	0x4b0
	.byte	0x9
	.4byte	0x24e
	.byte	0
	.byte	0x22
	.4byte	.LASF76
	.byte	0x8
	.byte	0x22
	.byte	0x6
	.4byte	0x4c2
	.byte	0x9
	.4byte	0x24e
	.byte	0
	.byte	0x13
	.4byte	.LASF43
	.byte	0xa
	.byte	0x43
	.byte	0x8
	.4byte	0x83
	.4byte	0x4d9
	.byte	0x9
	.4byte	0xd9
	.byte	0x16
	.byte	0
	.byte	0x23
	.4byte	.LASF77
	.byte	0x8
	.byte	0x1c
	.byte	0x11
	.4byte	0x24e
	.byte	0x24
	.4byte	.LASF78
	.byte	0x4
	.byte	0x7
	.byte	0x6
	.byte	0x14
	.4byte	.LASF47
	.byte	0x71
	.8byte	.LFB53
	.8byte	.LFE53-.LFB53
	.byte	0x1
	.byte	0x9c
	.4byte	0x54a
	.byte	0x5
	.4byte	.LASF44
	.byte	0x4
	.byte	0x74
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x5
	.4byte	.LASF45
	.byte	0x4
	.byte	0x75
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x5
	.4byte	.LASF46
	.byte	0x4
	.byte	0x76
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x17
	.4byte	.LASF53
	.4byte	0x55a
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0
	.byte	0xa
	.4byte	0x5d
	.4byte	0x55a
	.byte	0x11
	.4byte	0x4f
	.byte	0xa
	.byte	0
	.byte	0xf
	.4byte	0x54a
	.byte	0x14
	.4byte	.LASF48
	.byte	0x44
	.8byte	.LFB52
	.8byte	.LFE52-.LFB52
	.byte	0x1
	.byte	0x9c
	.4byte	0x5c3
	.byte	0x3
	.string	"p"
	.byte	0x4
	.byte	0x46
	.byte	0x13
	.4byte	0x24e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x5
	.4byte	.LASF49
	.byte	0x4
	.byte	0x4e
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.string	"x"
	.byte	0x4
	.byte	0x5c
	.byte	0x11
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.4byte	.LASF50
	.byte	0x4
	.byte	0x65
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x5
	.4byte	.LASF51
	.byte	0x4
	.byte	0x6a
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0x14
	.4byte	.LASF52
	.byte	0x9
	.8byte	.LFB51
	.8byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0x600
	.byte	0x17
	.4byte	.LASF53
	.4byte	0x610
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1
	.byte	0x3
	.string	"p"
	.byte	0x4
	.byte	0x14
	.byte	0x13
	.4byte	0x24e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.4byte	0x5d
	.4byte	0x610
	.byte	0x11
	.4byte	0x4f
	.byte	0x8
	.byte	0
	.byte	0xf
	.4byte	0x600
	.byte	0x25
	.4byte	.LASF54
	.byte	0x3
	.2byte	0x12d
	.byte	0x1
	.4byte	0x43
	.8byte	.LFB46
	.8byte	.LFE46-.LFB46
	.byte	0x1
	.byte	0x9c
	.4byte	0x645
	.byte	0x18
	.string	"x"
	.2byte	0x12f
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x26
	.4byte	.LASF55
	.byte	0x3
	.2byte	0x11c
	.byte	0x1
	.4byte	0x69
	.8byte	.LFB44
	.8byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0x675
	.byte	0x18
	.string	"x"
	.2byte	0x11e
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x19
	.4byte	.LASF56
	.2byte	0x115
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.4byte	.LASF57
	.2byte	0x10e
	.8byte	.LFB42
	.8byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.byte	0xb
	.4byte	.LASF58
	.byte	0xed
	.4byte	0x43
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x6d5
	.byte	0x3
	.string	"x"
	.byte	0x3
	.byte	0xef
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0xb
	.4byte	.LASF59
	.byte	0xe4
	.4byte	0x43
	.8byte	.LFB37
	.8byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x703
	.byte	0x3
	.string	"x"
	.byte	0x3
	.byte	0xe6
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0xb
	.4byte	.LASF60
	.byte	0xd5
	.4byte	0x43
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.4byte	0x731
	.byte	0x3
	.string	"x"
	.byte	0x3
	.byte	0xd7
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x15
	.4byte	.LASF62
	.byte	0xa6
	.8byte	.LFB29
	.8byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x75b
	.byte	0xd
	.string	"x"
	.byte	0x3
	.byte	0xa6
	.byte	0x12
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0xb
	.4byte	.LASF61
	.byte	0x7e
	.4byte	0x43
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x789
	.byte	0x3
	.string	"x"
	.byte	0x3
	.byte	0x80
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x15
	.4byte	.LASF63
	.byte	0x78
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x7b3
	.byte	0xd
	.string	"x"
	.byte	0x3
	.byte	0x78
	.byte	0x11
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x15
	.4byte	.LASF64
	.byte	0x3c
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x7dd
	.byte	0xd
	.string	"x"
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0xb
	.4byte	.LASF65
	.byte	0x34
	.4byte	0x43
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x80b
	.byte	0x3
	.string	"x"
	.byte	0x3
	.byte	0x36
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x27
	.4byte	.LASF66
	.byte	0x2
	.byte	0x1c
	.byte	0x14
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x893
	.byte	0xe
	.4byte	.LASF67
	.byte	0x26
	.4byte	0xc8
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x77
	.byte	0xe
	.4byte	.LASF68
	.byte	0x34
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x77
	.byte	0xe
	.4byte	.LASF69
	.byte	0x46
	.4byte	0xd9
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x77
	.byte	0xe
	.4byte	.LASF70
	.byte	0x58
	.4byte	0xd9
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x77
	.byte	0xd
	.string	"msg"
	.byte	0x2
	.byte	0x1c
	.byte	0x6e
	.4byte	0xd9
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0x16
	.byte	0x3
	.string	"buf"
	.byte	0x2
	.byte	0x22
	.byte	0xa
	.4byte	0x893
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x77
	.byte	0x5
	.4byte	.LASF71
	.byte	0x2
	.byte	0x23
	.byte	0xd
	.4byte	0xde
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x77
	.byte	0
	.byte	0xa
	.4byte	0x56
	.4byte	0x8a4
	.byte	0x28
	.4byte	0x4f
	.2byte	0x3ff
	.byte	0
	.byte	0x29
	.4byte	.LASF79
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x2a
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x3
	.string	"__v"
	.byte	0x1
	.byte	0x2d
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x8
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x8
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x16
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0x21
	.byte	0x1c
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0x21
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0x21
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0x21
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF62:
	.string	"w_stvec"
.LASF57:
	.string	"intr_on"
.LASF59:
	.string	"r_scause"
.LASF19:
	.string	"process"
.LASF35:
	.string	"SLEEPING"
.LASF36:
	.string	"RUNNABLE"
.LASF21:
	.string	"state"
.LASF9:
	.string	"uint64_t"
.LASF43:
	.string	"kprintf"
.LASF7:
	.string	"short int"
.LASF11:
	.string	"size_t"
.LASF38:
	.string	"ZOMBIE"
.LASF17:
	.string	"__spinlock_t"
.LASF41:
	.string	"userret"
.LASF54:
	.string	"r_tp"
.LASF65:
	.string	"r_sstatus"
.LASF67:
	.string	"filename"
.LASF50:
	.string	"satp"
.LASF16:
	.string	"va_list"
.LASF77:
	.string	"myproc"
.LASF51:
	.string	"trampoline_userret"
.LASF25:
	.string	"parent"
.LASF23:
	.string	"killed"
.LASF71:
	.string	"args"
.LASF52:
	.string	"usertrap"
.LASF30:
	.string	"kernel_sp"
.LASF60:
	.string	"r_satp"
.LASF40:
	.string	"uservec"
.LASF8:
	.string	"long int"
.LASF29:
	.string	"kernel_satp"
.LASF18:
	.string	"context"
.LASF14:
	.string	"name"
.LASF32:
	.string	"kernel_hartid"
.LASF34:
	.string	"_USED"
.LASF2:
	.string	"unsigned char"
.LASF66:
	.string	"kpanic_spin"
.LASF69:
	.string	"func"
.LASF61:
	.string	"r_sepc"
.LASF75:
	.string	"proc"
.LASF56:
	.string	"intr_off"
.LASF4:
	.string	"unsigned int"
.LASF55:
	.string	"intr_get"
.LASF44:
	.string	"sepc"
.LASF47:
	.string	"kerneltrap"
.LASF53:
	.string	"__func__"
.LASF26:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF70:
	.string	"condition"
.LASF22:
	.string	"chan"
.LASF37:
	.string	"RUNNING"
.LASF6:
	.string	"char"
.LASF13:
	.string	"locked"
.LASF28:
	.string	"trapframe"
.LASF39:
	.string	"trampoline"
.LASF20:
	.string	"lock"
.LASF15:
	.string	"spinlock_t"
.LASF42:
	.string	"vsprintf"
.LASF45:
	.string	"sstatus"
.LASF68:
	.string	"line"
.LASF63:
	.string	"w_sepc"
.LASF64:
	.string	"w_sstatus"
.LASF5:
	.string	"long unsigned int"
.LASF73:
	.string	"__builtin_va_list"
.LASF48:
	.string	"usertrapret"
.LASF72:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF58:
	.string	"r_stval"
.LASF76:
	.string	"setkilled"
.LASF49:
	.string	"trampoline_uservec"
.LASF31:
	.string	"kernel_trap"
.LASF27:
	.string	"pagetable"
.LASF78:
	.string	"kernelvec"
.LASF24:
	.string	"xstate"
.LASF74:
	.string	"procstate"
.LASF79:
	.string	"supervisor_interrupt_disable"
.LASF33:
	.string	"_UNUSED"
.LASF46:
	.string	"scause"
.LASF12:
	.string	"pagetable_t"
.LASF10:
	.string	"Bool"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"kernel/trapret.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
