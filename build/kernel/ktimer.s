	.file	"ktimer.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "kernel/ktimer.c"
	.align	2
	.type	sbi_settimer, @function
sbi_settimer:
.LFB0:
	.file 1 "include/sbi/sbi.h"
	.loc 1 66 53
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
.LBB2:
	.loc 1 67 24
	ld	a0,8(sp)
	.loc 1 67 78
	li	a1,0
	.loc 1 67 123
	li	a2,0
	.loc 1 67 168
	li	a7,0
	.loc 1 67 212
 #APP
# 67 "include/sbi/sbi.h" 1
	ecall
# 0 "" 2
 #NO_APP
.LBE2:
	.loc 1 68 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	sbi_settimer, .-sbi_settimer
	.align	2
	.type	read_64_bits, @function
read_64_bits:
.LFB6:
	.file 2 "include/io.h"
	.loc 2 163 49
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	.loc 2 163 67
	ld	a5,8(sp)
	.loc 2 163 60
	ld	a5,0(a5)
	sd	a5,24(sp)
	.loc 2 163 93
	.loc 2 163 142
	ld	a5,24(sp)
	.loc 2 163 147
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	read_64_bits, .-read_64_bits
	.align	2
	.type	get_cycle, @function
get_cycle:
.LFB13:
	.file 3 "include/kernel/ktimer.h"
	.loc 3 50 39
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 3 51 12
	li	a5,33603584
	addi	a0,a5,-8
	call	read_64_bits
	mv	a5,a0
	.loc 3 52 1
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	get_cycle, .-get_cycle
	.globl	ticks
	.section	.sbss,"aw",@nobits
	.align	6
	.type	ticks, @object
	.size	ticks, 8
ticks:
	.zero	8
	.text
	.align	2
	.globl	reset_timer
	.type	reset_timer, @function
reset_timer:
.LFB14:
	.file 4 "kernel/ktimer.c"
	.loc 4 18 23
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 4 19 18
	call	get_cycle
	mv	a4,a0
	.loc 4 19 5
	li	a5,8192
	addi	a5,a5,1808
	add	a5,a4,a5
	mv	a0,a5
	call	sbi_settimer
.LBB3:
	.loc 4 21 22
	li	a5,32
	sd	a5,8(sp)
	.loc 4 21 61
	ld	a5,8(sp)
 #APP
# 21 "kernel/ktimer.c" 1
	csrs sie, a5
# 0 "" 2
 #NO_APP
.LBE3:
	.loc 4 22 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	reset_timer, .-reset_timer
	.align	2
	.globl	ktimer_init
	.type	ktimer_init, @function
ktimer_init:
.LFB15:
	.loc 4 24 23
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 4 25 5
	call	reset_timer
	.loc 4 26 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	ktimer_init, .-ktimer_init
	.align	2
	.globl	ktimer_interrupt_handler
	.type	ktimer_interrupt_handler, @function
ktimer_interrupt_handler:
.LFB16:
	.loc 4 28 56
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
.LBB4:
	.loc 4 30 22
	li	a5,32
	sd	a5,24(sp)
	.loc 4 30 61
	ld	a5,24(sp)
 #APP
# 30 "kernel/ktimer.c" 1
	csrc sie, a5
# 0 "" 2
 #NO_APP
.LBE4:
	.loc 4 32 5
	call	reset_timer
	.loc 4 33 10
	lla	a5,ticks
	ld	a5,0(a5)
	addi	a4,a5,1
	lla	a5,ticks
	sd	a4,0(a5)
	.loc 4 35 12
	li	a5,0
	.loc 4 36 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	ktimer_interrupt_handler, .-ktimer_interrupt_handler
