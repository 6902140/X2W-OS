	.file	"strap.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "sbi/strap.c"
	.globl	sintr_msg
	.section	.rodata
	.align	3
.LC0:
	.string	"User Software Interrupt"
	.align	3
.LC1:
	.string	"Supervisor Software Interrupt"
	.align	3
.LC2:
	.string	"Reserved for Future Standard Use"
	.align	3
.LC3:
	.string	"Machine Software Interrupt"
	.align	3
.LC4:
	.string	"User Timer Interrupt"
	.align	3
.LC5:
	.string	"Supervisor Timer Interrupt"
	.align	3
.LC6:
	.string	"Machine Timer Interrupt"
	.align	3
.LC7:
	.string	"User External Interrupt"
	.align	3
.LC8:
	.string	"Supervisor External Interrupt"
	.align	3
.LC9:
	.string	"Machine External Interrupt"
	.data
	.align	3
	.type	sintr_msg, @object
	.size	sintr_msg, 512
sintr_msg:
	.dword	.LC0
	.dword	.LC1
	.dword	.LC2
	.dword	.LC3
	.dword	.LC4
	.dword	.LC5
	.dword	.LC2
	.dword	.LC6
	.dword	.LC7
	.dword	.LC8
	.dword	.LC2
	.dword	.LC9
	.zero	416
	.globl	sexcp_msg
	.section	.rodata
	.align	3
.LC10:
	.string	"Instrution Address Misaligned"
	.align	3
.LC11:
	.string	"Instrution Access Fault"
	.align	3
.LC12:
	.string	"Illegal Instruction"
	.align	3
.LC13:
	.string	"Breakpoint"
	.align	3
.LC14:
	.string	"Load address Misaligned"
	.align	3
.LC15:
	.string	"Load access Fault"
	.align	3
.LC16:
	.string	"Store/AMO address Misaligned"
	.align	3
.LC17:
	.string	"Store/AMO Access Fault"
	.align	3
.LC18:
	.string	"Environment Call from U-Mode"
	.align	3
.LC19:
	.string	"Environment Call from S-Mode"
	.align	3
.LC20:
	.string	"Reserved"
	.align	3
.LC21:
	.string	"Environment Call from M-Mode"
	.align	3
.LC22:
	.string	"Instruction Page Fault"
	.align	3
.LC23:
	.string	"Load Page Fault"
	.align	3
.LC24:
	.string	"Store/AMO Page Fault"
	.data
	.align	3
	.type	sexcp_msg, @object
	.size	sexcp_msg, 512
sexcp_msg:
	.dword	.LC10
	.dword	.LC11
	.dword	.LC12
	.dword	.LC13
	.dword	.LC14
	.dword	.LC15
	.dword	.LC16
	.dword	.LC17
	.dword	.LC18
	.dword	.LC19
	.dword	.LC20
	.dword	.LC21
	.dword	.LC22
	.dword	.LC23
	.dword	.LC2
	.dword	.LC24
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
	.text
	.align	2
	.globl	strap_init
	.type	strap_init, @function
strap_init:
.LFB8:
	.file 1 "sbi/strap.c"
	.loc 1 60 22
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
.LBB2:
	.loc 1 62 22
	lla	a5,strap_enter
	sd	a5,8(sp)
	.loc 1 62 91
	ld	a5,8(sp)
 #APP
# 62 "sbi/strap.c" 1
	csrw mtvec, a5
# 0 "" 2
 #NO_APP
.LBE2:
.LBB3:
	.loc 1 64 22
	sd	zero,0(sp)
	.loc 1 64 49
	ld	a5,0(sp)
 #APP
# 64 "sbi/strap.c" 1
	csrw mie, a5
# 0 "" 2
 #NO_APP
.LBE3:
.LBB4:
	.loc 1 66 17
	sd	zero,24(sp)
	.loc 1 66 5
	j	.L2
