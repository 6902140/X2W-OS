	.file	"kinit.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "kernel/kinit.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"Identical Mapping"
	.align	3
	.type	address_markers, @object
	.size	address_markers, 16
address_markers:
	.dword	0
	.dword	.LC0
	.align	3
.LC1:
	.string	"RSW"
	.align	3
.LC2:
	.string	".."
	.align	3
.LC3:
	.string	"D"
	.align	3
.LC4:
	.string	"."
	.align	3
.LC5:
	.string	"A"
	.align	3
.LC6:
	.string	"G"
	.align	3
.LC7:
	.string	"U"
	.align	3
.LC8:
	.string	"X"
	.align	3
.LC9:
	.string	"W"
	.align	3
.LC10:
	.string	"R"
	.align	3
.LC11:
	.string	"V"
	.align	3
	.type	prot_bits, @object
	.size	prot_bits, 288
prot_bits:
	.dword	768
	.dword	768
	.dword	.LC1
	.dword	.LC2
	.dword	128
	.dword	128
	.dword	.LC3
	.dword	.LC4
	.dword	64
	.dword	64
	.dword	.LC5
	.dword	.LC4
	.dword	32
	.dword	32
	.dword	.LC6
	.dword	.LC4
	.dword	16
	.dword	16
	.dword	.LC7
	.dword	.LC4
	.dword	8
	.dword	8
	.dword	.LC8
	.dword	.LC4
	.dword	4
	.dword	4
	.dword	.LC9
	.dword	.LC4
	.dword	2
	.dword	2
	.dword	.LC10
	.dword	.LC4
	.dword	1
	.dword	1
	.dword	.LC11
	.dword	.LC4
	.align	3
.LC12:
	.string	"=> ktrap_init\n"
	.align	3
.LC13:
	.string	"\tDone!\n"
	.align	3
.LC14:
	.string	"=> kplic_init\n"
	.align	3
.LC15:
	.string	"=> ktimer_init\n"
	.align	3
.LC16:
	.string	"=> memory_init\n"
	.align	3
.LC17:
	.string	"=> paging_init\n"
	.text
	.align	2
	.globl	kinit_all
	.type	kinit_all, @function