.Letext0:
	.file 5 "include/types.h"
	.file 6 "include/trap/trapframe.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x6ed
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xd
	.4byte	.LASF52
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x5
	.byte	0x1a
	.byte	0x17
	.4byte	0x54
	.byte	0xe
	.4byte	0x43
	.byte	0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x5
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x7
	.4byte	.LASF9
	.byte	0x5
	.byte	0x20
	.byte	0xe
	.4byte	0x7c
	.byte	0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x7
	.4byte	.LASF11
	.byte	0x5
	.byte	0x33
	.byte	0x12
	.4byte	0x43
	.byte	0x7
	.4byte	.LASF12
	.byte	0x5
	.byte	0x36
	.byte	0x12
	.4byte	0x43
	.byte	0x10
	.4byte	.LASF53
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x1
	.byte	0x12
	.byte	0xe
	.4byte	0xc6
	.byte	0x8
	.4byte	.LASF13
	.byte	0
	.byte	0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.byte	0x2
	.byte	0x8
	.4byte	.LASF16
	.byte	0x3
	.byte	0
	.byte	0x2
	.byte	0x1f
	.4byte	0xe2
	.byte	0x1
	.string	"_x1"
	.byte	0x1f
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"ra"
	.byte	0x1f
	.byte	0x20
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x21
	.4byte	0xfe
	.byte	0x1
	.string	"_x2"
	.byte	0x21
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"sp"
	.byte	0x21
	.byte	0x20
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x23
	.4byte	0x11a
	.byte	0x1
	.string	"_x3"
	.byte	0x23
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"gp"
	.byte	0x23
	.byte	0x20
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x25
	.4byte	0x136
	.byte	0x1
	.string	"_x4"
	.byte	0x25
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"tp"
	.byte	0x25
	.byte	0x20
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x27
	.4byte	0x152
	.byte	0x1
	.string	"_x5"
	.byte	0x27
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"t0"
	.byte	0x27
	.byte	0x20
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x29
	.4byte	0x16e
	.byte	0x1
	.string	"_x6"
	.byte	0x29
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"t1"
	.byte	0x29
	.byte	0x20
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x2b
	.4byte	0x18a
	.byte	0x1
	.string	"_x7"
	.byte	0x2b
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"t2"
	.byte	0x2b
	.byte	0x20
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x2d
	.4byte	0x1b0
	.byte	0x1
	.string	"_x8"
	.byte	0x2d
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"s0"
	.byte	0x2d
	.byte	0x20
	.4byte	0x8f
	.byte	0x1
	.string	"fp"
	.byte	0x2d
	.byte	0x2b
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x2f
	.4byte	0x1cc
	.byte	0x1
	.string	"_x9"
	.byte	0x2f
	.byte	0x14
	.4byte	0x8f
	.byte	0x1
	.string	"s1"
	.byte	0x2f
	.byte	0x20
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x31
	.4byte	0x1e7
	.byte	0x4
	.4byte	.LASF17
	.byte	0x31
	.4byte	0x8f
	.byte	0x1
	.string	"a0"
	.byte	0x31
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x33
	.4byte	0x202
	.byte	0x4
	.4byte	.LASF18
	.byte	0x33
	.4byte	0x8f
	.byte	0x1
	.string	"a1"
	.byte	0x33
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x35
	.4byte	0x21d
	.byte	0x4
	.4byte	.LASF19
	.byte	0x35
	.4byte	0x8f
	.byte	0x1
	.string	"a2"
	.byte	0x35
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x37
	.4byte	0x238
	.byte	0x4
	.4byte	.LASF20
	.byte	0x37
	.4byte	0x8f
	.byte	0x1
	.string	"a3"
	.byte	0x37
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x39
	.4byte	0x253
	.byte	0x4
	.4byte	.LASF21
	.byte	0x39
	.4byte	0x8f
	.byte	0x1
	.string	"a4"
	.byte	0x39
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x3b
	.4byte	0x26e
	.byte	0x4
	.4byte	.LASF22
	.byte	0x3b
	.4byte	0x8f
	.byte	0x1
	.string	"a5"
	.byte	0x3b
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x3d
	.4byte	0x289
	.byte	0x4
	.4byte	.LASF23
	.byte	0x3d
	.4byte	0x8f
	.byte	0x1
	.string	"a6"
	.byte	0x3d
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x3f
	.4byte	0x2a4
	.byte	0x4
	.4byte	.LASF24
	.byte	0x3f
	.4byte	0x8f
	.byte	0x1
	.string	"a7"
	.byte	0x3f
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x41
	.4byte	0x2bf
	.byte	0x4
	.4byte	.LASF25
	.byte	0x41
	.4byte	0x8f
	.byte	0x1
	.string	"s2"
	.byte	0x41
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x43
	.4byte	0x2da
	.byte	0x4
	.4byte	.LASF26
	.byte	0x43
	.4byte	0x8f
	.byte	0x1
	.string	"s3"
	.byte	0x43
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x45
	.4byte	0x2f5
	.byte	0x4
	.4byte	.LASF27
	.byte	0x45
	.4byte	0x8f
	.byte	0x1
	.string	"s4"
	.byte	0x45
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x47
	.4byte	0x310
	.byte	0x4
	.4byte	.LASF28
	.byte	0x47
	.4byte	0x8f
	.byte	0x1
	.string	"s5"
	.byte	0x47
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x49
	.4byte	0x32b
	.byte	0x4
	.4byte	.LASF29
	.byte	0x49
	.4byte	0x8f
	.byte	0x1
	.string	"s6"
	.byte	0x49
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x4b
	.4byte	0x346
	.byte	0x4
	.4byte	.LASF30
	.byte	0x4b
	.4byte	0x8f
	.byte	0x1
	.string	"s7"
	.byte	0x4b
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x4d
	.4byte	0x361
	.byte	0x4
	.4byte	.LASF31
	.byte	0x4d
	.4byte	0x8f
	.byte	0x1
	.string	"s8"
	.byte	0x4d
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x4f
	.4byte	0x37c
	.byte	0x4
	.4byte	.LASF32
	.byte	0x4f
	.4byte	0x8f
	.byte	0x1
	.string	"s9"
	.byte	0x4f
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x51
	.4byte	0x398
	.byte	0x4
	.4byte	.LASF33
	.byte	0x51
	.4byte	0x8f
	.byte	0x1
	.string	"s10"
	.byte	0x51
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x53
	.4byte	0x3b4
	.byte	0x4
	.4byte	.LASF34
	.byte	0x53
	.4byte	0x8f
	.byte	0x1
	.string	"s11"
	.byte	0x53
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x55
	.4byte	0x3cf
	.byte	0x4
	.4byte	.LASF35
	.byte	0x55
	.4byte	0x8f
	.byte	0x1
	.string	"t3"
	.byte	0x55
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x57
	.4byte	0x3ea
	.byte	0x4
	.4byte	.LASF36
	.byte	0x57
	.4byte	0x8f
	.byte	0x1
	.string	"t4"
	.byte	0x57
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x59
	.4byte	0x405
	.byte	0x4
	.4byte	.LASF37
	.byte	0x59
	.4byte	0x8f
	.byte	0x1
	.string	"t5"
	.byte	0x59
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.byte	0x5b
	.4byte	0x420
	.byte	0x4
	.4byte	.LASF38
	.byte	0x5b
	.4byte	0x8f
	.byte	0x1
	.string	"t6"
	.byte	0x5b
	.byte	0x21
	.4byte	0x8f
	.byte	0
	.byte	0x11
	.4byte	.LASF40
	.byte	0xf8
	.byte	0x6
	.byte	0x1d
	.byte	0x10
	.4byte	0x4e8
	.byte	0x3
	.4byte	0xc6
	.byte	0
	.byte	0x3
	.4byte	0xe2
	.byte	0x8
	.byte	0x3
	.4byte	0xfe
	.byte	0x10
	.byte	0x3
	.4byte	0x11a
	.byte	0x18
	.byte	0x3
	.4byte	0x136
	.byte	0x20
	.byte	0x3
	.4byte	0x152
	.byte	0x28
	.byte	0x3
	.4byte	0x16e
	.byte	0x30
	.byte	0x3
	.4byte	0x18a
	.byte	0x38
	.byte	0x3
	.4byte	0x1b0
	.byte	0x40
	.byte	0x3
	.4byte	0x1cc
	.byte	0x48
	.byte	0x3
	.4byte	0x1e7
	.byte	0x50
	.byte	0x3
	.4byte	0x202
	.byte	0x58
	.byte	0x3
	.4byte	0x21d
	.byte	0x60
	.byte	0x3
	.4byte	0x238
	.byte	0x68
	.byte	0x3
	.4byte	0x253
	.byte	0x70
	.byte	0x3
	.4byte	0x26e
	.byte	0x78
	.byte	0x3
	.4byte	0x289
	.byte	0x80
	.byte	0x3
	.4byte	0x2a4
	.byte	0x88
	.byte	0x3
	.4byte	0x2bf
	.byte	0x90
	.byte	0x3
	.4byte	0x2da
	.byte	0x98
	.byte	0x3
	.4byte	0x2f5
	.byte	0xa0
	.byte	0x3
	.4byte	0x310
	.byte	0xa8
	.byte	0x3
	.4byte	0x32b
	.byte	0xb0
	.byte	0x3
	.4byte	0x346
	.byte	0xb8
	.byte	0x3
	.4byte	0x361
	.byte	0xc0
	.byte	0x3
	.4byte	0x37c
	.byte	0xc8
	.byte	0x3
	.4byte	0x398
	.byte	0xd0
	.byte	0x3
	.4byte	0x3b4
	.byte	0xd8
	.byte	0x3
	.4byte	0x3cf
	.byte	0xe0
	.byte	0x3
	.4byte	0x3ea
	.byte	0xe8
	.byte	0x3
	.4byte	0x405
	.byte	0xf0
	.byte	0
	.byte	0x7
	.4byte	.LASF39
	.byte	0x6
	.byte	0x7f
	.byte	0x3
	.4byte	0x420
	.byte	0x12
	.4byte	.LASF41
	.2byte	0x120
	.byte	0x6
	.byte	0x8e
	.byte	0x10
	.4byte	0x54b
	.byte	0xc
	.4byte	.LASF42
	.byte	0x90
	.byte	0xc
	.4byte	0x8f
	.byte	0
	.byte	0xc
	.4byte	.LASF43
	.byte	0x92
	.byte	0x12
	.4byte	0x4e8
	.byte	0x8
	.byte	0x9
	.4byte	.LASF44
	.byte	0x94
	.4byte	0x8f
	.2byte	0x100
	.byte	0x9
	.4byte	.LASF45
	.byte	0x96
	.4byte	0x8f
	.2byte	0x108
	.byte	0x9
	.4byte	.LASF46
	.byte	0x98
	.4byte	0x8f
	.2byte	0x110
	.byte	0x9
	.4byte	.LASF47
	.byte	0x9a
	.4byte	0x8f
	.2byte	0x118
	.byte	0
	.byte	0x7
	.4byte	.LASF48
	.byte	0x6
	.byte	0x9b
	.byte	0x3
	.4byte	0x4f4
	.byte	0x13
	.byte	0x8
	.4byte	0x54b
	.byte	0x14
	.4byte	.LASF54
	.byte	0x4
	.byte	0x10
	.byte	0x30
	.4byte	0x4f
	.byte	0x40
	.byte	0x9
	.byte	0x3
	.8byte	ticks
	.byte	0x15
	.4byte	.LASF55
	.byte	0x4
	.byte	0x1c
	.byte	0x9
	.4byte	0x70
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x5c7
	.byte	0xa
	.4byte	.LASF49
	.byte	0x4
	.byte	0x1c
	.byte	0x30
	.4byte	0x557
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xb
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x6
	.string	"__v"
	.byte	0x4
	.byte	0x1e
	.byte	0x16
	.4byte	0x54
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF56
	.byte	0x4
	.byte	0x18
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.byte	0x17
	.4byte	.LASF57
	.byte	0x4
	.byte	0x12
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x621
	.byte	0xb
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x6
	.string	"__v"
	.byte	0x4
	.byte	0x15
	.byte	0x16
	.4byte	0x54
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LASF58
	.byte	0x3
	.byte	0x32
	.byte	0x18
	.4byte	0x43
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.4byte	.LASF59
	.byte	0x2
	.byte	0xa3
	.byte	0x18
	.4byte	0x43
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x680
	.byte	0xa
	.4byte	.LASF50
	.byte	0x2
	.byte	0xa3
	.byte	0x2c
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.string	"__v"
	.byte	0x2
	.byte	0xa3
	.byte	0x3c
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x1a
	.4byte	.LASF60
	.byte	0x1
	.byte	0x42
	.byte	0x14
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.4byte	.LASF51
	.byte	0x1
	.byte	0x42
	.byte	0x2a
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0xb
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x6
	.string	"a0"
	.byte	0x1
	.byte	0x43
	.byte	0x18
	.4byte	0x8f
	.byte	0x1
	.byte	0x5a
	.byte	0x6
	.string	"a1"
	.byte	0x1
	.byte	0x43
	.byte	0x4e
	.4byte	0x8f
	.byte	0x1
	.byte	0x5b
	.byte	0x6
	.string	"a2"
	.byte	0x1
	.byte	0x43
	.byte	0x7b
	.4byte	0x8f
	.byte	0x1
	.byte	0x5c
	.byte	0x6
	.string	"a7"
	.byte	0x1
	.byte	0x43
	.byte	0xa8
	.4byte	0x8f
	.byte	0x1
	.byte	0x61
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
	.byte	0x6
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
	.byte	0x6
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
	.byte	0x6
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x6
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
	.byte	0xa
	.byte	0x5
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
	.byte	0xb
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x6
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
	.byte	0xd
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
	.byte	0xe
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x3f
	.byte	0x19
	.byte	0x88,0x1
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
	.byte	0x2e
	.byte	0
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
	.byte	0x19
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
	.byte	0x1a
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
.LASF54:
	.string	"ticks"
