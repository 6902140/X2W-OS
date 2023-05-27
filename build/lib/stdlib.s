	.file	"stdlib.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "lib/stdlib.c"
	.align	2
	.globl	itoa
	.type	itoa, @function
itoa:
.LFB0:
	.file 1 "lib/stdlib.c"
	.loc 1 17 63
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a5,a2
	sb	a5,15(sp)
	.loc 1 19 31
	lbu	a5,15(sp)
	.loc 1 19 14
	ld	a4,24(sp)
	remu	a5,a4,a5
	sd	a5,40(sp)
	.loc 1 20 33
	lbu	a5,15(sp)
	.loc 1 20 14
	ld	a4,24(sp)
	divu	a5,a4,a5
	sd	a5,32(sp)
	.loc 1 22 8
	ld	a5,32(sp)
	beq	a5,zero,.L2
	.loc 1 23 9
	lbu	a5,15(sp)
	mv	a2,a5
	ld	a1,16(sp)
	ld	a0,32(sp)
	call	itoa
.L2:
	.loc 1 24 8
	ld	a4,40(sp)
	li	a5,9
	bgtu	a4,a5,.L3
	.loc 1 25 39
	ld	a5,40(sp)
	andi	a4,a5,0xff
	.loc 1 25 12
	ld	a5,16(sp)
	ld	a5,0(a5)
	.loc 1 25 26
	addi	a2,a5,1
	ld	a3,16(sp)
	sd	a2,0(a3)
	.loc 1 25 39
	addiw	a4,a4,48
	andi	a4,a4,0xff
	.loc 1 25 30
	sb	a4,0(a5)
	.loc 1 28 1
	j	.L5
.L3:
	.loc 1 27 44
	ld	a5,40(sp)
	andi	a4,a5,0xff
	.loc 1 27 12
	ld	a5,16(sp)
	ld	a5,0(a5)
	.loc 1 27 26
	addi	a2,a5,1
	ld	a3,16(sp)
	sd	a2,0(a3)
	.loc 1 27 44
	addiw	a4,a4,55
	andi	a4,a4,0xff
	.loc 1 27 30
	sb	a4,0(a5)
.L5:
	.loc 1 28 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	itoa, .-itoa
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
.LFB1:
	.loc 1 30 24
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	.loc 1 31 9
	li	a5,1
	sw	a5,28(sp)
	.loc 1 31 16
	sw	zero,24(sp)
	.loc 1 34 11
	j	.L7
.L8:
	.loc 1 36 12
	ld	a5,8(sp)
	addi	a5,a5,1
	sd	a5,8(sp)
.L7:
	.loc 1 34 12
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 34 17
	mv	a4,a5
	li	a5,32
	beq	a4,a5,.L8
	.loc 1 40 8
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 40 7
	mv	a4,a5
	li	a5,45
	bne	a4,a5,.L10
	.loc 1 41 14
	li	a5,-1
	sw	a5,28(sp)
	.loc 1 42 12
	ld	a5,8(sp)
	addi	a5,a5,1
	sd	a5,8(sp)
	.loc 1 46 10
	j	.L10
.L17:
	.loc 1 47 18
	lw	a5,24(sp)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sext.w	a4,a5
	.loc 1 47 25
	ld	a5,8(sp)
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 1 47 29
	addiw	a5,a5,-48
	sext.w	a5,a5
	.loc 1 47 13
	addw	a5,a4,a5
	sw	a5,24(sp)
	.loc 1 48 12
	ld	a5,8(sp)
	addi	a5,a5,1
	sd	a5,8(sp)
	.loc 1 49 12
	lw	a5,24(sp)
	sext.w	a4,a5
	li	a5,214749184
	addi	a5,a5,-820
	bgt	a4,a5,.L11
	.loc 1 49 35 discriminator 1
	lw	a5,24(sp)
	sext.w	a4,a5
	li	a5,214749184
	addi	a5,a5,-820
	bne	a4,a5,.L10
	.loc 1 49 66 discriminator 2
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 49 62 discriminator 2
	mv	a4,a5
	li	a5,55
	bleu	a4,a5,.L10
.L11:
	.loc 1 50 45
	lw	a5,28(sp)
	sext.w	a4,a5
	li	a5,-1
	bne	a4,a5,.L13
	.loc 1 50 45 is_stmt 0 discriminator 1
	li	a5,-2147483648
	j	.L15
.L13:
	.loc 1 50 45 discriminator 2
	li	a5,-2147483648
	xori	a5,a5,-1
	j	.L15
.L10:
	.loc 1 46 11 is_stmt 1
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 46 22
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L16
	.loc 1 46 25 discriminator 1
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 46 22 discriminator 1
	mv	a4,a5
	li	a5,57
	bleu	a4,a5,.L17
.L16:
	.loc 1 54 15
	lw	a5,24(sp)
	mv	a4,a5
	lw	a5,28(sp)
	mulw	a5,a4,a5
	sext.w	a5,a5
.L15:
	.loc 1 55 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	atoi, .-atoi
.Letext0:
	.file 2 "include/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x13f
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x6
	.4byte	.LASF18
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
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
	.byte	0x2
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
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.4byte	.LASF10
	.byte	0x20
	.byte	0xe
	.4byte	0x80
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x8
	.4byte	.LASF19
	.byte	0x1
	.byte	0x1e
	.byte	0x9
	.4byte	0x75
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xd6
	.byte	0x9
	.string	"str"
	.byte	0x1
	.byte	0x1e
	.byte	0x14
	.4byte	0xd6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF12
	.byte	0x1f
	.byte	0x9
	.4byte	0x6e
	.byte	0x2
	.byte	0x91
	.byte	0x7c
	.byte	0xa
	.string	"num"
	.byte	0x1
	.byte	0x1f
	.byte	0x10
	.4byte	0x6e
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x5
	.4byte	0x60
	.byte	0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0x11
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x13d
	.byte	0x4
	.4byte	.LASF13
	.byte	0x14
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.4byte	.LASF14
	.byte	0x24
	.4byte	0x13d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x4
	.4byte	.LASF15
	.byte	0x3a
	.4byte	0x2e
	.byte	0x2
	.byte	0x91
	.byte	0x4f
	.byte	0x3
	.4byte	.LASF16
	.byte	0x13
	.byte	0xe
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF17
	.byte	0x14
	.byte	0xe
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x5
	.4byte	0xd6
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
	.byte	0x3
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
	.byte	0x4
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0x11
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
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
.LASF14:
	.string	"buf_ptr_addr"
.LASF16:
	.string	"remain"
.LASF10:
	.string	"int64_t"
.LASF7:
	.string	"long unsigned int"
.LASF6:
	.string	"uint64_t"
.LASF15:
	.string	"base"
.LASF18:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF5:
	.string	"uint8_t"
.LASF2:
	.string	"unsigned char"
.LASF8:
	.string	"char"
.LASF11:
	.string	"long int"
.LASF12:
	.string	"sign"
.LASF3:
	.string	"short unsigned int"
.LASF19:
	.string	"atoi"
.LASF13:
	.string	"integer"
.LASF9:
	.string	"short int"
.LASF20:
	.string	"itoa"
.LASF17:
	.string	"quotient"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"lib/stdlib.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