.L3:
	.loc 1 67 9 discriminator 3
	lla	a3,general_strap_handler
	li	a2,0
	li	a1,0
	ld	a0,24(sp)
	call	regitser_strap_handler
	.loc 1 66 33 discriminator 3
	ld	a5,24(sp)
	addi	a5,a5,1
	sd	a5,24(sp)
.L2:
	.loc 1 66 26 discriminator 1
	ld	a4,24(sp)
	li	a5,63
	bleu	a4,a5,.L3
.LBE4:
.LBB5:
	.loc 1 68 17
	sd	zero,16(sp)
	.loc 1 68 5
	j	.L4
.L5:
	.loc 1 69 9 discriminator 3
	lla	a3,general_strap_handler
	li	a2,0
	li	a1,1
	ld	a0,16(sp)
	call	regitser_strap_handler
	.loc 1 68 33 discriminator 3
	ld	a5,16(sp)
	addi	a5,a5,1
	sd	a5,16(sp)
.L4:
	.loc 1 68 26 discriminator 1
	ld	a4,16(sp)
	li	a5,63
	bleu	a4,a5,.L5
.LBE5:
	.loc 1 71 5
	lla	a3,stimer_interrupt_handler
	lla	a2,.LC6
	li	a1,1
	li	a0,7
	call	regitser_strap_handler
	.loc 1 72 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	strap_init, .-strap_init
	.align	2
	.globl	delegate_traps
	.type	delegate_traps, @function
delegate_traps:
.LFB9:
	.loc 1 75 26
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	.loc 1 81 12
	li	a5,546
	sd	a5,24(sp)
	.loc 1 96 12
	li	a5,45056
	addi	a5,a5,429
	sd	a5,16(sp)
.LBB6:
	.loc 1 106 22
	ld	a5,24(sp)
	sd	a5,8(sp)
	.loc 1 106 68
	ld	a5,8(sp)
 #APP
# 106 "sbi/strap.c" 1
	csrw mideleg, a5
# 0 "" 2
 #NO_APP
.LBE6:
.LBB7:
	.loc 1 107 22
	ld	a5,16(sp)
	sd	a5,0(sp)
	.loc 1 107 68
	ld	a5,0(sp)
 #APP
# 107 "sbi/strap.c" 1
	csrw medeleg, a5
# 0 "" 2
 #NO_APP
.LBE7:
	.loc 1 108 1
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	delegate_traps, .-delegate_traps
	.align	2
	.globl	strap_dispatcher
	.type	strap_dispatcher, @function
strap_dispatcher:
.LFB10:
	.loc 1 111 45
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
.LBB8:
	.loc 1 112 52
 #APP
# 112 "sbi/strap.c" 1
	csrr a5, mcause
# 0 "" 2
 #NO_APP
	mv	ra,a5
	.loc 1 112 116
	mv	a5,ra
