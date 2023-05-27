	.file	"sched.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "kernel/sched.c"
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
	.globl	unused_pcb
	.bss
	.align	3
	.type	unused_pcb, @object
	.size	unused_pcb, 32
unused_pcb:
	.zero	32
	.globl	running_pcb
	.align	3
	.type	running_pcb, @object
	.size	running_pcb, 32
running_pcb:
	.zero	32
	.globl	sleeping_pcb
	.align	3
	.type	sleeping_pcb, @object
	.size	sleeping_pcb, 32
sleeping_pcb:
	.zero	32
	.globl	pcbarr
	.align	3
	.type	pcbarr, @object
	.size	pcbarr, 5632
pcbarr:
	.zero	5632
	.globl	kstack_arr
	.align	3
	.type	kstack_arr, @object
	.size	kstack_arr, 512
kstack_arr:
	.zero	512
	.globl	pgd_arr
	.align	3
	.type	pgd_arr, @object
	.size	pgd_arr, 512
pgd_arr:
	.zero	512
	.text
	.align	2
	.globl	process_init
	.type	process_init, @function
process_init:
.LFB34:
	.file 1 "kernel/sched.c"
	.loc 1 21 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 1 22 5
	lla	a0,unused_pcb
	call	list_init
	.loc 1 23 5
	lla	a0,running_pcb
	call	list_init
	.loc 1 24 5
	lla	a0,sleeping_pcb
	call	list_init
.LBB2:
	.loc 1 25 13
	sw	zero,12(sp)
	.loc 1 25 5
	j	.L2
.L3:
	.loc 1 26 9 discriminator 3
	lw	a4,12(sp)
	li	a5,88
	mul	a4,a4,a5
	lla	a5,pcbarr
	add	a5,a4,a5
	mv	a1,a5
	lla	a0,unused_pcb+16
	call	list_insert
	.loc 1 27 34 discriminator 3
	li	a0,1
	call	alloc_ppage
	mv	a5,a0
	.loc 1 27 23 discriminator 3
	mv	a3,a5
	.loc 1 27 22 discriminator 3
	lla	a4,kstack_arr
	lw	a5,12(sp)
	slli	a5,a5,3
	add	a5,a4,a5
	sd	a3,0(a5)
	.loc 1 28 31 discriminator 3
	li	a0,1
	call	alloc_ppage
	mv	a5,a0
	.loc 1 28 20 discriminator 3
	mv	a3,a5
	.loc 1 28 19 discriminator 3
	lla	a4,pgd_arr
	lw	a5,12(sp)
	slli	a5,a5,3
	add	a5,a4,a5
	sd	a3,0(a5)
	.loc 1 25 23 discriminator 3
	lw	a5,12(sp)
	addiw	a5,a5,1
	sw	a5,12(sp)
.L2:
	.loc 1 25 18 discriminator 1
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,63
	ble	a4,a5,.L3
.LBE2:
	.loc 1 30 1
	nop
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE34:
	.size	process_init, .-process_init
	.align	2
	.globl	init_tcb
	.type	init_tcb, @function
