	.file	"test.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "test/test.c"
	.globl	_Test
	.bss
	.align	3
	.type	_Test, @object
	.size	_Test, 168
_Test:
	.zero	168
	.text
	.align	2
	.globl	register_test_func
	.type	register_test_func, @function
register_test_func:
.LFB0:
	.file 1 "test/test.c"
	.loc 1 31 50
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 1 33 14
	lla	a5,_Test
	lbu	a5,0(a5)
	.loc 1 33 8
	mv	a4,a5
	li	a5,18
	bgtu	a4,a5,.L3
	.loc 1 34 35
	lla	a5,_Test
	lbu	a5,0(a5)
	.loc 1 34 47
	addiw	a4,a5,1
	andi	a3,a4,0xff
	lla	a4,_Test
	sb	a3,0(a4)
	sext.w	a5,a5
	.loc 1 34 51
	lla	a4,_Test
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,8(sp)
	sd	a4,8(a5)
.L3:
	.loc 1 36 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	register_test_func, .-register_test_func
	.align	2
	.globl	test_all
	.type	test_all, @function
test_all:
.LFB1:
	.loc 1 39 20
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 1 42 5
	lla	a0,test_uart
	call	register_test_func
	.loc 1 43 5
	lla	a0,test_stdlib
	call	register_test_func
	.loc 1 44 5
	lla	a0,test_stdfmt
	call	register_test_func
	.loc 1 45 5
	lla	a0,test_string
	call	register_test_func
	.loc 1 46 5
	lla	a0,test_kstdio
	call	register_test_func
.LBB2:
	.loc 1 50 14
	sw	zero,12(sp)
	.loc 1 50 5
	j	.L5
.L6:
	.loc 1 51 10 discriminator 3
	lla	a4,_Test
	lw	a5,12(sp)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,8(a5)
	jalr	a5
.LVL0:
	.loc 1 50 45 discriminator 3
	lw	a5,12(sp)
	addiw	a5,a5,1
	sw	a5,12(sp)
.L5:
	.loc 1 50 30 discriminator 1
	lla	a5,_Test
	lbu	a5,0(a5)
	sext.w	a4,a5
	.loc 1 50 23 discriminator 1
	lw	a5,12(sp)
	sext.w	a5,a5
	blt	a5,a4,.L6
.LBE2:
	.loc 1 53 1
	nop
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	test_all, .-test_all
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/test/test.h"
	.file 4 "include/test/test_kstdio.h"
	.file 5 "include/test/test_string.h"
	.file 6 "include/test/test_stdfmt.h"
	.file 7 "include/test/test_stdlib.h"
	.file 8 "include/test/test_uart.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x16d
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x5
	.4byte	.LASF18
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x17
	.byte	0x17
	.4byte	0x3a
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
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x1c
	.byte	0xf
	.4byte	0x7e
	.byte	0x7
	.byte	0x8
	.4byte	0x84
	.byte	0x8
	.4byte	0x64
	.byte	0x9
	.byte	0xa8
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.4byte	0xab
	.byte	0x4
	.4byte	.LASF11
	.byte	0x16
	.byte	0xd
	.4byte	0x2e
	.byte	0
	.byte	0x4
	.4byte	.LASF12
	.byte	0x18
	.byte	0x19
	.4byte	0xab
	.byte	0x8
	.byte	0
	.byte	0xa
	.4byte	0x72
	.4byte	0xbb
	.byte	0xb
	.4byte	0x4f
	.byte	0x13
	.byte	0
	.byte	0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0x19
	.byte	0x3
	.4byte	0x89
	.byte	0x9
	.byte	0x3
	.8byte	_Test
	.byte	0x2
	.4byte	.LASF13
	.byte	0x4
	.byte	0x14
	.4byte	0x64
	.byte	0x2
	.4byte	.LASF14
	.byte	0x5
	.byte	0x14
	.4byte	0x64
	.byte	0x2
	.4byte	.LASF15
	.byte	0x6
	.byte	0x15
	.4byte	0x64
	.byte	0x2
	.4byte	.LASF16
	.byte	0x7
	.byte	0x15
	.4byte	0x64
	.byte	0x2
	.4byte	.LASF17
	.byte	0x8
	.byte	0x12
	.4byte	0x64
	.byte	0xd
	.4byte	.LASF20
	.byte	0x1
	.byte	0x27
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x146
	.byte	0xe
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xf
	.string	"i"
	.byte	0x1
	.byte	0x32
	.byte	0xe
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF21
	.byte	0x1
	.byte	0x1f
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x1f
	.byte	0x2d
	.4byte	0x72
	.byte	0x2
	.byte	0x91
	.byte	0x78
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
	.byte	0x21
	.byte	0x5
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
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
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x13
	.byte	0x1
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
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0
	.byte	0
	.byte	0x11
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
.LASF13:
	.string	"test_kstdio"
.LASF4:
	.string	"unsigned int"
.LASF17:
	.string	"test_uart"
.LASF20:
	.string	"test_all"
.LASF15:
	.string	"test_stdfmt"
.LASF11:
	.string	"regiter_idx"
.LASF5:
	.string	"long unsigned int"
.LASF21:
	.string	"register_test_func"
.LASF10:
	.string	"test_func_pointer_t"
.LASF18:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF9:
	.string	"uint8_t"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"char"
.LASF8:
	.string	"long int"
.LASF16:
	.string	"test_stdlib"
.LASF12:
	.string	"test_functions"
.LASF3:
	.string	"short unsigned int"
.LASF22:
	.string	"func"
.LASF7:
	.string	"short int"
.LASF14:
	.string	"test_string"
.LASF19:
	.string	"_Test"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"test/test.c"
	.ident	"GCC: (g) 12.2.0"
