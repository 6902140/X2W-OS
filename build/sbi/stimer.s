	.file	"stimer.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "sbi/stimer.c"
	.align	2
	.type	write_64_bits, @function
write_64_bits:
.LFB7:
	.file 1 "include/io.h"
	.loc 1 168 62
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 168 73
	ld	a5,0(sp)
	sd	a5,24(sp)
	.loc 1 168 86
	.loc 1 168 129
	ld	a5,8(sp)
	.loc 1 168 154
	ld	a4,24(sp)
	sd	a4,0(a5)
	.loc 1 168 161
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	write_64_bits, .-write_64_bits
	.section	.rodata
	.align	3
.LC0:
	.string	"Machine Timer Interrupt"
	.text
	.align	2
	.globl	stimer_init
	.type	stimer_init, @function
stimer_init:
.LFB8:
	.file 2 "sbi/stimer.c"
	.loc 2 19 23
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 2 20 5
	lla	a3,stimer_interrupt_handler
	lla	a2,.LC0
	li	a1,1
	li	a0,7
	call	regitser_strap_handler
	.loc 2 21 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	stimer_init, .-stimer_init
	.align	2
	.globl	stimer_interrupt_handler
	.type	stimer_interrupt_handler, @function
stimer_interrupt_handler:
.LFB9:
	.loc 2 23 56
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
.LBB2:
	.loc 2 26 22
	li	a5,128
	sd	a5,24(sp)
	.loc 2 26 61
	ld	a5,24(sp)
 #APP
# 26 "sbi/stimer.c" 1
	csrc mie, a5
# 0 "" 2
 #NO_APP
.LBE2:
.LBB3:
	.loc 2 27 22
	li	a5,32
	sd	a5,16(sp)
	.loc 2 27 61
	ld	a5,16(sp)
 #APP
# 27 "sbi/stimer.c" 1
	csrs mip, a5
# 0 "" 2
 #NO_APP
.LBE3:
	.loc 2 28 12
	li	a5,0
	.loc 2 29 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	stimer_interrupt_handler, .-stimer_interrupt_handler
	.align	2
	.globl	clint_timer_event_start
	.type	clint_timer_event_start, @function
clint_timer_event_start:
.LFB10:
	.loc 2 32 50
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 2 33 5
	ld	a1,8(sp)
	li	a0,33570816
	call	write_64_bits
.LBB4:
	.loc 2 35 22
	li	a5,32
	sd	a5,24(sp)
	.loc 2 35 61
	ld	a5,24(sp)
 #APP
# 35 "sbi/stimer.c" 1
	csrc mip, a5
# 0 "" 2
 #NO_APP
.LBE4:
.LBB5:
	.loc 2 36 22
	li	a5,128
	sd	a5,16(sp)
	.loc 2 36 61
	ld	a5,16(sp)
 #APP
# 36 "sbi/stimer.c" 1
	csrs mie, a5
# 0 "" 2
 #NO_APP
.LBE5:
	.loc 2 37 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	clint_timer_event_start, .-clint_timer_event_start
