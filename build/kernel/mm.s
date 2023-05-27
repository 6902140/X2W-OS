	.file	"mm.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "kernel/mm.c"
	.align	2
	.type	supervisor_interrupt_disable, @function
supervisor_interrupt_disable:
.LFB10:
	.file 1 "include/kernel/ktrap.h"
	.loc 1 44 54
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
.LBB2:
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
.LBE2:
	.loc 1 46 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	supervisor_interrupt_disable, .-supervisor_interrupt_disable
	.section	.rodata
	.align	3
.LC0:
	.string	"===================== Error Message =====================%c"
	.align	3
.LC1:
	.string	"filename: %s, at line %d\n"
	.align	3
.LC2:
	.string	"unsatisfied condition: %s\n"
	.align	3
.LC3:
	.string	"assert check failed in function: %s\n"
	.align	3
.LC4:
	.string	"info message: %s\n"
	.text
	.align	2
	.type	kpanic_spin, @function
kpanic_spin:
.LFB19:
	.file 2 "include/kernel/kdebug.h"
	.loc 2 28 119
	.cfi_startproc
	addi	sp,sp,-1136
	.cfi_def_cfa_offset 1136
	sd	ra,1096(sp)
	.cfi_offset 1, -40
	sd	a0,40(sp)
	sd	a2,24(sp)
	sd	a3,16(sp)
	sd	a4,8(sp)
	sd	a5,1112(sp)
	sd	a6,1120(sp)
	sd	a7,1128(sp)
	mv	a5,a1
	sw	a5,36(sp)
	.loc 2 29 5
	call	supervisor_interrupt_disable
	.loc 2 30 5
	li	a1,10
	lla	a0,.LC0
	call	kprintf
	.loc 2 31 5
	lw	a5,36(sp)
	mv	a2,a5
	ld	a1,40(sp)
	lla	a0,.LC1
	call	kprintf
	.loc 2 32 5
	ld	a1,16(sp)
	lla	a0,.LC2
	call	kprintf
	.loc 2 33 5
	ld	a1,24(sp)
	lla	a0,.LC3
	call	kprintf
	.loc 2 34 10
	sd	zero,64(sp)
	addi	a5,sp,72
	li	a4,1016
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 36 5
	addi	a5,sp,1136
	sd	a5,0(sp)
	ld	a5,0(sp)
	addi	a5,a5,-24
	sd	a5,56(sp)
	.loc 2 37 5
	ld	a4,56(sp)
	addi	a5,sp,64
	mv	a2,a4
	ld	a1,8(sp)
	mv	a0,a5
	call	vsprintf
	.loc 2 38 5
	addi	a5,sp,64
	mv	a1,a5
	lla	a0,.LC4
	call	kprintf
.L3:
	.loc 2 39 11 discriminator 1
	nop
	j	.L3
	.cfi_endproc
.LFE19:
	.size	kpanic_spin, .-kpanic_spin
	.section	.rodata
	.align	3
.LC5:
	.string	"Identical Mapping"
	.align	3
	.type	address_markers, @object
	.size	address_markers, 16
address_markers:
	.dword	0
	.dword	.LC5
	.align	3
.LC6:
	.string	"RSW"
	.align	3
.LC7:
	.string	".."
	.align	3
.LC8:
	.string	"D"
	.align	3
.LC9:
	.string	"."
	.align	3
.LC10:
	.string	"A"
	.align	3
.LC11:
	.string	"G"
	.align	3
.LC12:
	.string	"U"
	.align	3
.LC13:
	.string	"X"
	.align	3
.LC14:
	.string	"W"
	.align	3
.LC15:
	.string	"R"
	.align	3
.LC16:
	.string	"V"
	.align	3
	.type	prot_bits, @object
	.size	prot_bits, 288
prot_bits:
	.dword	768
	.dword	768
	.dword	.LC6
	.dword	.LC7
	.dword	128
	.dword	128
	.dword	.LC8
	.dword	.LC9
	.dword	64
	.dword	64
	.dword	.LC10
	.dword	.LC9
	.dword	32
	.dword	32
	.dword	.LC11
	.dword	.LC9
	.dword	16
	.dword	16
	.dword	.LC12
	.dword	.LC9
	.dword	8
	.dword	8
	.dword	.LC13
	.dword	.LC9
	.dword	4
	.dword	4
	.dword	.LC14
	.dword	.LC9
	.dword	2
	.dword	2
	.dword	.LC15
	.dword	.LC9
	.dword	1
	.dword	1
	.dword	.LC16
	.dword	.LC9
	.text
	.align	2
	.type	page_align, @function
page_align:
.LFB20:
	.file 3 "include/kernel/paging.h"
	.loc 3 205 56
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 3 206 8
	lbu	a5,7(sp)
	andi	a5,a5,0xff
	bne	a5,zero,.L5
	.loc 3 207 22
	ld	a4,8(sp)
	li	a5,-4096
	and	a5,a4,a5
	j	.L6