init_tcb:
.LFB35:
	.loc 1 35 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 1 36 14
	ld	a4,8(sp)
	lla	a5,pcbarr
	sub	a5,a4,a5
	srai	a4,a5,3
	lla	a5,.LC12
	ld	a5,0(a5)
	mul	a5,a4,a5
	mv	a4,a5
	.loc 1 36 22
	li	a5,88
	divu	a5,a4,a5
	.loc 1 36 11
	sext.w	a4,a5
	ld	a5,8(sp)
	sw	a4,16(a5)
	.loc 1 37 27
	ld	a5,8(sp)
	lw	a5,16(a5)
	.loc 1 37 25
	lla	a4,kstack_arr
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,0(a5)
	.loc 1 37 14
	ld	a5,8(sp)
	sd	a4,64(a5)
	.loc 1 38 21
	ld	a5,8(sp)
	lw	a5,16(a5)
	.loc 1 38 19
	lla	a4,pgd_arr
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a4,0(a5)
	.loc 1 38 11
	ld	a5,8(sp)
	sd	a4,56(a5)
	.loc 1 39 13
	ld	a5,8(sp)
	sb	zero,48(a5)
	.loc 1 40 30
	ld	a5,8(sp)
	ld	a4,64(a5)
	.loc 1 40 43
	li	a5,1097728
	addi	a5,a5,-1024
	add	a4,a4,a5
	.loc 1 40 13
	ld	a5,8(sp)
	sd	a4,80(a5)
	.loc 1 41 20
	ld	a5,8(sp)
	ld	a5,56(a5)
	.loc 1 41 5
	li	a2,4096
	lla	a1,_s_kernel_pgd
	mv	a0,a5
	call	memcpy
	.loc 1 42 20
	ld	a5,8(sp)
	ld	a5,64(a5)
	.loc 1 42 5
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 43 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE35:
	.size	init_tcb, .-init_tcb
	.section	.rodata
	.align	3
