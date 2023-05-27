	.file	"ktrap.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "kernel/ktrap.c"
	.globl	kintr_msg
	.section	.rodata
	.align	3
.LC0:
	.string	"Undelegated Interrupt"
	.align	3
.LC1:
	.string	"Supervisor Software Interrupt"
	.align	3
.LC2:
	.string	"Supervisor Timer Interrupt"
	.align	3
.LC3:
	.string	"Supervisor External Interrupt"
	.data
	.align	3
	.type	kintr_msg, @object
	.size	kintr_msg, 512
kintr_msg:
	.dword	.LC0
	.dword	.LC1
	.dword	.LC0
	.dword	.LC0
	.dword	.LC0
	.dword	.LC2
	.dword	.LC0
	.dword	.LC0
	.dword	.LC0
	.dword	.LC3
	.dword	.LC0
	.dword	.LC0
	.zero	416
	.globl	kexcp_msg
	.section	.rodata
	.align	3
.LC4:
	.string	"Instrution Address Misaligned"
	.align	3
.LC5:
	.string	"Undelegated Exception"
	.align	3
.LC6:
	.string	"Breakpoint"
	.align	3
.LC7:
	.string	"Load access Fault"
	.align	3
.LC8:
	.string	"Store/AMO Access Fault"
	.align	3
.LC9:
	.string	"Environment Call from U-Mode"
	.align	3
.LC10:
	.string	"Instruction Page Fault"
	.align	3
.LC11:
	.string	"Load Page Fault"
	.align	3
.LC12:
	.string	"Store/AMO Page Fault"
	.data
	.align	3
	.type	kexcp_msg, @object
	.size	kexcp_msg, 512
kexcp_msg:
	.dword	.LC4
	.dword	.LC5
	.dword	.LC5
	.dword	.LC6
	.dword	.LC5
	.dword	.LC7
	.dword	.LC5
	.dword	.LC8
	.dword	.LC9
	.dword	.LC5
	.dword	.LC5
	.dword	.LC5
	.dword	.LC10
	.dword	.LC11
	.dword	.LC5
	.dword	.LC12
	.zero	384
	.globl	intr_handlers
	.bss
	.align	3
	.type	intr_handlers, @object
	.size	intr_handlers, 512
intr_handlers:
	.zero	512
	.globl	excp_handlers
	.align	3
	.type	excp_handlers, @object
	.size	excp_handlers, 512
excp_handlers:
	.zero	512
	.section	.rodata
	.align	3
.LC13:
	.string	"KTrap Info:\n"
	.align	3
.LC14:
	.string	"DIRECT"
	.align	3
.LC15:
	.string	"\tSet stvec to %#X, mode=%s\n"
	.align	3
.LC16:
	.string	"\tEnable All Supervisor Interrupts"
	.align	3
.LC17:
	.string	"\tRegister Supervisor Timer Interrupt Handler"
	.align	3
.LC18:
	.string	"\tRegister Supervisor External Interrupt Handler"
	.text
	.align	2
	.globl	ktrap_init
	.type	ktrap_init, @function
ktrap_init:
.LFB17:
	.file 1 "kernel/ktrap.c"
	.loc 1 61 22
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	.loc 1 62 5
	lla	a0,.LC13
	call	kprintf
.LBB2:
	.loc 1 64 22
	sd	zero,24(sp)
	.loc 1 64 49
	ld	a5,24(sp)
 #APP
# 64 "kernel/ktrap.c" 1
	csrw sscratch, a5
# 0 "" 2
 #NO_APP
.LBE2:
	.loc 1 66 5
	lla	a5,ktrap_enter
	lla	a2,.LC14
	mv	a1,a5
	lla	a0,.LC15
	call	kprintf
.LBB3:
	.loc 1 67 22
	lla	a5,ktrap_enter
	sd	a5,16(sp)
	.loc 1 67 91
	ld	a5,16(sp)
 #APP
# 67 "kernel/ktrap.c" 1
	csrw stvec, a5
# 0 "" 2
 #NO_APP
.LBE3:
	.loc 1 69 5
	lla	a0,.LC16
	call	kprintf
.LBB4:
	.loc 1 70 22
	li	a5,-1
	sd	a5,8(sp)
	.loc 1 70 50
	ld	a5,8(sp)
 #APP
# 70 "kernel/ktrap.c" 1
	csrw sie, a5
# 0 "" 2
 #NO_APP
