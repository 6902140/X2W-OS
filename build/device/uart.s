	.file	"uart.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "device/uart.c"
	.align	2
	.type	read_8_bits, @function
read_8_bits:
.LFB0:
	.file 1 "include/io.h"
	.loc 1 160 47
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	.loc 1 160 64
	ld	a5,8(sp)
	.loc 1 160 57
	lbu	a5,0(a5)
	sb	a5,31(sp)
	.loc 1 160 89
	.loc 1 160 138
	lbu	a5,31(sp)
	.loc 1 160 143
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	read_8_bits, .-read_8_bits
	.align	2
	.type	write_8_bits, @function
write_8_bits:
.LFB4:
	.loc 1 165 60
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 1 165 70
	lbu	a5,7(sp)
	sb	a5,31(sp)
	.loc 1 165 83
	.loc 1 165 126
	ld	a5,8(sp)
	.loc 1 165 150
	lbu	a4,31(sp)
	sb	a4,0(a5)
	.loc 1 165 157
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	write_8_bits, .-write_8_bits
	.align	2
	.globl	uart_init
	.type	uart_init, @function
uart_init:
.LFB8:
	.file 2 "device/uart.c"
	.loc 2 19 21
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 2 22 14
	li	a5,1
	sh	a5,14(sp)
	.loc 2 25 5
	li	a1,0
	li	a5,268435456
	addi	a0,a5,1
	call	write_8_bits
	.loc 2 28 5
	li	a1,128
	li	a5,268435456
	addi	a0,a5,3
	call	write_8_bits
	.loc 2 29 57
	lhu	a5,14(sp)
	andi	a5,a5,0xff
	.loc 2 29 5
	andi	a5,a5,17
	andi	a5,a5,0xff
	mv	a1,a5
	li	a0,268435456
	call	write_8_bits
	.loc 2 30 68
	lhu	a5,14(sp)
	sext.w	a5,a5
	sraiw	a5,a5,8
	sext.w	a5,a5
	.loc 2 30 39
	andi	a5,a5,0xff
	.loc 2 30 5
	andi	a5,a5,17
	andi	a5,a5,0xff
	mv	a1,a5
	li	a5,268435456
	addi	a0,a5,1
	call	write_8_bits
	.loc 2 33 5
	li	a1,3
	li	a5,268435456
	addi	a0,a5,3
	call	write_8_bits
	.loc 2 36 5
	li	a1,199
	li	a5,268435456
	addi	a0,a5,2
	call	write_8_bits
	.loc 2 39 5
	li	a1,1
	li	a5,268435456
	addi	a0,a5,1
	call	write_8_bits
	.loc 2 40 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	uart_init, .-uart_init
	.align	2
	.globl	uart_put
	.type	uart_put, @function
uart_put:
.LFB9:
	.loc 2 43 24
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	mv	a5,a0
	sb	a5,15(sp)
	.loc 2 45 11
	nop
.L6:
	.loc 2 45 13 discriminator 1
	li	a5,268435456
	addi	a0,a5,5
	call	read_8_bits
	mv	a5,a0
	.loc 2 45 46 discriminator 1
	sext.w	a5,a5
	andi	a5,a5,64
	sext.w	a5,a5
	.loc 2 45 60 discriminator 1
	beq	a5,zero,.L6
	.loc 2 46 5
	lbu	a5,15(sp)
	mv	a1,a5
	li	a0,268435456
	call	write_8_bits
	.loc 2 47 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	uart_put, .-uart_put
	.align	2
	.globl	uart_puts
	.type	uart_puts, @function
uart_puts:
.LFB10:
	.loc 2 49 32
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
.LBB2:
	.loc 2 50 14
	sw	zero,28(sp)
	.loc 2 50 5
	j	.L8
.L9:
	.loc 2 51 28 discriminator 3
	lw	a5,28(sp)
	ld	a4,8(sp)
	add	a5,a4,a5
	.loc 2 51 9 discriminator 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_put
	.loc 2 50 38 discriminator 3
	lw	a5,28(sp)
	addiw	a5,a5,1
	sw	a5,28(sp)
