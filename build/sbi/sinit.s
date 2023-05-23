	.file	"sinit.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "sbi/sinit.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"=> strap_init\n"
	.align	3
.LC1:
	.string	"=> secall_init\n"
	.align	3
.LC2:
	.string	"=> delegate_traps\n"
	.align	3
.LC3:
	.string	"=> stimer_init\n"
	.text
	.align	2
	.globl	sinit_all
	.type	sinit_all, @function
sinit_all:
.LFB11:
	.file 1 "sbi/sinit.c"
	.loc 1 18 21
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 20 5
	lla	a0,.LC0
	call	bprintf
	.loc 1 21 5
	call	strap_init
	.loc 1 23 5
	lla	a0,.LC1
	call	bprintf
	.loc 1 24 5
	call	secall_init
	.loc 1 26 5
	call	delegate_traps
	.loc 1 27 5
	lla	a0,.LC2
	call	bprintf
	.loc 1 29 5
	call	stimer_init
	.loc 1 30 5
	lla	a0,.LC3
	call	bprintf
	.loc 1 31 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	sinit_all, .-sinit_all
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/sbi/stimer.h"
	.file 4 "include/sbi/strap.h"
	.file 5 "include/sbi/secall.h"
	.file 6 "include/sbi/sstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd1
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x4
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
	.byte	0x1a
	.byte	0x17
	.4byte	0x4e
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x5
	.4byte	0x55
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
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x7
	.byte	0x8
	.4byte	0x5c
	.byte	0x2
	.4byte	.LASF11
	.byte	0x3
	.byte	0x17
	.byte	0x2
	.4byte	.LASF12
	.byte	0x4
	.byte	0x33
	.byte	0x2
	.4byte	.LASF13
	.byte	0x5
	.byte	0x17
	.byte	0x2
	.4byte	.LASF14
	.byte	0x4
	.byte	0x24
	.byte	0x8
	.4byte	.LASF16
	.byte	0x6
	.byte	0x43
	.byte	0x8
	.4byte	0x76
	.4byte	0xba
	.byte	0x9
	.4byte	0x81
	.byte	0xa
	.byte	0
	.byte	0xb
	.4byte	.LASF17
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
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
	.byte	0x6
	.byte	0x27
	.byte	0x19
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
	.byte	0x5
	.byte	0x26
	.byte	0
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
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
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
.LASF10:
	.string	"size_t"
.LASF12:
	.string	"delegate_traps"
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
.LASF14:
	.string	"strap_init"
.LASF8:
	.string	"long int"
.LASF11:
	.string	"stimer_init"
.LASF3:
	.string	"short unsigned int"
.LASF17:
	.string	"sinit_all"
.LASF7:
	.string	"short int"
.LASF4:
	.string	"unsigned int"
.LASF13:
	.string	"secall_init"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
.LASF0:
	.string	"sbi/sinit.c"
	.ident	"GCC: (g) 12.2.0"