.LBE4:
.LBB5:
	.loc 1 72 17
	sd	zero,40(sp)
	.loc 1 72 5
	j	.L2
.L3:
	.loc 1 73 9 discriminator 3
	lla	a3,general_ktrap_handler
	li	a2,0
	li	a1,0
	ld	a0,40(sp)
	call	register_ktrap_handler
	.loc 1 72 33 discriminator 3
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,40(sp)
.L2:
	.loc 1 72 26 discriminator 1
	ld	a4,40(sp)
	li	a5,63
	bleu	a4,a5,.L3
.LBE5:
.LBB6:
	.loc 1 74 17
	sd	zero,32(sp)
	.loc 1 74 5
	j	.L4
.L5:
	.loc 1 75 9 discriminator 3
	lla	a3,general_ktrap_handler
	li	a2,0
	li	a1,1
	ld	a0,32(sp)
	call	register_ktrap_handler
	.loc 1 74 33 discriminator 3
	ld	a5,32(sp)
	addi	a5,a5,1
	sd	a5,32(sp)
.L4:
	.loc 1 74 26 discriminator 1
	ld	a4,32(sp)
	li	a5,63
	bleu	a4,a5,.L5
.LBE6:
	.loc 1 77 5
	lla	a0,.LC17
	call	kprintf
	.loc 1 78 5
	lla	a3,ktimer_interrupt_handler
	lla	a2,.LC2
	li	a1,1
	li	a0,5
	call	register_ktrap_handler
	.loc 1 80 5
	lla	a0,.LC18
	call	kprintf
	.loc 1 81 5
	lla	a3,kplic_interrupt_handler
	lla	a2,.LC3
	li	a1,1
	li	a0,9
	call	register_ktrap_handler
	.loc 1 82 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	ktrap_init, .-ktrap_init
	.align	2
	.globl	ktrap_dispatcher
	.type	ktrap_dispatcher, @function
ktrap_dispatcher:
.LFB18:
	.loc 1 85 45
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
.LBB7:
	.loc 1 86 52
 #APP
# 86 "kernel/ktrap.c" 1
	csrr a5, scause
# 0 "" 2
 #NO_APP
	mv	ra,a5
	.loc 1 86 116
	mv	a5,ra
