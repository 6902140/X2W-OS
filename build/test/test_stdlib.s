	.file	"test_stdlib.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "test/test_stdlib.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"=> "
	.align	3
.LC1:
	.string	": \n"
	.text
	.align	2
	.globl	test_stdlib
	.type	test_stdlib, @function
test_stdlib:
.LFB8:
	.file 1 "test/test_stdlib.c"
	.loc 1 24 22
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 25 5
	lla	a0,.LC0
	call	uart_puts
	.loc 1 25 23
	lla	a0,__func__.0
	call	uart_puts
	.loc 1 25 44
	lla	a0,.LC1
	call	uart_puts
	.loc 1 26 5
	call	_test_itoa
	.loc 1 27 5
	call	_test_atoi
	.loc 1 29 12
	li	a5,0
	.loc 1 30 1
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	test_stdlib, .-test_stdlib
	.section	.rodata
	.align	3
.LC2:
	.string	"\n"
	.text
	.align	2
	.globl	_test_itoa
	.type	_test_itoa, @function
_test_itoa:
.LFB9:
	.loc 1 32 22
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	.cfi_offset 1, -8
	.loc 1 34 10
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
.LBB2:
	.loc 1 35 14
	li	a5,2
	sw	a5,76(sp)
	.loc 1 35 5
	j	.L4
.L5:
.LBB3:
	.loc 1 36 15 discriminator 3
	addi	a5,sp,8
	sd	a5,0(sp)
	.loc 1 37 9 discriminator 3
	lw	a5,76(sp)
	mv	a4,sp
	li	a2,2
	mv	a1,a4
	mv	a0,a5
	call	itoa
	.loc 1 38 9 discriminator 3
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
	.loc 1 38 30 discriminator 3
	lla	a0,.LC2
	call	uart_puts
.LBE3:
	.loc 1 35 42 discriminator 3
	lw	a5,76(sp)
	slliw	a5,a5,1
	sw	a5,76(sp)
.L4:
	.loc 1 35 29 discriminator 1
	lw	a5,76(sp)
	sext.w	a4,a5
	li	a5,128
	ble	a4,a5,.L5
.LBE2:
	.loc 1 40 1
	nop
	nop
	ld	ra,88(sp)
	.cfi_restore 1
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	_test_itoa, .-_test_itoa
	.section	.rodata
	.align	3
.LC3:
	.string	"123456"
	.align	3
.LC4:
	.string	"Testing atoi,output :%d\n"
	.text
	.align	2
	.globl	_test_atoi
	.type	_test_atoi, @function
_test_atoi:
.LFB10:
	.loc 1 42 22
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	.cfi_offset 1, -8
	.loc 1 43 11
	lla	a5,.LC3
	sd	a5,104(sp)
	.loc 1 44 10
	sd	zero,0(sp)
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sw	zero,96(sp)
	.loc 1 45 5
	ld	a0,104(sp)
	call	atoi
	mv	a4,a0
	mv	a5,sp
	mv	a2,a4
	lla	a1,.LC4
	mv	a0,a5
	call	sprintf
	.loc 1 46 5
	mv	a5,sp
	mv	a0,a5
	call	uart_puts
	.loc 1 47 1
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	_test_atoi, .-_test_atoi
	.section	.rodata
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 12
__func__.0:
	.string	"test_stdlib"
	.text
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/stdfmt.h"
	.file 4 "include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x216
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xd
	.4byte	.LASF23
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x3
	.4byte	.LASF5
	.byte	0x17
	.byte	0x17
	.4byte	0x39
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x1a
	.byte	0x17
	.4byte	0x59
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0x8
	.4byte	0x60
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF10
	.byte	0x20
	.byte	0xe
	.4byte	0x85
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2a
	.byte	0x12
	.4byte	0x4e
	.byte	0x5
	.4byte	0x60
	.byte	0x9
	.4byte	.LASF13
	.byte	0x3
	.byte	0x88
	.byte	0x8
	.4byte	0x8c
	.4byte	0xb8
	.byte	0x2
	.4byte	0x97
	.byte	0x2
	.4byte	0xb8
	.byte	0xf
	.byte	0
	.byte	0x5
	.4byte	0x67
	.byte	0x9
	.4byte	.LASF14
	.byte	0x4
	.byte	0x59
	.byte	0x9
	.4byte	0x7a
	.4byte	0xd3
	.byte	0x2
	.4byte	0x97
	.byte	0
	.byte	0xa
	.4byte	.LASF15
	.byte	0x4
	.byte	0x52
	.byte	0x6
	.4byte	0xef
	.byte	0x2
	.4byte	0x4e
	.byte	0x2
	.4byte	0xef
	.byte	0x2
	.4byte	0x2e
	.byte	0
	.byte	0x5
	.4byte	0x97
	.byte	0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x10
	.byte	0xd
	.4byte	0x106
	.byte	0x2
	.4byte	0xb8
	.byte	0
	.byte	0xb
	.4byte	.LASF19
	.byte	0x2a
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x140
	.byte	0x4
	.4byte	.LASF17
	.byte	0x2b
	.byte	0xb
	.4byte	0x97
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.4byte	.LASF18
	.byte	0x2c
	.byte	0xa
	.4byte	0x140
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x6
	.4byte	0x60
	.4byte	0x150
	.byte	0x7
	.4byte	0x59
	.byte	0x63
	.byte	0
	.byte	0xb
	.4byte	.LASF20
	.byte	0x20
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x1be
	.byte	0x4
	.4byte	.LASF21
	.byte	0x22
	.byte	0xa
	.4byte	0x1be
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0xc
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x4
	.4byte	.LASF22
	.byte	0x23
	.byte	0xe
	.4byte	0x73
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xc
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x10
	.string	"str"
	.byte	0x1
	.byte	0x24
	.byte	0xf
	.4byte	0x97
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0
	.byte	0
	.byte	0
	.byte	0x6
	.4byte	0x60
	.4byte	0x1ce
	.byte	0x7
	.4byte	0x59
	.byte	0x3f
	.byte	0
	.byte	0x11
	.4byte	.LASF24
	.byte	0x1
	.byte	0x18
	.byte	0x5
	.4byte	0x73
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x204
	.byte	0x12
	.4byte	.LASF25
	.4byte	0x214
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0
	.byte	0x6
	.4byte	0x67
	.4byte	0x214
	.byte	0x7
	.4byte	0x59
	.byte	0xb
	.byte	0
	.byte	0x8
	.4byte	0x204
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
	.byte	0xf
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x12
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
.LASF4:
	.string	"unsigned int"
.LASF12:
	.string	"size_t"
.LASF13:
	.string	"sprintf"
.LASF10:
	.string	"int64_t"
.LASF7:
	.string	"long unsigned int"
.LASF6:
	.string	"uint64_t"
.LASF22:
	.string	"base"
.LASF18:
	.string	"sprintf_buffer"
.LASF23:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF5:
	.string	"uint8_t"
.LASF2:
	.string	"unsigned char"
.LASF8:
	.string	"char"
.LASF16:
	.string	"uart_puts"
.LASF11:
	.string	"long int"
.LASF24:
	.string	"test_stdlib"
.LASF3:
	.string	"short unsigned int"
.LASF14:
	.string	"atoi"
.LASF20:
	.string	"_test_itoa"
.LASF19:
	.string	"_test_atoi"
.LASF17:
	.string	"test"
.LASF9:
	.string	"short int"
.LASF15:
	.string	"itoa"
.LASF25:
	.string	"__func__"
.LASF21:
	.string	"itoa_buf"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"test/test_stdlib.c"
	.ident	"GCC: (g) 12.2.0"
