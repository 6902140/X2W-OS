	.file	"kmain.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "kernel/kmain.c"
	.align	2
	.type	supervisor_interrupt_enable, @function
supervisor_interrupt_enable:
.LFB8:
	.file 1 "include/kernel/ktrap.h"
	.loc 1 37 53
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
.LBB2:
	.loc 1 38 22
	li	a5,2
	sd	a5,8(sp)
	.loc 1 38 60
	ld	a5,8(sp)
 #APP
# 38 "include/kernel/ktrap.h" 1
	csrs sstatus, a5
# 0 "" 2
 #NO_APP
.LBE2:
	.loc 1 39 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	supervisor_interrupt_enable, .-supervisor_interrupt_enable
	.section	.rodata
	.align	3
.LC0:
	.string	"============================================================\n"
	.align	3
.LC1:
	.string	"In kernel!\n"
	.align	3
.LC2:
	.string	"Kernel init!\n"
	.align	3
.LC3:
	.string	"Start testing!\n"
	.align	3
.LC4:
	.string	"Kernel Hanging Here!\n"
	.align	3
.LC5:
	.string	"local_interrupt_enable\n"
	.align	3
.LC6:
	.string	"Done"
	.text
	.align	2
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB11:
	.file 2 "kernel/kmain.c"
	.loc 2 21 23
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 2 22 5
	lla	a0,.LC0
	call	kprintf
	.loc 2 23 5
	lla	a0,.LC1
	call	kprintf
	.loc 2 24 5
	lla	a0,.LC2
	call	kprintf
	.loc 2 27 2
	call	print_kmem
	.loc 2 30 5
	call	kinit_all
	.loc 2 32 5
	lla	a0,.LC3
	call	kprintf
	.loc 2 36 5
	lla	a0,.LC4
	call	kprintf
	.loc 2 38 5
	lla	a0,.LC5
	call	kprintf
	.loc 2 40 5
	call	supervisor_interrupt_enable
	.loc 2 44 2
	lla	a0,.LC6
	call	kprintf
.L3:
	.loc 2 45 11 discriminator 1
	nop
	j	.L3
	.cfi_endproc
.LFE11:
	.size	kernel_main, .-kernel_main
	.section	.rodata
	.align	3
.LC7:
	.string	"X2W-OS Image Layout:\n"
	.align	3
.LC8:
	.string	"  kernel: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC9:
	.string	"  .text.boot: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC10:
	.string	"       .text: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC11:
	.string	"     .rodata: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC12:
	.string	"       .data: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC13:
	.string	"        .bss: 0x%08lx - 0x%08lx (%6ld B)\n"
	.text
	.align	2
	.globl	print_kmem
	.type	print_kmem, @function
print_kmem:
.LFB12:
	.loc 2 48 22
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 2 49 5
	lla	a0,.LC0
	call	kprintf
	.loc 2 50 5
	lla	a0,.LC7
	call	kprintf
	.loc 2 51 5
	lla	a1,_s_kernel
	lla	a2,_e_kernel
	.loc 2 53 23
	lla	a4,_e_kernel
	lla	a5,_s_kernel
	sub	a5,a4,a5
	.loc 2 51 5
	mv	a3,a5
	lla	a0,.LC8
	call	kprintf
	.loc 2 54 5
	lla	a1,_s_text_boot
	lla	a2,_e_text_boot
	.loc 2 56 26
	lla	a4,_e_text_boot
	lla	a5,_s_text_boot
	sub	a5,a4,a5
	.loc 2 54 5
	mv	a3,a5
	lla	a0,.LC9
	call	kprintf
	.loc 2 57 2
	lla	a1,_s_text
	lla	a2,_e_text
	.loc 2 59 21
	lla	a4,_e_text
	lla	a5,_s_text
	sub	a5,a4,a5
	.loc 2 57 2
	mv	a3,a5
	lla	a0,.LC10
	call	kprintf
	.loc 2 60 2
	lla	a1,_s_rodata
	lla	a2,_e_rodata
	.loc 2 62 23
	lla	a4,_e_rodata
	lla	a5,_s_rodata
	sub	a5,a4,a5
	.loc 2 60 2
	mv	a3,a5
	lla	a0,.LC11
	call	kprintf
	.loc 2 63 2
	lla	a1,_s_data
	lla	a2,_e_data
	.loc 2 65 21
	lla	a4,_e_data
	lla	a5,_s_data
	sub	a5,a4,a5
	.loc 2 63 2
	mv	a3,a5
	lla	a0,.LC12
	call	kprintf
	.loc 2 66 2
	lla	a1,_s_bss
	lla	a2,_e_bss
	.loc 2 68 20
	lla	a4,_e_bss
	lla	a5,_s_bss
	sub	a5,a4,a5
	.loc 2 66 2
	mv	a3,a5
	lla	a0,.LC13
	call	kprintf
	.loc 2 69 5
	lla	a0,.LC0
	call	kprintf
	.loc 2 70 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	print_kmem, .-print_kmem