.LBE7:
	.loc 1 86 12
	sd	a5,40(sp)
	.loc 1 88 49
	ld	a5,40(sp)
	.loc 1 88 59
	srai	a5,a5,63
	andi	a5,a5,0xff
	.loc 1 88 10
	andi	a5,a5,1
	sb	a5,39(sp)
	.loc 1 89 14
	ld	a4,40(sp)
	li	a5,-1
	srli	a5,a5,1
	and	a5,a4,a5
	sd	a5,24(sp)
	.loc 1 90 75
	lbu	a5,39(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L7
	.loc 1 90 75 is_stmt 0 discriminator 1
	lla	a5,intr_handlers
	j	.L8
.L7:
	.loc 1 90 75 discriminator 2
	lla	a5,excp_handlers
.L8:
	.loc 1 90 91 is_stmt 1 discriminator 4
	ld	a4,24(sp)
	slli	a4,a4,3
	add	a5,a5,a4
	ld	a5,0(a5)
	.loc 1 90 75 discriminator 4
	ld	a0,8(sp)
	jalr	a5
.LVL0:
	sd	a0,16(sp)
	.loc 1 91 1 discriminator 4
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	ktrap_dispatcher, .-ktrap_dispatcher
	.section	.rodata
	.align	3
.LC19:
	.string	"Interrupt"
	.align	3
.LC20:
	.string	"Exception"
	.align	3
.LC21:
	.string	"==================================================================\n"
	.align	3
.LC22:
	.string	"Message from Kernel General Trap Handler:\n"
	.align	3
.LC23:
	.string	"%s Happened, %s ID: %#X, scause register: %#X\n"
	.align	3
.LC24:
	.string	"Detailed Message: %s\n"
	.align	3
.LC25:
	.string	"No %s handler register for this %s, with ID: %#X\n"
	.align	3
.LC26:
	.string	"Running %s instead\n"
	.align	3
.LC27:
	.string	"Printing Trap Frame:\n"
	.align	3
.LC28:
	.string	"Please register handler to avoid hanging!\n"
	.align	3
.LC29:
	.string	"Hanging HART Here\n"
	.text
	.align	2
	.globl	general_ktrap_handler
	.type	general_ktrap_handler, @function
general_ktrap_handler:
.LFB19:
	.loc 1 94 79
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
.LBB8:
	.loc 1 95 52
 #APP
# 95 "kernel/ktrap.c" 1
	csrr a5, scause
# 0 "" 2
 #NO_APP
	mv	ra,a5
	.loc 1 95 116
	mv	a5,ra
.LBE8:
	.loc 1 95 12
	sd	a5,56(sp)
	.loc 1 96 49
	ld	a5,56(sp)
	.loc 1 96 59
	srai	a5,a5,63
	andi	a5,a5,0xff
	.loc 1 96 10
	andi	a5,a5,1
	sb	a5,55(sp)
	.loc 1 97 14
	ld	a4,56(sp)
	li	a5,-1
	srli	a5,a5,1
	and	a5,a4,a5
	sd	a5,40(sp)
	.loc 1 98 57
	lbu	a5,55(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L10
	.loc 1 98 57 is_stmt 0 discriminator 1
	lla	a5,kintr_msg
	j	.L11
.L10:
	.loc 1 98 57 discriminator 2
	lla	a5,kexcp_msg
.L11:
	.loc 1 98 18 is_stmt 1 discriminator 4
	sd	a5,32(sp)
	.loc 1 99 33 discriminator 4
	ld	a5,40(sp)
	slli	a5,a5,3
	ld	a4,32(sp)
	add	a5,a4,a5
	.loc 1 99 17 discriminator 4
	ld	a5,0(a5)
	sd	a5,24(sp)
	.loc 1 100 17 discriminator 4
	lbu	a5,55(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L12
	.loc 1 100 17 is_stmt 0 discriminator 1
	lla	a5,.LC19
	j	.L13
.L12:
	.loc 1 100 17 discriminator 2
	lla	a5,.LC20
.L13:
	.loc 1 100 17 discriminator 4
	sd	a5,16(sp)
	.loc 1 101 5 is_stmt 1 discriminator 4
	lla	a0,.LC21
	call	kprintf
	.loc 1 102 5 discriminator 4
	lla	a0,.LC22
	call	kprintf
	.loc 1 103 5 discriminator 4
	ld	a4,56(sp)
	ld	a3,40(sp)
	ld	a2,16(sp)
	ld	a1,16(sp)
	lla	a0,.LC23
	call	kprintf
	.loc 1 104 5 discriminator 4
	ld	a1,24(sp)
	lla	a0,.LC24
	call	kprintf
	.loc 1 105 5 discriminator 4
	ld	a3,40(sp)
	ld	a2,16(sp)
	ld	a1,16(sp)
	lla	a0,.LC25
	call	kprintf
	.loc 1 106 5 discriminator 4
	lla	a1,__func__.0
	lla	a0,.LC26
	call	kprintf
	.loc 1 107 5 discriminator 4
	lla	a0,.LC27
	call	kprintf
	.loc 1 108 5 discriminator 4
	lla	a1,kprintf
	ld	a0,8(sp)
	call	print_ktrapframe
	.loc 1 109 5 discriminator 4
	lla	a0,.LC28
	call	kprintf
	.loc 1 110 5 discriminator 4
	lla	a0,.LC29
	call	kprintf
.L14:
	.loc 1 111 11 discriminator 1
	nop
	j	.L14
	.cfi_endproc
.LFE19:
	.size	general_ktrap_handler, .-general_ktrap_handler
	.align	2
	.globl	register_ktrap_handler
	.type	register_ktrap_handler, @function
register_ktrap_handler:
.LFB20:
	.loc 1 116 108
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,24(sp)
	mv	a5,a1
	sd	a2,8(sp)
	sd	a3,0(sp)
	sb	a5,23(sp)
	.loc 1 117 8
	ld	a5,8(sp)
	beq	a5,zero,.L16
	.loc 1 118 32
	lbu	a5,23(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L17
	.loc 1 118 32 is_stmt 0 discriminator 1
	lla	a5,kintr_msg
	j	.L18
.L17:
	.loc 1 118 32 discriminator 2
	lla	a5,kexcp_msg
.L18:
	.loc 1 118 44 is_stmt 1 discriminator 4
	ld	a4,24(sp)
	slli	a4,a4,3
	add	a5,a5,a4
	.loc 1 118 56 discriminator 4
	ld	a4,8(sp)
	sd	a4,0(a5)
.L16:
	.loc 1 119 32
	lbu	a5,23(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L19
	.loc 1 119 32 is_stmt 0 discriminator 1
	lla	a5,intr_handlers
	j	.L20
.L19:
	.loc 1 119 32 discriminator 2
	lla	a5,excp_handlers
.L20:
	.loc 1 119 48 is_stmt 1 discriminator 4
	ld	a4,24(sp)
	slli	a4,a4,3
	add	a5,a5,a4
	.loc 1 119 60 discriminator 4
	ld	a4,0(sp)
	sd	a4,0(a5)
	.loc 1 120 1 discriminator 4
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	register_ktrap_handler, .-register_ktrap_handler
	.section	.rodata
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 22
__func__.0:
	.string	"general_ktrap_handler"
	.text
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/trap/trapframe.h"
	.file 4 "include/kernel/ktrap.h"
	.file 5 "include/kernel/kplic.h"
	.file 6 "include/kernel/ktimer.h"
	.file 7 "include/kernel/kstdio.h"
	.file 8 "include/trap/trap_entry.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x8f0
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x18
	.4byte	.LASF67
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x8
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x5
	.4byte	.LASF8
	.byte	0x2
	.byte	0x1a
	.byte	0x17
	.4byte	0x4f
	.byte	0x8
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x13
	.4byte	0x56
	.byte	0x8
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x19
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	.LASF9
	.byte	0x2
	.byte	0x20
	.byte	0xe
	.4byte	0x7c
	.byte	0x8
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x5
	.4byte	.LASF11
	.byte	0x2
	.byte	0x23
	.byte	0x17
	.4byte	0x2e
	.byte	0x1a
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x2
	.byte	0x24
	.byte	0x6
	.4byte	0xaa
	.byte	0x14
	.4byte	.LASF12
	.byte	0
	.byte	0x14
	.4byte	.LASF13
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	.LASF14
	.byte	0x2
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x5
	.4byte	.LASF15
	.byte	0x2
	.byte	0x33
	.byte	0x12
	.4byte	0x43
	.byte	0x5
	.4byte	.LASF16
	.byte	0x2
	.byte	0x36
	.byte	0x12
	.4byte	0x43
	.byte	0x2
	.byte	0x1f
	.4byte	0xea
	.byte	0x1
	.string	"_x1"
	.byte	0x1f
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"ra"
	.byte	0x1f
	.byte	0x20
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x21
	.4byte	0x106
	.byte	0x1
	.string	"_x2"
	.byte	0x21
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"sp"
	.byte	0x21
	.byte	0x20
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x23
	.4byte	0x122
	.byte	0x1
	.string	"_x3"
	.byte	0x23
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"gp"
	.byte	0x23
	.byte	0x20
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x25
	.4byte	0x13e
	.byte	0x1
	.string	"_x4"
	.byte	0x25
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"tp"
	.byte	0x25
	.byte	0x20
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x27
	.4byte	0x15a
	.byte	0x1
	.string	"_x5"
	.byte	0x27
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"t0"
	.byte	0x27
	.byte	0x20
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x29
	.4byte	0x176
	.byte	0x1
	.string	"_x6"
	.byte	0x29
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"t1"
	.byte	0x29
	.byte	0x20
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x2b
	.4byte	0x192
	.byte	0x1
	.string	"_x7"
	.byte	0x2b
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"t2"
	.byte	0x2b
	.byte	0x20
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x2d
	.4byte	0x1b8
	.byte	0x1
	.string	"_x8"
	.byte	0x2d
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"s0"
	.byte	0x2d
	.byte	0x20
	.4byte	0xc2
	.byte	0x1
	.string	"fp"
	.byte	0x2d
	.byte	0x2b
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x2f
	.4byte	0x1d4
	.byte	0x1
	.string	"_x9"
	.byte	0x2f
	.byte	0x14
	.4byte	0xc2
	.byte	0x1
	.string	"s1"
	.byte	0x2f
	.byte	0x20
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x31
	.4byte	0x1ef
	.byte	0x4
	.4byte	.LASF17
	.byte	0x31
	.4byte	0xc2
	.byte	0x1
	.string	"a0"
	.byte	0x31
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x33
	.4byte	0x20a
	.byte	0x4
	.4byte	.LASF18
	.byte	0x33
	.4byte	0xc2
	.byte	0x1
	.string	"a1"
	.byte	0x33
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x35
	.4byte	0x225
	.byte	0x4
	.4byte	.LASF19
	.byte	0x35
	.4byte	0xc2
	.byte	0x1
	.string	"a2"
	.byte	0x35
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x37
	.4byte	0x240
	.byte	0x4
	.4byte	.LASF20
	.byte	0x37
	.4byte	0xc2
	.byte	0x1
	.string	"a3"
	.byte	0x37
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x39
	.4byte	0x25b
	.byte	0x4
	.4byte	.LASF21
	.byte	0x39
	.4byte	0xc2
	.byte	0x1
	.string	"a4"
	.byte	0x39
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x3b
	.4byte	0x276
	.byte	0x4
	.4byte	.LASF22
	.byte	0x3b
	.4byte	0xc2
	.byte	0x1
	.string	"a5"
	.byte	0x3b
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x3d
	.4byte	0x291
	.byte	0x4
	.4byte	.LASF23
	.byte	0x3d
	.4byte	0xc2
	.byte	0x1
	.string	"a6"
	.byte	0x3d
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x3f
	.4byte	0x2ac
	.byte	0x4
	.4byte	.LASF24
	.byte	0x3f
	.4byte	0xc2
	.byte	0x1
	.string	"a7"
	.byte	0x3f
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x41
	.4byte	0x2c7
	.byte	0x4
	.4byte	.LASF25
	.byte	0x41
	.4byte	0xc2
	.byte	0x1
	.string	"s2"
	.byte	0x41
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x43
	.4byte	0x2e2
	.byte	0x4
	.4byte	.LASF26
	.byte	0x43
	.4byte	0xc2
	.byte	0x1
	.string	"s3"
	.byte	0x43
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x45
	.4byte	0x2fd
	.byte	0x4
	.4byte	.LASF27
	.byte	0x45
	.4byte	0xc2
	.byte	0x1
	.string	"s4"
	.byte	0x45
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x47
	.4byte	0x318
	.byte	0x4
	.4byte	.LASF28
	.byte	0x47
	.4byte	0xc2
	.byte	0x1
	.string	"s5"
	.byte	0x47
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x49
	.4byte	0x333
	.byte	0x4
	.4byte	.LASF29
	.byte	0x49
	.4byte	0xc2
	.byte	0x1
	.string	"s6"
	.byte	0x49
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x4b
	.4byte	0x34e
	.byte	0x4
	.4byte	.LASF30
	.byte	0x4b
	.4byte	0xc2
	.byte	0x1
	.string	"s7"
	.byte	0x4b
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x4d
	.4byte	0x369
	.byte	0x4
	.4byte	.LASF31
	.byte	0x4d
	.4byte	0xc2
	.byte	0x1
	.string	"s8"
	.byte	0x4d
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x4f
	.4byte	0x384
	.byte	0x4
	.4byte	.LASF32
	.byte	0x4f
	.4byte	0xc2
	.byte	0x1
	.string	"s9"
	.byte	0x4f
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x51
	.4byte	0x3a0
	.byte	0x4
	.4byte	.LASF33
	.byte	0x51
	.4byte	0xc2
	.byte	0x1
	.string	"s10"
	.byte	0x51
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x53
	.4byte	0x3bc
	.byte	0x4
	.4byte	.LASF34
	.byte	0x53
	.4byte	0xc2
	.byte	0x1
	.string	"s11"
	.byte	0x53
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x55
	.4byte	0x3d7
	.byte	0x4
	.4byte	.LASF35
	.byte	0x55
	.4byte	0xc2
	.byte	0x1
	.string	"t3"
	.byte	0x55
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x57
	.4byte	0x3f2
	.byte	0x4
	.4byte	.LASF36
	.byte	0x57
	.4byte	0xc2
	.byte	0x1
	.string	"t4"
	.byte	0x57
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x59
	.4byte	0x40d
	.byte	0x4
	.4byte	.LASF37
	.byte	0x59
	.4byte	0xc2
	.byte	0x1
	.string	"t5"
	.byte	0x59
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.byte	0x5b
	.4byte	0x428
	.byte	0x4
	.4byte	.LASF38
	.byte	0x5b
	.4byte	0xc2
	.byte	0x1
	.string	"t6"
	.byte	0x5b
	.byte	0x21
	.4byte	0xc2
	.byte	0
	.byte	0x1b
	.4byte	.LASF40
	.byte	0xf8
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0x4f0
	.byte	0x3
	.4byte	0xce
	.byte	0
	.byte	0x3
	.4byte	0xea
	.byte	0x8
	.byte	0x3
	.4byte	0x106
	.byte	0x10
	.byte	0x3
	.4byte	0x122
	.byte	0x18
	.byte	0x3
	.4byte	0x13e
	.byte	0x20
	.byte	0x3
	.4byte	0x15a
	.byte	0x28
	.byte	0x3
	.4byte	0x176
	.byte	0x30
	.byte	0x3
	.4byte	0x192
	.byte	0x38
	.byte	0x3
	.4byte	0x1b8
	.byte	0x40
	.byte	0x3
	.4byte	0x1d4
	.byte	0x48
	.byte	0x3
	.4byte	0x1ef
	.byte	0x50
	.byte	0x3
	.4byte	0x20a
	.byte	0x58
	.byte	0x3
	.4byte	0x225
	.byte	0x60
	.byte	0x3
	.4byte	0x240
	.byte	0x68
	.byte	0x3
	.4byte	0x25b
	.byte	0x70
	.byte	0x3
	.4byte	0x276
	.byte	0x78
	.byte	0x3
	.4byte	0x291
	.byte	0x80
	.byte	0x3
	.4byte	0x2ac
	.byte	0x88
	.byte	0x3
	.4byte	0x2c7
	.byte	0x90
	.byte	0x3
	.4byte	0x2e2
	.byte	0x98
	.byte	0x3
	.4byte	0x2fd
	.byte	0xa0
	.byte	0x3
	.4byte	0x318
	.byte	0xa8
	.byte	0x3
	.4byte	0x333
	.byte	0xb0
	.byte	0x3
	.4byte	0x34e
	.byte	0xb8
	.byte	0x3
	.4byte	0x369
	.byte	0xc0
	.byte	0x3
	.4byte	0x384
	.byte	0xc8
	.byte	0x3
	.4byte	0x3a0
	.byte	0xd0
	.byte	0x3
	.4byte	0x3bc
	.byte	0xd8
	.byte	0x3
	.4byte	0x3d7
	.byte	0xe0
	.byte	0x3
	.4byte	0x3f2
	.byte	0xe8
	.byte	0x3
	.4byte	0x40d
	.byte	0xf0
	.byte	0
	.byte	0x5
	.4byte	.LASF39
	.byte	0x3
	.byte	0x7f
	.byte	0x3
	.4byte	0x428
	.byte	0x1c
	.4byte	.LASF41
	.2byte	0x120
	.byte	0x3
	.byte	0x8e
	.byte	0x10
	.4byte	0x553
	.byte	0x15
	.4byte	.LASF42
	.byte	0x90
	.byte	0xc
	.4byte	0xc2
	.byte	0
	.byte	0x15
	.4byte	.LASF43
	.byte	0x92
	.byte	0x12
	.4byte	0x4f0
	.byte	0x8
	.byte	0xc
	.4byte	.LASF44
	.byte	0x94
	.4byte	0xc2
	.2byte	0x100
	.byte	0xc
	.4byte	.LASF45
	.byte	0x96
	.4byte	0xc2
	.2byte	0x108
	.byte	0xc
	.4byte	.LASF46
	.byte	0x98
	.4byte	0xc2
	.2byte	0x110
	.byte	0xc
	.4byte	.LASF47
	.byte	0x9a
	.4byte	0xc2
	.2byte	0x118
	.byte	0
	.byte	0x5
	.4byte	.LASF48
	.byte	0x3
	.byte	0x9b
	.byte	0x3
	.4byte	0x4fc
	.byte	0x5
	.4byte	.LASF49
	.byte	0x3
	.byte	0x9f
	.byte	0x12
	.4byte	0x56b
	.byte	0xa
	.4byte	0x570
	.byte	0x16
	.4byte	0xaa
	.4byte	0x580
	.byte	0x9
	.4byte	0x580
	.byte	0x17
	.byte	0
	.byte	0xa
	.4byte	0x5d
	.byte	0x5
	.4byte	.LASF50
	.byte	0x4
	.byte	0x1f
	.byte	0x13
	.4byte	0x591
	.byte	0xa
	.4byte	0x596
	.byte	0x16
	.4byte	0x70
	.4byte	0x5a5
	.byte	0x9
	.4byte	0x5a5
	.byte	0
	.byte	0xa
	.4byte	0x553
	.byte	0xf
	.4byte	0x580
	.4byte	0x5ba
	.byte	0x10
	.4byte	0x4f
	.byte	0x3f
	.byte	0
	.byte	0xd
	.4byte	.LASF51
	.byte	0x13
	.byte	0xd
	.4byte	0x5aa
	.byte	0x9
	.byte	0x3
	.8byte	kintr_msg
	.byte	0xd
	.4byte	.LASF52
	.byte	0x23
	.byte	0xd
	.4byte	0x5aa
	.byte	0x9
	.byte	0x3
	.8byte	kexcp_msg
	.byte	0xf
	.4byte	0x585
	.4byte	0x5f4
	.byte	0x10
	.4byte	0x4f
	.byte	0x3f
	.byte	0
	.byte	0xd
	.4byte	.LASF53
	.byte	0x37
	.byte	0x11
	.4byte	0x5e4
	.byte	0x9
	.byte	0x3
	.8byte	intr_handlers
	.byte	0xd
	.4byte	.LASF54
	.byte	0x3a
	.byte	0x11
	.4byte	0x5e4
	.byte	0x9
	.byte	0x3
	.8byte	excp_handlers
	.byte	0x1d
	.4byte	.LASF68
	.byte	0x3
	.byte	0xba
	.byte	0x6
	.4byte	0x635
	.byte	0x9
	.4byte	0x5a5
	.byte	0x9
	.4byte	0x55f
	.byte	0
	.byte	0x11
	.4byte	.LASF55
	.byte	0x5
	.byte	0x35
	.byte	0x9
	.4byte	0x70
	.4byte	0x64b
	.byte	0x9
	.4byte	0x5a5
	.byte	0
	.byte	0x11
	.4byte	.LASF56
	.byte	0x6
	.byte	0x4f
	.byte	0x9
	.4byte	0x70
	.4byte	0x661
	.byte	0x9
	.4byte	0x5a5
	.byte	0
	.byte	0x1e
	.4byte	.LASF69
	.byte	0x8
	.byte	0x2b
	.byte	0xd
	.byte	0x11
	.4byte	.LASF57
	.byte	0x7
	.byte	0x43
	.byte	0x8
	.4byte	0xaa
	.4byte	0x680
	.byte	0x9
	.4byte	0x580
	.byte	0x17
	.byte	0
	.byte	0x1f
	.4byte	.LASF64
	.byte	0x1
	.byte	0x74
	.byte	0x6
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x6d8
	.byte	0xb
	.4byte	.LASF58
	.byte	0x74
	.byte	0x26
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0xb
	.4byte	.LASF59
	.byte	0x74
	.byte	0x36
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x77
	.byte	0x20
	.string	"msg"
	.byte	0x1
	.byte	0x74
	.byte	0x4d
	.4byte	0x580
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xb
	.4byte	.LASF60
	.byte	0x74
	.byte	0x62
	.4byte	0x585
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x21
	.4byte	.LASF70
	.byte	0x1
	.byte	0x5e
	.byte	0x23
	.4byte	0x70
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x78e
	.byte	0xb
	.4byte	.LASF61
	.byte	0x5e
	.byte	0x47
	.4byte	0x5a5
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x7
	.4byte	.LASF46
	.byte	0x5f
	.byte	0xc
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x7
	.4byte	.LASF62
	.byte	0x60
	.byte	0xa
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x7
	.4byte	.LASF58
	.byte	0x61
	.byte	0xe
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x7
	.4byte	.LASF63
	.byte	0x62
	.byte	0x12
	.4byte	0x78e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x6
	.string	"msg"
	.byte	0x63
	.byte	0x11
	.4byte	0x580
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x6
	.string	"s"
	.byte	0x64
	.byte	0x11
	.4byte	0x580
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x22
	.4byte	.LASF71
	.4byte	0x7a3
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0x12
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0x6
	.string	"__v"
	.byte	0x5f
	.byte	0x2f
	.4byte	0x4f
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	0x580
	.byte	0xf
	.4byte	0x5d
	.4byte	0x7a3
	.byte	0x10
	.4byte	0x4f
	.byte	0x15
	.byte	0
	.byte	0x13
	.4byte	0x793
	.byte	0x23
	.4byte	.LASF65
	.byte	0x1
	.byte	0x55
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x82c
	.byte	0xb
	.4byte	.LASF61
	.byte	0x55
	.byte	0x25
	.4byte	0x5a5
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x7
	.4byte	.LASF46
	.byte	0x56
	.byte	0xc
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x7
	.4byte	.LASF62
	.byte	0x58
	.byte	0xa
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x7
	.4byte	.LASF58
	.byte	0x59
	.byte	0xe
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x7
	.4byte	.LASF66
	.byte	0x5a
	.byte	0xd
	.4byte	0x70
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x12
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x6
	.string	"__v"
	.byte	0x56
	.byte	0x2f
	.4byte	0x4f
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0x24
	.4byte	.LASF72
	.byte	0x1
	.byte	0x3d
	.byte	0x6
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x86a
	.byte	0x6
	.string	"__v"
	.byte	0x40
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0xe
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x88e
	.byte	0x6
	.string	"__v"
	.byte	0x43
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0xe
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x8b2
	.byte	0x6
	.string	"__v"
	.byte	0x46
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0xe
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x8d4
	.byte	0x6
	.string	"i"
	.byte	0x48
	.byte	0x11
	.4byte	0xaa
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x12
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0x6
	.string	"i"
	.byte	0x4a
	.byte	0x11
	.4byte	0xaa
	.byte	0x2
	.byte	0x91
	.byte	0x60
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
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0xd
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x14
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
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
	.byte	0x7
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
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
	.byte	0x8
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
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
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
	.byte	0xc
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
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
	.byte	0x16
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
	.byte	0x4
	.byte	0x1
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x87,0x1
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
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x24
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
.LASF72:
	.string	"ktrap_init"
.LASF51:
	.string	"kintr_msg"
.LASF65:
	.string	"ktrap_dispatcher"
.LASF46:
	.string	"scause"
.LASF59:
	.string	"interrupt"
.LASF58:
	.string	"trap_code"
.LASF8:
	.string	"uint64_t"
.LASF7:
	.string	"short int"
.LASF14:
	.string	"size_t"
.LASF68:
	.string	"print_ktrapframe"
.LASF55:
	.string	"kplic_interrupt_handler"
.LASF57:
	.string	"kprintf"
.LASF16:
	.string	"ireg_t"
.LASF38:
	.string	"_x31"
.LASF37:
	.string	"_x30"
.LASF9:
	.string	"int64_t"
.LASF44:
	.string	"sstatus"
.LASF66:
	.string	"rtval"
.LASF15:
	.string	"addr_t"
.LASF63:
	.string	"msg_source"
.LASF39:
	.string	"gtrapframe_t"
.LASF12:
	.string	"False"
.LASF10:
	.string	"long int"
.LASF54:
	.string	"excp_handlers"
.LASF31:
	.string	"_x24"
.LASF32:
	.string	"_x25"
.LASF48:
	.string	"ktrapframe_t"
.LASF33:
	.string	"_x26"
.LASF2:
	.string	"unsigned char"
.LASF50:
	.string	"ktrap_handler_t"
.LASF41:
	.string	"__ktrapframe_t"
.LASF4:
	.string	"unsigned int"
.LASF49:
	.string	"printf_t"
.LASF42:
	.string	"sepc"
.LASF47:
	.string	"origin_a0"
.LASF71:
	.string	"__func__"
.LASF3:
	.string	"short unsigned int"
.LASF64:
	.string	"register_ktrap_handler"
.LASF61:
	.string	"ktf_ptr"
.LASF6:
	.string	"char"
.LASF40:
	.string	"__gtrapframe_t"
.LASF43:
	.string	"gregisters"
.LASF17:
	.string	"_x10"
.LASF18:
	.string	"_x11"
.LASF19:
	.string	"_x12"
.LASF20:
	.string	"_x13"
.LASF21:
	.string	"_x14"
.LASF22:
	.string	"_x15"
.LASF23:
	.string	"_x16"
.LASF24:
	.string	"_x17"
.LASF25:
	.string	"_x18"
.LASF26:
	.string	"_x19"
.LASF34:
	.string	"_x27"
.LASF35:
	.string	"_x28"
.LASF36:
	.string	"_x29"
.LASF5:
	.string	"long unsigned int"
.LASF62:
	.string	"is_interrupt"
.LASF60:
	.string	"trap_func"
.LASF67:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF53:
	.string	"intr_handlers"
.LASF70:
	.string	"general_ktrap_handler"
.LASF13:
	.string	"True"
.LASF52:
	.string	"kexcp_msg"
.LASF69:
	.string	"ktrap_enter"
.LASF56:
	.string	"ktimer_interrupt_handler"
.LASF27:
	.string	"_x20"
.LASF28:
	.string	"_x21"
.LASF29:
	.string	"_x22"
.LASF30:
	.string	"_x23"
.LASF45:
	.string	"sbadaddr"
.LASF11:
	.string	"Bool"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"kernel/ktrap.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