.LASF57:
	.string	"reset_timer"
.LASF60:
	.string	"sbi_settimer"
.LASF15:
	.string	"SBICALL_CONSOLE_PUTSTR"
.LASF8:
	.string	"uint64_t"
.LASF7:
	.string	"short int"
.LASF46:
	.string	"scause"
.LASF12:
	.string	"ireg_t"
.LASF58:
	.string	"get_cycle"
.LASF38:
	.string	"_x31"
.LASF37:
	.string	"_x30"
.LASF9:
	.string	"int64_t"
.LASF44:
	.string	"sstatus"
.LASF11:
	.string	"addr_t"
.LASF39:
	.string	"gtrapframe_t"
.LASF10:
	.string	"long int"
.LASF50:
	.string	"addr"
.LASF31:
	.string	"_x24"
.LASF32:
	.string	"_x25"
.LASF48:
	.string	"ktrapframe_t"
.LASF33:
	.string	"_x26"
.LASF59:
	.string	"read_64_bits"
.LASF2:
	.string	"unsigned char"
.LASF41:
	.string	"__ktrapframe_t"
.LASF51:
	.string	"next_ticks"
.LASF4:
	.string	"unsigned int"
.LASF13:
	.string	"SBICALL_SETTIMER"
.LASF47:
	.string	"origin_a0"
.LASF3:
	.string	"short unsigned int"
.LASF49:
	.string	"kft_ptr"
.LASF6:
	.string	"char"
.LASF40:
	.string	"__gtrapframe_t"
.LASF43:
	.string	"gregisters"
.LASF26:
	.string	"_x19"
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
.LASF16:
	.string	"SBICALL_CONSOLE_GETCHAR"
.LASF34:
	.string	"_x27"
.LASF35:
	.string	"_x28"
.LASF36:
	.string	"_x29"
.LASF56:
	.string	"ktimer_init"
.LASF5:
	.string	"long unsigned int"
.LASF53:
	.string	"__sbicall_id_t"
.LASF52:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF14:
	.string	"SBICALL_CONSOLE_PUTCHAR"
.LASF42:
	.string	"sepc"
.LASF55:
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
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
.LASF0:
	.string	"kernel/ktimer.c"
	.ident	"GCC: (g) 12.2.0"