.Letext0:
	.file 3 "include/types.h"
	.file 4 "include/trap/trapframe.h"
	.file 5 "include/sbi/strap.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x6c7
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xf
	.4byte	.LASF50
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.byte	0x1a
	.byte	0x17
	.4byte	0x4f
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x10
	.4byte	0x56
	.byte	0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	.LASF9
	.byte	0x3
	.byte	0x20
	.byte	0xe
	.4byte	0x7c
	.byte	0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x5
	.4byte	.LASF11
	.byte	0x3
	.byte	0x23
	.byte	0x17
	.4byte	0x2e
	.byte	0x12
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x3
	.byte	0x24
	.byte	0x6
	.4byte	0xaa
	.byte	0xb
	.4byte	.LASF12
	.byte	0
	.byte	0xb
	.4byte	.LASF13
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	.LASF14
	.byte	0x3
	.byte	0x33
	.byte	0x12
	.4byte	0x43
	.byte	0x5
	.4byte	.LASF15
	.byte	0x3
	.byte	0x36
	.byte	0x12
	.4byte	0x43
	.byte	0x2
	.byte	0x1f
	.4byte	0xde
	.byte	0x1
	.string	"_x1"
	.byte	0x1f
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"ra"
	.byte	0x1f
	.byte	0x20
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x21
	.4byte	0xfa
	.byte	0x1
	.string	"_x2"
	.byte	0x21
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"sp"
	.byte	0x21
	.byte	0x20
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x23
	.4byte	0x116
	.byte	0x1
	.string	"_x3"
	.byte	0x23
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"gp"
	.byte	0x23
	.byte	0x20
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x25
	.4byte	0x132
	.byte	0x1
	.string	"_x4"
	.byte	0x25
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"tp"
	.byte	0x25
	.byte	0x20
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x27
	.4byte	0x14e
	.byte	0x1
	.string	"_x5"
	.byte	0x27
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"t0"
	.byte	0x27
	.byte	0x20
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x29
	.4byte	0x16a
	.byte	0x1
	.string	"_x6"
	.byte	0x29
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"t1"
	.byte	0x29
	.byte	0x20
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x2b
	.4byte	0x186
	.byte	0x1
	.string	"_x7"
	.byte	0x2b
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"t2"
	.byte	0x2b
	.byte	0x20
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x2d
	.4byte	0x1ac
	.byte	0x1
	.string	"_x8"
	.byte	0x2d
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"s0"
	.byte	0x2d
	.byte	0x20
	.4byte	0xb6
	.byte	0x1
	.string	"fp"
	.byte	0x2d
	.byte	0x2b
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x2f
	.4byte	0x1c8
	.byte	0x1
	.string	"_x9"
	.byte	0x2f
	.byte	0x14
	.4byte	0xb6
	.byte	0x1
	.string	"s1"
	.byte	0x2f
	.byte	0x20
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x31
	.4byte	0x1e3
	.byte	0x4
	.4byte	.LASF16
	.byte	0x31
	.4byte	0xb6
	.byte	0x1
	.string	"a0"
	.byte	0x31
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x33
	.4byte	0x1fe
	.byte	0x4
	.4byte	.LASF17
	.byte	0x33
	.4byte	0xb6
	.byte	0x1
	.string	"a1"
	.byte	0x33
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x35
	.4byte	0x219
	.byte	0x4
	.4byte	.LASF18
	.byte	0x35
	.4byte	0xb6
	.byte	0x1
	.string	"a2"
	.byte	0x35
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x37
	.4byte	0x234
	.byte	0x4
	.4byte	.LASF19
	.byte	0x37
	.4byte	0xb6
	.byte	0x1
	.string	"a3"
	.byte	0x37
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x39
	.4byte	0x24f
	.byte	0x4
	.4byte	.LASF20
	.byte	0x39
	.4byte	0xb6
	.byte	0x1
	.string	"a4"
	.byte	0x39
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x3b
	.4byte	0x26a
	.byte	0x4
	.4byte	.LASF21
	.byte	0x3b
	.4byte	0xb6
	.byte	0x1
	.string	"a5"
	.byte	0x3b
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x3d
	.4byte	0x285
	.byte	0x4
	.4byte	.LASF22
	.byte	0x3d
	.4byte	0xb6
	.byte	0x1
	.string	"a6"
	.byte	0x3d
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x3f
	.4byte	0x2a0
	.byte	0x4
	.4byte	.LASF23
	.byte	0x3f
	.4byte	0xb6
	.byte	0x1
	.string	"a7"
	.byte	0x3f
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x41
	.4byte	0x2bb
	.byte	0x4
	.4byte	.LASF24
	.byte	0x41
	.4byte	0xb6
	.byte	0x1
	.string	"s2"
	.byte	0x41
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x43
	.4byte	0x2d6
	.byte	0x4
	.4byte	.LASF25
	.byte	0x43
	.4byte	0xb6
	.byte	0x1
	.string	"s3"
	.byte	0x43
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x45
	.4byte	0x2f1
	.byte	0x4
	.4byte	.LASF26
	.byte	0x45
	.4byte	0xb6
	.byte	0x1
	.string	"s4"
	.byte	0x45
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x47
	.4byte	0x30c
	.byte	0x4
	.4byte	.LASF27
	.byte	0x47
	.4byte	0xb6
	.byte	0x1
	.string	"s5"
	.byte	0x47
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x49
	.4byte	0x327
	.byte	0x4
	.4byte	.LASF28
	.byte	0x49
	.4byte	0xb6
	.byte	0x1
	.string	"s6"
	.byte	0x49
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x4b
	.4byte	0x342
	.byte	0x4
	.4byte	.LASF29
	.byte	0x4b
	.4byte	0xb6
	.byte	0x1
	.string	"s7"
	.byte	0x4b
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x4d
	.4byte	0x35d
	.byte	0x4
	.4byte	.LASF30
	.byte	0x4d
	.4byte	0xb6
	.byte	0x1
	.string	"s8"
	.byte	0x4d
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x4f
	.4byte	0x378
	.byte	0x4
	.4byte	.LASF31
	.byte	0x4f
	.4byte	0xb6
	.byte	0x1
	.string	"s9"
	.byte	0x4f
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x51
	.4byte	0x394
	.byte	0x4
	.4byte	.LASF32
	.byte	0x51
	.4byte	0xb6
	.byte	0x1
	.string	"s10"
	.byte	0x51
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x53
	.4byte	0x3b0
	.byte	0x4
	.4byte	.LASF33
	.byte	0x53
	.4byte	0xb6
	.byte	0x1
	.string	"s11"
	.byte	0x53
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x55
	.4byte	0x3cb
	.byte	0x4
	.4byte	.LASF34
	.byte	0x55
	.4byte	0xb6
	.byte	0x1
	.string	"t3"
	.byte	0x55
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x57
	.4byte	0x3e6
	.byte	0x4
	.4byte	.LASF35
	.byte	0x57
	.4byte	0xb6
	.byte	0x1
	.string	"t4"
	.byte	0x57
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x59
	.4byte	0x401
	.byte	0x4
	.4byte	.LASF36
	.byte	0x59
	.4byte	0xb6
	.byte	0x1
	.string	"t5"
	.byte	0x59
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.byte	0x5b
	.4byte	0x41c
	.byte	0x4
	.4byte	.LASF37
	.byte	0x5b
	.4byte	0xb6
	.byte	0x1
	.string	"t6"
	.byte	0x5b
	.byte	0x21
	.4byte	0xb6
	.byte	0
	.byte	0x13
	.4byte	.LASF39
	.byte	0xf8
	.byte	0x4
	.byte	0x1d
	.byte	0x10
	.4byte	0x4e4
	.byte	0x3
	.4byte	0xc2
	.byte	0
	.byte	0x3
	.4byte	0xde
	.byte	0x8
	.byte	0x3
	.4byte	0xfa
	.byte	0x10
	.byte	0x3
	.4byte	0x116
	.byte	0x18
	.byte	0x3
	.4byte	0x132
	.byte	0x20
	.byte	0x3
	.4byte	0x14e
	.byte	0x28
	.byte	0x3
	.4byte	0x16a
	.byte	0x30
	.byte	0x3
	.4byte	0x186
	.byte	0x38
	.byte	0x3
	.4byte	0x1ac
	.byte	0x40
	.byte	0x3
	.4byte	0x1c8
	.byte	0x48
	.byte	0x3
	.4byte	0x1e3
	.byte	0x50
	.byte	0x3
	.4byte	0x1fe
	.byte	0x58
	.byte	0x3
	.4byte	0x219
	.byte	0x60
	.byte	0x3
	.4byte	0x234
	.byte	0x68
	.byte	0x3
	.4byte	0x24f
	.byte	0x70
	.byte	0x3
	.4byte	0x26a
	.byte	0x78
	.byte	0x3
	.4byte	0x285
	.byte	0x80
	.byte	0x3
	.4byte	0x2a0
	.byte	0x88
	.byte	0x3
	.4byte	0x2bb
	.byte	0x90
	.byte	0x3
	.4byte	0x2d6
	.byte	0x98
	.byte	0x3
	.4byte	0x2f1
	.byte	0xa0
	.byte	0x3
	.4byte	0x30c
	.byte	0xa8
	.byte	0x3
	.4byte	0x327
	.byte	0xb0
	.byte	0x3
	.4byte	0x342
	.byte	0xb8
	.byte	0x3
	.4byte	0x35d
	.byte	0xc0
	.byte	0x3
	.4byte	0x378
	.byte	0xc8
	.byte	0x3
	.4byte	0x394
	.byte	0xd0
	.byte	0x3
	.4byte	0x3b0
	.byte	0xd8
	.byte	0x3
	.4byte	0x3cb
	.byte	0xe0
	.byte	0x3
	.4byte	0x3e6
	.byte	0xe8
	.byte	0x3
	.4byte	0x401
	.byte	0xf0
	.byte	0
	.byte	0x5
	.4byte	.LASF38
	.byte	0x4
	.byte	0x7f
	.byte	0x3
	.4byte	0x41c
	.byte	0x14
	.4byte	.LASF40
	.2byte	0x108
	.byte	0x4
	.byte	0x83
	.byte	0x10
	.4byte	0x525
	.byte	0xc
	.4byte	.LASF41
	.byte	0x85
	.byte	0xc
	.4byte	0xb6
	.byte	0
	.byte	0xc
	.4byte	.LASF42
	.byte	0x87
	.byte	0x12
	.4byte	0x4e4
	.byte	0x8
	.byte	0x15
	.4byte	.LASF43
	.byte	0x4
	.byte	0x89
	.byte	0xc
	.4byte	0xb6
	.2byte	0x100
	.byte	0
	.byte	0x5
	.4byte	.LASF44
	.byte	0x4
	.byte	0x8a
	.byte	0x3
	.4byte	0x4f0
	.byte	0xa
	.4byte	0x5d
	.byte	0x5
	.4byte	.LASF45
	.byte	0x5
	.byte	0x1e
	.byte	0x13
	.4byte	0x542
	.byte	0xa
	.4byte	0x547
	.byte	0x16
	.4byte	0x70
	.4byte	0x556
	.byte	0x7
	.4byte	0x556
	.byte	0
	.byte	0xa
	.4byte	0x525
	.byte	0x17
	.4byte	.LASF51
	.byte	0x5
	.byte	0x46
	.byte	0x6
	.4byte	0x57c
	.byte	0x7
	.4byte	0x43
	.byte	0x7
	.4byte	0x83
	.byte	0x7
	.4byte	0x531
	.byte	0x7
	.4byte	0x536
	.byte	0
	.byte	0x18
	.4byte	.LASF52
	.byte	0x2
	.byte	0x20
	.byte	0x6
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x5f0
	.byte	0x9
	.4byte	.LASF46
	.byte	0x2
	.byte	0x20
	.byte	0x27
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xd
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x5ce
	.byte	0x8
	.string	"__v"
	.byte	0x2
	.byte	0x23
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x8
	.string	"__v"
	.byte	0x2
	.byte	0x24
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF53
	.byte	0x2
	.byte	0x17
	.byte	0x9
	.4byte	0x70
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x668
	.byte	0x9
	.4byte	.LASF47
	.byte	0x2
	.byte	0x17
	.byte	0x30
	.4byte	0x556
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xd
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x646
	.byte	0x8
	.string	"__v"
	.byte	0x2
	.byte	0x1a
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0xe
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x8
	.string	"__v"
	.byte	0x2
	.byte	0x1b
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF54
	.byte	0x2
	.byte	0x13
	.byte	0x6
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.byte	0x1b
	.4byte	.LASF55
	.byte	0x1
	.byte	0xa8
	.byte	0x14
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF48
	.byte	0x1
	.byte	0xa8
	.byte	0x29
	.4byte	0xaa
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x9
	.4byte	.LASF49
	.byte	0x1
	.byte	0xa8
	.byte	0x38
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x8
	.string	"__v"
	.byte	0x1
	.byte	0xa8
	.byte	0x49
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
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
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
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
	.byte	0xe
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x1b
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
.LASF46:
	.string	"next_ticks"
