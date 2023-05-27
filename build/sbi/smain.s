	.file	"smain.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "sbi/smain.c"
	.section	.rodata
	.align	3
.LC0:
	.ascii	"`YMM'   `MP'      `7MMF'     A     `7MF'             .M\"\"\""
	.ascii	"bgd `7MM\"\"\"Yp, `7MMF'\n  VMb.  ,P          `MA     ,MA   "
	.ascii	"  ,V              ,MI    \"Y   MM    Yb   MM  \n   `MM.M'   "
	.ascii	"  pd*\"*b.VM:   ,VVM:   ,V               `MMb.       MM    d"
	.ascii	"P   MM  \n     MMb     (O)   j8 MM.  M' MM.  M'   **********"
	.ascii	"    `YMMNq.   MM\"\"\"bg.   MM  \n   ,M'`Mb.       ,;j9 `MM "
	.ascii	"A'  `MM A'                .     `MM   MM    `Y   MM  \n"
	.string	"  ,P   `MM.   ,-='     :MM;    :MM;                 Mb     dM   MM    ,9   MM  \n.MM:.  .:MMa.Ammmmmmm   VF      VF                  P\"Ybmmd\"  .JMMmmmd9  .JMML.\n\nCopyright Shihong Wang, Shaofei Wang, Zhuiri Xiao (c) 2023 with GNU Public License V3.0\nEnjoy!\n"
	.align	3
.LC1:
	.string	"============================================================\n"
	.align	3
.LC2:
	.string	"Enter SBI!\n"
	.align	3
.LC3:
	.string	"SBI init!\n"
	.align	3
.LC4:
	.string	"Jump to kernel!\n"
	.text
	.align	2
	.globl	sbi_main
	.type	sbi_main, @function
sbi_main:
.LFB8:
	.file 1 "sbi/smain.c"
	.loc 1 20 46
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 22 5
	call	uart_init
	.loc 1 24 5
	lla	a0,.LC0
	call	bprintf
	.loc 1 25 5
	lla	a0,.LC1
	call	bprintf
	.loc 1 27 5
	lla	a0,.LC2
	call	bprintf
	.loc 1 29 5
	lla	a0,.LC3
	call	bprintf
	.loc 1 30 5
	call	sinit_all
	.loc 1 32 5
	lla	a0,.LC4
	call	bprintf
	.loc 1 33 5
	call	jump_to_kernel
	.cfi_endproc
.LFE8:
	.size	sbi_main, .-sbi_main
	.align	2
	.globl	jump_to_kernel
	.type	jump_to_kernel, @function
jump_to_kernel:
.LFB9:
	.loc 1 39 48
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
.LBB2:
	.loc 1 42 43
 #APP
# 42 "sbi/smain.c" 1
	csrr a5, mstatus
# 0 "" 2
 #NO_APP
	mv	ra,a5
	.loc 1 42 108
	mv	a5,ra
.LBE2:
	.loc 1 42 10
	sd	a5,56(sp)
	.loc 1 43 21
	ld	a4,56(sp)
	li	a5,-8192
	addi	a5,a5,2047
	and	a4,a4,a5
	.loc 1 43 10
	li	a5,4096
	addi	a5,a5,-2048
	or	a5,a4,a5
	sd	a5,56(sp)
	.loc 1 44 10
	ld	a5,56(sp)
	andi	a5,a5,-129
	sd	a5,56(sp)
.LBB3:
	.loc 1 45 22
	ld	a5,56(sp)
	sd	a5,48(sp)
	.loc 1 45 52
	ld	a5,48(sp)
 #APP
# 45 "sbi/smain.c" 1
	csrw mstatus, a5
# 0 "" 2
 #NO_APP
.LBE3:
.LBB4:
	.loc 1 48 22
	li	a5,1025
	slli	a5,a5,21
	sd	a5,40(sp)
	.loc 1 48 58
	ld	a5,40(sp)
 #APP
# 48 "sbi/smain.c" 1
	csrw mepc, a5
# 0 "" 2
 #NO_APP
.LBE4:
.LBB5:
	.loc 1 50 22
	li	a5,1025
	slli	a5,a5,21
	sd	a5,32(sp)
	.loc 1 50 58
	ld	a5,32(sp)
 #APP