.LC12:
	.dword	3353953467947191203
	.text
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/trap/trapframe.h"
	.file 4 "include/stdlist.h"
	.file 5 "include/kernel/locks.h"
	.file 6 "include/psched.h"
	.file 7 "include/kernel/paging.h"
	.file 8 "include/string.h"
	.file 9 "include/kernel/mm.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x928
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x14
	.4byte	.LASF90
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x6
	.4byte	.LASF5
	.byte	0x2
	.byte	0x17
	.byte	0x17
	.4byte	0x3a
	.byte	0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x9
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x6
	.4byte	.LASF6
	.byte	0x2
	.byte	0x1a
	.byte	0x17
	.4byte	0x5b
	.byte	0x9
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0xc
	.4byte	0x62
	.byte	0x9
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0x15
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x9
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x6
	.4byte	.LASF11
	.byte	0x2
	.byte	0x23
	.byte	0x17
	.4byte	0x3a
	.byte	0x6
	.4byte	.LASF12
	.byte	0x2
	.byte	0x2a
	.byte	0x12
	.4byte	0x4f
	.byte	0x6
	.4byte	.LASF13
	.byte	0x2
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0x6
	.4byte	.LASF14
	.byte	0x2
	.byte	0x33
	.byte	0x12
	.4byte	0x4f
	.byte	0x6
	.4byte	.LASF15
	.byte	0x2
	.byte	0x36
	.byte	0x12
	.4byte	0x4f
	.byte	0x2
	.byte	0x1f
	.4byte	0xdb
	.byte	0x1
	.string	"_x1"
	.byte	0x1f
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"ra"
	.byte	0x1f
	.byte	0x20
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x21
	.4byte	0xf7
	.byte	0x1
	.string	"_x2"
	.byte	0x21
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"sp"
	.byte	0x21
	.byte	0x20
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x23
	.4byte	0x113
	.byte	0x1
	.string	"_x3"
	.byte	0x23
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"gp"
	.byte	0x23
	.byte	0x20
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x25
	.4byte	0x12f
	.byte	0x1
	.string	"_x4"
	.byte	0x25
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"tp"
	.byte	0x25
	.byte	0x20
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x27
	.4byte	0x14b
	.byte	0x1
	.string	"_x5"
	.byte	0x27
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"t0"
	.byte	0x27
	.byte	0x20
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x29
	.4byte	0x167
	.byte	0x1
	.string	"_x6"
	.byte	0x29
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"t1"
	.byte	0x29
	.byte	0x20
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x2b
	.4byte	0x183
	.byte	0x1
	.string	"_x7"
	.byte	0x2b
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"t2"
	.byte	0x2b
	.byte	0x20
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x2d
	.4byte	0x1a9
	.byte	0x1
	.string	"_x8"
	.byte	0x2d
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"s0"
	.byte	0x2d
	.byte	0x20
	.4byte	0xb3
	.byte	0x1
	.string	"fp"
	.byte	0x2d
	.byte	0x2b
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x2f
	.4byte	0x1c5
	.byte	0x1
	.string	"_x9"
	.byte	0x2f
	.byte	0x14
	.4byte	0xb3
	.byte	0x1
	.string	"s1"
	.byte	0x2f
	.byte	0x20
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x31
	.4byte	0x1e0
	.byte	0x4
	.4byte	.LASF16
	.byte	0x31
	.4byte	0xb3
	.byte	0x1
	.string	"a0"
	.byte	0x31
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x33
	.4byte	0x1fb
	.byte	0x4
	.4byte	.LASF17
	.byte	0x33
	.4byte	0xb3
	.byte	0x1
	.string	"a1"
	.byte	0x33
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x35
	.4byte	0x216
	.byte	0x4
	.4byte	.LASF18
	.byte	0x35
	.4byte	0xb3
	.byte	0x1
	.string	"a2"
	.byte	0x35
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x37
	.4byte	0x231
	.byte	0x4
	.4byte	.LASF19
	.byte	0x37
	.4byte	0xb3
	.byte	0x1
	.string	"a3"
	.byte	0x37
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x39
	.4byte	0x24c
	.byte	0x4
	.4byte	.LASF20
	.byte	0x39
	.4byte	0xb3
	.byte	0x1
	.string	"a4"
	.byte	0x39
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x3b
	.4byte	0x267
	.byte	0x4
	.4byte	.LASF21
	.byte	0x3b
	.4byte	0xb3
	.byte	0x1
	.string	"a5"
	.byte	0x3b
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x3d
	.4byte	0x282
	.byte	0x4
	.4byte	.LASF22
	.byte	0x3d
	.4byte	0xb3
	.byte	0x1
	.string	"a6"
	.byte	0x3d
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x3f
	.4byte	0x29d
	.byte	0x4
	.4byte	.LASF23
	.byte	0x3f
	.4byte	0xb3
	.byte	0x1
	.string	"a7"
	.byte	0x3f
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x41
	.4byte	0x2b8
	.byte	0x4
	.4byte	.LASF24
	.byte	0x41
	.4byte	0xb3
	.byte	0x1
	.string	"s2"
	.byte	0x41
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x43
	.4byte	0x2d3
	.byte	0x4
	.4byte	.LASF25
	.byte	0x43
	.4byte	0xb3
	.byte	0x1
	.string	"s3"
	.byte	0x43
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x45
	.4byte	0x2ee
	.byte	0x4
	.4byte	.LASF26
	.byte	0x45
	.4byte	0xb3
	.byte	0x1
	.string	"s4"
	.byte	0x45
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x47
	.4byte	0x309
	.byte	0x4
	.4byte	.LASF27
	.byte	0x47
	.4byte	0xb3
	.byte	0x1
	.string	"s5"
	.byte	0x47
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x49
	.4byte	0x324
	.byte	0x4
	.4byte	.LASF28
	.byte	0x49
	.4byte	0xb3
	.byte	0x1
	.string	"s6"
	.byte	0x49
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x4b
	.4byte	0x33f
	.byte	0x4
	.4byte	.LASF29
	.byte	0x4b
	.4byte	0xb3
	.byte	0x1
	.string	"s7"
	.byte	0x4b
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x4d
	.4byte	0x35a
	.byte	0x4
	.4byte	.LASF30
	.byte	0x4d
	.4byte	0xb3
	.byte	0x1
	.string	"s8"
	.byte	0x4d
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x4f
	.4byte	0x375
	.byte	0x4
	.4byte	.LASF31
	.byte	0x4f
	.4byte	0xb3
	.byte	0x1
	.string	"s9"
	.byte	0x4f
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x51
	.4byte	0x391
	.byte	0x4
	.4byte	.LASF32
	.byte	0x51
	.4byte	0xb3
	.byte	0x1
	.string	"s10"
	.byte	0x51
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x53
	.4byte	0x3ad
	.byte	0x4
	.4byte	.LASF33
	.byte	0x53
	.4byte	0xb3
	.byte	0x1
	.string	"s11"
	.byte	0x53
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x55
	.4byte	0x3c8
	.byte	0x4
	.4byte	.LASF34
	.byte	0x55
	.4byte	0xb3
	.byte	0x1
	.string	"t3"
	.byte	0x55
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x57
	.4byte	0x3e3
	.byte	0x4
	.4byte	.LASF35
	.byte	0x57
	.4byte	0xb3
	.byte	0x1
	.string	"t4"
	.byte	0x57
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x59
	.4byte	0x3fe
	.byte	0x4
	.4byte	.LASF36
	.byte	0x59
	.4byte	0xb3
	.byte	0x1
	.string	"t5"
	.byte	0x59
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0x2
	.byte	0x5b
	.4byte	0x419
	.byte	0x4
	.4byte	.LASF37
	.byte	0x5b
	.4byte	0xb3
	.byte	0x1
	.string	"t6"
	.byte	0x5b
	.byte	0x21
	.4byte	0xb3
	.byte	0
	.byte	0xa
	.4byte	.LASF39
	.byte	0xf8
	.byte	0x3
	.byte	0x1d
	.4byte	0x4e0
	.byte	0x3
	.4byte	0xbf
	.byte	0
	.byte	0x3
	.4byte	0xdb
	.byte	0x8
	.byte	0x3
	.4byte	0xf7
	.byte	0x10
	.byte	0x3
	.4byte	0x113
	.byte	0x18
	.byte	0x3
	.4byte	0x12f
	.byte	0x20
	.byte	0x3
	.4byte	0x14b
	.byte	0x28
	.byte	0x3
	.4byte	0x167
	.byte	0x30
	.byte	0x3
	.4byte	0x183
	.byte	0x38
	.byte	0x3
	.4byte	0x1a9
	.byte	0x40
	.byte	0x3
	.4byte	0x1c5
	.byte	0x48
	.byte	0x3
	.4byte	0x1e0
	.byte	0x50
	.byte	0x3
	.4byte	0x1fb
	.byte	0x58
	.byte	0x3
	.4byte	0x216
	.byte	0x60
	.byte	0x3
	.4byte	0x231
	.byte	0x68
	.byte	0x3
	.4byte	0x24c
	.byte	0x70
	.byte	0x3
	.4byte	0x267
	.byte	0x78
	.byte	0x3
	.4byte	0x282
	.byte	0x80
	.byte	0x3
	.4byte	0x29d
	.byte	0x88
	.byte	0x3
	.4byte	0x2b8
	.byte	0x90
	.byte	0x3
	.4byte	0x2d3
	.byte	0x98
	.byte	0x3
	.4byte	0x2ee
	.byte	0xa0
	.byte	0x3
	.4byte	0x309
	.byte	0xa8
	.byte	0x3
	.4byte	0x324
	.byte	0xb0
	.byte	0x3
	.4byte	0x33f
	.byte	0xb8
	.byte	0x3
	.4byte	0x35a
	.byte	0xc0
	.byte	0x3
	.4byte	0x375
	.byte	0xc8
	.byte	0x3
	.4byte	0x391
	.byte	0xd0
	.byte	0x3
	.4byte	0x3ad
	.byte	0xd8
	.byte	0x3
	.4byte	0x3c8
	.byte	0xe0
	.byte	0x3
	.4byte	0x3e3
	.byte	0xe8
	.byte	0x3
	.4byte	0x3fe
	.byte	0xf0
	.byte	0
	.byte	0x6
	.4byte	.LASF38
	.byte	0x3
	.byte	0x7f
	.byte	0x3
	.4byte	0x419
	.byte	0x16
	.4byte	.LASF40
	.2byte	0x120
	.byte	0x3
	.byte	0x8e
	.byte	0x10
	.4byte	0x545
	.byte	0x5
	.4byte	.LASF41
	.byte	0x3
	.byte	0x90
	.byte	0xc
	.4byte	0xb3
	.byte	0
	.byte	0x5
	.4byte	.LASF42
	.byte	0x3
	.byte	0x92
	.byte	0x12
	.4byte	0x4e0
	.byte	0x8
	.byte	0xe
	.4byte	.LASF43
	.byte	0x94
	.4byte	0xb3
	.2byte	0x100
	.byte	0xe
	.4byte	.LASF44
	.byte	0x96
	.4byte	0xb3
	.2byte	0x108
	.byte	0xe
	.4byte	.LASF45
	.byte	0x98
	.4byte	0xb3
	.2byte	0x110
	.byte	0xe
	.4byte	.LASF46
	.byte	0x9a
	.4byte	0xb3
	.2byte	0x118
	.byte	0
	.byte	0x6
	.4byte	.LASF47
	.byte	0x3
	.byte	0x9b
	.byte	0x3
	.4byte	0x4ec
	.byte	0x7
	.4byte	0x69
	.byte	0xa
	.4byte	.LASF48
	.byte	0x10
	.byte	0x4
	.byte	0x19
	.4byte	0x57d
	.byte	0x5
	.4byte	.LASF49
	.byte	0x4
	.byte	0x1b
	.byte	0x1b
	.4byte	0x57d
	.byte	0
	.byte	0x5
	.4byte	.LASF50
	.byte	0x4
	.byte	0x1d
	.byte	0x1b
	.4byte	0x57d
	.byte	0x8
	.byte	0
	.byte	0x7
	.4byte	0x556
	.byte	0x6
	.4byte	.LASF51
	.byte	0x4
	.byte	0x1e
	.byte	0x3
	.4byte	0x556
	.byte	0xa
	.4byte	.LASF52
	.byte	0x20
	.byte	0x4
	.byte	0x23
	.4byte	0x5b5
	.byte	0x5
	.4byte	.LASF53
	.byte	0x4
	.byte	0x25
	.byte	0x11
	.4byte	0x582
	.byte	0
	.byte	0x5
	.4byte	.LASF54
	.byte	0x4
	.byte	0x27
	.byte	0x11
	.4byte	0x582
	.byte	0x10
	.byte	0
	.byte	0x6
	.4byte	.LASF55
	.byte	0x4
	.byte	0x28
	.byte	0x3
	.4byte	0x58e
	.byte	0x7
	.4byte	0x582
	.byte	0xa
	.4byte	.LASF56
	.byte	0x10
	.byte	0x5
	.byte	0x1b
	.4byte	0x5ed
	.byte	0x5
	.4byte	.LASF57
	.byte	0x5
	.byte	0x1d
	.byte	0xa
	.4byte	0x83
	.byte	0
	.byte	0x5
	.4byte	.LASF58
	.byte	0x5
	.byte	0x1f
	.byte	0xb
	.4byte	0x5ed
	.byte	0x8
	.byte	0
	.byte	0x7
	.4byte	0x62
	.byte	0x6
	.4byte	.LASF59
	.byte	0x5
	.byte	0x20
	.byte	0x3
	.4byte	0x5c6
	.byte	0xa
	.4byte	.LASF60
	.byte	0x58
	.byte	0x6
	.byte	0x11
	.4byte	0x68d
	.byte	0x5
	.4byte	.LASF61
	.byte	0x6
	.byte	0x12
	.byte	0x11
	.4byte	0x582
	.byte	0
	.byte	0xf
	.string	"pid"
	.byte	0x6
	.byte	0x13
	.byte	0x9
	.4byte	0x75
	.byte	0x10
	.byte	0x5
	.4byte	.LASF62
	.byte	0x6
	.byte	0x14
	.byte	0x9
	.4byte	0x75
	.byte	0x14
	.byte	0x5
	.4byte	.LASF63
	.byte	0x6
	.byte	0x15
	.byte	0x9
	.4byte	0x75
	.byte	0x18
	.byte	0x5
	.4byte	.LASF64
	.byte	0x6
	.byte	0x16
	.byte	0x10
	.4byte	0x5f2
	.byte	0x20
	.byte	0x5
	.4byte	.LASF65
	.byte	0x6
	.byte	0x17
	.byte	0xd
	.4byte	0x2e
	.byte	0x30
	.byte	0xf
	.string	"pgd"
	.byte	0x6
	.byte	0x18
	.byte	0xf
	.4byte	0x68d
	.byte	0x38
	.byte	0x5
	.4byte	.LASF66
	.byte	0x6
	.byte	0x19
	.byte	0xf
	.4byte	0x68d
	.byte	0x40
	.byte	0x5
	.4byte	.LASF67
	.byte	0x6
	.byte	0x1a
	.byte	0x15
	.4byte	0x692
	.byte	0x48
	.byte	0x5
	.4byte	.LASF68
	.byte	0x6
	.byte	0x1b
	.byte	0x13
	.4byte	0x697
	.byte	0x50
	.byte	0
	.byte	0x7
	.4byte	0x4f
	.byte	0x7
	.4byte	0x5fe
	.byte	0x7
	.4byte	0x545
	.byte	0x17
	.string	"pcb"
	.byte	0x6
	.byte	0x1c
	.byte	0x2
	.4byte	0x5fe
	.byte	0xd
	.4byte	0x62
	.4byte	0x6b3
	.byte	0x18
	.byte	0
	.byte	0x19
	.4byte	.LASF78
	.byte	0x7
	.byte	0x47
	.byte	0xd
	.4byte	0x6a8
	.byte	0xa
	.4byte	.LASF69
	.byte	0x10
	.byte	0x7
	.byte	0x50
	.4byte	0x6e6
	.byte	0x5
	.4byte	.LASF70
	.byte	0x7
	.byte	0x51
	.byte	0x9
	.4byte	0xa7
	.byte	0
	.byte	0x5
	.4byte	.LASF58
	.byte	0x7
	.byte	0x52
	.byte	0x8
	.4byte	0x5ed
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	.LASF71
	.byte	0x7
	.byte	0x53
	.byte	0x3
	.4byte	0x6bf
	.byte	0xc
	.4byte	0x6e6
	.byte	0xd
	.4byte	0x6f2
	.4byte	0x707
	.byte	0x10
	.4byte	0x5b
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0x6f7
	.byte	0x12
	.4byte	.LASF76
	.byte	0x55
	.byte	0x1c
	.4byte	0x707
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0xa
	.4byte	.LASF72
	.byte	0x20
	.byte	0x7
	.byte	0x5f
	.4byte	0x762
	.byte	0x5
	.4byte	.LASF73
	.byte	0x7
	.byte	0x61
	.byte	0xb
	.4byte	0x4f
	.byte	0
	.byte	0xf
	.string	"val"
	.byte	0x7
	.byte	0x63
	.byte	0xb
	.4byte	0x4f
	.byte	0x8
	.byte	0xf
	.string	"set"
	.byte	0x7
	.byte	0x65
	.byte	0xe
	.4byte	0x551
	.byte	0x10
	.byte	0x5
	.4byte	.LASF74
	.byte	0x7
	.byte	0x67
	.byte	0xe
	.4byte	0x551
	.byte	0x18
	.byte	0
	.byte	0x6
	.4byte	.LASF75
	.byte	0x7
	.byte	0x68
	.byte	0x3
	.4byte	0x721
	.byte	0xc
	.4byte	0x762
	.byte	0xd
	.4byte	0x76e
	.4byte	0x783
	.byte	0x10
	.4byte	0x5b
	.byte	0x8
	.byte	0
	.byte	0xc
	.4byte	0x773
	.byte	0x12
	.4byte	.LASF77
	.byte	0x6a
	.byte	0x1d
	.4byte	0x783
	.byte	0x9
	.byte	0x3
	.8byte	prot_bits
	.byte	0xb
	.4byte	.LASF79
	.byte	0xa
	.byte	0x8
	.4byte	0x5b5
	.byte	0x9
	.byte	0x3
	.8byte	unused_pcb
	.byte	0xb
	.4byte	.LASF80
	.byte	0xb
	.byte	0x8
	.4byte	0x5b5
	.byte	0x9
	.byte	0x3
	.8byte	running_pcb
	.byte	0xb
	.4byte	.LASF81
	.byte	0xc
	.byte	0x8
	.4byte	0x5b5
	.byte	0x9
	.byte	0x3
	.8byte	sleeping_pcb
	.byte	0xd
	.4byte	0x69c
	.4byte	0x7ec
	.byte	0x10
	.4byte	0x5b
	.byte	0x3f
	.byte	0
	.byte	0xb
	.4byte	.LASF82
	.byte	0x10
	.byte	0x5
	.4byte	0x7dc
	.byte	0x9
	.byte	0x3
	.8byte	pcbarr
	.byte	0xd
	.4byte	0x68d
	.4byte	0x811
	.byte	0x10
	.4byte	0x5b
	.byte	0x3f
	.byte	0
	.byte	0xb
	.4byte	.LASF83
	.byte	0x11
	.byte	0xb
	.4byte	0x801
	.byte	0x9
	.byte	0x3
	.8byte	kstack_arr
	.byte	0xb
	.4byte	.LASF84
	.byte	0x12
	.byte	0xb
	.4byte	0x801
	.byte	0x9
	.byte	0x3
	.8byte	pgd_arr
	.byte	0x11
	.4byte	.LASF85
	.byte	0x8
	.byte	0x20
	.4byte	0x8f
	.4byte	0x85a
	.byte	0x8
	.4byte	0x85a
	.byte	0x8
	.4byte	0x9b
	.byte	0x8
	.4byte	0x8f
	.byte	0
	.byte	0x1a
	.byte	0x8
	.byte	0x11
	.4byte	.LASF86
	.byte	0x8
	.byte	0x39
	.4byte	0x8f
	.4byte	0x87b
	.byte	0x8
	.4byte	0x85a
	.byte	0x8
	.4byte	0x87b
	.byte	0x8
	.4byte	0x8f
	.byte	0
	.byte	0x7
	.4byte	0x880
	.byte	0x1b
	.byte	0x11
	.4byte	.LASF87
	.byte	0x9
	.byte	0x73
	.4byte	0xa7
	.4byte	0x896
	.byte	0x8
	.4byte	0x83
	.byte	0
	.byte	0x13
	.4byte	.LASF88
	.byte	0x42
	.4byte	0x8ab
	.byte	0x8
	.4byte	0x5c1
	.byte	0x8
	.4byte	0x5c1
	.byte	0
	.byte	0x13
	.4byte	.LASF89
	.byte	0x38
	.4byte	0x8bb
	.byte	0x8
	.4byte	0x8bb
	.byte	0
	.byte	0x7
	.4byte	0x5b5
	.byte	0x1c
	.4byte	.LASF91
	.byte	0x1
	.byte	0x22
	.byte	0x6
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.4byte	0x8ec
	.byte	0x1d
	.string	"t"
	.byte	0x1
	.byte	0x22
	.byte	0x14
	.4byte	0x8ec
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x7
	.4byte	0x69c
	.byte	0x1e
	.4byte	.LASF92
	.byte	0x1
	.byte	0x14
	.byte	0x6
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.byte	0x1f
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x20
	.string	"i"
	.byte	0x1
	.byte	0x19
	.byte	0xd
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0xd
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
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
	.byte	0x21
	.byte	0x14
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x5
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
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0x21
	.byte	0x10
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0x21
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x7
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
	.byte	0x13
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
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
	.byte	0x17
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x20
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
.LASF45:
	.string	"scause"