.LBE8:
	.loc 1 112 12
	sd	a5,40(sp)
	.loc 1 114 49
	ld	a5,40(sp)
	.loc 1 114 59
	srai	a5,a5,63
	andi	a5,a5,0xff
	.loc 1 114 10
	andi	a5,a5,1
	sb	a5,39(sp)
	.loc 1 115 14
	ld	a4,40(sp)
	li	a5,-1
	srli	a5,a5,1
	and	a5,a4,a5
	sd	a5,24(sp)
	.loc 1 116 75
	lbu	a5,39(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L8
	.loc 1 116 75 is_stmt 0 discriminator 1
	lla	a5,intr_handlers
	j	.L9
.L8:
	.loc 1 116 75 discriminator 2
	lla	a5,excp_handlers
.L9:
	.loc 1 116 91 is_stmt 1 discriminator 4
	ld	a4,24(sp)
	slli	a4,a4,3
	add	a5,a5,a4
	ld	a5,0(a5)
	.loc 1 116 75 discriminator 4
	ld	a0,8(sp)
	jalr	a5
.LVL0:
	sd	a0,16(sp)
	.loc 1 117 1 discriminator 4
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	strap_dispatcher, .-strap_dispatcher
	.section	.rodata
	.align	3
.LC25:
	.string	"Interrupt"
	.align	3
.LC26:
	.string	"Exception"
	.align	3
.LC27:
	.string	"==================================================================\n"
	.align	3
.LC28:
	.string	"Message from SBI General Trap Handler:\n"
	.align	3
.LC29:
	.string	"%s Happened, %s ID: %#X, mcause register: %#X\n"
	.align	3
.LC30:
	.string	"Detailed Message: %s\n"
	.align	3
.LC31:
	.string	"No %s handler register for this %s, with ID: %#X\n"
	.align	3
.LC32:
	.string	"Running %s instead\n"
	.align	3
.LC33:
	.string	"Printing Trap Frame:\n"
	.align	3
.LC34:
	.string	"Please register handler to avoid hanging!\n"
	.align	3
.LC35:
	.string	"Hanging HART Here\n"
	.text
	.align	2
	.globl	general_strap_handler
	.type	general_strap_handler, @function
general_strap_handler:
.LFB11:
	.loc 1 120 79
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
.LBB9:
	.loc 1 121 52
 #APP
# 121 "sbi/strap.c" 1
	csrr a5, mcause
# 0 "" 2
 #NO_APP
	mv	ra,a5
	.loc 1 121 116
	mv	a5,ra
.LBE9:
	.loc 1 121 12
	sd	a5,56(sp)
	.loc 1 122 49
	ld	a5,56(sp)
	.loc 1 122 59
	srai	a5,a5,63
	andi	a5,a5,0xff
	.loc 1 122 10
	andi	a5,a5,1
	sb	a5,55(sp)
	.loc 1 123 14
	ld	a4,56(sp)
	li	a5,-1
	srli	a5,a5,1
	and	a5,a4,a5
	sd	a5,40(sp)
	.loc 1 124 57
	lbu	a5,55(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L11
	.loc 1 124 57 is_stmt 0 discriminator 1
	lla	a5,sintr_msg
	j	.L12
.L11:
	.loc 1 124 57 discriminator 2
	lla	a5,sexcp_msg
.L12:
	.loc 1 124 18 is_stmt 1 discriminator 4
	sd	a5,32(sp)
	.loc 1 125 33 discriminator 4
	ld	a5,40(sp)
	slli	a5,a5,3
	ld	a4,32(sp)
	add	a5,a4,a5
	.loc 1 125 17 discriminator 4
	ld	a5,0(a5)
	sd	a5,24(sp)
	.loc 1 126 17 discriminator 4
	lbu	a5,55(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L13
	.loc 1 126 17 is_stmt 0 discriminator 1
	lla	a5,.LC25
	j	.L14
.L13:
	.loc 1 126 17 discriminator 2
	lla	a5,.LC26
.L14:
	.loc 1 126 17 discriminator 4
	sd	a5,16(sp)
	.loc 1 127 5 is_stmt 1 discriminator 4
	lla	a0,.LC27
	call	bprintf
	.loc 1 128 5 discriminator 4
	lla	a0,.LC28
	call	bprintf
	.loc 1 129 5 discriminator 4
	ld	a4,56(sp)
	ld	a3,40(sp)
	ld	a2,16(sp)
	ld	a1,16(sp)
	lla	a0,.LC29
	call	bprintf
	.loc 1 130 5 discriminator 4
	ld	a1,24(sp)
	lla	a0,.LC30
	call	bprintf
	.loc 1 131 5 discriminator 4
	ld	a3,40(sp)
	ld	a2,16(sp)
	ld	a1,16(sp)
	lla	a0,.LC31
	call	bprintf
	.loc 1 132 5 discriminator 4
	lla	a1,__func__.0
	lla	a0,.LC32
	call	bprintf
	.loc 1 133 5 discriminator 4
	lla	a0,.LC33
	call	bprintf
	.loc 1 134 5 discriminator 4
	lla	a1,bprintf
	ld	a0,8(sp)
	call	print_strapframe
	.loc 1 135 5 discriminator 4
	lla	a0,.LC34
	call	bprintf
	.loc 1 136 5 discriminator 4
	lla	a0,.LC35
	call	bprintf
.L15:
	.loc 1 137 11 discriminator 1
	nop
	j	.L15
	.cfi_endproc
.LFE11:
	.size	general_strap_handler, .-general_strap_handler
	.align	2
	.globl	regitser_strap_handler
	.type	regitser_strap_handler, @function
regitser_strap_handler:
.LFB12:
	.loc 1 142 108
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,24(sp)
	mv	a5,a1
	sd	a2,8(sp)
	sd	a3,0(sp)
	sb	a5,23(sp)
	.loc 1 143 8
	ld	a5,8(sp)
	beq	a5,zero,.L17
	.loc 1 144 32
	lbu	a5,23(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L18
	.loc 1 144 32 is_stmt 0 discriminator 1
	lla	a5,sintr_msg
	j	.L19
.L18:
	.loc 1 144 32 discriminator 2
	lla	a5,sexcp_msg
.L19:
	.loc 1 144 44 is_stmt 1 discriminator 4
	ld	a4,24(sp)
	slli	a4,a4,3
	add	a5,a5,a4
	.loc 1 144 56 discriminator 4
	ld	a4,8(sp)
	sd	a4,0(a5)
.L17:
	.loc 1 145 32
	lbu	a5,23(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L20
	.loc 1 145 32 is_stmt 0 discriminator 1
	lla	a5,intr_handlers
	j	.L21
.L20:
	.loc 1 145 32 discriminator 2
	lla	a5,excp_handlers
.L21:
	.loc 1 145 48 is_stmt 1 discriminator 4
	ld	a4,24(sp)
	slli	a4,a4,3
	add	a5,a5,a4
	.loc 1 145 60 discriminator 4
	ld	a4,0(sp)
	sd	a4,0(a5)
	.loc 1 146 1 discriminator 4
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	regitser_strap_handler, .-regitser_strap_handler
	.section	.rodata
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 22
__func__.0:
	.string	"general_strap_handler"
	.text
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/trap/trapframe.h"
	.file 4 "include/sbi/strap.h"
	.file 5 "include/sbi/sstdio.h"
	.file 6 "include/sbi/stimer.h"
	.file 7 "include/trap/trap_entry.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x90f
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
	.byte	0x11
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
	.byte	0x12
	.4byte	.LASF12
	.byte	0
	.byte	0x12
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
	.2byte	0x108
	.byte	0x3
	.byte	0x83
	.byte	0x10
	.4byte	0x531
	.byte	0x13
	.4byte	.LASF42
	.byte	0x85
	.byte	0xc
	.4byte	0xc2
	.byte	0
	.byte	0x13
	.4byte	.LASF43
	.byte	0x87
	.byte	0x12
	.4byte	0x4f0
	.byte	0x8
	.byte	0x1d
	.4byte	.LASF44
	.byte	0x3
	.byte	0x89
	.byte	0xc
	.4byte	0xc2
	.2byte	0x100
	.byte	0
	.byte	0x5
	.4byte	.LASF45
	.byte	0x3
	.byte	0x8a
	.byte	0x3
	.4byte	0x4fc
	.byte	0x5
	.4byte	.LASF46
	.byte	0x3
	.byte	0x9f
	.byte	0x12
	.4byte	0x549
	.byte	0xa
	.4byte	0x54e
	.byte	0x14
	.4byte	0xaa
	.4byte	0x55e
	.byte	0x9
	.4byte	0x55e
	.byte	0x15
	.byte	0
	.byte	0xa
	.4byte	0x5d
	.byte	0x5
	.4byte	.LASF47
	.byte	0x4
	.byte	0x1e
	.byte	0x13
	.4byte	0x56f
	.byte	0xa
	.4byte	0x574
	.byte	0x14
	.4byte	0x70
	.4byte	0x583
	.byte	0x9
	.4byte	0x583
	.byte	0
	.byte	0xa
	.4byte	0x531
	.byte	0xf
	.4byte	0x55e
	.4byte	0x598
	.byte	0x10
	.4byte	0x4f
	.byte	0x3f
	.byte	0
	.byte	0xc
	.4byte	.LASF48
	.byte	0x13
	.byte	0xd
	.4byte	0x588
	.byte	0x9
	.byte	0x3
	.8byte	sintr_msg
	.byte	0xc
	.4byte	.LASF49
	.byte	0x23
	.byte	0xd
	.4byte	0x588
	.byte	0x9
	.byte	0x3
	.8byte	sexcp_msg
	.byte	0xf
	.4byte	0x563
	.4byte	0x5d2
	.byte	0x10
	.4byte	0x4f
	.byte	0x3f
	.byte	0
	.byte	0xc
	.4byte	.LASF50
	.byte	0x37
	.byte	0x11
	.4byte	0x5c2
	.byte	0x9
	.byte	0x3
	.8byte	intr_handlers
	.byte	0xc
	.4byte	.LASF51
	.byte	0x3a
	.byte	0x11
	.4byte	0x5c2
	.byte	0x9
	.byte	0x3
	.8byte	excp_handlers
	.byte	0x1e
	.4byte	.LASF68
	.byte	0x3
	.byte	0xb1
	.byte	0x6
	.4byte	0x613
	.byte	0x9
	.4byte	0x583
	.byte	0x9
	.4byte	0x53d
	.byte	0
	.byte	0x16
	.4byte	.LASF52
	.byte	0x5
	.byte	0x43
	.byte	0x8
	.4byte	0xaa
	.4byte	0x62a
	.byte	0x9
	.4byte	0x55e
	.byte	0x15
	.byte	0
	.byte	0x16
	.4byte	.LASF53
	.byte	0x6
	.byte	0x1c
	.byte	0x9
	.4byte	0x70
	.4byte	0x640
	.byte	0x9
	.4byte	0x583
	.byte	0
	.byte	0x1f
	.4byte	.LASF69
	.byte	0x7
	.byte	0x18
	.byte	0xd
	.byte	0x17
	.4byte	.LASF61
	.byte	0x8e
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x69e
	.byte	0xb
	.4byte	.LASF54
	.byte	0x8e
	.byte	0x26
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0xb
	.4byte	.LASF55
	.byte	0x8e
	.byte	0x36
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x77
	.byte	0x20
	.string	"msg"
	.byte	0x1
	.byte	0x8e
	.byte	0x4d
	.4byte	0x55e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xb
	.4byte	.LASF56
	.byte	0x8e
	.byte	0x62
	.4byte	0x563
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x21
	.4byte	.LASF70
	.byte	0x1
	.byte	0x78
	.byte	0x23
	.4byte	0x70
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x754
	.byte	0xb
	.4byte	.LASF57
	.byte	0x78
	.byte	0x47
	.4byte	0x583
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x6
	.4byte	.LASF58
	.byte	0x79
	.byte	0xc
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF59
	.byte	0x7a
	.byte	0xa
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x6
	.4byte	.LASF54
	.byte	0x7b
	.byte	0xe
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.4byte	.LASF60
	.byte	0x7c
	.byte	0x12
	.4byte	0x754
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x7
	.string	"msg"
	.byte	0x7d
	.byte	0x11
	.4byte	0x55e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x7
	.string	"s"
	.byte	0x7e
	.byte	0x11
	.4byte	0x55e
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x22
	.4byte	.LASF71
	.4byte	0x769
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0xd
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.byte	0x7
	.string	"__v"
	.byte	0x79
	.byte	0x2f
	.4byte	0x4f
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	0x55e
	.byte	0xf
	.4byte	0x5d
	.4byte	0x769
	.byte	0x10
	.4byte	0x4f
	.byte	0x15
	.byte	0
	.byte	0x11
	.4byte	0x759
	.byte	0x23
	.4byte	.LASF62
	.byte	0x1
	.byte	0x6f
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x7f2
	.byte	0xb
	.4byte	.LASF57
	.byte	0x6f
	.byte	0x25
	.4byte	0x583
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x6
	.4byte	.LASF58
	.byte	0x70
	.byte	0xc
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF59
	.byte	0x72
	.byte	0xa
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x6
	.4byte	.LASF54
	.byte	0x73
	.byte	0xe
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.4byte	.LASF63
	.byte	0x74
	.byte	0xd
	.4byte	0x70
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xd
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0x7
	.string	"__v"
	.byte	0x70
	.byte	0x2f
	.4byte	0x4f
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LASF64
	.byte	0x4b
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x86f
	.byte	0x6
	.4byte	.LASF65
	.byte	0x51
	.byte	0xc
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x6
	.4byte	.LASF66
	.byte	0x60
	.byte	0xc
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0xe
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x84e
	.byte	0x7
	.string	"__v"
	.byte	0x6a
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xd
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x7
	.string	"__v"
	.byte	0x6b
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x24
	.4byte	.LASF72
	.byte	0x1
	.byte	0x3c
	.byte	0x6
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x8ad
	.byte	0x7
	.string	"__v"
	.byte	0x3e
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0xe
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x8d1
	.byte	0x7
	.string	"__v"
	.byte	0x40
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0xe
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x8f3
	.byte	0x7
	.string	"i"
	.byte	0x42
	.byte	0x11
	.4byte	0xaa
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xd
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x7
	.string	"i"
	.byte	0x44
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
	.byte	0x7
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
	.byte	0xd
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
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
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x1e
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
	.byte	0x1f
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
.LASF47:
	.string	"strap_handler_t"
.LASF55:
	.string	"interrupt"
.LASF54:
	.string	"trap_code"
.LASF41:
	.string	"__strapframe_t"
.LASF48:
	.string	"sintr_msg"
.LASF68:
	.string	"print_strapframe"
.LASF8:
	.string	"uint64_t"
.LASF7:
	.string	"short int"
.LASF14:
	.string	"size_t"
.LASF16:
	.string	"ireg_t"
.LASF38:
	.string	"_x31"
.LASF37:
	.string	"_x30"
.LASF9:
	.string	"int64_t"
.LASF63:
	.string	"rtval"
.LASF15:
	.string	"addr_t"
.LASF60:
	.string	"msg_source"
.LASF39:
	.string	"gtrapframe_t"
.LASF12:
	.string	"False"
.LASF10:
	.string	"long int"
.LASF51:
	.string	"excp_handlers"
.LASF31:
	.string	"_x24"
.LASF32:
	.string	"_x25"
.LASF44:
	.string	"mstatus"
.LASF53:
	.string	"stimer_interrupt_handler"
.LASF33:
	.string	"_x26"
.LASF57:
	.string	"stf_ptr"
.LASF2:
	.string	"unsigned char"
.LASF42:
	.string	"mepc"
.LASF4:
	.string	"unsigned int"
.LASF46:
	.string	"printf_t"
.LASF66:
	.string	"delegated_exceptions"
.LASF69:
	.string	"strap_enter"
.LASF71:
	.string	"__func__"
.LASF3:
	.string	"short unsigned int"
.LASF70:
	.string	"general_strap_handler"
.LASF64:
	.string	"delegate_traps"
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
.LASF52:
	.string	"bprintf"
.LASF5:
	.string	"long unsigned int"
.LASF45:
	.string	"strapframe_t"
.LASF59:
	.string	"is_interrupt"
.LASF49:
	.string	"sexcp_msg"
.LASF61:
	.string	"regitser_strap_handler"
.LASF67:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF50:
	.string	"intr_handlers"
.LASF56:
	.string	"trap_func"
.LASF13:
	.string	"True"
.LASF62:
	.string	"strap_dispatcher"
.LASF65:
	.string	"delegated_interrupts"
.LASF72:
	.string	"strap_init"
.LASF27:
	.string	"_x20"
.LASF28:
	.string	"_x21"
.LASF29:
	.string	"_x22"
.LASF30:
	.string	"_x23"
.LASF58:
	.string	"mcause"
.LASF11:
	.string	"Bool"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"sbi/strap.c"
	.ident	"GCC: (g) 12.2.0"