kinit_all:
.LFB41:
	.file 1 "kernel/kinit.c"
	.loc 1 26 21
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 27 5
	lla	a0,.LC12
	call	kprintf
	.loc 1 28 5
	call	ktrap_init
	.loc 1 29 5
	lla	a0,.LC13
	call	kprintf
	.loc 1 30 5
	lla	a0,.LC14
	call	kprintf
	.loc 1 31 5
	call	kplic_init
	.loc 1 32 5
	lla	a0,.LC13
	call	kprintf
	.loc 1 33 5
	lla	a0,.LC15
	call	kprintf
	.loc 1 34 5
	call	ktimer_init
	.loc 1 35 5
	lla	a0,.LC13
	call	kprintf
	.loc 1 36 5
	lla	a0,.LC16
	call	kprintf
	.loc 1 37 5
	lla	a4,_e_kernel
	li	a5,129
	slli	a1,a5,24
	mv	a0,a4
	call	memory_init
	.loc 1 38 5
	lla	a0,.LC13
	call	kprintf
	.loc 1 39 5
	lla	a0,.LC17
	call	kprintf
	.loc 1 40 5
	call	paging_init
	.loc 1 41 5
	lla	a0,.LC13
	call	kprintf
	.loc 1 42 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE41:
	.size	kinit_all, .-kinit_all
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/kernel/paging.h"
	.file 4 "include/kernel/ktimer.h"
	.file 5 "include/kernel/kplic.h"
	.file 6 "include/kernel/ktrap.h"
	.file 7 "include/kernel/mm.h"
	.file 8 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1e9
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xd
	.4byte	.LASF26
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
	.byte	0x2
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
	.byte	0x3
	.4byte	0x56
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x2
	.4byte	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x2
	.4byte	.LASF11
	.byte	0x2
	.byte	0x33
	.byte	0x12
	.4byte	0x43
	.byte	0x8
	.4byte	0x56
	.byte	0x8
	.4byte	0x5d
	.byte	0x5
	.4byte	0x56
	.4byte	0xa4
	.byte	0xf
	.byte	0
	.byte	0x9
	.4byte	.LASF15
	.byte	0x10
	.byte	0x50
	.4byte	0xc8
	.byte	0x4
	.4byte	.LASF12
	.byte	0x51
	.byte	0x9
	.4byte	0x83
	.byte	0
	.byte	0x4
	.4byte	.LASF13
	.byte	0x52
	.byte	0x8
	.4byte	0x8f
	.byte	0x8
	.byte	0
	.byte	0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x53
	.byte	0x3
	.4byte	0xa4
	.byte	0x3
	.4byte	0xc8
	.byte	0x5
	.4byte	0xd4
	.4byte	0xe9
	.byte	0xa
	.4byte	0x4f
	.byte	0
	.byte	0
	.byte	0x3
	.4byte	0xd9
	.byte	0xb
	.4byte	.LASF20
	.byte	0x55
	.byte	0x1c
	.4byte	0xe9
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0x9
	.4byte	.LASF16
	.byte	0x20
	.byte	0x5f
	.4byte	0x13f
	.byte	0x4
	.4byte	.LASF17
	.byte	0x61
	.byte	0xb
	.4byte	0x43
	.byte	0
	.byte	0xc
	.string	"val"
	.byte	0x63
	.byte	0xb
	.4byte	0x43
	.byte	0x8
	.byte	0xc
	.string	"set"
	.byte	0x65
	.byte	0xe
	.4byte	0x94
	.byte	0x10
	.byte	0x4
	.4byte	.LASF18
	.byte	0x67
	.byte	0xe
	.4byte	0x94
	.byte	0x18
	.byte	0
	.byte	0x2
	.4byte	.LASF19
	.byte	0x3
	.byte	0x68
	.byte	0x3
	.4byte	0x103
	.byte	0x3
	.4byte	0x13f
	.byte	0x5
	.4byte	0x14b
	.4byte	0x160
	.byte	0xa
	.4byte	0x4f
	.byte	0x8
	.byte	0
	.byte	0x3
	.4byte	0x150
	.byte	0xb
	.4byte	.LASF21
	.byte	0x6a
	.byte	0x1d
	.4byte	0x160
	.byte	0x9
	.byte	0x3
	.8byte	prot_bits
	.byte	0x10
	.4byte	.LASF27
	.byte	0x1
	.byte	0x16
	.byte	0xd
	.4byte	0x99
	.byte	0x11
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x1fd
	.byte	0x6
	.byte	0x12
	.4byte	.LASF28
	.byte	0x7
	.byte	0x63
	.byte	0x6
	.4byte	0x1a6
	.byte	0x6
	.4byte	0x83
	.byte	0x6
	.4byte	0x83
	.byte	0
	.byte	0x7
	.4byte	.LASF23
	.byte	0x4
	.byte	0x47
	.byte	0x7
	.4byte	.LASF24
	.byte	0x5
	.byte	0x18
	.byte	0x7
	.4byte	.LASF25
	.byte	0x6
	.byte	0x36
	.byte	0x13
	.4byte	.LASF29
	.byte	0x8
	.byte	0x43
	.byte	0x8
	.4byte	0x77
	.4byte	0x1d2
	.byte	0x6
	.4byte	0x94
	.byte	0x14
	.byte	0
	.byte	0x15
	.4byte	.LASF30
	.byte	0x1
	.byte	0x1a
	.byte	0x6
	.8byte	.LFB41
	.8byte	.LFE41-.LFB41
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
	.byte	0x3
	.byte	0x26
	.byte	0
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
	.byte	0x3
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x10
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x34
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
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
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x15
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
.LASF28:
	.string	"memory_init"
.LASF9:
	.string	"uint64_t"
.LASF29:
	.string	"kprintf"
.LASF7:
	.string	"short int"
.LASF10:
	.string	"size_t"
.LASF20:
	.string	"address_markers"
.LASF14:
	.string	"addr_marker_t"
.LASF15:
	.string	"__addr_marker_t"
.LASF27:
	.string	"_e_kernel"
.LASF25:
	.string	"ktrap_init"
.LASF21:
	.string	"prot_bits"
.LASF11:
	.string	"addr_t"
.LASF30:
	.string	"kinit_all"
.LASF8:
	.string	"long int"
.LASF18:
	.string	"clear"
.LASF24:
	.string	"kplic_init"
.LASF13:
	.string	"name"
.LASF2:
	.string	"unsigned char"
.LASF12:
	.string	"start_address"
.LASF4:
	.string	"unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF6:
	.string	"char"
.LASF19:
	.string	"property_bit_t"
.LASF5:
	.string	"long unsigned int"
.LASF26:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF17:
	.string	"mask"
.LASF22:
	.string	"paging_init"
.LASF23:
	.string	"ktimer_init"
.LASF16:
	.string	"__property_bit_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"kernel/kinit.c"
	.ident	"GCC: (g) 12.2.0"
