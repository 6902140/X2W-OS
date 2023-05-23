	.file	"test_uart.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "test/test_uart.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"=> test_uart:\n"
	.align	3
.LC2:
	.string	"Hello UART!\n"
	.align	3
.LC1:
	.string	"01234567890ABCDEFGHI./?\"'"
	.text
	.align	2
	.globl	test_uart
	.type	test_uart, @function
test_uart:
.LFB0:
	.file 1 "test/test_uart.c"
	.loc 1 19 20
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	.loc 1 21 5
	lla	a0,.LC0
	call	uart_puts
	.loc 1 22 10
	lla	a5,.LC1
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	sd	a2,0(sp)
	sd	a3,8(sp)
	sd	a4,16(sp)
	lhu	a5,24(a5)
	sh	a5,24(sp)
.LBB2:
	.loc 1 23 14
	sw	zero,44(sp)
	.loc 1 23 5
	j	.L2
.L3:
	.loc 1 24 9 discriminator 3
	lw	a5,44(sp)
	addi	a5,a5,48
	add	a5,a5,sp
	lbu	a5,-48(a5)
	mv	a0,a5
	call	uart_put
	.loc 1 23 56 discriminator 3
	lw	a5,44(sp)
	addiw	a5,a5,1
	sw	a5,44(sp)
.L2:
	.loc 1 23 23 discriminator 1
	lw	a5,44(sp)
	mv	a4,a5
	li	a5,25
	bleu	a4,a5,.L3
.LBE2:
	.loc 1 25 5
	li	a0,10
	call	uart_put
	.loc 1 28 11
	lla	a5,.LC2
	sd	a5,32(sp)
	.loc 1 29 5
	ld	a0,32(sp)
	call	uart_puts
	.loc 1 38 12
	li	a5,0
	.loc 1 39 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	test_uart, .-test_uart
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xdd
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x6
	.4byte	.LASF7
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x1
	.4byte	.LASF2
	.byte	0xf
	.4byte	0x3e
	.byte	0x2
	.4byte	0x3e
	.byte	0
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.byte	0x7
	.4byte	0x3e
	.byte	0x1
	.4byte	.LASF3
	.byte	0x11
	.4byte	0x5a
	.byte	0x2
	.4byte	0x5a
	.byte	0
	.byte	0x4
	.4byte	0x45
	.byte	0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x13
	.byte	0x5
	.4byte	0xbd
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0xbd
	.byte	0x9
	.4byte	.LASF4
	.byte	0x1
	.byte	0x16
	.byte	0xa
	.4byte	0xc4
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x5
	.string	"str"
	.byte	0x1c
	.byte	0xb
	.4byte	0xdb
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x5
	.string	"i"
	.byte	0x17
	.byte	0xe
	.4byte	0xbd
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xc
	.4byte	0x3e
	.4byte	0xd4
	.byte	0xd
	.4byte	0xd4
	.byte	0x19
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.byte	0x4
	.4byte	0x3e
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0xd
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
	.byte	0x4
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
.LASF2:
	.string	"uart_put"
.LASF6:
	.string	"long unsigned int"
.LASF4:
	.string	"charset"
.LASF7:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF8:
	.string	"test_uart"
.LASF5:
	.string	"char"
.LASF3:
	.string	"uart_puts"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"test/test_uart.c"
	.ident	"GCC: (g) 12.2.0"