.LASF62:
	.string	"priority"
.LASF50:
	.string	"next"
.LASF6:
	.string	"uint64_t"
.LASF9:
	.string	"short int"
.LASF12:
	.string	"size_t"
.LASF72:
	.string	"__property_bit_t"
.LASF76:
	.string	"address_markers"
.LASF71:
	.string	"addr_marker_t"
.LASF56:
	.string	"__spinlock_t"
.LASF79:
	.string	"unused_pcb"
.LASF67:
	.string	"father"
.LASF69:
	.string	"__addr_marker_t"
.LASF15:
	.string	"ireg_t"
.LASF86:
	.string	"memcpy"
.LASF37:
	.string	"_x31"
.LASF30:
	.string	"_x24"
.LASF36:
	.string	"_x30"
.LASF53:
	.string	"head"
.LASF77:
	.string	"prot_bits"
.LASF5:
	.string	"uint8_t"
.LASF43:
	.string	"sstatus"
.LASF70:
	.string	"start_address"
.LASF14:
	.string	"addr_t"
.LASF38:
	.string	"gtrapframe_t"
.LASF85:
	.string	"memset"
.LASF10:
	.string	"long int"
.LASF74:
	.string	"clear"
.LASF68:
	.string	"frame"
.LASF13:
	.string	"byte"
