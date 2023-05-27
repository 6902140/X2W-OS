	.file	"locks.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "lib/kernel/locks.c"
	.align	2
	.type	supervisor_interrupt_enable, @function
supervisor_interrupt_enable:
.LFB0:
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
.LFE0:
	.size	supervisor_interrupt_enable, .-supervisor_interrupt_enable
	.align	2
	.type	supervisor_interrupt_disable, @function
supervisor_interrupt_disable:
.LFB1:
	.loc 1 44 54
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
.LBB3:
	.loc 1 45 22
	li	a5,2
	sd	a5,8(sp)
	.loc 1 45 60
	ld	a5,8(sp)
 #APP
# 45 "include/kernel/ktrap.h" 1
	csrc sstatus, a5
# 0 "" 2
 #NO_APP
.LBE3:
	.loc 1 46 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	supervisor_interrupt_disable, .-supervisor_interrupt_disable
	.align	2
	.globl	spinlock_init
	.type	spinlock_init, @function
spinlock_init:
.LFB2:
	.file 2 "lib/kernel/locks.c"
	.loc 2 15 49
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 2 16 18
	ld	a5,8(sp)
	sb	zero,0(a5)
	.loc 2 17 16
	ld	a5,8(sp)
	ld	a4,0(sp)
	sd	a4,8(a5)
	.loc 2 18 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	spinlock_init, .-spinlock_init
	.align	2
	.globl	spinlock_acquire
	.type	spinlock_acquire, @function
spinlock_acquire:
.LFB3:
	.loc 2 20 40
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 2 22 5
	call	supervisor_interrupt_disable
	.loc 2 24 11
	nop
.L5:
	.loc 2 24 37 discriminator 1
	ld	a5,8(sp)
	.loc 2 24 12 discriminator 1
	andi	a4,a5,-4
	andi	a5,a5,3
	li	a3,1
	slliw	a5,a5,3
	sllw	a2,a3,a5
	amoor.w.aq a3,a2,0(a4)
	srlw	a5,a3,a5
	andi	a5,a5,0xff
	.loc 2 24 58 discriminator 1
	bne	a5,zero,.L5
	.loc 2 35 5
	fence	iorw,iorw
	.loc 2 36 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	spinlock_acquire, .-spinlock_acquire
	.align	2
	.globl	spinlock_release
	.type	spinlock_release, @function
spinlock_release:
.LFB4:
	.loc 2 38 40
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 2 49 5
	fence	iorw,iorw
	.loc 2 51 25
	ld	a5,8(sp)
	.loc 2 51 5
	fence	iorw,iorw
	sb	zero,0(a5)
	.loc 2 53 5
	call	supervisor_interrupt_enable
	.loc 2 54 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	spinlock_release, .-spinlock_release
.Letext0:
	.file 3 "include/kernel/locks.h"
	.file 4 "include/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1cf
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xa
	.4byte	.LASF19
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
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x23
	.byte	0x17
	.4byte	0x2e
	.byte	0xc
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x4
	.byte	0x24
	.byte	0x6
	.4byte	0x8d
	.byte	0x4
	.4byte	.LASF9
	.byte	0
	.byte	0x4
	.4byte	.LASF10
	.byte	0x1
	.byte	0
	.byte	0xd
	.4byte	.LASF20
	.byte	0x10
	.byte	0x3
	.byte	0x1b
	.byte	0x10
	.4byte	0xb3
	.byte	0x5
	.4byte	.LASF11
	.byte	0x1d
	.byte	0xa
	.4byte	0x66
	.byte	0
	.byte	0x5
	.4byte	.LASF12
	.byte	0x1f
	.byte	0xb
	.4byte	0xb3
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0x4a
	.byte	0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x20
	.byte	0x3
	.4byte	0x8d
	.byte	0x7
	.4byte	.LASF15
	.byte	0x26
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0xef
	.byte	0x2
	.4byte	.LASF17
	.byte	0x26
	.byte	0x23
	.4byte	0xef
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x6
	.4byte	0xb8
	.byte	0x7
	.4byte	.LASF16
	.byte	0x14
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x11f
	.byte	0x2
	.4byte	.LASF17
	.byte	0x14
	.byte	0x23
	.4byte	0xef
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.4byte	.LASF18
	.byte	0x2
	.byte	0xf
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x15a
	.byte	0x2
	.4byte	.LASF17
	.byte	0xf
	.byte	0x20
	.4byte	0xef
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x2
	.4byte	.LASF12
	.byte	0xf
	.byte	0x2c
	.4byte	0xb3
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0xf
	.4byte	.LASF21
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x198
	.byte	0x8
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x9
	.string	"__v"
	.byte	0x2d
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0x25
	.byte	0x14
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x9
	.string	"__v"
	.byte	0x26
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
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
	.byte	0x2
	.byte	0x18
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
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0x21
	.byte	0x16
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0x4
	.byte	0x1
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0xd
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
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
	.byte	0xe
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
	.byte	0x10
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
.LASF12:
	.string	"name"
.LASF10:
	.string	"True"
.LASF4:
	.string	"unsigned int"
.LASF18:
	.string	"spinlock_init"
.LASF14:
	.string	"spinlock_t"
.LASF16:
	.string	"spinlock_acquire"
.LASF21:
	.string	"supervisor_interrupt_disable"
.LASF19:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"char"
.LASF13:
	.string	"Bool"
.LASF8:
	.string	"long int"
.LASF17:
	.string	"lock"
.LASF11:
	.string	"locked"
.LASF5:
	.string	"long unsigned int"
.LASF15:
	.string	"spinlock_release"
.LASF3:
	.string	"short unsigned int"
.LASF9:
	.string	"False"
.LASF7:
	.string	"short int"
.LASF22:
	.string	"supervisor_interrupt_enable"
.LASF20:
	.string	"__spinlock_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"lib/kernel/locks.c"
	.ident	"GCC: (g) 12.2.0"