.LASF45:
	.string	"strap_handler_t"
.LASF40:
	.string	"__strapframe_t"
.LASF8:
	.string	"uint64_t"
.LASF7:
	.string	"short int"
.LASF15:
	.string	"ireg_t"
.LASF37:
	.string	"_x31"
.LASF36:
	.string	"_x30"
.LASF9:
	.string	"int64_t"
.LASF14:
	.string	"addr_t"
.LASF38:
	.string	"gtrapframe_t"
.LASF12:
	.string	"False"
.LASF10:
	.string	"long int"
.LASF48:
	.string	"addr"
.LASF30:
	.string	"_x24"
.LASF55:
	.string	"write_64_bits"
.LASF31:
	.string	"_x25"
.LASF43:
	.string	"mstatus"
.LASF53:
	.string	"stimer_interrupt_handler"
.LASF32:
	.string	"_x26"
.LASF47:
	.string	"stf_ptr"
.LASF2:
	.string	"unsigned char"
.LASF41:
	.string	"mepc"
.LASF4:
	.string	"unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF52:
	.string	"clint_timer_event_start"
.LASF6:
	.string	"char"
.LASF39:
	.string	"__gtrapframe_t"
.LASF42:
	.string	"gregisters"
.LASF54:
	.string	"stimer_init"
.LASF16:
	.string	"_x10"
.LASF17:
	.string	"_x11"
.LASF18:
	.string	"_x12"
.LASF19:
	.string	"_x13"
.LASF20:
	.string	"_x14"
.LASF21:
	.string	"_x15"
.LASF22:
	.string	"_x16"
.LASF23:
	.string	"_x17"
.LASF24:
	.string	"_x18"
.LASF25:
	.string	"_x19"
.LASF33:
	.string	"_x27"
.LASF34:
	.string	"_x28"
.LASF35:
	.string	"_x29"
.LASF5:
	.string	"long unsigned int"
.LASF44:
	.string	"strapframe_t"
.LASF51:
	.string	"regitser_strap_handler"
.LASF50:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF13:
	.string	"True"
.LASF49:
	.string	"value"
.LASF26:
	.string	"_x20"
.LASF27:
	.string	"_x21"
.LASF28:
	.string	"_x22"
.LASF29:
	.string	"_x23"
.LASF11:
	.string	"Bool"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"sbi/stimer.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