.L8:
	.loc 2 50 24 discriminator 1
	lw	a5,28(sp)
	ld	a4,8(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 2 50 28 discriminator 1
	bne	a5,zero,.L9
.LBE2:
	.loc 2 52 1
	nop
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	uart_puts, .-uart_puts
	.align	2
	.globl	uart_get
	.type	uart_get, @function
uart_get:
.LFB11:
	.loc 2 54 20
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 2 55 9
	li	a5,268435456
	addi	a0,a5,5
	call	read_8_bits
	mv	a5,a0
	.loc 2 55 42
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	.loc 2 55 8
	beq	a5,zero,.L11
	.loc 2 56 16
	li	a0,268435456
	call	read_8_bits
	mv	a5,a0
	j	.L12
.L11:
	.loc 2 58 16
	li	a5,255
.L12:
	.loc 2 59 1
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	uart_get, .-uart_get
	.section	.rodata
	.align	3
.LC0:
	.string	"Enter an enter!\n"
	.text
	.align	2
	.globl	uart_interrupt_handler
	.type	uart_interrupt_handler, @function
uart_interrupt_handler:
.LFB12:
	.loc 2 62 34
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 2 63 14
	call	uart_get
	mv	a5,a0
	sb	a5,15(sp)
	.loc 2 66 13
	lbu	a5,15(sp)
	andi	a4,a5,0xff
	li	a5,13
	bne	a4,a5,.L14
	.loc 2 67 9
	lla	a0,.LC0
	call	uart_puts
.L14:
	.loc 2 70 5
	lbu	a5,15(sp)
	mv	a0,a5
	call	uart_put
	.loc 2 71 1
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	uart_interrupt_handler, .-uart_interrupt_handler
.Letext0:
	.file 3 "include/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x209
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x7
	.4byte	.LASF22
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF2
	.byte	0x17
	.byte	0x17
	.4byte	0x39
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x2
	.4byte	.LASF3
	.byte	0x18
	.byte	0x18
	.4byte	0x4b
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x2
	.4byte	.LASF7
	.byte	0x1a
	.byte	0x17
	.4byte	0x64
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x8
	.4byte	0x6b
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF10
	.byte	0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x2
	.4byte	.LASF12
	.byte	0x33
	.byte	0x12
	.4byte	0x59
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3e
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0xc1
	.byte	0x4
	.string	"c"
	.byte	0x2
	.byte	0x3f
	.byte	0xa
	.4byte	0x6b
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0x36
	.byte	0x6
	.4byte	0x6b
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.byte	0x3
	.4byte	.LASF14
	.byte	0x31
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x129
	.byte	0x6
	.string	"str"
	.byte	0x31
	.byte	0x1c
	.4byte	0x129
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xb
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x4
	.string	"i"
	.byte	0x2
	.byte	0x32
	.byte	0xe
	.4byte	0x7e
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x72
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2b
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x15a
	.byte	0x6
	.string	"chr"
	.byte	0x2b
	.byte	0x14
	.4byte	0x6b
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0x3
	.4byte	.LASF16
	.byte	0x13
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x186
	.byte	0xd
	.4byte	.LASF17
	.byte	0x2
	.byte	0x16
	.byte	0xe
	.4byte	0x40
	.byte	0x2
	.byte	0x91
	.byte	0x6e
	.byte	0
	.byte	0xe
	.4byte	.LASF20
	.byte	0x1
	.byte	0xa5
	.byte	0x14
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x1d0
	.byte	0x5
	.4byte	.LASF18
	.byte	0xa5
	.byte	0x28
	.4byte	0x8c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x5
	.4byte	.LASF19
	.byte	0xa5
	.byte	0x36
	.4byte	0x2e
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0xa5
	.byte	0x46
	.4byte	0x2e
	.byte	0x2
	.byte	0x91
	.byte	0x7f
	.byte	0
	.byte	0xf
	.4byte	.LASF21
	.byte	0x1
	.byte	0xa0
	.byte	0x17
	.4byte	0x2e
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.4byte	.LASF18
	.byte	0xa0
	.byte	0x2a
	.4byte	0x8c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0xa0
	.byte	0x39
	.4byte	0x2e
	.byte	0x2
	.byte	0x91
	.byte	0x7f
	.byte	0
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
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
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
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
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
.LASF6:
	.string	"unsigned int"
.LASF21:
	.string	"read_8_bits"
.LASF15:
	.string	"uart_put"
.LASF13:
	.string	"uart_interrupt_handler"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"uint64_t"
.LASF18:
	.string	"addr"
.LASF22:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF2:
	.string	"uint8_t"
.LASF4:
	.string	"unsigned char"
.LASF9:
	.string	"char"
.LASF14:
	.string	"uart_puts"
.LASF11:
	.string	"long int"
.LASF12:
	.string	"addr_t"
.LASF20:
	.string	"write_8_bits"
.LASF5:
	.string	"short unsigned int"
.LASF23:
	.string	"uart_get"
.LASF3:
	.string	"uint16_t"
.LASF19:
	.string	"value"
.LASF17:
	.string	"divisor"
.LASF10:
	.string	"short int"
.LASF16:
	.string	"uart_init"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"device/uart.c"
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
	.ident	"GCC: (g) 12.2.0"
