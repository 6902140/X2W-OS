	.file	"mm.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "kernel/mm.c"
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
	.loc 3 203 56
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 3 204 8
	lbu	a5,7(sp)
	andi	a5,a5,0xff
	bne	a5,zero,.L5
	.loc 3 205 22
	ld	a4,8(sp)
	li	a5,-4096
	and	a5,a4,a5
	j	.L6
.L5:
	.loc 3 206 30
	ld	a4,8(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 3 206 35
	li	a5,-4096
	and	a5,a4,a5
.L6:
	.loc 3 207 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	page_align, .-page_align
	.align	2
	.type	get_pgd, @function
get_pgd:
.LFB24:
	.loc 3 267 35
	.cfi_startproc
	.loc 3 269 12
	lla	a5,_s_kernel_pgd
	.loc 3 270 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE24:
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
	lla	a4,pool_btmps+290
	sd	a4,0(a5)
	.loc 4 75 15
	lla	a5,user_ppool
	ld	a5,0(a5)
	.loc 4 75 56
	lla	a4,pool_btmps+306
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
	.loc 4 85 32
	lla	a5,_e_kernel
	li	a1,1
	mv	a0,a5
	call	page_align
	mv	a4,a0
	.loc 4 85 30
	lla	a5,kernel_vpool
	sd	a4,8(a5)
	.loc 4 86 23
	lla	a5,kernel_vpool
	lla	a4,pool_btmps+145
	sd	a4,0(a5)
	.loc 4 87 17
	lla	a5,kernel_vpool
	ld	a5,0(a5)
	.loc 4 87 60
	lla	a4,pool_btmps+161
	.loc 4 87 29
	sd	a4,8(a5)
	.loc 4 88 5
	lla	a5,kernel_vpool
	ld	a5,0(a5)
	li	a1,129
	mv	a0,a5
	call	bitmap_init
	.loc 4 89 5
	lla	a1,.LC19
	lla	a0,kernel_vpool+16
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
	lla	a0,.LC20
	call	kprintf
	.loc 4 103 5
	ld	a1,24(sp)
	lla	a0,.LC21
	call	kprintf
	.loc 4 104 5
	lla	a1,kernel_ppool
	lla	a0,.LC22
	call	kprintf
	.loc 4 105 5
	lla	a5,kernel_ppool
	ld	a4,16(a5)
	lla	a5,kernel_ppool
	ld	a5,8(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC23
	call	kprintf
	.loc 4 106 5
	lla	a1,user_ppool
	lla	a0,.LC24
	call	kprintf
	.loc 4 107 5
	lla	a5,user_ppool
	ld	a4,16(a5)
	lla	a5,user_ppool
	ld	a5,8(a5)
	mv	a2,a5
	mv	a1,a4
	lla	a0,.LC25
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
	bne	a4,a5,.L12
	.loc 4 112 53 is_stmt 0 discriminator 1
	lla	a5,kernel_ppool
	j	.L13
.L12:
	.loc 4 112 53 discriminator 2
	lla	a5,user_ppool
.L13:
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
	bne	a4,a5,.L14
	.loc 4 116 33 discriminator 1
	ld	a5,32(sp)
	lla	a4,.LC26
	lla	a3,.LC27
	lla	a2,__func__.4
	li	a1,116
	lla	a0,.LC28
	call	kpanic_spin
.L14:
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
.LFB37:
	.loc 4 130 42
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 4 131 53
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L17
	.loc 4 131 53 is_stmt 0 discriminator 1
	lla	a5,kernel_ppool
	j	.L18
.L17:
	.loc 4 131 53 discriminator 2
	lla	a5,user_ppool
.L18:
	.loc 4 131 14 is_stmt 1 discriminator 4
	sd	a5,24(sp)
	.loc 4 133 37 discriminator 4
	ld	a5,24(sp)
	ld	a5,8(a5)
	.loc 4 133 31 discriminator 4
	ld	a4,8(sp)
	sub	a5,a4,a5
	.loc 4 133 52 discriminator 4
	srli	a5,a5,12
	.loc 4 133 14 discriminator 4
	sd	a5,16(sp)
	.loc 4 134 8 discriminator 4
	ld	a5,16(sp)
	bge	a5,zero,.L19
	.loc 4 134 32 discriminator 1
	ld	a5,16(sp)
	lla	a4,.LC29
	lla	a3,.LC30
	lla	a2,__func__.3
	li	a1,134
	lla	a0,.LC28
	call	kpanic_spin
.L19:
	.loc 4 136 5
	ld	a5,24(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 137 5
	ld	a5,24(sp)
	ld	a5,0(a5)
	li	a2,0
	ld	a1,16(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 138 5
	ld	a5,24(sp)
	addi	a5,a5,24
	mv	a0,a5
	call	spinlock_release
	.loc 4 139 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE37:
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
.LFB38:
	.loc 4 142 47
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 143 8
	ld	a5,8(sp)
	bne	a5,zero,.L21
	.loc 4 143 40 discriminator 1
	lla	a4,.LC31
	lla	a3,.LC32
	lla	a2,__func__.2
	li	a1,143
	lla	a0,.LC28
	call	kpanic_spin
.L21:
	.loc 4 145 24
	ld	a5,8(sp)
	ld	a5,0(a5)
	ld	a1,0(sp)
	mv	a0,a5
	call	bitmap_scan
	sd	a0,24(sp)
	.loc 4 147 8
	ld	a4,24(sp)
	li	a5,-1
	bne	a4,a5,.L22
	.loc 4 147 33 discriminator 1
	ld	a5,24(sp)
	lla	a4,.LC33
	lla	a3,.LC27
	lla	a2,__func__.2
	li	a1,147
	lla	a0,.LC28
	call	kpanic_spin
.L22:
	.loc 4 148 5
	ld	a5,8(sp)
	addi	a5,a5,16
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 149 5
	ld	a5,8(sp)
	ld	a5,0(a5)
	li	a2,1
	ld	a1,24(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 150 5
	ld	a5,8(sp)
	addi	a5,a5,16
	mv	a0,a5
	call	spinlock_release
	.loc 4 152 17
	ld	a5,8(sp)
	ld	a5,8(a5)
	.loc 4 152 41
	ld	a4,24(sp)
	slli	a4,a4,12
	.loc 4 152 31
	add	a5,a5,a4
	.loc 4 153 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE38:
	.size	alloc_vpage, .-alloc_vpage
	.align	2
	.globl	free_vpage
	.type	free_vpage, @function
free_vpage:
.LFB39:
	.loc 4 156 46
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 4 157 8
	ld	a5,8(sp)
	bne	a5,zero,.L25
	.loc 4 157 40 discriminator 1
	lla	a4,.LC31
	lla	a3,.LC32
	lla	a2,__func__.1
	li	a1,157
	lla	a0,.LC28
	call	kpanic_spin
.L25:
	.loc 4 159 38
	ld	a5,8(sp)
	ld	a5,8(a5)
	.loc 4 159 31
	ld	a4,0(sp)
	sub	a5,a4,a5
	.loc 4 159 53
	srli	a5,a5,12
	.loc 4 159 14
	sd	a5,24(sp)
	.loc 4 160 8
	ld	a5,24(sp)
	bge	a5,zero,.L26
	.loc 4 160 32 discriminator 1
	ld	a5,24(sp)
	lla	a4,.LC29
	lla	a3,.LC30
	lla	a2,__func__.1
	li	a1,160
	lla	a0,.LC28
	call	kpanic_spin
.L26:
	.loc 4 161 5
	ld	a5,8(sp)
	addi	a5,a5,16
	mv	a0,a5
	call	spinlock_acquire
	.loc 4 162 5
	ld	a5,8(sp)
	ld	a5,0(a5)
	li	a2,0
	ld	a1,24(sp)
	mv	a0,a5
	call	bitmap_set
	.loc 4 163 5
	ld	a5,8(sp)
	addi	a5,a5,16
	mv	a0,a5
	call	spinlock_release
	.loc 4 164 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE39:
	.size	free_vpage, .-free_vpage
	.align	2
	.globl	get_ppool
	.type	get_ppool, @function
get_ppool:
.LFB40:
	.loc 4 167 25
	.cfi_startproc
	.loc 4 169 12
	lla	a5,kernel_ppool
	.loc 4 170 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE40:
	.size	get_ppool, .-get_ppool
	.align	2
	.globl	get_vpool
	.type	get_vpool, @function
get_vpool:
.LFB41:
	.loc 4 173 25
	.cfi_startproc
	.loc 4 175 12
	lla	a5,kernel_vpool
	.loc 4 176 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE41:
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
.LFB42:
	.loc 4 184 42
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 4 185 8
	ld	a5,8(sp)
	bne	a5,zero,.L32
	.loc 4 185 27 discriminator 1
	ld	a5,8(sp)
	lla	a4,.LC34
	lla	a3,.LC35
	lla	a2,__func__.0
	li	a1,185
	lla	a0,.LC28
	call	kpanic_spin
.L32:
	.loc 4 187 8
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	beq	a4,a5,.L33
	.loc 4 187 33 discriminator 1
	lbu	a5,7(sp)
	sext.w	a5,a5
	lla	a4,.LC36
	lla	a3,.LC37
	lla	a2,__func__.0
	li	a1,187
	lla	a0,.LC28
	call	kpanic_spin
.L33:
	.loc 4 190 5
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L34
	.loc 4 190 5 is_stmt 0 discriminator 1
	lla	a5,.LC38
	j	.L35
.L34:
	.loc 4 190 5 discriminator 2
	lla	a5,.LC39
.L35:
	.loc 4 190 5 discriminator 4
	mv	a1,a5
	lla	a0,.LC40
	call	kprintf
	.loc 4 193 18 is_stmt 1 discriminator 4
	call	get_pgd
	sd	a0,48(sp)
	.loc 4 196 22 discriminator 4
	call	get_vpool
	sd	a0,40(sp)
	.loc 4 199 44 discriminator 4
	ld	a1,8(sp)
	ld	a0,40(sp)
	call	alloc_vpage
	sd	a0,56(sp)
	.loc 4 201 11 discriminator 4
	j	.L36
.L37:
.LBB3:
	.loc 4 203 48
	lbu	a5,7(sp)
	mv	a0,a5
	call	alloc_ppage
	sd	a0,32(sp)
	.loc 4 204 25
	li	a5,231
	sd	a5,24(sp)
	.loc 4 207 9
	li	a5,0
	ld	a4,24(sp)
	li	a3,4096
	ld	a2,32(sp)
	ld	a1,56(sp)
	ld	a0,48(sp)
	call	create_mapping
	.loc 4 210 15
	ld	a4,56(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,56(sp)
.L36:
.LBE3:
	.loc 4 201 15
	ld	a5,8(sp)
	addi	a4,a5,-1
	sd	a4,8(sp)
	.loc 4 201 18
	bne	a5,zero,.L37
	.loc 4 212 12
	ld	a5,56(sp)
	.loc 4 213 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	malloc_page, .-malloc_page
	.section	.rodata
	.align	3
	.type	__func__.4, @object
	.size	__func__.4, 12
__func__.4:
	.string	"alloc_ppage"
	.align	3
	.type	__func__.3, @object
	.size	__func__.3, 11
__func__.3:
	.string	"free_ppage"
	.align	3
	.type	__func__.2, @object
	.size	__func__.2, 12
__func__.2:
	.string	"alloc_vpage"
	.align	3
	.type	__func__.1, @object
	.size	__func__.1, 11
__func__.1:
	.string	"free_vpage"
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 12
__func__.0:
	.string	"malloc_page"
	.text
.Letext0:
	.file 5 "include/types.h"
	.file 6 "include/stdbitmap.h"
	.file 7 "include/asm/svxx.h"
	.file 8 "include/kernel/locks.h"
	.file 9 "include/kernel/mm.h"
	.file 10 "include/stdarg.h"
	.file 11 "include/stdfmt.h"
	.file 12 "include/string.h"
	.file 13 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x989
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x1b
	.4byte	.LASF96
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x9
	.4byte	0x62
	.byte	0x8
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	.LASF10
	.byte	0x5
	.byte	0x20
	.byte	0xe
	.4byte	0x88
	.byte	0x8
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x5
	.4byte	.LASF12
	.byte	0x5
	.byte	0x23
	.byte	0x17
	.4byte	0x3a
	.byte	0x1d
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x5
	.byte	0x24
	.byte	0x6
	.4byte	0xb6
	.byte	0x15
	.4byte	.LASF13
	.byte	0
	.byte	0x15
	.4byte	.LASF14
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	.LASF15
	.byte	0x5
	.byte	0x2a
	.byte	0x12
	.4byte	0x4f
	.byte	0x5
	.4byte	.LASF16
	.byte	0x5
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0x5
	.4byte	.LASF17
	.byte	0x5
	.byte	0x30
	.byte	0x11
	.4byte	0x7c
	.byte	0x5
	.4byte	.LASF18
	.byte	0x5
	.byte	0x33
	.byte	0x12
	.4byte	0x4f
	.byte	0xa
	.4byte	.LASF22
	.byte	0x10
	.byte	0x6
	.byte	0x1d
	.4byte	0x10d
	.byte	0x2
	.4byte	.LASF19
	.byte	0x6
	.byte	0x1f
	.byte	0xc
	.4byte	0xb6
	.byte	0
	.byte	0x2
	.4byte	.LASF20
	.byte	0x6
	.byte	0x21
	.byte	0xb
	.4byte	0x10d
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0xc2
	.byte	0x5
	.4byte	.LASF21
	.byte	0x6
	.byte	0x22
	.byte	0x3
	.4byte	0xe6
	.byte	0xa
	.4byte	.LASF23
	.byte	0x8
	.byte	0x7
	.byte	0x24
	.4byte	0x138
	.byte	0x11
	.string	"val"
	.byte	0x7
	.byte	0x25
	.byte	0xe
	.4byte	0x4f
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LASF24
	.byte	0x7
	.byte	0x26
	.byte	0x3
	.4byte	0x11e
	.byte	0x1e
	.4byte	.LASF25
	.byte	0x7
	.2byte	0x16d
	.byte	0x10
	.4byte	0xda
	.byte	0xa
	.4byte	.LASF26
	.byte	0x10
	.byte	0x8
	.byte	0x1b
	.4byte	0x178
	.byte	0x2
	.4byte	.LASF27
	.byte	0x8
	.byte	0x1d
	.byte	0xa
	.4byte	0x8f
	.byte	0
	.byte	0x2
	.4byte	.LASF28
	.byte	0x8
	.byte	0x1f
	.byte	0xb
	.4byte	0x178
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0x62
	.byte	0x5
	.4byte	.LASF29
	.byte	0x8
	.byte	0x20
	.byte	0x3
	.4byte	0x151
	.byte	0xa
	.4byte	.LASF30
	.byte	0x28
	.byte	0x9
	.byte	0x1b
	.4byte	0x1ca
	.byte	0x2
	.4byte	.LASF31
	.byte	0x9
	.byte	0x1d
	.byte	0xf
	.4byte	0x1ca
	.byte	0
	.byte	0x2
	.4byte	.LASF32
	.byte	0x9
	.byte	0x1f
	.byte	0xc
	.4byte	0xda
	.byte	0x8
	.byte	0x2
	.4byte	.LASF19
	.byte	0x9
	.byte	0x21
	.byte	0xc
	.4byte	0xb6
	.byte	0x10
	.byte	0x2
	.4byte	.LASF33
	.byte	0x9
	.byte	0x23
	.byte	0x10
	.4byte	0x17d
	.byte	0x18
	.byte	0
	.byte	0x6
	.4byte	0x112
	.byte	0x5
	.4byte	.LASF34
	.byte	0x9
	.byte	0x24
	.byte	0x3
	.4byte	0x189
	.byte	0xa
	.4byte	.LASF35
	.byte	0x20
	.byte	0x9
	.byte	0x2c
	.4byte	0x20f
	.byte	0x2
	.4byte	.LASF31
	.byte	0x9
	.byte	0x2e
	.byte	0xf
	.4byte	0x1ca
	.byte	0
	.byte	0x2
	.4byte	.LASF36
	.byte	0x9
	.byte	0x30
	.byte	0xc
	.4byte	0xda
	.byte	0x8
	.byte	0x2
	.4byte	.LASF33
	.byte	0x9
	.byte	0x32
	.byte	0x10
	.4byte	0x17d
	.byte	0x10
	.byte	0
	.byte	0x5
	.4byte	.LASF37
	.byte	0x9
	.byte	0x33
	.byte	0x3
	.4byte	0x1db
	.byte	0x6
	.4byte	0x69
	.byte	0x5
	.4byte	.LASF38
	.byte	0xa
	.byte	0x22
	.byte	0x1b
	.4byte	0x22c
	.byte	0x1f
	.byte	0x8
	.4byte	.LASF97
	.byte	0x7
	.4byte	0x62
	.4byte	0x23d
	.byte	0x20
	.byte	0
	.byte	0x16
	.4byte	.LASF51
	.byte	0x3
	.byte	0x47
	.4byte	0x232
	.byte	0x6
	.4byte	0x144
	.byte	0xa
	.4byte	.LASF39
	.byte	0x10
	.byte	0x3
	.byte	0x50
	.4byte	0x274
	.byte	0x2
	.4byte	.LASF40
	.byte	0x3
	.byte	0x51
	.byte	0x9
	.4byte	0xda
	.byte	0
	.byte	0x2
	.4byte	.LASF28
	.byte	0x3
	.byte	0x52
	.byte	0x8
	.4byte	0x178
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	.LASF41
	.byte	0x3
	.byte	0x53
	.byte	0x3
	.4byte	0x24d
	.byte	0x9
	.4byte	0x274
	.byte	0x7
	.4byte	0x280
	.4byte	0x295
	.byte	0xc
	.4byte	0x5b
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	0x285
	.byte	0x3
	.4byte	.LASF46
	.byte	0x3
	.byte	0x55
	.byte	0x1c
	.4byte	0x295
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0xa
	.4byte	.LASF42
	.byte	0x20
	.byte	0x3
	.byte	0x5f
	.4byte	0x2f1
	.byte	0x2
	.4byte	.LASF43
	.byte	0x3
	.byte	0x61
	.byte	0xb
	.4byte	0x4f
	.byte	0
	.byte	0x11
	.string	"val"
	.byte	0x3
	.byte	0x63
	.byte	0xb
	.4byte	0x4f
	.byte	0x8
	.byte	0x11
	.string	"set"
	.byte	0x3
	.byte	0x65
	.byte	0xe
	.4byte	0x21b
	.byte	0x10
	.byte	0x2
	.4byte	.LASF44
	.byte	0x3
	.byte	0x67
	.byte	0xe
	.4byte	0x21b
	.byte	0x18
	.byte	0
	.byte	0x5
	.4byte	.LASF45
	.byte	0x3
	.byte	0x68
	.byte	0x3
	.4byte	0x2b0
	.byte	0x9
	.4byte	0x2f1
	.byte	0x7
	.4byte	0x2fd
	.4byte	0x312
	.byte	0xc
	.4byte	0x5b
	.byte	0x8
	.byte	0
	.byte	0x9
	.4byte	0x302
	.byte	0x3
	.4byte	.LASF47
	.byte	0x3
	.byte	0x6a
	.byte	0x1d
	.4byte	0x312
	.byte	0x9
	.byte	0x3
	.8byte	prot_bits
	.byte	0x21
	.2byte	0x2b3
	.byte	0x4
	.byte	0x19
	.byte	0x1
	.4byte	0x360
	.byte	0x2
	.4byte	.LASF48
	.byte	0x4
	.byte	0x1b
	.byte	0xa
	.4byte	0x360
	.byte	0
	.byte	0x2
	.4byte	.LASF49
	.byte	0x4
	.byte	0x1d
	.byte	0xa
	.4byte	0x360
	.byte	0x91
	.byte	0x22
	.4byte	.LASF50
	.byte	0x4
	.byte	0x1f
	.byte	0xa
	.4byte	0x370
	.2byte	0x122
	.byte	0
	.byte	0x7
	.4byte	0xc2
	.4byte	0x370
	.byte	0xc
	.4byte	0x5b
	.byte	0x90
	.byte	0
	.byte	0x7
	.4byte	0xc2
	.4byte	0x381
	.byte	0x17
	.4byte	0x5b
	.2byte	0x190
	.byte	0
	.byte	0xe
	.4byte	.LASF52
	.byte	0x20
	.byte	0x3
	.4byte	0x32d
	.byte	0x9
	.byte	0x3
	.8byte	pool_btmps
	.byte	0xe
	.4byte	.LASF53
	.byte	0x2d
	.byte	0x9
	.4byte	0x1cf
	.byte	0x9
	.byte	0x3
	.8byte	kernel_ppool
	.byte	0xe
	.4byte	.LASF54
	.byte	0x2d
	.byte	0x17
	.4byte	0x1cf
	.byte	0x9
	.byte	0x3
	.8byte	user_ppool
	.byte	0xe
	.4byte	.LASF55
	.byte	0x34
	.byte	0x9
	.4byte	0x20f
	.byte	0x9
	.byte	0x3
	.8byte	kernel_vpool
	.byte	0x16
	.4byte	.LASF56
	.byte	0x4
	.byte	0x37
	.4byte	0x232
	.byte	0xb
	.4byte	.LASF59
	.byte	0x4
	.byte	0xb6
	.byte	0xd
	.4byte	0x40b
	.byte	0x1
	.4byte	0x248
	.byte	0x1
	.4byte	0xda
	.byte	0x1
	.4byte	0xda
	.byte	0x1
	.4byte	0x4f
	.byte	0x1
	.4byte	0x138
	.byte	0x1
	.4byte	0x4f
	.byte	0
	.byte	0xf
	.4byte	.LASF57
	.byte	0xb
	.byte	0x5b
	.byte	0x8
	.4byte	0xb6
	.4byte	0x42b
	.byte	0x1
	.4byte	0x178
	.byte	0x1
	.4byte	0x21b
	.byte	0x1
	.4byte	0x220
	.byte	0
	.byte	0xf
	.4byte	.LASF58
	.byte	0xc
	.byte	0x20
	.byte	0x8
	.4byte	0xb6
	.4byte	0x44b
	.byte	0x1
	.4byte	0x44b
	.byte	0x1
	.4byte	0xc2
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0x23
	.byte	0x8
	.byte	0xb
	.4byte	.LASF60
	.byte	0x8
	.byte	0x3d
	.byte	0x6
	.4byte	0x45f
	.byte	0x1
	.4byte	0x45f
	.byte	0
	.byte	0x6
	.4byte	0x17d
	.byte	0xb
	.4byte	.LASF61
	.byte	0x6
	.byte	0x34
	.byte	0x6
	.4byte	0x480
	.byte	0x1
	.4byte	0x1ca
	.byte	0x1
	.4byte	0xce
	.byte	0x1
	.4byte	0x8f
	.byte	0
	.byte	0xb
	.4byte	.LASF62
	.byte	0x8
	.byte	0x33
	.byte	0x6
	.4byte	0x492
	.byte	0x1
	.4byte	0x45f
	.byte	0
	.byte	0xf
	.4byte	.LASF63
	.byte	0x6
	.byte	0x49
	.byte	0xa
	.4byte	0xce
	.4byte	0x4ad
	.byte	0x1
	.4byte	0x1ca
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0xf
	.4byte	.LASF64
	.byte	0xd
	.byte	0x43
	.byte	0x8
	.4byte	0xb6
	.4byte	0x4c4
	.byte	0x1
	.4byte	0x21b
	.byte	0x18
	.byte	0
	.byte	0xb
	.4byte	.LASF65
	.byte	0x8
	.byte	0x29
	.byte	0x6
	.4byte	0x4db
	.byte	0x1
	.4byte	0x45f
	.byte	0x1
	.4byte	0x178
	.byte	0
	.byte	0xb
	.4byte	.LASF66
	.byte	0x6
	.byte	0x2b
	.byte	0x6
	.4byte	0x4f2
	.byte	0x1
	.4byte	0x1ca
	.byte	0x1
	.4byte	0xb6
	.byte	0
	.byte	0x12
	.4byte	.LASF76
	.byte	0xb8
	.byte	0x7
	.4byte	0x44b
	.8byte	.LFB42
	.8byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0x5a4
	.byte	0x13
	.string	"cnt"
	.byte	0x4
	.byte	0xb8
	.byte	0x1a
	.4byte	0xb6
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x4
	.4byte	.LASF67
	.byte	0x4
	.byte	0xb8
	.byte	0x24
	.4byte	0x8f
	.byte	0x3
	.byte	0x91
	.byte	0xb7,0x7f
	.byte	0xd
	.4byte	.LASF74
	.4byte	0x5b4
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0x14
	.string	"pgd"
	.byte	0x4
	.byte	0xc1
	.byte	0xc
	.4byte	0x248
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.4byte	.LASF68
	.byte	0x4
	.byte	0xc4
	.byte	0xe
	.4byte	0x5b9
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF69
	.byte	0x4
	.byte	0xc7
	.byte	0xc
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x19
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x3
	.4byte	.LASF70
	.byte	0x4
	.byte	0xcb
	.byte	0x10
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF71
	.byte	0x4
	.byte	0xcc
	.byte	0x19
	.4byte	0x138
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x5b4
	.byte	0xc
	.4byte	0x5b
	.byte	0xb
	.byte	0
	.byte	0x9
	.4byte	0x5a4
	.byte	0x6
	.4byte	0x20f
	.byte	0x1a
	.4byte	.LASF72
	.byte	0xad
	.4byte	0x5b9
	.8byte	.LFB41
	.8byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.byte	0x1a
	.4byte	.LASF73
	.byte	0xa7
	.4byte	0x5f6
	.8byte	.LFB40
	.8byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.4byte	0x1cf
	.byte	0x10
	.4byte	.LASF78
	.byte	0x9c
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x658
	.byte	0x4
	.4byte	.LASF68
	.byte	0x4
	.byte	0x9c
	.byte	0x1a
	.4byte	0x5b9
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.4byte	.LASF69
	.byte	0x4
	.byte	0x9c
	.byte	0x28
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xd
	.4byte	.LASF74
	.4byte	0x668
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1
	.byte	0x3
	.4byte	.LASF75
	.byte	0x4
	.byte	0x9f
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0x668
	.byte	0xc
	.4byte	0x5b
	.byte	0xa
	.byte	0
	.byte	0x9
	.4byte	0x658
	.byte	0x12
	.4byte	.LASF77
	.byte	0x8e
	.byte	0x8
	.4byte	0xda
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x6cf
	.byte	0x4
	.4byte	.LASF68
	.byte	0x4
	.byte	0x8e
	.byte	0x1d
	.4byte	0x5b9
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x13
	.string	"cnt"
	.byte	0x4
	.byte	0x8e
	.byte	0x2b
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xd
	.4byte	.LASF74
	.4byte	0x5b4
	.byte	0x9
	.byte	0x3
	.8byte	__func__.2
	.byte	0x3
	.4byte	.LASF75
	.byte	0x4
	.byte	0x91
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x10
	.4byte	.LASF79
	.byte	0x82
	.8byte	.LFB37
	.8byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x73b
	.byte	0x4
	.4byte	.LASF70
	.byte	0x4
	.byte	0x82
	.byte	0x18
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.4byte	.LASF67
	.byte	0x4
	.byte	0x82
	.byte	0x24
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x57
	.byte	0x3
	.4byte	.LASF80
	.byte	0x4
	.byte	0x83
	.byte	0xe
	.4byte	0x5f6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF75
	.byte	0x4
	.byte	0x85
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xd
	.4byte	.LASF74
	.4byte	0x668
	.byte	0x9
	.byte	0x3
	.8byte	__func__.3
	.byte	0
	.byte	0x12
	.4byte	.LASF81
	.byte	0x6f
	.byte	0x8
	.4byte	0xda
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0x7ac
	.byte	0x4
	.4byte	.LASF67
	.byte	0x4
	.byte	0x6f
	.byte	0x19
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x4f
	.byte	0x3
	.4byte	.LASF80
	.byte	0x4
	.byte	0x70
	.byte	0xe
	.4byte	0x5f6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF75
	.byte	0x4
	.byte	0x72
	.byte	0xe
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xd
	.4byte	.LASF74
	.4byte	0x5b4
	.byte	0x9
	.byte	0x3
	.8byte	__func__.4
	.byte	0x3
	.4byte	.LASF70
	.byte	0x4
	.byte	0x7b
	.byte	0xc
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x10
	.4byte	.LASF82
	.byte	0x5d
	.8byte	.LFB35
	.8byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.4byte	0x7f6
	.byte	0x4
	.4byte	.LASF83
	.byte	0x4
	.byte	0x5d
	.byte	0x19
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.4byte	.LASF84
	.byte	0x4
	.byte	0x5d
	.byte	0x2d
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF85
	.byte	0x4
	.byte	0x60
	.byte	0xc
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x10
	.4byte	.LASF86
	.byte	0x39
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0x84f
	.byte	0x4
	.4byte	.LASF83
	.byte	0x4
	.byte	0x39
	.byte	0x18
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.4byte	.LASF85
	.byte	0x4
	.byte	0x39
	.byte	0x2c
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF87
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF88
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x24
	.4byte	.LASF98
	.byte	0x3
	.2byte	0x10b
	.byte	0x16
	.4byte	0x248
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.byte	0x25
	.4byte	.LASF99
	.byte	0x3
	.byte	0xcb
	.byte	0x16
	.4byte	0xda
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x8af
	.byte	0x4
	.4byte	.LASF89
	.byte	0x3
	.byte	0xcb
	.byte	0x28
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x4
	.4byte	.LASF90
	.byte	0x3
	.byte	0xcb
	.byte	0x33
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x77
	.byte	0
	.byte	0x26
	.4byte	.LASF100
	.byte	0x2
	.byte	0x1c
	.byte	0x14
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x93f
	.byte	0x4
	.4byte	.LASF91
	.byte	0x2
	.byte	0x1c
	.byte	0x26
	.4byte	0x178
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x77
	.byte	0x4
	.4byte	.LASF92
	.byte	0x2
	.byte	0x1c
	.byte	0x34
	.4byte	0x75
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x77
	.byte	0x4
	.4byte	.LASF93
	.byte	0x2
	.byte	0x1c
	.byte	0x46
	.4byte	0x21b
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x77
	.byte	0x4
	.4byte	.LASF94
	.byte	0x2
	.byte	0x1c
	.byte	0x58
	.4byte	0x21b
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x77
	.byte	0x13
	.string	"msg"
	.byte	0x2
	.byte	0x1c
	.byte	0x6e
	.4byte	0x21b
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0x18
	.byte	0x14
	.string	"buf"
	.byte	0x2
	.byte	0x22
	.byte	0xa
	.4byte	0x93f
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x77
	.byte	0x3
	.4byte	.LASF95
	.byte	0x2
	.byte	0x23
	.byte	0xd
	.4byte	0x220
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x77
	.byte	0
	.byte	0x7
	.4byte	0x62
	.4byte	0x950
	.byte	0x17
	.4byte	0x5b
	.2byte	0x3ff
	.byte	0
	.byte	0x27
	.4byte	.LASF101
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x14
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
	.byte	0x5
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0xe
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x23
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x26
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
	.byte	0x27
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
.LASF65:
	.string	"spinlock_init"
.LASF97:
	.string	"__builtin_va_list"
.LASF87:
	.string	"kpages"
.LASF15:
	.string	"size_t"
.LASF61:
	.string	"bitmap_set"
.LASF39:
	.string	"__addr_marker_t"
.LASF6:
	.string	"uint64_t"
.LASF78:
	.string	"free_vpage"
.LASF38:
	.string	"va_list"
.LASF47:
	.string	"prot_bits"
.LASF50:
	.string	"user_ppool_btmp"
.LASF22:
	.string	"__bitmap_t"
.LASF89:
	.string	"addr"
.LASF85:
	.string	"total_pages"
.LASF90:
	.string	"next"
.LASF88:
	.string	"upages"
.LASF25:
	.string	"pgd_t"
.LASF41:
	.string	"addr_marker_t"
.LASF55:
	.string	"kernel_vpool"
.LASF20:
	.string	"bits"
.LASF11:
	.string	"long int"
.LASF101:
	.string	"supervisor_interrupt_disable"
.LASF96:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF14:
	.string	"True"
.LASF93:
	.string	"func"
.LASF29:
	.string	"spinlock_t"
.LASF21:
	.string	"bitmap_t"
.LASF52:
	.string	"pool_btmps"
.LASF16:
	.string	"byte"
.LASF92:
	.string	"line"
.LASF31:
	.string	"btmp"
.LASF43:
	.string	"mask"
.LASF79:
	.string	"free_ppage"
.LASF23:
	.string	"__page_property_t"
.LASF82:
	.string	"memory_init"
.LASF4:
	.string	"unsigned int"
.LASF68:
	.string	"vpool"
.LASF7:
	.string	"long unsigned int"
.LASF62:
	.string	"spinlock_acquire"
.LASF28:
	.string	"name"
.LASF19:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF53:
	.string	"kernel_ppool"
.LASF54:
	.string	"user_ppool"
.LASF77:
	.string	"alloc_vpage"
.LASF99:
	.string	"page_align"
.LASF49:
	.string	"kernel_vpool_btmp"
.LASF44:
	.string	"clear"
.LASF91:
	.string	"filename"
.LASF27:
	.string	"locked"
.LASF34:
	.string	"ppool_t"
.LASF13:
	.string	"False"
.LASF69:
	.string	"vpage"
.LASF98:
	.string	"get_pgd"
.LASF67:
	.string	"kpage"
.LASF100:
	.string	"kpanic_spin"
.LASF63:
	.string	"bitmap_scan"
.LASF32:
	.string	"paddr_start"
.LASF2:
	.string	"unsigned char"
.LASF37:
	.string	"vpool_t"
.LASF9:
	.string	"short int"
.LASF45:
	.string	"property_bit_t"
.LASF94:
	.string	"condition"
.LASF74:
	.string	"__func__"
.LASF42:
	.string	"__property_bit_t"
.LASF76:
	.string	"malloc_page"
.LASF75:
	.string	"bit_idx"
.LASF72:
	.string	"get_vpool"
.LASF30:
	.string	"__ppool_t"
.LASF40:
	.string	"start_address"
.LASF70:
	.string	"ppage"
.LASF56:
	.string	"_e_kernel"
.LASF48:
	.string	"kernel_ppool_btmp"
.LASF8:
	.string	"char"
.LASF17:
	.string	"offset_t"
.LASF86:
	.string	"init_pools"
.LASF66:
	.string	"bitmap_init"
.LASF46:
	.string	"address_markers"
.LASF35:
	.string	"__vpool_t"
.LASF57:
	.string	"vsprintf"
.LASF83:
	.string	"start_paddr"
.LASF60:
	.string	"spinlock_release"
.LASF58:
	.string	"memset"
.LASF24:
	.string	"page_property_t"
.LASF84:
	.string	"end_paddr"
.LASF59:
	.string	"create_mapping"
.LASF80:
	.string	"pool"
.LASF5:
	.string	"uint8_t"
.LASF64:
	.string	"kprintf"
.LASF51:
	.string	"_s_kernel_pgd"
.LASF36:
	.string	"vaddr_start"
.LASF73:
	.string	"get_ppool"
.LASF81:
	.string	"alloc_ppage"
.LASF18:
	.string	"addr_t"
.LASF10:
	.string	"int64_t"
.LASF12:
	.string	"Bool"
.LASF71:
	.string	"pproperty"
.LASF95:
	.string	"args"
.LASF33:
	.string	"lock"
.LASF26:
	.string	"__spinlock_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
.LASF0:
	.string	"kernel/mm.c"
	.ident	"GCC: (g) 12.2.0"
