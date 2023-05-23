	.file	"sstdio.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "lib/sbi/sstdio.c"
	.align	2
	.globl	bprintf
	.type	bprintf, @function
bprintf:
.LFB8:
	.file 1 "lib/sbi/sstdio.c"
	.loc 1 16 40
	.cfi_startproc
	addi	sp,sp,-1136
	.cfi_def_cfa_offset 1136
	sd	ra,1064(sp)
	.cfi_offset 1, -72
	sd	a0,8(sp)
	sd	a1,1080(sp)
	sd	a2,1088(sp)
	sd	a3,1096(sp)
	sd	a4,1104(sp)
	sd	a5,1112(sp)
	sd	a6,1120(sp)
	sd	a7,1128(sp)
	.loc 1 18 5
	addi	a5,sp,1136
	sd	a5,0(sp)
	ld	a5,0(sp)
	addi	a5,a5,-56
	sd	a5,1048(sp)
	.loc 1 19 10
	sd	zero,24(sp)
	addi	a5,sp,32
	li	a4,1016
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 20 5
	ld	a4,1048(sp)
	addi	a5,sp,24
	mv	a2,a4
	ld	a1,8(sp)
	mv	a0,a5
	call	vsprintf
	.loc 1 22 5
	addi	a5,sp,24
	mv	a0,a5
	call	uart_puts
	.loc 1 23 12
	addi	a5,sp,24
	mv	a0,a5
	call	strlen
	mv	a5,a0
	.loc 1 24 1
	mv	a0,a5
	ld	ra,1064(sp)
	.cfi_restore 1
	addi	sp,sp,1136
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	bprintf, .-bprintf
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/stdarg.h"
	.file 4 "include/string.h"
	.file 5 "include/stdfmt.h"
	.file 6 "include/device/uart.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x143
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x6
	.4byte	.LASF15
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
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
	.4byte	.LASF9
	.byte	0x2
	.byte	0x1a
	.byte	0x17
	.4byte	0x4f
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x7
	.4byte	0x56
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x22
	.byte	0x1b
	.4byte	0x8f
	.byte	0x9
	.byte	0x8
	.4byte	.LASF16
	.byte	0x4
	.4byte	0x56
	.byte	0x5
	.4byte	.LASF12
	.byte	0x4
	.byte	0x6d
	.4byte	0x77
	.4byte	0xaf
	.byte	0x2
	.4byte	0xaf
	.byte	0
	.byte	0x4
	.4byte	0x5d
	.byte	0xa
	.4byte	.LASF17
	.byte	0x6
	.byte	0x3c
	.byte	0x6
	.4byte	0xc6
	.byte	0x2
	.4byte	0xaf
	.byte	0
	.byte	0x5
	.4byte	.LASF13
	.byte	0x5
	.byte	0x5b
	.4byte	0x77
	.4byte	0xe5
	.byte	0x2
	.4byte	0x95
	.byte	0x2
	.4byte	0xaf
	.byte	0x2
	.4byte	0x83
	.byte	0
	.byte	0xb
	.4byte	.LASF18
	.byte	0x1
	.byte	0x10
	.byte	0x8
	.4byte	0x77
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x139
	.byte	0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0x10
	.byte	0x1c
	.4byte	0xaf
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0xd
	.byte	0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0x11
	.byte	0xd
	.4byte	0x83
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0xf
	.string	"buf"
	.byte	0x1
	.byte	0x13
	.byte	0xa
	.4byte	0x139
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x77
	.byte	0
	.byte	0x10
	.4byte	0x56
	.byte	0x11
	.4byte	0x4f
	.2byte	0x3ff
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
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x21
	.byte	0x8
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
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
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
	.byte	0xc
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
	.byte	0xd
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
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
.LASF10:
	.string	"size_t"
.LASF16:
	.string	"__builtin_va_list"
.LASF18:
	.string	"bprintf"
.LASF5:
	.string	"long unsigned int"
.LASF9:
	.string	"uint64_t"
.LASF15:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF13:
	.string	"vsprintf"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"char"
.LASF17:
	.string	"uart_puts"
.LASF8:
	.string	"long int"
.LASF11:
	.string	"va_list"
.LASF12:
	.string	"strlen"
.LASF3:
	.string	"short unsigned int"
.LASF19:
	.string	"format"
.LASF7:
	.string	"short int"
.LASF14:
	.string	"args"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"lib/sbi/sstdio.c"
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
	.ident	"GCC: (g) 12.2.0"