# 50 "sbi/smain.c" 1
	csrw stvec, a5
# 0 "" 2
 #NO_APP
.LBE5:
.LBB6:
	.loc 1 52 22
	sd	zero,24(sp)
	.loc 1 52 49
	ld	a5,24(sp)
 #APP
# 52 "sbi/smain.c" 1
	csrw sie, a5
# 0 "" 2
 #NO_APP
.LBE6:
.LBB7:
	.loc 1 54 22
	sd	zero,16(sp)
	.loc 1 54 49
	ld	a5,16(sp)
 #APP
# 54 "sbi/smain.c" 1
	csrw satp, a5
# 0 "" 2
 #NO_APP
.LBE7:
.LBB8:
	.loc 1 57 22
	li	a5,-1
	srli	a5,a5,10
	sd	a5,8(sp)
	.loc 1 57 72
	ld	a5,8(sp)
 #APP
# 57 "sbi/smain.c" 1
	csrw pmpaddr0, a5
# 0 "" 2
 #NO_APP
.LBE8:
.LBB9:
	.loc 1 58 22
	li	a5,15
	sd	a5,0(sp)
	.loc 1 58 51
	ld	a5,0(sp)
 #APP
# 58 "sbi/smain.c" 1
	csrw pmpcfg0, a5
# 0 "" 2
 #NO_APP
.LBE9:
	.loc 1 61 5
 #APP
# 61 "sbi/smain.c" 1
	mret
# 0 "" 2
 #NO_APP
	.cfi_endproc
.LFE9:
	.size	jump_to_kernel, .-jump_to_kernel
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/sbi/sinit.h"
	.file 4 "include/device/uart.h"
	.file 5 "include/sbi/sstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x219
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
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x4
	.4byte	.LASF9
	.byte	0x1a
	.byte	0x17
	.4byte	0x4e
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x7
	.4byte	0x55
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x4
	.4byte	.LASF10
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x4
	.4byte	.LASF11
	.byte	0x36
	.byte	0x12
	.4byte	0x43
	.byte	0x5
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x9
	.4byte	.LASF16
	.byte	0x5
	.byte	0x43
	.byte	0x8
	.4byte	0x76
	.4byte	0xaa
	.byte	0xa
	.4byte	0xaa
	.byte	0xb
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x5c
	.byte	0x5
	.4byte	.LASF13
	.byte	0x4
	.byte	0x23
	.byte	0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0x27
	.byte	0x20
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x202
	.byte	0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0x29
	.byte	0xe
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x107
	.byte	0x1
	.string	"__v"
	.byte	0x2a
	.byte	0x26
	.4byte	0x4e
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0x3
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x12b
	.byte	0x1
	.string	"__v"
	.byte	0x2d
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x3
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x14f
	.byte	0x1
	.string	"__v"
	.byte	0x30
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x3
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x173
	.byte	0x1
	.string	"__v"
	.byte	0x32
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x3
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x197
	.byte	0x1
	.string	"__v"
	.byte	0x34
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0x3
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x1bb
	.byte	0x1
	.string	"__v"
	.byte	0x36
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0x3
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x1e0
	.byte	0x1
	.string	"__v"
	.byte	0x39
	.byte	0x16
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0
	.byte	0xf
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.byte	0x1
	.string	"__v"
	.byte	0x3a
	.byte	0x16
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0x14
	.byte	0x20
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
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
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x18
	.byte	0
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
	.byte	0x87,0x1
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
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x10
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
	.string	"mval"
.LASF11:
	.string	"ireg_t"
.LASF10:
	.string	"size_t"
.LASF16:
	.string	"bprintf"
.LASF5:
	.string	"long unsigned int"
.LASF9:
	.string	"uint64_t"
.LASF15:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"char"
.LASF8:
	.string	"long int"
.LASF3:
	.string	"short unsigned int"
.LASF17:
	.string	"jump_to_kernel"
.LASF12:
	.string	"sinit_all"
.LASF7:
	.string	"short int"
.LASF13:
	.string	"uart_init"
.LASF18:
	.string	"sbi_main"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"sbi/smain.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