.Letext0:
	.file 3 "include/types.h"
	.file 4 "include/kernel/kmain.h"
	.file 5 "include/kernel/kinit.h"
	.file 6 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1a9
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x5
	.4byte	.LASF26
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
	.byte	0x3
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
	.byte	0x6
	.4byte	0x55
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x3
	.4byte	.LASF11
	.byte	0x33
	.byte	0x12
	.4byte	0x43
	.byte	0x8
	.byte	0x8
	.4byte	0x5c
	.byte	0x9
	.4byte	0x55
	.4byte	0x9d
	.byte	0xa
	.byte	0
	.byte	0x1
	.4byte	.LASF12
	.byte	0x2a
	.byte	0xd
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF13
	.byte	0x2a
	.byte	0x1a
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF14
	.byte	0x32
	.byte	0xd
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF15
	.byte	0x32
	.byte	0x1d
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF16
	.byte	0x3a
	.byte	0xd
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF17
	.byte	0x3a
	.byte	0x18
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF18
	.byte	0x42
	.byte	0xd
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF19
	.byte	0x42
	.byte	0x1a
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF20
	.byte	0x4a
	.byte	0xd
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF21
	.byte	0x4a
	.byte	0x18
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF22
	.byte	0x52
	.byte	0xd
	.4byte	0x92
	.byte	0x1
	.4byte	.LASF23
	.byte	0x52
	.byte	0x17
	.4byte	0x92
	.byte	0xb
	.4byte	.LASF27
	.byte	0x5
	.byte	0x18
	.byte	0x6
	.byte	0xc
	.4byte	.LASF28
	.byte	0x6
	.byte	0x43
	.byte	0x8
	.4byte	0x76
	.4byte	0x140
	.byte	0xd
	.4byte	0x8c
	.byte	0xe
	.byte	0
	.byte	0x4
	.4byte	.LASF24
	.byte	0x30
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.byte	0x4
	.4byte	.LASF25
	.byte	0x15
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.byte	0xf
	.4byte	.LASF29
	.byte	0x1
	.byte	0x25
	.byte	0x14
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x11
	.string	"__v"
	.byte	0x1
	.byte	0x26
	.byte	0x16
	.4byte	0x4e
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
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
	.byte	0x4
	.byte	0x2e
	.byte	0
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
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
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x18
	.byte	0
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
	.byte	0x10
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x11
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
.LASF13:
	.string	"_e_kernel"
.LASF18:
	.string	"_s_rodata"
.LASF12:
	.string	"_s_kernel"
.LASF22:
	.string	"_s_bss"
.LASF15:
	.string	"_e_text_boot"
.LASF16:
	.string	"_s_text"
.LASF5:
	.string	"long unsigned int"
.LASF9:
	.string	"uint64_t"
.LASF28:
	.string	"kprintf"
.LASF26:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF2:
	.string	"unsigned char"
.LASF24:
	.string	"print_kmem"
.LASF6:
	.string	"char"
.LASF8:
	.string	"long int"
.LASF21:
	.string	"_e_data"
.LASF14:
	.string	"_s_text_boot"
.LASF11:
	.string	"addr_t"
.LASF25:
	.string	"kernel_main"
.LASF17:
	.string	"_e_text"
.LASF3:
	.string	"short unsigned int"
.LASF23:
	.string	"_e_bss"
.LASF19:
	.string	"_e_rodata"
.LASF7:
	.string	"short int"
.LASF20:
	.string	"_s_data"
.LASF4:
	.string	"unsigned int"
.LASF29:
	.string	"supervisor_interrupt_enable"
.LASF27:
	.string	"kinit_all"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
.LASF0:
	.string	"kernel/kmain.c"
	.ident	"GCC: (g) 12.2.0"