.LASF31:
	.string	"_x25"
.LASF47:
	.string	"ktrapframe_t"
.LASF32:
	.string	"_x26"
.LASF61:
	.string	"link"
.LASF54:
	.string	"tail"
.LASF89:
	.string	"list_init"
.LASF2:
	.string	"unsigned char"
.LASF51:
	.string	"list_elem_t"
.LASF40:
	.string	"__ktrapframe_t"
.LASF88:
	.string	"list_insert"
.LASF4:
	.string	"unsigned int"
.LASF63:
	.string	"counter"
.LASF41:
	.string	"sepc"
.LASF48:
	.string	"__list_elem_t"
.LASF46:
	.string	"origin_a0"
.LASF82:
	.string	"pcbarr"
.LASF66:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF84:
	.string	"pgd_arr"
.LASF78:
	.string	"_s_kernel_pgd"
.LASF8:
	.string	"char"
.LASF57:
	.string	"locked"
.LASF39:
	.string	"__gtrapframe_t"
.LASF52:
	.string	"__list_t"
.LASF42:
	.string	"gregisters"
.LASF59:
	.string	"spinlock_t"
.LASF16:
	.string	"_x10"
.LASF17:
	.string	"_x11"
.LASF18:
	.string	"_x12"
.LASF19:
	.string	"_x13"
