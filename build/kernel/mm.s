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
.LFB49:
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
.LFE49:
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
.LFB58:
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
.LFE58:
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
.LFB59:
	.file 3 "include/kernel/paging.h"
	.loc 3 204 56
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 3 205 8
	lbu	a5,7(sp)
	andi	a5,a5,0xff
	bne	a5,zero,.L5
	.loc 3 206 22
	ld	a4,8(sp)
	li	a5,-4096
	and	a5,a4,a5
	j	.L6
.L5:
	.loc 3 207 30
	ld	a4,8(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 3 207 35
	li	a5,-4096
	and	a5,a4,a5
.L6:
	.loc 3 208 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE59:
	.size	page_align, .-page_align
	.align	2
	.type	get_pgd, @function
get_pgd:
.LFB63:
	.loc 3 268 35
	.cfi_startproc
	.loc 3 270 12
	lla	a5,_s_kernel_pgd
	.loc 3 271 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE63:
	.size	get_pgd, .-get_pgd
	.globl	pool_btmps
	.bss
	.align	3
	.type	pool_btmps, @object
	.size	pool_btmps, 691
pool_btmps:
	.zero	691
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
	.globl	kernel_vpool
	.align	3
	.type	kernel_vpool, @object
	.size	kernel_vpool, 32
kernel_vpool:
	.zero	32
	.section	.rodata
	.align	3
.LC17:
	.string	"kernel_ppool lock"
	.align	3
.LC18:
	.string	"user_ppool lock"
	.align	3
.LC19:
	.string	"kernel_vpool lock"
	.text
	.align	2
	.globl	init_pools
	.type	init_pools, @function
init_pools:
.LFB73:
	.file 4 "kernel/mm.c"
	.loc 4 59 56
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 62 9
	li	a5,1024
	sd	a5,24(sp)
	.loc 4 63 9
	li	a5,4096
	addi	a5,a5,-1024
	sd	a5,16(sp)
	.loc 4 66 23
	lla	a5,kernel_ppool
	ld	a4,24(sp)
	sd	a4,16(a5)
	.loc 4 67 30
	lla	a5,kernel_ppool
	ld	a4,8(sp)
	sd	a4,8(a5)
	.loc 4 68 23
	lla	a5,kernel_ppool
	lla	a4,pool_btmps
	sd	a4,0(a5)
	.loc 4 69 17
	lla	a5,kernel_ppool
	ld	a5,0(a5)
	.loc 4 69 60
	lla	a4,pool_btmps+16
	.loc 4 69 29
	sd	a4,8(a5)
	.loc 4 70 5
	lla	a5,kernel_ppool
	ld	a5,0(a5)
	li	a1,129
	mv	a0,a5
	call	bitmap_init
	.loc 4 71 5
	lla	a1,.LC17
	lla	a0,kernel_ppool+24
	call	spinlock_init
	.loc 4 74 21
	lla	a5,user_ppool
	ld	a4,16(sp)
	sd	a4,16(a5)
	.loc 4 75 42
	ld	a4,8(sp)
	ld	a5,24(sp)
	add	a4,a4,a5
	.loc 4 75 28
	lla	a5,user_ppool
	sd	a4,8(a5)
	.loc 4 76 21
	lla	a5,user_ppool
	lla	a4,pool_btmps+290
	sd	a4,0(a5)
	.loc 4 77 15
	lla	a5,user_ppool
	ld	a5,0(a5)
	.loc 4 77 56
	lla	a4,pool_btmps+306
	.loc 4 77 27
	sd	a4,8(a5)
	.loc 4 78 5
	lla	a5,user_ppool
	ld	a5,0(a5)
	li	a1,385
	mv	a0,a5
	call	bitmap_init
	.loc 4 79 5
	lla	a1,.LC18
	lla	a0,user_ppool+24
	call	spinlock_init
	.loc 4 87 32
	lla	a5,_e_kernel
	li	a1,1
	mv	a0,a5
	call	page_align
	mv	a4,a0
	.loc 4 87 30
	lla	a5,kernel_vpool
	sd	a4,8(a5)
	.loc 4 88 23
	lla	a5,kernel_vpool
	lla	a4,pool_btmps+145
	sd	a4,0(a5)
	.loc 4 89 17
	lla	a5,kernel_vpool
	ld	a5,0(a5)
	.loc 4 89 60
	lla	a4,pool_btmps+161
	.loc 4 89 29
	sd	a4,8(a5)
	.loc 4 90 5
	lla	a5,kernel_vpool
	ld	a5,0(a5)
	li	a1,129
	mv	a0,a5
	call	bitmap_init
	.loc 4 91 5
	lla	a1,.LC19
	lla	a0,kernel_vpool+16
	call	spinlock_init
	.loc 4 92 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE73:
	.size	init_pools, .-init_pools
	.section	.rodata
	.align	3
.LC20:
	.string	"Memory Management Info:\n"
	.align	3
.LC21:
	.string	"\ttotal physical pages available: %#X\n"
	.align	3
.LC22:
	.string	"\tkernel physical pool is at: %#X\n"
	.align	3
.LC23:
	.string	"\t%#X kernel physical pages available, start from %#X\n"
	.align	3
.LC24:
	.string	"\tuser physical pool is at: %#X\n"
	.align	3
.LC25:
	.string	"\t%#X user physical pages available, start from %#X\n"
	.text
	.align	2
	.globl	memory_init
	.type	memory_init, @function
memory_init:
.LFB74:
	.loc 4 95 55
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 96 19
	li	a1,1
	ld	a0,8(sp)
	call	page_align
	sd	a0,8(sp)
	.loc 4 97 17
	li	a1,0
	ld	a0,0(sp)
	call	page_align
	sd	a0,0(sp)
	.loc 4 98 37
	ld	a4,0(sp)
	ld	a5,8(sp)
	sub	a5,a4,a5
	.loc 4 98 52
	srli	a5,a5,12
	.loc 4 98 12
	addi	a5,a5,1
	sd	a5,24(sp)
	.loc 4 101 5
	ld	a1,24(sp)
	ld	a0,8(sp)
	call	init_pools
	.loc 4 104 5
	lla	a0,.LC20
	call	kprintf
	.loc 4 105 5
	ld	a1,24(sp)
	lla	a0,.LC21
	call	kprintf
	.loc 4 106 5
	lla	a1,kernel_ppool
	lla	a0,.LC22
	call	kprintf
	.loc 4 107 5
	lla	a5,kernel_ppool
	ld	a4,16(a5)
	lla	a5,kernel_ppool
	ld	a5,8(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC23
	call	kprintf
	.loc 4 108 5
	lla	a1,user_ppool
	lla	a0,.LC24
	call	kprintf
	.loc 4 109 5
	lla	a5,user_ppool
	ld	a4,16(a5)
	lla	a5,user_ppool
	ld	a5,8(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC25
	call	kprintf
	.loc 4 110 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE74:
	.size	memory_init, .-memory_init
	.section	.rodata
	.align	3
.LC26:
	.string	"\"bit_idx=%d, cannot find a physical page!\""
	.align	3
.LC27:
	.string	"bit_idx != -1"
	.align	3
.LC28:
	.string	"kernel/mm.c"
	.text
	.align	2
	.globl	alloc_ppage
	.type	alloc_ppage, @function
alloc_ppage:
.LFB75:
	.loc 4 113 31
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	mv	a5,a0
	sb	a5,15(sp)
	.loc 4 114 53
	lbu	a5,15(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L12
	.loc 4 114 53 is_stmt 0 discriminator 1
	lla	a5,kernel_ppool
	j	.L13
.L12:
	.loc 4 114 53 discriminator 2
	lla	a5,user_ppool
.L13:
	.loc 4 114 14 is_stmt 1 discriminator 4
	sd	a5,40(sp)
	.loc 4 116 24 discriminator 4
	ld	a5,40(sp)
	ld	a5,0(a5)
	li	a1,1
	mv	a0,a5
	call	bitmap_scan
	sd	a0,32(sp)
	.loc 4 118 8 discriminator 4
	ld	a4,32(sp)
	li	a5,-1
	bne	a4,a5,.L14
	.loc 4 118 33 discriminator 1
	ld	a5,32(sp)
	lla	a4,.LC26
	lla	a3,.LC27
	lla	a2,__func__.7
	li	a1,118
	lla	a0,.LC28
	call	kpanic_spin
.L14:
	.loc 4 120 5
	ld	a5,40(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 121 5
	ld	a5,40(sp)
	ld	a5,0(a5)
	li	a2,1
	ld	a1,32(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 122 5
	ld	a5,40(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_release
	.loc 4 125 24
	ld	a5,40(sp)
	ld	a5,8(a5)
	.loc 4 125 48
	ld	a4,32(sp)
	slli	a4,a4,12
	.loc 4 125 12
	add	a5,a5,a4
	sd	a5,24(sp)
	.loc 4 126 5
	ld	a5,24(sp)
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 4 128 12
	ld	a5,24(sp)
	.loc 4 129 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE75:
	.size	alloc_ppage, .-alloc_ppage
	.section	.rodata
	.align	3
.LC29:
	.string	"\"bit_idx shouldn't be negative, bit_idx = %d!\""
	.align	3
.LC30:
	.string	"bit_idx >= 0"
	.text
	.align	2
	.globl	free_ppage
	.type	free_ppage, @function
free_ppage:
.LFB76:
	.loc 4 132 42
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 4 133 53
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L17
	.loc 4 133 53 is_stmt 0 discriminator 1
	lla	a5,kernel_ppool
	j	.L18
.L17:
	.loc 4 133 53 discriminator 2
	lla	a5,user_ppool
.L18:
	.loc 4 133 14 is_stmt 1 discriminator 4
	sd	a5,24(sp)
	.loc 4 135 37 discriminator 4
	ld	a5,24(sp)
	ld	a5,8(a5)
	.loc 4 135 31 discriminator 4
	ld	a4,8(sp)
	sub	a5,a4,a5
	.loc 4 135 52 discriminator 4
	srli	a5,a5,12
	.loc 4 135 14 discriminator 4
	sd	a5,16(sp)
	.loc 4 136 8 discriminator 4
	ld	a5,16(sp)
	bge	a5,zero,.L19
	.loc 4 136 32 discriminator 1
	ld	a5,16(sp)
	lla	a4,.LC29
	lla	a3,.LC30
	lla	a2,__func__.6
	li	a1,136
	lla	a0,.LC28
	call	kpanic_spin
.L19:
	.loc 4 138 5
	ld	a5,24(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 139 5
	ld	a5,24(sp)
	ld	a5,0(a5)
	li	a2,0
	ld	a1,16(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 140 5
	ld	a5,24(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_release
	.loc 4 141 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE76:
	.size	free_ppage, .-free_ppage
	.section	.rodata
	.align	3
.LC31:
	.string	"\"vpool shouldn't be NULL!\""
	.align	3
.LC32:
	.string	"vpool != NULL"
	.align	3
.LC33:
	.string	"\"bit_idx=%d, cannot find a virtual page!\""
	.text
	.align	2
	.globl	alloc_vpage
	.type	alloc_vpage, @function
alloc_vpage:
.LFB77:
	.loc 4 144 47
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 145 8
	ld	a5,8(sp)
	bne	a5,zero,.L21
	.loc 4 145 40 discriminator 1
	lla	a4,.LC31
	lla	a3,.LC32
	lla	a2,__func__.5
	li	a1,145
	lla	a0,.LC28
	call	kpanic_spin
.L21:
	.loc 4 147 24
	ld	a5,8(sp)
	ld	a5,0(a5)
	ld	a1,0(sp)
	mv	a0,a5
	call	bitmap_scan
	sd	a0,24(sp)
	.loc 4 149 8
	ld	a4,24(sp)
	li	a5,-1
	bne	a4,a5,.L22
	.loc 4 149 33 discriminator 1
	ld	a5,24(sp)
	lla	a4,.LC33
	lla	a3,.LC27
	lla	a2,__func__.5
	li	a1,149
	lla	a0,.LC28
	call	kpanic_spin
.L22:
	.loc 4 150 5
	ld	a5,8(sp)
	addi	a5,a5,16
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 151 5
	ld	a5,8(sp)
	ld	a5,0(a5)
	li	a2,1
	ld	a1,24(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 152 5
	ld	a5,8(sp)
	addi	a5,a5,16
	mv	a0,a5
	call	spinlock_release
	.loc 4 154 17
	ld	a5,8(sp)
	ld	a5,8(a5)
	.loc 4 154 41
	ld	a4,24(sp)
	slli	a4,a4,12
	.loc 4 154 31
	add	a5,a5,a4
	.loc 4 155 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE77:
	.size	alloc_vpage, .-alloc_vpage
	.align	2
	.globl	free_vpage
	.type	free_vpage, @function
free_vpage:
.LFB78:
	.loc 4 158 46
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 159 8
	ld	a5,8(sp)
	bne	a5,zero,.L25
	.loc 4 159 40 discriminator 1
	lla	a4,.LC31
	lla	a3,.LC32
	lla	a2,__func__.4
	li	a1,159
	lla	a0,.LC28
	call	kpanic_spin
.L25:
	.loc 4 161 38
	ld	a5,8(sp)
	ld	a5,8(a5)
	.loc 4 161 31
	ld	a4,0(sp)
	sub	a5,a4,a5
	.loc 4 161 53
	srli	a5,a5,12
	.loc 4 161 14
	sd	a5,24(sp)
	.loc 4 162 8
	ld	a5,24(sp)
	bge	a5,zero,.L26
	.loc 4 162 32 discriminator 1
	ld	a5,24(sp)
	lla	a4,.LC29
	lla	a3,.LC30
	lla	a2,__func__.4
	li	a1,162
	lla	a0,.LC28
	call	kpanic_spin
.L26:
	.loc 4 163 5
	ld	a5,8(sp)
	addi	a5,a5,16
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 164 5
	ld	a5,8(sp)
	ld	a5,0(a5)
	li	a2,0
	ld	a1,24(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 165 5
	ld	a5,8(sp)
	addi	a5,a5,16
	mv	a0,a5
	call	spinlock_release
	.loc 4 166 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE78:
	.size	free_vpage, .-free_vpage
	.align	2
	.globl	get_ppool
	.type	get_ppool, @function
get_ppool:
.LFB79:
	.loc 4 169 25
	.cfi_startproc
	.loc 4 171 12
	lla	a5,kernel_ppool
	.loc 4 172 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE79:
	.size	get_ppool, .-get_ppool
	.align	2
	.globl	get_vpool
	.type	get_vpool, @function
get_vpool:
.LFB80:
	.loc 4 175 25
	.cfi_startproc
	.loc 4 177 12
	lla	a5,kernel_vpool
	.loc 4 178 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE80:
	.size	get_vpool, .-get_vpool
	.section	.rodata
	.align	3
.LC34:
	.string	"\"cnt must greater than zero, but cut = %d!\""
	.align	3
.LC35:
	.string	"cnt > 0"
	.align	3
.LC36:
	.string	"\"Only kernel page is supported now, you're trying to malloc a user page, kpage=%d!\""
	.align	3
.LC37:
	.string	"kpage == True"
	.align	3
.LC38:
	.string	"kernel"
	.align	3
.LC39:
	.string	"user"
	.align	3
.LC40:
	.string	"Malloc a %s page\n"
	.text
	.align	2
	.globl	malloc_page
	.type	malloc_page, @function
malloc_page:
.LFB81:
	.loc 4 186 42
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 4 187 8
	ld	a5,8(sp)
	bne	a5,zero,.L32
	.loc 4 187 27 discriminator 1
	ld	a5,8(sp)
	lla	a4,.LC34
	lla	a3,.LC35
	lla	a2,__func__.3
	li	a1,187
	lla	a0,.LC28
	call	kpanic_spin
.L32:
	.loc 4 189 8
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	beq	a4,a5,.L33
	.loc 4 189 33 discriminator 1
	lbu	a5,7(sp)
	sext.w	a5,a5
	lla	a4,.LC36
	lla	a3,.LC37
	lla	a2,__func__.3
	li	a1,189
	lla	a0,.LC28
	call	kpanic_spin
.L33:
	.loc 4 192 5
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L34
	.loc 4 192 5 is_stmt 0 discriminator 1
	lla	a5,.LC38
	j	.L35
.L34:
	.loc 4 192 5 discriminator 2
	lla	a5,.LC39
.L35:
	.loc 4 192 5 discriminator 4
	mv	a1,a5
	lla	a0,.LC40
	call	kprintf
	.loc 4 195 18 is_stmt 1 discriminator 4
	call	get_pgd
	sd	a0,48(sp)
	.loc 4 198 22 discriminator 4
	call	get_vpool
	sd	a0,40(sp)
	.loc 4 201 44 discriminator 4
	ld	a1,8(sp)
	ld	a0,40(sp)
	call	alloc_vpage
	sd	a0,56(sp)
	.loc 4 203 11 discriminator 4
	j	.L36
.L37:
.LBB3:
	.loc 4 205 48
	lbu	a5,7(sp)
	mv	a0,a5
	call	alloc_ppage
	sd	a0,32(sp)
	.loc 4 206 25
	li	a5,231
	sd	a5,24(sp)
	.loc 4 209 9
	li	a5,0
	ld	a4,24(sp)
	li	a3,4096
	ld	a2,32(sp)
	ld	a1,56(sp)
	ld	a0,48(sp)
	call	create_mapping
	.loc 4 212 15
	ld	a4,56(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,56(sp)
.L36:
.LBE3:
	.loc 4 203 15
	ld	a5,8(sp)
	addi	a4,a5,-1
	sd	a4,8(sp)
	.loc 4 203 18
	bne	a5,zero,.L37
	.loc 4 214 12
	ld	a5,56(sp)
	.loc 4 215 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE81:
	.size	malloc_page, .-malloc_page
	.section	.rodata
	.align	3
.LC41:
	.string	"\"walk va too much\""
	.align	3
.LC42:
	.string	"va<PHYSTOP"
	.text
	.align	2
	.globl	walk
	.type	walk, @function
walk:
.LFB82:
	.loc 4 260 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a5,a2
	sw	a5,12(sp)
	.loc 4 263 8
	ld	a4,16(sp)
	li	a5,537
	slli	a5,a5,22
	bltu	a4,a5,.L40
	.loc 4 263 33 discriminator 1
	li	a5,0
	lla	a4,.LC41
	lla	a3,.LC42
	lla	a2,__func__.2
	li	a1,263
	lla	a0,.LC28
	call	kpanic_spin
.L40:
.LBB4:
	.loc 4 264 11
	li	a5,2
	sw	a5,44(sp)
	.loc 4 264 3
	j	.L41
.L47:
.LBB5:
	.loc 4 265 59
	lw	a5,44(sp)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,3
	addw	a5,a5,a4
	sext.w	a5,a5
	.loc 4 265 56
	addiw	a5,a5,12
	sext.w	a5,a5
	.loc 4 265 49
	mv	a4,a5
	ld	a5,16(sp)
	srl	a5,a5,a4
	.loc 4 265 71
	andi	a5,a5,511
	.loc 4 265 28
	slli	a5,a5,3
	.loc 4 265 12
	ld	a4,24(sp)
	add	a5,a4,a5
	sd	a5,32(sp)
	.loc 4 266 8
	ld	a5,32(sp)
	ld	a5,0(a5)
	.loc 4 266 13
	andi	a5,a5,1
	.loc 4 266 7
	beq	a5,zero,.L42
	.loc 4 267 35
	ld	a5,32(sp)
	ld	a5,0(a5)
	.loc 4 267 41
	srli	a5,a5,10
	.loc 4 267 48
	slli	a5,a5,12
	.loc 4 267 17
	sd	a5,24(sp)
	j	.L43
.L42:
	.loc 4 269 9
	lw	a5,12(sp)
	sext.w	a5,a5
	beq	a5,zero,.L44
	.loc 4 269 41 discriminator 1
	li	a0,1
	call	alloc_ppage
	mv	a5,a0
	.loc 4 269 31 discriminator 1
	sd	a5,24(sp)
	.loc 4 269 17 discriminator 1
	ld	a5,24(sp)
	bne	a5,zero,.L45
.L44:
	.loc 4 270 16
	li	a5,0
	j	.L46
.L45:
	.loc 4 271 7
	li	a2,4096
	li	a1,0
	ld	a0,24(sp)
	call	memset
	.loc 4 272 17
	ld	a5,24(sp)
	.loc 4 272 38
	srli	a5,a5,12
	.loc 4 272 45
	slli	a5,a5,10
	.loc 4 272 52
	ori	a4,a5,1
	.loc 4 272 12
	ld	a5,32(sp)
	sd	a4,0(a5)
.L43:
.LBE5:
	.loc 4 264 38 discriminator 2
	lw	a5,44(sp)
	addiw	a5,a5,-1
	sw	a5,44(sp)
.L41:
	.loc 4 264 28 discriminator 1
	lw	a5,44(sp)
	sext.w	a5,a5
	bgt	a5,zero,.L47
.LBE4:
	.loc 4 275 41
	ld	a5,16(sp)
	srli	a5,a5,12
	.loc 4 275 59
	andi	a5,a5,511
	.loc 4 275 20
	slli	a5,a5,3
	.loc 4 275 10
	ld	a4,24(sp)
	add	a5,a4,a5
.L46:
	.loc 4 276 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE82:
	.size	walk, .-walk
	.section	.rodata
	.align	3
.LC43:
	.string	"\"mappages:size error\""
	.align	3
.LC44:
	.string	"size>0"
	.align	3
.LC45:
	.string	"\"mappage:repeat map\""
	.align	3
.LC46:
	.string	"!(*pte&PTE_V)"
	.text
	.align	2
	.globl	mappages
	.type	mappages, @function
mappages:
.LFB83:
	.loc 4 284 1
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	.cfi_offset 1, -8
	sd	a0,40(sp)
	sd	a1,32(sp)
	sd	a2,24(sp)
	sd	a3,16(sp)
	mv	a5,a4
	sw	a5,12(sp)
	.loc 4 290 6
	ld	a5,24(sp)
	bne	a5,zero,.L49
	.loc 4 290 24 discriminator 1
	li	a5,1
	lla	a4,.LC43
	lla	a3,.LC44
	lla	a2,__func__.1
	li	a1,290
	lla	a0,.LC28
	call	kpanic_spin
.L49:
	.loc 4 293 5
	ld	a4,32(sp)
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,72(sp)
	.loc 4 294 16
	ld	a4,32(sp)
	ld	a5,24(sp)
	add	a5,a4,a5
	.loc 4 294 23
	addi	a4,a5,-1
	.loc 4 294 8
	li	a5,-4096
	and	a5,a4,a5
	sd	a5,64(sp)
.L55:
	.loc 4 296 15
	li	a2,1
	ld	a1,72(sp)
	ld	a0,40(sp)
	call	walk
	sd	a0,56(sp)
	.loc 4 296 7
	ld	a5,56(sp)
	bne	a5,zero,.L50
	.loc 4 297 14
	li	a5,-1
	j	.L51
.L50:
	.loc 4 300 11
	ld	a5,56(sp)
	ld	a5,0(a5)
	.loc 4 300 15
	andi	a5,a5,1
	.loc 4 300 8
	beq	a5,zero,.L52
	.loc 4 300 37 discriminator 1
	li	a5,0
	lla	a4,.LC45
	lla	a3,.LC46
	lla	a2,__func__.1
	li	a1,300
	lla	a0,.LC28
	call	kpanic_spin
.L52:
	.loc 4 301 29
	ld	a5,16(sp)
	srli	a5,a5,12
	.loc 4 301 36
	slli	a4,a5,10
	.loc 4 301 43
	lw	a5,12(sp)
	or	a5,a4,a5
	.loc 4 301 50
	ori	a4,a5,1
	.loc 4 301 10
	ld	a5,56(sp)
	sd	a4,0(a5)
	.loc 4 302 7
	ld	a4,72(sp)
	ld	a5,64(sp)
	beq	a4,a5,.L57
	.loc 4 304 7
	ld	a4,72(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,72(sp)
	.loc 4 305 8
	ld	a4,16(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,16(sp)
	.loc 4 296 7
	j	.L55
.L57:
	.loc 4 303 7
	nop
	.loc 4 307 10
	li	a5,0
.L51:
	.loc 4 308 1
	mv	a0,a5
	ld	ra,88(sp)
	.cfi_restore 1
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE83:
	.size	mappages, .-mappages
	.align	2
	.globl	uvmcreate
	.type	uvmcreate, @function
uvmcreate:
.LFB84:
	.loc 4 319 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 4 321 29
	li	a0,1
	call	alloc_ppage
	mv	a5,a0
	.loc 4 321 13
	sd	a5,8(sp)
	.loc 4 322 5
	ld	a5,8(sp)
	bne	a5,zero,.L59
	.loc 4 323 12
	li	a5,0
	j	.L60
.L59:
	.loc 4 324 3
	li	a2,4096
	li	a1,0
	ld	a0,8(sp)
	call	memset
	.loc 4 325 10
	ld	a5,8(sp)
.L60:
	.loc 4 326 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE84:
	.size	uvmcreate, .-uvmcreate
	.section	.rodata
	.align	3
.LC47:
	.string	"\"uvmfirst: more than a page\""
	.align	3
.LC48:
	.string	"sz<=PGSIZE"
	.text
	.align	2
	.globl	uvmfirst
	.type	uvmfirst, @function
uvmfirst:
.LFB85:
	.loc 4 332 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a5,a2
	sw	a5,12(sp)
	.loc 4 337 6
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,4096
	bleu	a4,a5,.L62
	.loc 4 337 26 discriminator 1
	li	a5,0
	lla	a4,.LC47
	lla	a3,.LC48
	lla	a2,__func__.0
	li	a1,337
	lla	a0,.LC28
	call	kpanic_spin
.L62:
	.loc 4 338 16
	li	a0,1
	call	alloc_ppage
	mv	a5,a0
	.loc 4 338 7
	sd	a5,40(sp)
	.loc 4 339 3
	li	a2,4096
	li	a1,0
	ld	a0,40(sp)
	call	memset
	.loc 4 340 3
	ld	a5,40(sp)
	li	a4,30
	mv	a3,a5
	li	a2,4096
	li	a1,0
	ld	a0,24(sp)
	call	mappages
	.loc 4 341 3
	lwu	a5,12(sp)
	mv	a2,a5
	ld	a1,16(sp)
	ld	a0,40(sp)
	call	memmove
	.loc 4 342 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE85:
	.size	uvmfirst, .-uvmfirst
	.section	.rodata
	.align	3
	.type	__func__.7, @object
	.size	__func__.7, 12
__func__.7:
	.string	"alloc_ppage"
	.align	3
	.type	__func__.6, @object
	.size	__func__.6, 11
__func__.6:
	.string	"free_ppage"
	.align	3
	.type	__func__.5, @object
	.size	__func__.5, 12
__func__.5:
	.string	"alloc_vpage"
	.align	3
	.type	__func__.4, @object
	.size	__func__.4, 11
__func__.4:
	.string	"free_vpage"
	.align	3
	.type	__func__.3, @object
	.size	__func__.3, 12
__func__.3:
	.string	"malloc_page"
	.section	.srodata,"a"
	.align	3
	.type	__func__.2, @object
	.size	__func__.2, 5
__func__.2:
	.string	"walk"
	.section	.rodata
	.align	3
	.type	__func__.1, @object
	.size	__func__.1, 9
__func__.1:
	.string	"mappages"
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 9
__func__.0:
	.string	"uvmfirst"
	.text
.Letext0:
	.file 5 "include/types.h"
	.file 6 "include/stdbitmap.h"
	.file 7 "include/asm/svxx.h"
	.file 8 "include/kernel/locks.h"
	.file 9 "include/riscv.h"
	.file 10 "include/kernel/mm.h"
	.file 11 "include/stdarg.h"
	.file 12 "include/string.h"
	.file 13 "include/stdfmt.h"
	.file 14 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xbf9
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x21
	.4byte	.LASF109
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF5
	.byte	0x5
	.byte	0x17
	.byte	0x17
	.4byte	0x3a
	.byte	0xa
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0xa
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x2
	.4byte	.LASF6
	.byte	0x5
	.byte	0x1a
	.byte	0x17
	.4byte	0x5b
	.byte	0xa
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0xa
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0x8
	.4byte	0x62
	.byte	0xa
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0x22
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.4byte	.LASF10
	.byte	0x5
	.byte	0x20
	.byte	0xe
	.4byte	0x88
	.byte	0xa
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x2
	.4byte	.LASF12
	.byte	0x5
	.byte	0x23
	.byte	0x17
	.4byte	0x3a
	.byte	0x23
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x5
	.byte	0x24
	.byte	0x6
	.4byte	0xb6
	.byte	0x1b
	.4byte	.LASF13
	.byte	0
	.byte	0x1b
	.4byte	.LASF14
	.byte	0x1
	.byte	0
	.byte	0x2
	.4byte	.LASF15
	.byte	0x5
	.byte	0x2a
	.byte	0x12
	.4byte	0x4f
	.byte	0x2
	.4byte	.LASF16
	.byte	0x5
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0x2
	.4byte	.LASF17
	.byte	0x5
	.byte	0x30
	.byte	0x11
	.4byte	0x7c
	.byte	0x2
	.4byte	.LASF18
	.byte	0x5
	.byte	0x33
	.byte	0x12
	.4byte	0x4f
	.byte	0x2
	.4byte	.LASF19
	.byte	0x5
	.byte	0x3b
	.byte	0x13
	.4byte	0xf2
	.byte	0x6
	.4byte	0x4f
	.byte	0x2
	.4byte	.LASF20
	.byte	0x5
	.byte	0x3c
	.byte	0x12
	.4byte	0x4f
	.byte	0xb
	.4byte	.LASF24
	.byte	0x10
	.byte	0x6
	.byte	0x1d
	.4byte	0x12a
	.byte	0x3
	.4byte	.LASF21
	.byte	0x6
	.byte	0x1f
	.byte	0xc
	.4byte	0xb6
	.byte	0
	.byte	0x3
	.4byte	.LASF22
	.byte	0x6
	.byte	0x21
	.byte	0xb
	.4byte	0x12a
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0xc2
	.byte	0x2
	.4byte	.LASF23
	.byte	0x6
	.byte	0x22
	.byte	0x3
	.4byte	0x103
	.byte	0xb
	.4byte	.LASF25
	.byte	0x8
	.byte	0x7
	.byte	0x24
	.4byte	0x155
	.byte	0x15
	.string	"val"
	.byte	0x7
	.byte	0x25
	.byte	0xe
	.4byte	0x4f
	.byte	0
	.byte	0
	.byte	0x2
	.4byte	.LASF26
	.byte	0x7
	.byte	0x26
	.byte	0x3
	.4byte	0x13b
	.byte	0x1c
	.4byte	.LASF27
	.byte	0x7
	.2byte	0x16d
	.byte	0x10
	.4byte	0xda
	.byte	0xb
	.4byte	.LASF28
	.byte	0x10
	.byte	0x8
	.byte	0x1b
	.4byte	0x195
	.byte	0x3
	.4byte	.LASF29
	.byte	0x8
	.byte	0x1d
	.byte	0xa
	.4byte	0x8f
	.byte	0
	.byte	0x3
	.4byte	.LASF30
	.byte	0x8
	.byte	0x1f
	.byte	0xb
	.4byte	0x195
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0x62
	.byte	0x2
	.4byte	.LASF31
	.byte	0x8
	.byte	0x20
	.byte	0x3
	.4byte	0x16e
	.byte	0x1c
	.4byte	.LASF32
	.byte	0x9
	.2byte	0x14e
	.byte	0x12
	.4byte	0x4f
	.byte	0xb
	.4byte	.LASF33
	.byte	0x28
	.byte	0xa
	.byte	0x21
	.4byte	0x1f4
	.byte	0x3
	.4byte	.LASF34
	.byte	0xa
	.byte	0x23
	.byte	0xf
	.4byte	0x1f4
	.byte	0
	.byte	0x3
	.4byte	.LASF35
	.byte	0xa
	.byte	0x25
	.byte	0xc
	.4byte	0xda
	.byte	0x8
	.byte	0x3
	.4byte	.LASF21
	.byte	0xa
	.byte	0x27
	.byte	0xc
	.4byte	0xb6
	.byte	0x10
	.byte	0x3
	.4byte	.LASF36
	.byte	0xa
	.byte	0x29
	.byte	0x10
	.4byte	0x19a
	.byte	0x18
	.byte	0
	.byte	0x6
	.4byte	0x12f
	.byte	0x2
	.4byte	.LASF37
	.byte	0xa
	.byte	0x2a
	.byte	0x3
	.4byte	0x1b3
	.byte	0xb
	.4byte	.LASF38
	.byte	0x20
	.byte	0xa
	.byte	0x32
	.4byte	0x239
	.byte	0x3
	.4byte	.LASF34
	.byte	0xa
	.byte	0x34
	.byte	0xf
	.4byte	0x1f4
	.byte	0
	.byte	0x3
	.4byte	.LASF39
	.byte	0xa
	.byte	0x36
	.byte	0xc
	.4byte	0xda
	.byte	0x8
	.byte	0x3
	.4byte	.LASF36
	.byte	0xa
	.byte	0x38
	.byte	0x10
	.4byte	0x19a
	.byte	0x10
	.byte	0
	.byte	0x2
	.4byte	.LASF40
	.byte	0xa
	.byte	0x39
	.byte	0x3
	.4byte	0x205
	.byte	0x6
	.4byte	0x69
	.byte	0x2
	.4byte	.LASF41
	.byte	0xb
	.byte	0x22
	.byte	0x1b
	.4byte	0x256
	.byte	0x24
	.byte	0x8
	.4byte	.LASF110
	.byte	0x7
	.4byte	0x62
	.4byte	0x267
	.byte	0x25
	.byte	0
	.byte	0x1d
	.4byte	.LASF54
	.byte	0x3
	.byte	0x48
	.4byte	0x25c
	.byte	0x6
	.4byte	0x161
	.byte	0xb
	.4byte	.LASF42
	.byte	0x10
	.byte	0x3
	.byte	0x51
	.4byte	0x29e
	.byte	0x3
	.4byte	.LASF43
	.byte	0x3
	.byte	0x52
	.byte	0x9
	.4byte	0xda
	.byte	0
	.byte	0x3
	.4byte	.LASF30
	.byte	0x3
	.byte	0x53
	.byte	0x8
	.4byte	0x195
	.byte	0x8
	.byte	0
	.byte	0x2
	.4byte	.LASF44
	.byte	0x3
	.byte	0x54
	.byte	0x3
	.4byte	0x277
	.byte	0x8
	.4byte	0x29e
	.byte	0x7
	.4byte	0x2aa
	.4byte	0x2bf
	.byte	0xc
	.4byte	0x5b
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	0x2af
	.byte	0x4
	.4byte	.LASF49
	.byte	0x3
	.byte	0x56
	.byte	0x1c
	.4byte	0x2bf
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0xb
	.4byte	.LASF45
	.byte	0x20
	.byte	0x3
	.byte	0x60
	.4byte	0x31b
	.byte	0x3
	.4byte	.LASF46
	.byte	0x3
	.byte	0x62
	.byte	0xb
	.4byte	0x4f
	.byte	0
	.byte	0x15
	.string	"val"
	.byte	0x3
	.byte	0x64
	.byte	0xb
	.4byte	0x4f
	.byte	0x8
	.byte	0x15
	.string	"set"
	.byte	0x3
	.byte	0x66
	.byte	0xe
	.4byte	0x245
	.byte	0x10
	.byte	0x3
	.4byte	.LASF47
	.byte	0x3
	.byte	0x68
	.byte	0xe
	.4byte	0x245
	.byte	0x18
	.byte	0
	.byte	0x2
	.4byte	.LASF48
	.byte	0x3
	.byte	0x69
	.byte	0x3
	.4byte	0x2da
	.byte	0x8
	.4byte	0x31b
	.byte	0x7
	.4byte	0x327
	.4byte	0x33c
	.byte	0xc
	.4byte	0x5b
	.byte	0x8
	.byte	0
	.byte	0x8
	.4byte	0x32c
	.byte	0x4
	.4byte	.LASF50
	.byte	0x3
	.byte	0x6b
	.byte	0x1d
	.4byte	0x33c
	.byte	0x9
	.byte	0x3
	.8byte	prot_bits
	.byte	0x26
	.2byte	0x2b3
	.byte	0x4
	.byte	0x1b
	.byte	0x1
	.4byte	0x38a
	.byte	0x3
	.4byte	.LASF51
	.byte	0x4
	.byte	0x1d
	.byte	0xa
	.4byte	0x38a
	.byte	0
	.byte	0x3
	.4byte	.LASF52
	.byte	0x4
	.byte	0x1f
	.byte	0xa
	.4byte	0x38a
	.byte	0x91
	.byte	0x27
	.4byte	.LASF53
	.byte	0x4
	.byte	0x21
	.byte	0xa
	.4byte	0x39a
	.2byte	0x122
	.byte	0
	.byte	0x7
	.4byte	0xc2
	.4byte	0x39a
	.byte	0xc
	.4byte	0x5b
	.byte	0x90
	.byte	0
	.byte	0x7
	.4byte	0xc2
	.4byte	0x3ab
	.byte	0x1e
	.4byte	0x5b
	.2byte	0x190
	.byte	0
	.byte	0x11
	.4byte	.LASF55
	.byte	0x22
	.byte	0x3
	.4byte	0x357
	.byte	0x9
	.byte	0x3
	.8byte	pool_btmps
	.byte	0x11
	.4byte	.LASF56
	.byte	0x2f
	.byte	0x9
	.4byte	0x1f9
	.byte	0x9
	.byte	0x3
	.8byte	kernel_ppool
	.byte	0x11
	.4byte	.LASF57
	.byte	0x2f
	.byte	0x17
	.4byte	0x1f9
	.byte	0x9
	.byte	0x3
	.8byte	user_ppool
	.byte	0x11
	.4byte	.LASF58
	.byte	0x36
	.byte	0x9
	.4byte	0x239
	.byte	0x9
	.byte	0x3
	.8byte	kernel_vpool
	.byte	0x1d
	.4byte	.LASF59
	.byte	0x4
	.byte	0x39
	.4byte	0x25c
	.byte	0xf
	.4byte	.LASF60
	.byte	0xc
	.byte	0x48
	.byte	0x8
	.4byte	0xb6
	.4byte	0x42a
	.byte	0x1
	.4byte	0x42a
	.byte	0x1
	.4byte	0x42c
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0x28
	.byte	0x8
	.byte	0x6
	.4byte	0x431
	.byte	0x29
	.byte	0xd
	.4byte	.LASF63
	.byte	0x4
	.byte	0xb8
	.byte	0xd
	.4byte	0x45d
	.byte	0x1
	.4byte	0x272
	.byte	0x1
	.4byte	0xda
	.byte	0x1
	.4byte	0xda
	.byte	0x1
	.4byte	0x4f
	.byte	0x1
	.4byte	0x155
	.byte	0x1
	.4byte	0x4f
	.byte	0
	.byte	0xf
	.4byte	.LASF61
	.byte	0xd
	.byte	0x5b
	.byte	0x8
	.4byte	0xb6
	.4byte	0x47d
	.byte	0x1
	.4byte	0x195
	.byte	0x1
	.4byte	0x245
	.byte	0x1
	.4byte	0x24a
	.byte	0
	.byte	0xf
	.4byte	.LASF62
	.byte	0xc
	.byte	0x20
	.byte	0x8
	.4byte	0xb6
	.4byte	0x49d
	.byte	0x1
	.4byte	0x42a
	.byte	0x1
	.4byte	0xc2
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0xd
	.4byte	.LASF64
	.byte	0x8
	.byte	0x3d
	.byte	0x6
	.4byte	0x4af
	.byte	0x1
	.4byte	0x4af
	.byte	0
	.byte	0x6
	.4byte	0x19a
	.byte	0xd
	.4byte	.LASF65
	.byte	0x6
	.byte	0x34
	.byte	0x6
	.4byte	0x4d0
	.byte	0x1
	.4byte	0x1f4
	.byte	0x1
	.4byte	0xce
	.byte	0x1
	.4byte	0x8f
	.byte	0
	.byte	0xd
	.4byte	.LASF66
	.byte	0x8
	.byte	0x33
	.byte	0x6
	.4byte	0x4e2
	.byte	0x1
	.4byte	0x4af
	.byte	0
	.byte	0xf
	.4byte	.LASF67
	.byte	0x6
	.byte	0x49
	.byte	0xa
	.4byte	0xce
	.4byte	0x4fd
	.byte	0x1
	.4byte	0x1f4
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0xf
	.4byte	.LASF68
	.byte	0xe
	.byte	0x43
	.byte	0x8
	.4byte	0xb6
	.4byte	0x514
	.byte	0x1
	.4byte	0x245
	.byte	0x1f
	.byte	0
	.byte	0xd
	.4byte	.LASF69
	.byte	0x8
	.byte	0x29
	.byte	0x6
	.4byte	0x52b
	.byte	0x1
	.4byte	0x4af
	.byte	0x1
	.4byte	0x195
	.byte	0
	.byte	0xd
	.4byte	.LASF70
	.byte	0x6
	.byte	0x2b
	.byte	0x6
	.4byte	0x542
	.byte	0x1
	.4byte	0x1f4
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0x2a
	.4byte	.LASF88
	.byte	0x4
	.2byte	0x14b
	.byte	0x6
	.8byte	.LFB85
	.8byte	.LFE85-.LFB85
	.byte	0x1
	.byte	0x9c
	.4byte	0x5b0
	.byte	0xe
	.4byte	.LASF71
	.2byte	0x14b
	.byte	0x1b
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.string	"src"
	.2byte	0x14b
	.byte	0x2c
	.4byte	0x195
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x10
	.string	"sz"
	.2byte	0x14b
	.byte	0x3e
	.4byte	0x48
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x12
	.string	"mem"
	.2byte	0x14d
	.byte	0x9
	.4byte	0x195
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x9
	.4byte	.LASF76
	.4byte	0x5c0
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x5c0
	.byte	0xc
	.4byte	0x5b
	.byte	0x8
	.byte	0
	.byte	0x8
	.4byte	0x5b0
	.byte	0x16
	.4byte	.LASF72
	.2byte	0x13e
	.byte	0xd
	.4byte	0xe6
	.8byte	.LFB84
	.8byte	.LFE84-.LFB84
	.byte	0x1
	.byte	0x9c
	.4byte	0x5f7
	.byte	0x17
	.4byte	.LASF71
	.2byte	0x140
	.byte	0xf
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x16
	.4byte	.LASF73
	.2byte	0x11b
	.byte	0x5
	.4byte	0x75
	.8byte	.LFB83
	.8byte	.LFE83-.LFB83
	.byte	0x1
	.byte	0x9c
	.4byte	0x6a4
	.byte	0xe
	.4byte	.LASF71
	.2byte	0x11b
	.byte	0x1a
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x10
	.string	"va"
	.2byte	0x11b
	.byte	0x2e
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0xe
	.4byte	.LASF21
	.2byte	0x11b
	.byte	0x3b
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x10
	.string	"pa"
	.2byte	0x11b
	.byte	0x4a
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0xe
	.4byte	.LASF74
	.2byte	0x11b
	.byte	0x52
	.4byte	0x75
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0x12
	.string	"a"
	.2byte	0x11d
	.byte	0xc
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x17
	.4byte	.LASF75
	.2byte	0x11d
	.byte	0xf
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x12
	.string	"pte"
	.2byte	0x11e
	.byte	0xa
	.4byte	0x6a4
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x9
	.4byte	.LASF76
	.4byte	0x5c0
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1
	.byte	0
	.byte	0x6
	.4byte	0x1a6
	.byte	0x16
	.4byte	.LASF77
	.2byte	0x103
	.byte	0x9
	.4byte	0x6a4
	.8byte	.LFB82
	.8byte	.LFE82-.LFB82
	.byte	0x1
	.byte	0x9c
	.4byte	0x74d
	.byte	0xe
	.4byte	.LASF71
	.2byte	0x103
	.byte	0x1a
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.string	"va"
	.2byte	0x103
	.byte	0x2e
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xe
	.4byte	.LASF78
	.2byte	0x103
	.byte	0x36
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x9
	.4byte	.LASF76
	.4byte	0x75d
	.byte	0x9
	.byte	0x3
	.8byte	__func__.2
	.byte	0x13
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x17
	.4byte	.LASF79
	.2byte	0x108
	.byte	0xb
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x13
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x12
	.string	"pte"
	.2byte	0x109
	.byte	0xc
	.4byte	0x6a4
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x75d
	.byte	0xc
	.4byte	0x5b
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	0x74d
	.byte	0x18
	.4byte	.LASF80
	.byte	0xba
	.byte	0x7
	.4byte	0x42a
	.8byte	.LFB81
	.8byte	.LFE81-.LFB81
	.byte	0x1
	.byte	0x9c
	.4byte	0x814
	.byte	0x19
	.string	"cnt"
	.byte	0x4
	.byte	0xba
	.byte	0x1a
	.4byte	0xb6
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x5
	.4byte	.LASF81
	.byte	0x4
	.byte	0xba
	.byte	0x24
	.4byte	0x8f
	.byte	0x3
	.byte	0x91
	.byte	0xb7,0x7f
	.byte	0x9
	.4byte	.LASF76
	.4byte	0x824
	.byte	0x9
	.byte	0x3
	.8byte	__func__.3
	.byte	0x1a
	.string	"pgd"
	.byte	0x4
	.byte	0xc3
	.byte	0xc
	.4byte	0x272
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x4
	.4byte	.LASF82
	.byte	0x4
	.byte	0xc6
	.byte	0xe
	.4byte	0x829
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.4byte	.LASF83
	.byte	0x4
	.byte	0xc9
	.byte	0xc
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x13
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x4
	.4byte	.LASF84
	.byte	0x4
	.byte	0xcd
	.byte	0x10
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x4
	.4byte	.LASF85
	.byte	0x4
	.byte	0xce
	.byte	0x19
	.4byte	0x155
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x824
	.byte	0xc
	.4byte	0x5b
	.byte	0xb
	.byte	0
	.byte	0x8
	.4byte	0x814
	.byte	0x6
	.4byte	0x239
	.byte	0x20
	.4byte	.LASF86
	.byte	0xaf
	.4byte	0x829
	.8byte	.LFB80
	.8byte	.LFE80-.LFB80
	.byte	0x1
	.byte	0x9c
	.byte	0x20
	.4byte	.LASF87
	.byte	0xa9
	.4byte	0x866
	.8byte	.LFB79
	.8byte	.LFE79-.LFB79
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.4byte	0x1f9
	.byte	0x14
	.4byte	.LASF89
	.byte	0x9e
	.8byte	.LFB78
	.8byte	.LFE78-.LFB78
	.byte	0x1
	.byte	0x9c
	.4byte	0x8c8
	.byte	0x5
	.4byte	.LASF82
	.byte	0x4
	.byte	0x9e
	.byte	0x1a
	.4byte	0x829
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.4byte	.LASF83
	.byte	0x4
	.byte	0x9e
	.byte	0x28
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x9
	.4byte	.LASF76
	.4byte	0x8d8
	.byte	0x9
	.byte	0x3
	.8byte	__func__.4
	.byte	0x4
	.4byte	.LASF90
	.byte	0x4
	.byte	0xa1
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x8d8
	.byte	0xc
	.4byte	0x5b
	.byte	0xa
	.byte	0
	.byte	0x8
	.4byte	0x8c8
	.byte	0x18
	.4byte	.LASF91
	.byte	0x90
	.byte	0x8
	.4byte	0xda
	.8byte	.LFB77
	.8byte	.LFE77-.LFB77
	.byte	0x1
	.byte	0x9c
	.4byte	0x93f
	.byte	0x5
	.4byte	.LASF82
	.byte	0x4
	.byte	0x90
	.byte	0x1d
	.4byte	0x829
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x19
	.string	"cnt"
	.byte	0x4
	.byte	0x90
	.byte	0x2b
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x9
	.4byte	.LASF76
	.4byte	0x824
	.byte	0x9
	.byte	0x3
	.8byte	__func__.5
	.byte	0x4
	.4byte	.LASF90
	.byte	0x4
	.byte	0x93
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x14
	.4byte	.LASF92
	.byte	0x84
	.8byte	.LFB76
	.8byte	.LFE76-.LFB76
	.byte	0x1
	.byte	0x9c
	.4byte	0x9ab
	.byte	0x5
	.4byte	.LASF84
	.byte	0x4
	.byte	0x84
	.byte	0x18
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.4byte	.LASF81
	.byte	0x4
	.byte	0x84
	.byte	0x24
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x57
	.byte	0x4
	.4byte	.LASF93
	.byte	0x4
	.byte	0x85
	.byte	0xe
	.4byte	0x866
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.4byte	.LASF90
	.byte	0x4
	.byte	0x87
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x9
	.4byte	.LASF76
	.4byte	0x8d8
	.byte	0x9
	.byte	0x3
	.8byte	__func__.6
	.byte	0
	.byte	0x18
	.4byte	.LASF94
	.byte	0x71
	.byte	0x8
	.4byte	0xda
	.8byte	.LFB75
	.8byte	.LFE75-.LFB75
	.byte	0x1
	.byte	0x9c
	.4byte	0xa1c
	.byte	0x5
	.4byte	.LASF81
	.byte	0x4
	.byte	0x71
	.byte	0x19
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x4f
	.byte	0x4
	.4byte	.LASF93
	.byte	0x4
	.byte	0x72
	.byte	0xe
	.4byte	0x866
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.4byte	.LASF90
	.byte	0x4
	.byte	0x74
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x9
	.4byte	.LASF76
	.4byte	0x824
	.byte	0x9
	.byte	0x3
	.8byte	__func__.7
	.byte	0x4
	.4byte	.LASF84
	.byte	0x4
	.byte	0x7d
	.byte	0xc
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x14
	.4byte	.LASF95
	.byte	0x5f
	.8byte	.LFB74
	.8byte	.LFE74-.LFB74
	.byte	0x1
	.byte	0x9c
	.4byte	0xa66
	.byte	0x5
	.4byte	.LASF96
	.byte	0x4
	.byte	0x5f
	.byte	0x19
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.4byte	.LASF97
	.byte	0x4
	.byte	0x5f
	.byte	0x2d
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x4
	.4byte	.LASF98
	.byte	0x4
	.byte	0x62
	.byte	0xc
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x14
	.4byte	.LASF99
	.byte	0x3b
	.8byte	.LFB73
	.8byte	.LFE73-.LFB73
	.byte	0x1
	.byte	0x9c
	.4byte	0xabf
	.byte	0x5
	.4byte	.LASF96
	.byte	0x4
	.byte	0x3b
	.byte	0x18
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.4byte	.LASF98
	.byte	0x4
	.byte	0x3b
	.byte	0x2c
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x4
	.4byte	.LASF100
	.byte	0x4
	.byte	0x3e
	.byte	0x9
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.4byte	.LASF101
	.byte	0x4
	.byte	0x3f
	.byte	0x9
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x2b
	.4byte	.LASF111
	.byte	0x3
	.2byte	0x10c
	.byte	0x16
	.4byte	0x272
	.8byte	.LFB63
	.8byte	.LFE63-.LFB63
	.byte	0x1
	.byte	0x9c
	.byte	0x2c
	.4byte	.LASF112
	.byte	0x3
	.byte	0xcc
	.byte	0x16
	.4byte	0xda
	.8byte	.LFB59
	.8byte	.LFE59-.LFB59
	.byte	0x1
	.byte	0x9c
	.4byte	0xb1f
	.byte	0x5
	.4byte	.LASF102
	.byte	0x3
	.byte	0xcc
	.byte	0x28
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x5
	.4byte	.LASF103
	.byte	0x3
	.byte	0xcc
	.byte	0x33
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x77
	.byte	0
	.byte	0x2d
	.4byte	.LASF113
	.byte	0x2
	.byte	0x1c
	.byte	0x14
	.8byte	.LFB58
	.8byte	.LFE58-.LFB58
	.byte	0x1
	.byte	0x9c
	.4byte	0xbaf
	.byte	0x5
	.4byte	.LASF104
	.byte	0x2
	.byte	0x1c
	.byte	0x26
	.4byte	0x195
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x77
	.byte	0x5
	.4byte	.LASF105
	.byte	0x2
	.byte	0x1c
	.byte	0x34
	.4byte	0x75
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x77
	.byte	0x5
	.4byte	.LASF106
	.byte	0x2
	.byte	0x1c
	.byte	0x46
	.4byte	0x245
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x77
	.byte	0x5
	.4byte	.LASF107
	.byte	0x2
	.byte	0x1c
	.byte	0x58
	.4byte	0x245
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x77
	.byte	0x19
	.string	"msg"
	.byte	0x2
	.byte	0x1c
	.byte	0x6e
	.4byte	0x245
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0x1f
	.byte	0x1a
	.string	"buf"
	.byte	0x2
	.byte	0x22
	.byte	0xa
	.4byte	0xbaf
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x77
	.byte	0x4
	.4byte	.LASF108
	.byte	0x2
	.byte	0x23
	.byte	0xd
	.4byte	0x24a
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x77
	.byte	0
	.byte	0x7
	.4byte	0x62
	.4byte	0xbc0
	.byte	0x1e
	.4byte	0x5b
	.2byte	0x3ff
	.byte	0
	.byte	0x2e
	.4byte	.LASF114
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.8byte	.LFB49
	.8byte	.LFE49-.LFB49
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x1a
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x5
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
	.byte	0x17
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x2e
	.byte	0
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
	.byte	0xa
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
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x24
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0x2e
	.byte	0x1
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
	.byte	0x2b
	.byte	0x2e
	.byte	0
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
	.byte	0x2c
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
	.byte	0x2d
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
	.byte	0x2e
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
.LASF69:
	.string	"spinlock_init"
.LASF110:
	.string	"__builtin_va_list"
.LASF72:
	.string	"uvmcreate"
.LASF100:
	.string	"kpages"
.LASF15:
	.string	"size_t"
.LASF65:
	.string	"bitmap_set"
.LASF42:
	.string	"__addr_marker_t"
.LASF6:
	.string	"uint64_t"
.LASF89:
	.string	"free_vpage"
.LASF41:
	.string	"va_list"
.LASF50:
	.string	"prot_bits"
.LASF53:
	.string	"user_ppool_btmp"
.LASF24:
	.string	"__bitmap_t"
.LASF102:
	.string	"addr"
.LASF74:
	.string	"perm"
.LASF98:
	.string	"total_pages"
.LASF103:
	.string	"next"
.LASF101:
	.string	"upages"
.LASF27:
	.string	"pgd_t"
.LASF44:
	.string	"addr_marker_t"
.LASF58:
	.string	"kernel_vpool"
.LASF22:
	.string	"bits"
.LASF11:
	.string	"long int"
.LASF114:
	.string	"supervisor_interrupt_disable"
.LASF109:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF14:
	.string	"True"
.LASF106:
	.string	"func"
.LASF31:
	.string	"spinlock_t"
.LASF23:
	.string	"bitmap_t"
.LASF55:
	.string	"pool_btmps"
.LASF16:
	.string	"byte"
.LASF105:
	.string	"line"
.LASF34:
	.string	"btmp"
.LASF46:
	.string	"mask"
.LASF92:
	.string	"free_ppage"
.LASF20:
	.string	"pde_t"
.LASF25:
	.string	"__page_property_t"
.LASF95:
	.string	"memory_init"
.LASF4:
	.string	"unsigned int"
.LASF19:
	.string	"pagetable_t"
.LASF82:
	.string	"vpool"
.LASF7:
	.string	"long unsigned int"
.LASF66:
	.string	"spinlock_acquire"
.LASF30:
	.string	"name"
.LASF79:
	.string	"level"
.LASF21:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF56:
	.string	"kernel_ppool"
.LASF75:
	.string	"last"
.LASF57:
	.string	"user_ppool"
.LASF91:
	.string	"alloc_vpage"
.LASF112:
	.string	"page_align"
.LASF52:
	.string	"kernel_vpool_btmp"
.LASF47:
	.string	"clear"
.LASF104:
	.string	"filename"
.LASF32:
	.string	"pte_t"
.LASF29:
	.string	"locked"
.LASF77:
	.string	"walk"
.LASF37:
	.string	"ppool_t"
.LASF13:
	.string	"False"
.LASF83:
	.string	"vpage"
.LASF111:
	.string	"get_pgd"
.LASF81:
	.string	"kpage"
.LASF113:
	.string	"kpanic_spin"
.LASF73:
	.string	"mappages"
.LASF67:
	.string	"bitmap_scan"
.LASF88:
	.string	"uvmfirst"
.LASF71:
	.string	"pagetable"
.LASF35:
	.string	"paddr_start"
.LASF2:
	.string	"unsigned char"
.LASF40:
	.string	"vpool_t"
.LASF9:
	.string	"short int"
.LASF48:
	.string	"property_bit_t"
.LASF107:
	.string	"condition"
.LASF76:
	.string	"__func__"
.LASF45:
	.string	"__property_bit_t"
.LASF80:
	.string	"malloc_page"
.LASF90:
	.string	"bit_idx"
.LASF86:
	.string	"get_vpool"
.LASF33:
	.string	"__ppool_t"
.LASF43:
	.string	"start_address"
.LASF84:
	.string	"ppage"
.LASF59:
	.string	"_e_kernel"
.LASF51:
	.string	"kernel_ppool_btmp"
.LASF8:
	.string	"char"
.LASF17:
	.string	"offset_t"
.LASF99:
	.string	"init_pools"
.LASF70:
	.string	"bitmap_init"
.LASF49:
	.string	"address_markers"
.LASF78:
	.string	"alloc"
.LASF38:
	.string	"__vpool_t"
.LASF61:
	.string	"vsprintf"
.LASF96:
	.string	"start_paddr"
.LASF64:
	.string	"spinlock_release"
.LASF62:
	.string	"memset"
.LASF26:
	.string	"page_property_t"
.LASF97:
	.string	"end_paddr"
.LASF60:
	.string	"memmove"
.LASF63:
	.string	"create_mapping"
.LASF93:
	.string	"pool"
.LASF5:
	.string	"uint8_t"
.LASF68:
	.string	"kprintf"
.LASF54:
	.string	"_s_kernel_pgd"
.LASF39:
	.string	"vaddr_start"
.LASF87:
	.string	"get_ppool"
.LASF94:
	.string	"alloc_ppage"
.LASF18:
	.string	"addr_t"
.LASF10:
	.string	"int64_t"
.LASF12:
	.string	"Bool"
.LASF85:
	.string	"pproperty"
.LASF108:
	.string	"args"
.LASF36:
	.string	"lock"
.LASF28:
	.string	"__spinlock_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"kernel/mm.c"
	.ident	"GCC: (g) 12.2.0"