.L5:
	.loc 3 208 30
	ld	a4,8(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 3 208 35
	li	a5,-4096
	and	a5,a4,a5
.L6:
	.loc 3 209 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	page_align, .-page_align
	.globl	pool_btmps
	.bss
	.align	3
	.type	pool_btmps, @object
	.size	pool_btmps, 546
pool_btmps:
	.zero	546
	.globl	kernel_ppool
	.align	3
	.type	kernel_ppool, @object
	.size	kernel_ppool, 40
kernel_ppool:
	.zero	40
	.globl	user_ppool
	.align	3
	.type	user_ppool, @object
	.size	user_ppool, 40
user_ppool:
	.zero	40
	.section	.rodata
	.align	3
.LC17:
	.string	"kernel_ppool lock"
	.align	3
.LC18:
	.string	"user_ppool lock"
	.text
	.align	2
	.globl	init_pools
	.type	init_pools, @function
init_pools:
.LFB34:
	.file 4 "kernel/mm.c"
	.loc 4 57 56
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 60 9
	li	a5,1024
	sd	a5,24(sp)
	.loc 4 61 9
	li	a5,4096
	addi	a5,a5,-1024
	sd	a5,16(sp)
	.loc 4 64 23
	lla	a5,kernel_ppool
	ld	a4,24(sp)
	sd	a4,16(a5)
	.loc 4 65 30
	lla	a5,kernel_ppool
	ld	a4,8(sp)
	sd	a4,8(a5)
	.loc 4 66 23
	lla	a5,kernel_ppool
	lla	a4,pool_btmps
	sd	a4,0(a5)
	.loc 4 67 17
	lla	a5,kernel_ppool
	ld	a5,0(a5)
	.loc 4 67 60
	lla	a4,pool_btmps+16
	.loc 4 67 29
	sd	a4,8(a5)
	.loc 4 68 5
	lla	a5,kernel_ppool
	ld	a5,0(a5)
	li	a1,129
	mv	a0,a5
	call	bitmap_init
	.loc 4 69 5
	lla	a1,.LC17
	lla	a0,kernel_ppool+24
	call	spinlock_init
	.loc 4 72 21
	lla	a5,user_ppool
	ld	a4,16(sp)
	sd	a4,16(a5)
	.loc 4 73 42
	ld	a4,8(sp)
	ld	a5,24(sp)
	add	a4,a4,a5
	.loc 4 73 28
	lla	a5,user_ppool
	sd	a4,8(a5)
	.loc 4 74 21
	lla	a5,user_ppool
	lla	a4,pool_btmps+145
	sd	a4,0(a5)
	.loc 4 75 15
	lla	a5,user_ppool
	ld	a5,0(a5)
	.loc 4 75 56
	lla	a4,pool_btmps+161
	.loc 4 75 27
	sd	a4,8(a5)
	.loc 4 76 5
	lla	a5,user_ppool
	ld	a5,0(a5)
	li	a1,385
	mv	a0,a5
	call	bitmap_init
	.loc 4 77 5
	lla	a1,.LC18
	lla	a0,user_ppool+24
	call	spinlock_init
	.loc 4 90 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE34:
	.size	init_pools, .-init_pools
	.section	.rodata
	.align	3
.LC19:
	.string	"Memory Management Info:\n"
	.align	3
.LC20:
	.string	"\ttotal physical pages available: %#X\n"
	.align	3
.LC21:
	.string	"\tkernel physical pool is at: %#X\n"
	.align	3
.LC22:
	.string	"\t%#X kernel physical pages available, start from %#X\n"
	.align	3
.LC23:
	.string	"\tuser physical pool is at: %#X\n"
	.align	3
.LC24:
	.string	"\t%#X user physical pages available, start from %#X\n"
	.text
	.align	2
	.globl	memory_init
	.type	memory_init, @function
memory_init:
.LFB35:
	.loc 4 93 55
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 94 19
	li	a1,1
	ld	a0,8(sp)
	call	page_align
	sd	a0,8(sp)
	.loc 4 95 17
	li	a1,0
	ld	a0,0(sp)
	call	page_align
	sd	a0,0(sp)
	.loc 4 96 37
	ld	a4,0(sp)
	ld	a5,8(sp)
	sub	a5,a4,a5
	.loc 4 96 52
	srli	a5,a5,12
	.loc 4 96 12
	addi	a5,a5,1
	sd	a5,24(sp)
	.loc 4 99 5
	ld	a1,24(sp)
	ld	a0,8(sp)
	call	init_pools
	.loc 4 102 5
	lla	a0,.LC19
	call	kprintf
	.loc 4 103 5
	ld	a1,24(sp)
	lla	a0,.LC20
	call	kprintf
	.loc 4 104 5
	lla	a1,kernel_ppool
	lla	a0,.LC21
	call	kprintf
	.loc 4 105 5
	lla	a5,kernel_ppool
	ld	a4,16(a5)
	lla	a5,kernel_ppool
	ld	a5,8(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC22
	call	kprintf
	.loc 4 106 5
	lla	a1,user_ppool
	lla	a0,.LC23
	call	kprintf
	.loc 4 107 5
	lla	a5,user_ppool
	ld	a4,16(a5)
	lla	a5,user_ppool
	ld	a5,8(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC24
	call	kprintf
	.loc 4 108 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE35:
	.size	memory_init, .-memory_init
	.section	.rodata
	.align	3
.LC25:
	.string	"\"bit_idx=%d, cannot find a physical page!\""
	.align	3
.LC26:
	.string	"bit_idx != -1"
	.align	3
.LC27:
	.string	"kernel/mm.c"
	.text
	.align	2
	.globl	alloc_ppage
	.type	alloc_ppage, @function
alloc_ppage:
.LFB36:
	.loc 4 111 31
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	mv	a5,a0
	sb	a5,15(sp)
	.loc 4 112 53
	lbu	a5,15(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L10
	.loc 4 112 53 is_stmt 0 discriminator 1
	lla	a5,kernel_ppool
	j	.L11
.L10:
	.loc 4 112 53 discriminator 2
	lla	a5,user_ppool
.L11:
	.loc 4 112 14 is_stmt 1 discriminator 4
	sd	a5,40(sp)
	.loc 4 114 24 discriminator 4
	ld	a5,40(sp)
	ld	a5,0(a5)
	li	a1,1
	mv	a0,a5
	call	bitmap_scan
	sd	a0,32(sp)
	.loc 4 116 8 discriminator 4
	ld	a4,32(sp)
	li	a5,-1
	bne	a4,a5,.L12
	.loc 4 116 33 discriminator 1
	ld	a5,32(sp)
	lla	a4,.LC25
	lla	a3,.LC26
	lla	a2,__func__.2
	li	a1,116
	lla	a0,.LC27
	call	kpanic_spin
.L12:
	.loc 4 118 5
	ld	a5,40(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 119 5
	ld	a5,40(sp)
	ld	a5,0(a5)
	li	a2,1
	ld	a1,32(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 120 5
	ld	a5,40(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_release
	.loc 4 123 24
	ld	a5,40(sp)
	ld	a5,8(a5)
	.loc 4 123 48
	ld	a4,32(sp)
	slli	a4,a4,12
	.loc 4 123 12
	add	a5,a5,a4
	sd	a5,24(sp)
	.loc 4 124 5
	ld	a5,24(sp)
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 4 126 12
	ld	a5,24(sp)
	.loc 4 127 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE36:
	.size	alloc_ppage, .-alloc_ppage
	.align	2
	.globl	alloc_nppage
	.type	alloc_nppage, @function
alloc_nppage:
.LFB37:
	.loc 4 131 43
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 4 132 53
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L15
	.loc 4 132 53 is_stmt 0 discriminator 1
	lla	a5,kernel_ppool
	j	.L16
.L15:
	.loc 4 132 53 discriminator 2
	lla	a5,user_ppool
.L16:
	.loc 4 132 14 is_stmt 1 discriminator 4
	sd	a5,32(sp)
	.loc 4 134 24 discriminator 4
	ld	a5,32(sp)
	ld	a5,0(a5)
	ld	a1,8(sp)
	mv	a0,a5
	call	bitmap_scan
	sd	a0,24(sp)
	.loc 4 136 8 discriminator 4
	ld	a4,24(sp)
	li	a5,-1
	bne	a4,a5,.L17
	.loc 4 136 33 discriminator 1
	ld	a5,24(sp)
	lla	a4,.LC25
	lla	a3,.LC26
	lla	a2,__func__.1
	li	a1,136
	lla	a0,.LC27
	call	kpanic_spin
.L17:
	.loc 4 138 5
	ld	a5,32(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_acquire
.LBB3:
	.loc 4 139 13
	ld	a5,24(sp)
	sw	a5,44(sp)
	.loc 4 139 5
	j	.L18
.L19:
	.loc 4 140 9 discriminator 3
	ld	a5,32(sp)
	ld	a5,0(a5)
	lw	a4,44(sp)
	li	a2,1
	mv	a1,a4
	mv	a0,a5
	call	bitmap_set
	.loc 4 139 38 discriminator 3
	lw	a5,44(sp)
	addiw	a5,a5,1
	sw	a5,44(sp)
.L18:
	.loc 4 139 24 discriminator 1
	lw	a4,44(sp)
	ld	a5,24(sp)
	sub	a5,a4,a5
	mv	a4,a5
	.loc 4 139 32 discriminator 1
	ld	a5,8(sp)
	bgtu	a5,a4,.L19
.LBE3:
	.loc 4 141 5
	ld	a5,32(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_release
	.loc 4 144 24
	ld	a5,32(sp)
	ld	a5,8(a5)
	.loc 4 144 48
	ld	a4,24(sp)
	slli	a4,a4,12
	.loc 4 144 12
	add	a5,a5,a4
	sd	a5,16(sp)
.LBB4:
	.loc 4 145 13
	ld	a5,24(sp)
	sw	a5,40(sp)
	.loc 4 145 5
	j	.L20
.L21:
	.loc 4 146 40 discriminator 3
	lw	a4,40(sp)
	ld	a5,24(sp)
	sub	a5,a4,a5
	.loc 4 146 49 discriminator 3
	slli	a5,a5,12
	.loc 4 146 37 discriminator 3
	mv	a4,a5
	ld	a5,16(sp)
	add	a5,a4,a5
	.loc 4 146 9 discriminator 3
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 4 145 38 discriminator 3
	lw	a5,40(sp)
	addiw	a5,a5,1
	sw	a5,40(sp)
.L20:
	.loc 4 145 24 discriminator 1
	lw	a4,40(sp)
	ld	a5,24(sp)
	sub	a5,a4,a5
	mv	a4,a5
	.loc 4 145 32 discriminator 1
	ld	a5,8(sp)
	bgtu	a5,a4,.L21
.LBE4:
	.loc 4 148 12
	ld	a5,16(sp)
	.loc 4 151 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE37:
	.size	alloc_nppage, .-alloc_nppage
	.section	.rodata
	.align	3
.LC28:
	.string	"\"bit_idx shouldn't be negative, bit_idx = %d!\""
	.align	3
.LC29:
	.string	"bit_idx >= 0"
	.text
	.align	2
	.globl	free_ppage
	.type	free_ppage, @function
free_ppage:
.LFB38:
	.loc 4 154 42
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 4 155 53
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L24
	.loc 4 155 53 is_stmt 0 discriminator 1
	lla	a5,kernel_ppool
	j	.L25
.L24:
	.loc 4 155 53 discriminator 2
	lla	a5,user_ppool
.L25:
	.loc 4 155 14 is_stmt 1 discriminator 4
	sd	a5,24(sp)
	.loc 4 157 37 discriminator 4
	ld	a5,24(sp)
	ld	a5,8(a5)
	.loc 4 157 31 discriminator 4
	ld	a4,8(sp)
	sub	a5,a4,a5
	.loc 4 157 52 discriminator 4
	srli	a5,a5,12
	.loc 4 157 14 discriminator 4
	sd	a5,16(sp)
	.loc 4 158 8 discriminator 4
	ld	a5,16(sp)
	bge	a5,zero,.L26
	.loc 4 158 32 discriminator 1
	ld	a5,16(sp)
	lla	a4,.LC28
	lla	a3,.LC29
	lla	a2,__func__.0
	li	a1,158
	lla	a0,.LC27
	call	kpanic_spin
.L26:
	.loc 4 160 5
	ld	a5,24(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 161 5
	ld	a5,24(sp)
	ld	a5,0(a5)
	li	a2,0
	ld	a1,16(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 162 5
	ld	a5,24(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_release
	.loc 4 163 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE38:
	.size	free_ppage, .-free_ppage
	.align	2
	.globl	kfree_pages
	.type	kfree_pages, @function
kfree_pages:
.LFB39:
	.loc 4 165 44
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 166 11
	ld	a5,8(sp)
	sd	a5,24(sp)
	.loc 4 167 19
	ld	a4,24(sp)
	.loc 4 167 46
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 4 167 51
	li	a5,-4096
	and	a5,a4,a5
	.loc 4 167 9
	sd	a5,24(sp)
	.loc 4 168 5
	j	.L28
.L29:
	.loc 4 169 9 discriminator 2
	ld	a5,24(sp)
	li	a1,1
	mv	a0,a5
	call	free_ppage
	.loc 4 168 31 discriminator 2
	ld	a4,24(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,24(sp)
.L28:
	.loc 4 168 15 discriminator 1
	ld	a5,0(sp)
	.loc 4 168 14 discriminator 1
	ld	a4,24(sp)
	bltu	a4,a5,.L29
	.loc 4 171 1
	nop
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE39:
	.size	kfree_pages, .-kfree_pages
	.align	2
	.globl	get_ppool
	.type	get_ppool, @function
get_ppool:
.LFB40:
	.loc 4 199 25
	.cfi_startproc
	.loc 4 201 12
	lla	a5,kernel_ppool
	.loc 4 202 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE40:
	.size	get_ppool, .-get_ppool
	.section	.rodata
	.align	3
	.type	__func__.2, @object
	.size	__func__.2, 12
__func__.2:
	.string	"alloc_ppage"
	.align	3
	.type	__func__.1, @object
	.size	__func__.1, 13
__func__.1:
	.string	"alloc_nppage"
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 11
__func__.0:
	.string	"free_ppage"
	.text
.Letext0:
	.file 5 "include/types.h"
	.file 6 "include/stdbitmap.h"
	.file 7 "include/kernel/locks.h"
	.file 8 "include/kernel/mm.h"
	.file 9 "include/stdarg.h"
	.file 10 "include/stdfmt.h"
	.file 11 "include/string.h"
	.file 12 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x80b
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x19
	.4byte	.LASF82
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x4
	.4byte	.LASF5
	.byte	0x5
	.byte	0x17
	.byte	0x17
	.4byte	0x3a
	.byte	0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x8
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x4
	.4byte	.LASF6
	.byte	0x5
	.byte	0x1a
	.byte	0x17
	.4byte	0x5b
	.byte	0x8
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0x6
	.4byte	0x62
	.byte	0x8
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0x1a
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	.LASF10
	.byte	0x5
	.byte	0x20
	.byte	0xe
	.4byte	0x88
	.byte	0x8
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x4
	.4byte	.LASF12
	.byte	0x5
	.byte	0x23
	.byte	0x17
	.4byte	0x3a
	.byte	0x1b
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x5
	.byte	0x24
	.byte	0x6
	.4byte	0xb6
	.byte	0x12
	.4byte	.LASF13
	.byte	0
	.byte	0x12
	.4byte	.LASF14
	.byte	0x1
	.byte	0
	.byte	0x4
	.4byte	.LASF15
	.byte	0x5
	.byte	0x2a
	.byte	0x12
	.4byte	0x4f
	.byte	0x4
	.4byte	.LASF16
	.byte	0x5
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0x4
	.4byte	.LASF17
	.byte	0x5
	.byte	0x30
	.byte	0x11
	.4byte	0x7c
	.byte	0x4
	.4byte	.LASF18
	.byte	0x5
	.byte	0x33
	.byte	0x12
	.4byte	0x4f
	.byte	0xb
	.4byte	.LASF22
	.byte	0x10
	.byte	0x6
	.byte	0x1d
	.4byte	0x10d
	.byte	0x5
	.4byte	.LASF19
	.byte	0x6
	.byte	0x1f
	.byte	0xc
	.4byte	0xb6
	.byte	0
	.byte	0x5
	.4byte	.LASF20
	.byte	0x6
	.byte	0x21
	.byte	0xb
	.4byte	0x10d
	.byte	0x8
	.byte	0
	.byte	0x9
	.4byte	0xc2
	.byte	0x4
	.4byte	.LASF21
	.byte	0x6
	.byte	0x22
	.byte	0x3
	.4byte	0xe6
	.byte	0xb
	.4byte	.LASF23
	.byte	0x10
	.byte	0x7
	.byte	0x1b
	.4byte	0x145
	.byte	0x5
	.4byte	.LASF24
	.byte	0x7
	.byte	0x1d
	.byte	0xa
	.4byte	0x8f
	.byte	0
	.byte	0x5
	.4byte	.LASF25
	.byte	0x7
	.byte	0x1f
	.byte	0xb
	.4byte	0x145
	.byte	0x8
	.byte	0
	.byte	0x9
	.4byte	0x62
	.byte	0x4
	.4byte	.LASF26
	.byte	0x7
	.byte	0x20
	.byte	0x3
	.4byte	0x11e
	.byte	0xb
	.4byte	.LASF27
	.byte	0x28
	.byte	0x8
	.byte	0x23
	.4byte	0x197
	.byte	0x5
	.4byte	.LASF28
	.byte	0x8
	.byte	0x25
	.byte	0xf
	.4byte	0x197
	.byte	0
	.byte	0x5
	.4byte	.LASF29
	.byte	0x8
	.byte	0x27
	.byte	0xc
	.4byte	0xda
	.byte	0x8
	.byte	0x5
	.4byte	.LASF19
	.byte	0x8
	.byte	0x29
	.byte	0xc
	.4byte	0xb6
	.byte	0x10
	.byte	0x5
	.4byte	.LASF30
	.byte	0x8
	.byte	0x2b
	.byte	0x10
	.4byte	0x14a
	.byte	0x18
	.byte	0
	.byte	0x9
	.4byte	0x112
	.byte	0x4
	.4byte	.LASF31
	.byte	0x8
	.byte	0x2c
	.byte	0x3
	.4byte	0x156
	.byte	0x9
	.4byte	0x69
	.byte	0x4
	.4byte	.LASF32
	.byte	0x9
	.byte	0x22
	.byte	0x1b
	.4byte	0x1b9
	.byte	0x1c
	.byte	0x8
	.4byte	.LASF83
	.byte	0xb
	.4byte	.LASF33
	.byte	0x10
	.byte	0x3
	.byte	0x50
	.4byte	0x1e6
	.byte	0x5
	.4byte	.LASF34
	.byte	0x3
	.byte	0x51
	.byte	0x9
	.4byte	0xda
	.byte	0
	.byte	0x5
	.4byte	.LASF25
	.byte	0x3
	.byte	0x52
	.byte	0x8
	.4byte	0x145
	.byte	0x8
	.byte	0
	.byte	0x4
	.4byte	.LASF35
	.byte	0x3
	.byte	0x53
	.byte	0x3
	.4byte	0x1bf
	.byte	0x6
	.4byte	0x1e6
	.byte	0x7
	.4byte	0x1f2
	.4byte	0x207
	.byte	0xa
	.4byte	0x5b
	.byte	0
	.byte	0
	.byte	0x6
	.4byte	0x1f7
	.byte	0x3
	.4byte	.LASF40
	.byte	0x3
	.byte	0x55
	.byte	0x1c
	.4byte	0x207
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0xb
	.4byte	.LASF36
	.byte	0x20
	.byte	0x3
	.byte	0x5f
	.4byte	0x261
	.byte	0x5
	.4byte	.LASF37
	.byte	0x3
	.byte	0x61
	.byte	0xb
	.4byte	0x4f
	.byte	0
	.byte	0x13
	.string	"val"
	.byte	0x63
	.byte	0xb
	.4byte	0x4f
	.byte	0x8
	.byte	0x13
	.string	"set"
	.byte	0x65
	.byte	0xe
	.4byte	0x1a8
	.byte	0x10
	.byte	0x5
	.4byte	.LASF38
	.byte	0x3
	.byte	0x67
	.byte	0xe
	.4byte	0x1a8
	.byte	0x18
	.byte	0
	.byte	0x4
	.4byte	.LASF39
	.byte	0x3
	.byte	0x68
	.byte	0x3
	.4byte	0x222
	.byte	0x6
	.4byte	0x261
	.byte	0x7
	.4byte	0x26d
	.4byte	0x282
	.byte	0xa
	.4byte	0x5b
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0x272
	.byte	0x3
	.4byte	.LASF41
	.byte	0x3
	.byte	0x6a
	.byte	0x1d
	.4byte	0x282
	.byte	0x9
	.byte	0x3
	.8byte	prot_bits
	.byte	0x1d
	.2byte	0x222
	.byte	0x4
	.byte	0x19
	.byte	0x1
	.4byte	0x2c2
	.byte	0x5
	.4byte	.LASF42
	.byte	0x4
	.byte	0x1b
	.byte	0xa
	.4byte	0x2c2
	.byte	0
	.byte	0x5
	.4byte	.LASF43
	.byte	0x4
	.byte	0x1f
	.byte	0xa
	.4byte	0x2d2
	.byte	0x91
	.byte	0
	.byte	0x7
	.4byte	0xc2
	.4byte	0x2d2
	.byte	0xa
	.4byte	0x5b
	.byte	0x90
	.byte	0
	.byte	0x7
	.4byte	0xc2
	.4byte	0x2e3
	.byte	0x14
	.4byte	0x5b
	.2byte	0x190
	.byte	0
	.byte	0x10
	.4byte	.LASF44
	.byte	0x20
	.byte	0x3
	.4byte	0x29d
	.byte	0x9
	.byte	0x3
	.8byte	pool_btmps
	.byte	0x10
	.4byte	.LASF45
	.byte	0x2d
	.byte	0x9
	.4byte	0x19c
	.byte	0x9
	.byte	0x3
	.8byte	kernel_ppool
	.byte	0x10
	.4byte	.LASF46
	.byte	0x2d
	.byte	0x17
	.4byte	0x19c
	.byte	0x9
	.byte	0x3
	.8byte	user_ppool
	.byte	0xd
	.4byte	.LASF47
	.byte	0xa
	.byte	0x5b
	.byte	0x8
	.4byte	0xb6
	.4byte	0x342
	.byte	0x1
	.4byte	0x145
	.byte	0x1
	.4byte	0x1a8
	.byte	0x1
	.4byte	0x1ad
	.byte	0
	.byte	0xd
	.4byte	.LASF48
	.byte	0xb
	.byte	0x20
	.byte	0x8
	.4byte	0xb6
	.4byte	0x362
	.byte	0x1
	.4byte	0x362
	.byte	0x1
	.4byte	0xc2
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0x1e
	.byte	0x8
	.byte	0xc
	.4byte	.LASF49
	.byte	0x7
	.byte	0x3d
	.4byte	0x375
	.byte	0x1
	.4byte	0x375
	.byte	0
	.byte	0x9
	.4byte	0x14a
	.byte	0xc
	.4byte	.LASF50
	.byte	0x6
	.byte	0x34
	.4byte	0x395
	.byte	0x1
	.4byte	0x197
	.byte	0x1
	.4byte	0xce
	.byte	0x1
	.4byte	0x8f
	.byte	0
	.byte	0xc
	.4byte	.LASF51
	.byte	0x7
	.byte	0x33
	.4byte	0x3a6
	.byte	0x1
	.4byte	0x375
	.byte	0
	.byte	0xd
	.4byte	.LASF52
	.byte	0x6
	.byte	0x49
	.byte	0xa
	.4byte	0xce
	.4byte	0x3c1
	.byte	0x1
	.4byte	0x197
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0xd
	.4byte	.LASF53
	.byte	0xc
	.byte	0x43
	.byte	0x8
	.4byte	0xb6
	.4byte	0x3d8
	.byte	0x1
	.4byte	0x1a8
	.byte	0x15
	.byte	0
	.byte	0xc
	.4byte	.LASF54
	.byte	0x7
	.byte	0x29
	.4byte	0x3ee
	.byte	0x1
	.4byte	0x375
	.byte	0x1
	.4byte	0x145
	.byte	0
	.byte	0xc
	.4byte	.LASF55
	.byte	0x6
	.byte	0x2b
	.4byte	0x404
	.byte	0x1
	.4byte	0x197
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0x1f
	.4byte	.LASF84
	.byte	0x4
	.byte	0xc7
	.byte	0xa
	.4byte	0x422
	.8byte	.LFB40
	.8byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	0x19c
	.byte	0xe
	.4byte	.LASF59
	.byte	0xa5
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x471
	.byte	0x2
	.4byte	.LASF56
	.byte	0x4
	.byte	0xa5
	.byte	0x19
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x2
	.4byte	.LASF57
	.byte	0x4
	.byte	0xa5
	.byte	0x27
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF58
	.byte	0x4
	.byte	0xa6
	.byte	0xb
	.4byte	0x145
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.4byte	.LASF60
	.byte	0x9a
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x4dd
	.byte	0x2
	.4byte	.LASF61
	.byte	0x4
	.byte	0x9a
	.byte	0x18
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x2
	.4byte	.LASF62
	.byte	0x4
	.byte	0x9a
	.byte	0x24
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x57
	.byte	0x3
	.4byte	.LASF63
	.byte	0x4
	.byte	0x9b
	.byte	0xe
	.4byte	0x422
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF64
	.byte	0x4
	.byte	0x9d
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x11
	.4byte	.LASF65
	.4byte	0x4ed
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x4ed
	.byte	0xa
	.4byte	0x5b
	.byte	0xa
	.byte	0
	.byte	0x6
	.4byte	0x4dd
	.byte	0x16
	.4byte	.LASF66
	.byte	0x83
	.4byte	0xda
	.8byte	.LFB37
	.8byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x5b3
	.byte	0x17
	.string	"cnt"
	.byte	0x4
	.byte	0x83
	.byte	0x1c
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x2
	.4byte	.LASF62
	.byte	0x4
	.byte	0x83
	.byte	0x25
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x47
	.byte	0x3
	.4byte	.LASF63
	.byte	0x4
	.byte	0x84
	.byte	0xe
	.4byte	0x422
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.4byte	.LASF64
	.byte	0x4
	.byte	0x86
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.4byte	.LASF65
	.4byte	0x5c3
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1
	.byte	0x3
	.4byte	.LASF61
	.byte	0x4
	.byte	0x90
	.byte	0xc
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x20
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x593
	.byte	0xf
	.string	"i"
	.byte	0x4
	.byte	0x8b
	.byte	0xd
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x18
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0xf
	.string	"i"
	.byte	0x4
	.byte	0x91
	.byte	0xd
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x5c3
	.byte	0xa
	.4byte	0x5b
	.byte	0xc
	.byte	0
	.byte	0x6
	.4byte	0x5b3
	.byte	0x16
	.4byte	.LASF67
	.byte	0x6f
	.4byte	0xda
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0x638
	.byte	0x2
	.4byte	.LASF62
	.byte	0x4
	.byte	0x6f
	.byte	0x19
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x4f
	.byte	0x3
	.4byte	.LASF63
	.byte	0x4
	.byte	0x70
	.byte	0xe
	.4byte	0x422
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF64
	.byte	0x4
	.byte	0x72
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x11
	.4byte	.LASF65
	.4byte	0x648
	.byte	0x9
	.byte	0x3
	.8byte	__func__.2
	.byte	0x3
	.4byte	.LASF61
	.byte	0x4
	.byte	0x7b
	.byte	0xc
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x648
	.byte	0xa
	.4byte	0x5b
	.byte	0xb
	.byte	0
	.byte	0x6
	.4byte	0x638
	.byte	0xe
	.4byte	.LASF68
	.byte	0x5d
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.4byte	0x697
	.byte	0x2
	.4byte	.LASF69
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x2
	.4byte	.LASF70
	.byte	0x4
	.byte	0x5d
	.byte	0x2d
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF71
	.byte	0x4
	.byte	0x60
	.byte	0xc
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.4byte	.LASF72
	.byte	0x39
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0x6f0
	.byte	0x2
	.4byte	.LASF69
	.byte	0x4
	.byte	0x39
	.byte	0x18
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x2
	.4byte	.LASF71
	.byte	0x4
	.byte	0x39
	.byte	0x2c
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF73
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF74
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x21
	.4byte	.LASF85
	.byte	0x3
	.byte	0xcd
	.byte	0x16
	.4byte	0xda
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x731
	.byte	0x2
	.4byte	.LASF75
	.byte	0x3
	.byte	0xcd
	.byte	0x28
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x2
	.4byte	.LASF76
	.byte	0x3
	.byte	0xcd
	.byte	0x33
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x77
	.byte	0
	.byte	0x22
	.4byte	.LASF86
	.byte	0x2
	.byte	0x1c
	.byte	0x14
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x7c1
	.byte	0x2
	.4byte	.LASF77
	.byte	0x2
	.byte	0x1c
	.byte	0x26
	.4byte	0x145
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x77
	.byte	0x2
	.4byte	.LASF78
	.byte	0x2
	.byte	0x1c
	.byte	0x34
	.4byte	0x75
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x77
	.byte	0x2
	.4byte	.LASF79
	.byte	0x2
	.byte	0x1c
	.byte	0x46
	.4byte	0x1a8
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x77
	.byte	0x2
	.4byte	.LASF80
	.byte	0x2
	.byte	0x1c
	.byte	0x58
	.4byte	0x1a8
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x77
	.byte	0x17
	.string	"msg"
	.byte	0x2
	.byte	0x1c
	.byte	0x6e
	.4byte	0x1a8
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0x15
	.byte	0xf
	.string	"buf"
	.byte	0x2
	.byte	0x22
	.byte	0xa
	.4byte	0x7c1
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x77
	.byte	0x3
	.4byte	.LASF81
	.byte	0x2
	.byte	0x23
	.byte	0xd
	.4byte	0x1ad
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x77
	.byte	0
	.byte	0x7
	.4byte	0x62
	.4byte	0x7d2
	.byte	0x14
	.4byte	0x5b
	.2byte	0x3ff
	.byte	0
	.byte	0x23
	.4byte	.LASF87
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.byte	0x18
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xf
	.string	"__v"
	.byte	0x1
	.byte	0x2d
	.byte	0x16
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
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
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
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
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
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
	.byte	0x21
	.byte	0x4
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x8
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
	.byte	0x17
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
	.byte	0x18
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x13
	.byte	0x1
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
	.byte	0x1e
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
.LASF54:
	.string	"spinlock_init"
.LASF83:
	.string	"__builtin_va_list"
.LASF73:
	.string	"kpages"
.LASF15:
	.string	"size_t"
.LASF50:
	.string	"bitmap_set"
.LASF33:
	.string	"__addr_marker_t"
.LASF6:
	.string	"uint64_t"
.LASF32:
	.string	"va_list"
.LASF41:
	.string	"prot_bits"
.LASF43:
	.string	"user_ppool_btmp"
.LASF22:
	.string	"__bitmap_t"
.LASF75:
	.string	"addr"
.LASF71:
	.string	"total_pages"
.LASF76:
	.string	"next"
.LASF74:
	.string	"upages"
.LASF35:
	.string	"addr_marker_t"
.LASF86:
	.string	"kpanic_spin"
.LASF20:
	.string	"bits"
.LASF11:
	.string	"long int"
.LASF87:
	.string	"supervisor_interrupt_disable"
.LASF82:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF14:
	.string	"True"
.LASF79:
	.string	"func"
.LASF26:
	.string	"spinlock_t"
.LASF21:
	.string	"bitmap_t"
.LASF44:
	.string	"pool_btmps"
.LASF16:
	.string	"byte"
.LASF78:
	.string	"line"
.LASF28:
	.string	"btmp"
.LASF37:
	.string	"mask"
.LASF60:
	.string	"free_ppage"
.LASF58:
	.string	"temp"
.LASF59:
	.string	"kfree_pages"
.LASF68:
	.string	"memory_init"
.LASF4:
	.string	"unsigned int"
.LASF7:
	.string	"long unsigned int"
.LASF51:
	.string	"spinlock_acquire"
.LASF25:
	.string	"name"
.LASF19:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF45:
	.string	"kernel_ppool"
.LASF46:
	.string	"user_ppool"
.LASF85:
	.string	"page_align"
.LASF38:
	.string	"clear"
.LASF77:
	.string	"filename"
.LASF56:
	.string	"pstart"
.LASF24:
	.string	"locked"
.LASF57:
	.string	"pend"
.LASF31:
	.string	"ppool_t"
.LASF13:
	.string	"False"
.LASF62:
	.string	"kpage"
.LASF52:
	.string	"bitmap_scan"
.LASF66:
	.string	"alloc_nppage"
.LASF29:
	.string	"paddr_start"
.LASF2:
	.string	"unsigned char"
.LASF9:
	.string	"short int"
.LASF39:
	.string	"property_bit_t"
.LASF80:
	.string	"condition"
.LASF65:
	.string	"__func__"
.LASF36:
	.string	"__property_bit_t"
.LASF64:
	.string	"bit_idx"
.LASF27:
	.string	"__ppool_t"
.LASF34:
	.string	"start_address"
.LASF61:
	.string	"ppage"
.LASF42:
	.string	"kernel_ppool_btmp"
.LASF8:
	.string	"char"
.LASF17:
	.string	"offset_t"
.LASF72:
	.string	"init_pools"
.LASF55:
	.string	"bitmap_init"
.LASF40:
	.string	"address_markers"
.LASF47:
	.string	"vsprintf"
.LASF69:
	.string	"start_paddr"
.LASF49:
	.string	"spinlock_release"
.LASF48:
	.string	"memset"
.LASF70:
	.string	"end_paddr"
.LASF63:
	.string	"pool"
.LASF5:
	.string	"uint8_t"
.LASF53:
	.string	"kprintf"
.LASF84:
	.string	"get_ppool"
.LASF67:
	.string	"alloc_ppage"
.LASF18:
	.string	"addr_t"
.LASF10:
	.string	"int64_t"
.LASF12:
	.string	"Bool"
.LASF81:
	.string	"args"
.LASF30:
	.string	"lock"
.LASF23:
	.string	"__spinlock_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"kernel/mm.c"
	.ident	"GCC: (g) 12.2.0"