.LASF20:
	.string	"_x14"
.LASF21:
	.string	"_x15"
.LASF22:
	.string	"_x16"
.LASF23:
	.string	"_x17"
.LASF24:
	.string	"_x18"
.LASF25:
	.string	"_x19"
.LASF33:
	.string	"_x27"
.LASF34:
	.string	"_x28"
.LASF35:
	.string	"_x29"
.LASF7:
	.string	"long unsigned int"
.LASF75:
	.string	"property_bit_t"
.LASF81:
	.string	"sleeping_pcb"
.LASF65:
	.string	"state"
.LASF90:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF73:
	.string	"mask"
.LASF60:
	.string	"__pcb_t"
.LASF80:
	.string	"running_pcb"
.LASF92:
	.string	"process_init"
.LASF58:
	.string	"name"
.LASF64:
	.string	"slock"
.LASF87:
	.string	"alloc_ppage"
.LASF55:
	.string	"list_t"
.LASF91:
	.string	"init_tcb"
.LASF83:
	.string	"kstack_arr"
.LASF49:
	.string	"prev"
.LASF26:
	.string	"_x20"
.LASF27:
	.string	"_x21"
.LASF28:
	.string	"_x22"
.LASF29:
	.string	"_x23"
.LASF44:
	.string	"sbadaddr"
.LASF11:
	.string	"Bool"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"kernel/sched.c"
	.ident	"GCC: (g) 12.2.0"
