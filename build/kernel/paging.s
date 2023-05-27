	.file	"paging.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "kernel/paging.c"
	.align	2
	.type	is_valid_page, @function
is_valid_page:
.LFB6:
	.file 1 "include/asm/svxx.h"
	.loc 1 54 47
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 1 55 18
	ld	a5,8(sp)
	andi	a5,a5,1
	.loc 1 55 44
	snez	a5,a5
	andi	a5,a5,0xff
	.loc 1 56 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	is_valid_page, .-is_valid_page
	.align	2
	.type	is_leaf_page, @function
is_leaf_page:
.LFB14:
	.loc 1 188 46
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 1 189 14
	ld	a0,8(sp)
	call	is_valid_page
	mv	a5,a0
	.loc 1 189 33
	beq	a5,zero,.L4
	.loc 1 189 41 discriminator 1
	ld	a5,8(sp)
	andi	a5,a5,14
	.loc 1 189 33 discriminator 1
	beq	a5,zero,.L4
	.loc 1 189 33 is_stmt 0 discriminator 3
	li	a5,1
	j	.L5
.L4:
	.loc 1 189 33 discriminator 4
	li	a5,0
.L5:
	.loc 1 189 92 is_stmt 1 discriminator 6
	snez	a5,a5
	andi	a5,a5,0xff
	.loc 1 190 1 discriminator 6
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	is_leaf_page, .-is_leaf_page
	.align	2
	.type	supervisor_interrupt_disable, @function
supervisor_interrupt_disable:
.LFB16:
	.file 2 "include/kernel/ktrap.h"
	.loc 2 44 54
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
.LBB2:
	.loc 2 45 22
	li	a5,2
	sd	a5,8(sp)
	.loc 2 45 60
	ld	a5,8(sp)
 #APP
# 45 "include/kernel/ktrap.h" 1
	csrc sstatus, a5
# 0 "" 2
 #NO_APP
.LBE2:
	.loc 2 46 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
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
.LFB25:
	.file 3 "include/kernel/kdebug.h"
	.loc 3 28 119
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
	.loc 3 29 5
	call	supervisor_interrupt_disable
	.loc 3 30 5
	li	a1,10
	lla	a0,.LC0
	call	kprintf
	.loc 3 31 5
	lw	a5,36(sp)
	mv	a2,a5
	ld	a1,40(sp)
	lla	a0,.LC1
	call	kprintf
	.loc 3 32 5
	ld	a1,16(sp)
	lla	a0,.LC2
	call	kprintf
	.loc 3 33 5
	ld	a1,24(sp)
	lla	a0,.LC3
	call	kprintf
	.loc 3 34 10
	sd	zero,64(sp)
	addi	a5,sp,72
	li	a4,1016
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 3 36 5
	addi	a5,sp,1136
	sd	a5,0(sp)
	ld	a5,0(sp)
	addi	a5,a5,-24
	sd	a5,56(sp)
	.loc 3 37 5
	ld	a4,56(sp)
	addi	a5,sp,64
	mv	a2,a4
	ld	a1,8(sp)
	mv	a0,a5
	call	vsprintf
	.loc 3 38 5
	addi	a5,sp,64
	mv	a1,a5
	lla	a0,.LC4
	call	kprintf
.L9:
	.loc 3 39 11 discriminator 1
	nop
	j	.L9
	.cfi_endproc
.LFE25:
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
.LFB26:
	.file 4 "include/kernel/paging.h"
	.loc 4 205 56
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 4 206 8
	lbu	a5,7(sp)
	andi	a5,a5,0xff
	bne	a5,zero,.L11
	.loc 4 207 22
	ld	a4,8(sp)
	li	a5,-4096
	and	a5,a4,a5
	j	.L12
.L11:
	.loc 4 208 30
	ld	a4,8(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a4,a4,a5
	.loc 4 208 35
	li	a5,-4096
	and	a5,a4,a5
.L12:
	.loc 4 209 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE26:
	.size	page_align, .-page_align
	.section	.rodata
	.align	3
.LC17:
	.string	"\"vpn = %d, should be in [2, 1, 0, -1]!\""
	.align	3
.LC18:
	.string	"result != -1"
	.align	3
.LC19:
	.string	"include/kernel/paging.h"
	.text
	.align	2
	.type	get_vpn, @function
get_vpn:
.LFB28:
	.loc 4 228 54
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	sw	a5,4(sp)
	.loc 4 229 14
	li	a5,-1
	sd	a5,24(sp)
	.loc 4 230 8
	lw	a5,4(sp)
	sext.w	a4,a5
	li	a5,2
	bne	a4,a5,.L14
	.loc 4 231 36
	ld	a5,8(sp)
	srli	a5,a5,30
	.loc 4 231 16
	andi	a5,a5,511
	sd	a5,24(sp)
	j	.L15
.L14:
	.loc 4 232 13
	lw	a5,4(sp)
	sext.w	a4,a5
	li	a5,1
	bne	a4,a5,.L16
	.loc 4 233 36
	ld	a5,8(sp)
	srli	a5,a5,21
	.loc 4 233 16
	andi	a5,a5,511
	sd	a5,24(sp)
	j	.L15
.L16:
	.loc 4 234 13
	lw	a5,4(sp)
	sext.w	a5,a5
	bne	a5,zero,.L17
	.loc 4 235 36
	ld	a5,8(sp)
	srli	a5,a5,12
	.loc 4 235 16
	andi	a5,a5,511
	sd	a5,24(sp)
	j	.L15
.L17:
	.loc 4 236 13
	lw	a5,4(sp)
	sext.w	a4,a5
	li	a5,-1
	bne	a4,a5,.L15
	.loc 4 237 36
	ld	a4,8(sp)
	.loc 4 237 16
	li	a5,4096
	addi	a5,a5,-1
	and	a5,a4,a5
	sd	a5,24(sp)
.L15:
	.loc 4 238 8
	ld	a4,24(sp)
	li	a5,-1
	bne	a4,a5,.L18
	.loc 4 238 32 discriminator 1
	lw	a5,4(sp)
	lla	a4,.LC17
	lla	a3,.LC18
	lla	a2,__func__.3
	li	a1,238
	lla	a0,.LC19
	call	kpanic_spin
.L18:
	.loc 4 239 12
	ld	a5,24(sp)
	.loc 4 241 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	get_vpn, .-get_vpn
	.align	2
	.type	get_pgd, @function
get_pgd:
.LFB30:
	.loc 4 269 35
	.cfi_startproc
	.loc 4 271 12
	lla	a5,_s_kernel_pgd
	.loc 4 272 1
	mv	a0,a5
	ret
	.cfi_endproc
.LFE30:
	.size	get_pgd, .-get_pgd
	.align	2
	.type	get_pmd, @function
get_pmd:
.LFB31:
	.loc 4 279 51
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 4 280 31
	ld	a5,8(sp)
	ld	a5,0(a5)
	.loc 4 280 37
	srli	a5,a5,10
	.loc 4 280 44
	slli	a5,a5,12
	.loc 4 281 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE31:
	.size	get_pmd, .-get_pmd
	.align	2
	.type	get_pt, @function
get_pt:
.LFB32:
	.loc 4 288 49
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 4 289 30
	ld	a5,8(sp)
	ld	a5,0(a5)
	.loc 4 289 36
	srli	a5,a5,10
	.loc 4 289 43
	slli	a5,a5,12
	.loc 4 290 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE32:
	.size	get_pt, .-get_pt
	.align	2
	.type	set_pgd_entry, @function
set_pgd_entry:
.LFB34:
	.loc 4 311 99
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 4 312 44
	ld	a5,16(sp)
	srli	a5,a5,12
	.loc 4 312 51
	slli	a4,a5,10
	.loc 4 312 68
	ld	a5,8(sp)
	.loc 4 312 20
	or	a4,a4,a5
	.loc 4 312 18
	ld	a5,24(sp)
	sd	a4,0(a5)
	.loc 4 313 1
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE34:
	.size	set_pgd_entry, .-set_pgd_entry
	.align	2
	.type	set_pmd_entry, @function
set_pmd_entry:
.LFB36:
	.loc 4 335 97
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 4 336 43
	ld	a5,16(sp)
	srli	a5,a5,12
	.loc 4 336 50
	slli	a4,a5,10
	.loc 4 336 66
	ld	a5,8(sp)
	.loc 4 336 20
	or	a4,a4,a5
	.loc 4 336 18
	ld	a5,24(sp)
	sd	a4,0(a5)
	.loc 4 337 1
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE36:
	.size	set_pmd_entry, .-set_pmd_entry
	.align	2
	.type	set_pt_entry, @function
set_pt_entry:
.LFB38:
	.loc 4 359 92
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 4 360 41
	ld	a5,16(sp)
	srli	a5,a5,12
	.loc 4 360 48
	slli	a4,a5,10
	.loc 4 360 63
	ld	a5,8(sp)
	.loc 4 360 19
	or	a4,a4,a5
	.loc 4 360 17
	ld	a5,24(sp)
	sd	a4,0(a5)
	.loc 4 361 1
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE38:
	.size	set_pt_entry, .-set_pt_entry
	.align	2
	.type	get_mapping_end, @function
get_mapping_end:
.LFB39:
	.loc 4 375 85
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a5,a2
	sb	a5,15(sp)
	.loc 4 377 8
	lbu	a5,15(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L30
	.loc 4 378 29
	ld	a4,24(sp)
	li	a5,1073741824
	add	a4,a4,a5
	.loc 4 378 18
	li	a5,-1073741824
	and	a5,a4,a5
	sd	a5,40(sp)
	j	.L31
.L30:
	.loc 4 380 29
	ld	a4,24(sp)
	li	a5,2097152
	add	a4,a4,a5
	.loc 4 380 18
	li	a5,-2097152
	and	a5,a4,a5
	sd	a5,40(sp)
.L31:
	.loc 4 381 21
	ld	a5,40(sp)
	addi	a4,a5,-1
	.loc 4 381 35
	ld	a5,16(sp)
	addi	a5,a5,-1
	.loc 4 381 50
	bgeu	a4,a5,.L32
	.loc 4 381 50 is_stmt 0 discriminator 1
	ld	a5,40(sp)
	j	.L34
.L32:
	.loc 4 381 50 discriminator 2
	ld	a5,16(sp)
.L34:
	.loc 4 382 1 is_stmt 1 discriminator 5
	mv	a0,a5
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE39:
	.size	get_mapping_end, .-get_mapping_end
	.globl	kernel_pgd
	.section	.sdata,"aw"
	.align	3
	.type	kernel_pgd, @object
	.size	kernel_pgd, 8
kernel_pgd:
	.dword	_s_kernel_pgd
	.section	.rodata
	.align	3
.LC20:
	.string	"kernel PGD is at: %#X\n"
	.align	3
.LC21:
	.string	"Load Page Fault Exception"
	.align	3
.LC22:
	.string	"Store Page Fault Exception"
	.text
	.align	2
	.globl	paging_init
	.type	paging_init, @function
paging_init:
.LFB40:
	.file 5 "kernel/paging.c"
	.loc 5 22 23
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 5 24 5
	lla	a5,kernel_pgd
	ld	a5,0(a5)
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 5 25 5
	lla	a5,kernel_pgd
	ld	a5,0(a5)
	mv	a1,a5
	lla	a0,.LC20
	call	kprintf
	.loc 5 27 5
	call	create_identical_mapping
	.loc 5 29 5
	call	create_mmio_mapping
	.loc 5 31 5
	lla	a3,paging_load_page_fault_exception_handler
	lla	a2,.LC21
	li	a1,0
	li	a0,13
	call	register_ktrap_handler
	.loc 5 33 5
	lla	a3,paging_load_page_fault_exception_handler
	lla	a2,.LC22
	li	a1,0
	li	a0,15
	call	register_ktrap_handler
	.loc 5 35 5
	call	enable_vm_translation
	.loc 5 36 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE40:
	.size	paging_init, .-paging_init
	.section	.rodata
	.align	3
.LC23:
	.string	"start %s\n"
	.align	3
.LC24:
	.string	"\tmapping kernel text, %#X~%#X, %7d Bytes, %2d Pages used (%2d * 4096 = %7d)\n"
	.align	3
.LC25:
	.string	"\tmapping kernel data, %#X~%#X, %7d Bytes, %2d Pages used (%2d * 4096 = %7d)\n"
	.align	3
.LC26:
	.string	"\tmapping other RAM, %#X~%#X, %7d Bytes, %2d Pages used (%2d * 4096 = %7d)\n"
	.align	3
.LC27:
	.string	"\tmapping trampoline, %#X~%#X, %7d Bytes, %2d Pages used (%2d * 4096 = %7d)\n"
	.text
	.align	2
	.globl	create_identical_mapping
	.type	create_identical_mapping, @function
create_identical_mapping:
.LFB41:
	.loc 5 48 36
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	.loc 5 49 5
	lla	a1,__func__.5
	lla	a0,.LC23
	call	kprintf
	.loc 5 54 16
	lla	a5,_s_text_boot
	sd	a5,56(sp)
	.loc 5 54 50
	lla	a5,_e_text
	sd	a5,48(sp)
	.loc 5 54 75
	ld	a4,48(sp)
	ld	a5,56(sp)
	sub	a5,a4,a5
	sd	a5,40(sp)
	.loc 5 55 31
	ld	a4,40(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a5,a4,a5
	.loc 5 55 11
	srli	a5,a5,12
	sd	a5,32(sp)
	.loc 5 56 5
	ld	a5,32(sp)
	slli	a5,a5,12
	mv	a6,a5
	ld	a5,32(sp)
	ld	a4,32(sp)
	ld	a3,40(sp)
	ld	a2,48(sp)
	ld	a1,56(sp)
	lla	a0,.LC24
	call	kprintf
	.loc 5 57 21
	li	a5,235
	sd	a5,24(sp)
	.loc 5 58 5
	lla	a5,kernel_pgd
	ld	a0,0(a5)
	li	a5,0
	ld	a4,24(sp)
	ld	a3,40(sp)
	ld	a2,56(sp)
	ld	a1,56(sp)
	call	create_mapping
	.loc 5 62 16
	lla	a5,_s_rodata
	sd	a5,56(sp)
	.loc 5 62 47
	lla	a5,_e_bss
	sd	a5,48(sp)
	.loc 5 62 71
	ld	a4,48(sp)
	ld	a5,56(sp)
	sub	a5,a4,a5
	sd	a5,40(sp)
	.loc 5 63 31
	ld	a4,40(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a5,a4,a5
	.loc 5 63 11
	srli	a5,a5,12
	sd	a5,32(sp)
	.loc 5 64 5
	ld	a5,32(sp)
	slli	a5,a5,12
	mv	a6,a5
	ld	a5,32(sp)
	ld	a4,32(sp)
	ld	a3,40(sp)
	ld	a2,48(sp)
	ld	a1,56(sp)
	lla	a0,.LC25
	call	kprintf
	.loc 5 65 21
	li	a5,231
	sd	a5,16(sp)
	.loc 5 66 5
	lla	a5,kernel_pgd
	ld	a0,0(a5)
	li	a5,0
	ld	a4,16(sp)
	ld	a3,40(sp)
	ld	a2,56(sp)
	ld	a1,56(sp)
	call	create_mapping
	.loc 5 68 15
	lla	a5,_e_kernel
	sd	a5,56(sp)
	.loc 5 68 42
	ld	a4,56(sp)
	li	a5,16777216
	add	a5,a4,a5
	sd	a5,48(sp)
	.loc 5 68 76
	ld	a4,48(sp)
	ld	a5,56(sp)
	sub	a5,a4,a5
	sd	a5,40(sp)
	.loc 5 69 31
	ld	a4,40(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a5,a4,a5
	.loc 5 69 11
	srli	a5,a5,12
	sd	a5,32(sp)
	.loc 5 70 5
	ld	a5,32(sp)
	slli	a5,a5,12
	mv	a6,a5
	ld	a5,32(sp)
	ld	a4,32(sp)
	ld	a3,40(sp)
	ld	a2,48(sp)
	ld	a1,56(sp)
	lla	a0,.LC26
	call	kprintf
	.loc 5 71 21
	li	a5,231
	sd	a5,8(sp)
	.loc 5 72 5
	lla	a5,kernel_pgd
	ld	a0,0(a5)
	li	a5,0
	ld	a4,8(sp)
	ld	a3,40(sp)
	ld	a2,56(sp)
	ld	a1,56(sp)
	call	create_mapping
	.loc 5 74 15
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	sd	a5,56(sp)
	.loc 5 74 57
	ld	a4,56(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,48(sp)
	.loc 5 74 83
	li	a5,4096
	sd	a5,40(sp)
	.loc 5 75 31
	ld	a4,40(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a5,a4,a5
	.loc 5 75 11
	srli	a5,a5,12
	sd	a5,32(sp)
	.loc 5 76 5
	ld	a5,32(sp)
	slli	a5,a5,12
	mv	a6,a5
	ld	a5,32(sp)
	ld	a4,32(sp)
	ld	a3,40(sp)
	ld	a2,48(sp)
	ld	a1,56(sp)
	lla	a0,.LC27
	call	kprintf
	.loc 5 77 21
	li	a5,10
	sd	a5,0(sp)
	.loc 5 78 5
	lla	a5,kernel_pgd
	ld	a0,0(a5)
	lla	a2,trampoline
	li	a5,0
	ld	a4,0(sp)
	ld	a3,40(sp)
	ld	a1,56(sp)
	call	create_mapping
	.loc 5 80 1
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE41:
	.size	create_identical_mapping, .-create_identical_mapping
	.section	.rodata
	.align	3
.LC28:
	.string	"\tmapping PLIC  MMIO registers,  %#8X~%#8X, %7d Bytes, %2d Pages used (%2d * 4096 = %7d)\n"
	.align	3
.LC29:
	.string	"\tmapping CLINT MMIO registers,  %#8X~ %#8X, %7d Bytes, %2d Pages used (%2d * 4096 = %7d)\n"
	.align	3
.LC30:
	.string	"\tmapping UART  MMIO registers, %#X~%#X, %7d Bytes, %2d Pages used (%2d * 4096 = %7d)\n"
	.text
	.align	2
	.globl	create_mmio_mapping
	.type	create_mmio_mapping, @function
create_mmio_mapping:
.LFB42:
	.loc 5 83 31
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	.loc 5 84 5
	lla	a1,__func__.4
	lla	a0,.LC23
	call	kprintf
	.loc 5 87 21
	li	a5,231
	sd	a5,8(sp)
	.loc 5 90 16
	li	a5,201326592
	sd	a5,40(sp)
	.loc 5 90 49
	li	a5,268435456
	sd	a5,32(sp)
	.loc 5 90 79
	ld	a4,32(sp)
	ld	a5,40(sp)
	sub	a5,a4,a5
	sd	a5,24(sp)
	.loc 5 91 31
	ld	a4,24(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a5,a4,a5
	.loc 5 91 11
	srli	a5,a5,12
	sd	a5,16(sp)
	.loc 5 92 5
	ld	a5,16(sp)
	slli	a5,a5,12
	mv	a6,a5
	ld	a5,16(sp)
	ld	a4,16(sp)
	ld	a3,24(sp)
	ld	a2,32(sp)
	ld	a1,40(sp)
	lla	a0,.LC28
	call	kprintf
	.loc 5 93 5
	lla	a5,kernel_pgd
	ld	a0,0(a5)
	li	a5,0
	ld	a4,8(sp)
	ld	a3,24(sp)
	ld	a2,40(sp)
	ld	a1,40(sp)
	call	create_mapping
	.loc 5 96 16
	li	a5,33554432
	sd	a5,40(sp)
	.loc 5 96 47
	li	a5,33619968
	sd	a5,32(sp)
	.loc 5 96 86
	li	a5,65536
	sd	a5,24(sp)
	.loc 5 97 31
	ld	a4,24(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a5,a4,a5
	.loc 5 97 11
	srli	a5,a5,12
	sd	a5,16(sp)
	.loc 5 98 5
	ld	a5,16(sp)
	slli	a5,a5,12
	mv	a6,a5
	ld	a5,16(sp)
	ld	a4,16(sp)
	ld	a3,24(sp)
	ld	a2,32(sp)
	ld	a1,40(sp)
	lla	a0,.LC29
	call	kprintf
	.loc 5 99 5
	lla	a5,kernel_pgd
	ld	a0,0(a5)
	li	a5,0
	ld	a4,8(sp)
	ld	a3,24(sp)
	ld	a2,40(sp)
	ld	a1,40(sp)
	call	create_mapping
	.loc 5 102 16
	li	a5,268435456
	sd	a5,40(sp)
	.loc 5 102 48
	li	a5,268439552
	sd	a5,32(sp)
	.loc 5 102 85
	li	a5,4096
	sd	a5,24(sp)
	.loc 5 103 31
	ld	a4,24(sp)
	li	a5,4096
	addi	a5,a5,-1
	add	a5,a4,a5
	.loc 5 103 11
	srli	a5,a5,12
	sd	a5,16(sp)
	.loc 5 104 5
	ld	a5,16(sp)
	slli	a5,a5,12
	mv	a6,a5
	ld	a5,16(sp)
	ld	a4,16(sp)
	ld	a3,24(sp)
	ld	a2,32(sp)
	ld	a1,40(sp)
	lla	a0,.LC30
	call	kprintf
	.loc 5 105 5
	lla	a5,kernel_pgd
	ld	a0,0(a5)
	li	a5,0
	ld	a4,8(sp)
	ld	a3,24(sp)
	ld	a2,40(sp)
	ld	a1,40(sp)
	call	create_mapping
	.loc 5 106 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	create_mmio_mapping, .-create_mmio_mapping
	.section	.rodata
	.align	3
.LC31:
	.string	"==============================================================================\n"
	.align	3
.LC32:
	.string	"Supervisor Load Page Fault Exception Happend, stvec = %#X\n"
	.align	3
.LC33:
	.string	"This means you're trying to access an invalid virtual address %#X\n"
	.align	3
.LC34:
	.string	"Load Page Fault exception happened may due to PGDE/PMDE/PTE is invalid\n"
	.align	3
.LC35:
	.string	"This may because you didn't add memory mapping of that virtual address\n"
	.align	3
.LC36:
	.string	"Please check correspoding PGDE/PMDE/PTE and use create_mapping() to fix it\n"
	.align	3
.LC37:
	.string	"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
	.align	3
.LC38:
	.string	"Here are some helpful infomation\n"
	.align	3
.LC39:
	.string	"Detailed infomation of vaddr:\n"
	.align	3
.LC40:
	.string	"\tVPN[2] = %#3X\n\tVPN[1] = %#3X\n\tVPN[0] = %#3X\n\tOFFSET = %#3X\n"
	.align	3
.LC41:
	.string	"Detailed infomation of PGD:\n"
	.align	3
.LC42:
	.string	"\tkernel PGD is at %#X\n"
	.align	3
.LC43:
	.string	"\tcurrent running thread PGD is at %#X\n"
	.align	3
.LC44:
	.string	"Kernel PGD/PMT/PT Info:\n"
	.align	3
.LC45:
	.string	"WARNING: printing PGD/PMT/PT may cause huge outputs on screen, please use tee to save outputs. Start printing in a few seconds...\n"
	.text
	.align	2
	.globl	paging_load_page_fault_exception_handler
	.type	paging_load_page_fault_exception_handler, @function
paging_load_page_fault_exception_handler:
.LFB43:
	.loc 5 110 98
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 5 112 5
	call	supervisor_interrupt_disable
.LBB3:
	.loc 5 114 54
 #APP
# 114 "kernel/paging.c" 1
	csrr a5, stval
# 0 "" 2
 #NO_APP
	mv	ra,a5
	.loc 5 114 117
	mv	a5,ra
.LBE3:
	.loc 5 114 12
	sd	a5,48(sp)
	.loc 5 116 16
	li	a1,2
	ld	a0,48(sp)
	call	get_vpn
	sd	a0,40(sp)
	.loc 5 117 16
	li	a1,1
	ld	a0,48(sp)
	call	get_vpn
	sd	a0,32(sp)
	.loc 5 118 16
	li	a1,0
	ld	a0,48(sp)
	call	get_vpn
	sd	a0,24(sp)
	.loc 5 119 16
	li	a1,-1
	ld	a0,48(sp)
	call	get_vpn
	sd	a0,16(sp)
	.loc 5 120 5
	lla	a0,.LC31
	call	kprintf
	.loc 5 121 5
	ld	a1,48(sp)
	lla	a0,.LC32
	call	kprintf
	.loc 5 122 5
	ld	a1,48(sp)
	lla	a0,.LC33
	call	kprintf
	.loc 5 123 5
	lla	a0,.LC34
	call	kprintf
	.loc 5 124 5
	lla	a0,.LC35
	call	kprintf
	.loc 5 125 5
	lla	a0,.LC36
	call	kprintf
	.loc 5 126 5
	lla	a0,.LC37
	call	kprintf
	.loc 5 127 5
	lla	a0,.LC38
	call	kprintf
	.loc 5 128 5
	lla	a0,.LC39
	call	kprintf
	.loc 5 129 5
	ld	a4,16(sp)
	ld	a3,24(sp)
	ld	a2,32(sp)
	ld	a1,40(sp)
	lla	a0,.LC40
	call	kprintf
	.loc 5 136 5
	lla	a0,.LC41
	call	kprintf
	.loc 5 137 5
	lla	a5,kernel_pgd
	ld	a5,0(a5)
	mv	a1,a5
	lla	a0,.LC42
	call	kprintf
	.loc 5 138 66
	call	get_pgd
	mv	a5,a0
	.loc 5 138 5
	mv	a1,a5
	lla	a0,.LC43
	call	kprintf
	.loc 5 139 5
	lla	a0,.LC44
	call	kprintf
	.loc 5 140 5
	lla	a0,.LC45
	call	kprintf
.LBB4:
	.loc 5 142 18
	li	a5,-2147483648
	xori	a5,a5,-1
	sw	a5,60(sp)
	.loc 5 142 5
	nop
.L39:
	.loc 5 142 39 discriminator 2
	lw	a5,60(sp)
	addiw	a4,a5,-1
	sw	a4,60(sp)
	.loc 5 142 42 discriminator 2
	bgt	a5,zero,.L39
.LBE4:
	.loc 5 144 5
	call	disable_vm_translation
	.loc 5 145 5
	call	get_pgd
	mv	a3,a0
	lla	a5,_s_text_boot
	lla	a4,_e_bss
	mv	a2,a4
	mv	a1,a5
	mv	a0,a3
	call	dump_pgd
.L40:
	.loc 5 146 11 discriminator 1
	nop
	j	.L40
	.cfi_endproc
.LFE43:
	.size	paging_load_page_fault_exception_handler, .-paging_load_page_fault_exception_handler
	.section	.rodata
	.align	3
.LC46:
	.string	"PGDE"
	.align	3
.LC47:
	.string	"PMDE"
	.align	3
.LC48:
	.string	"PTE"
	.data
	.align	3
	.type	pg_levels, @object
	.size	pg_levels, 96
pg_levels:
	.dword	9
	.zero	8
	.dword	.LC46
	.dword	prot_bits
	.dword	9
	.zero	8
	.dword	.LC47
	.dword	prot_bits
	.dword	9
	.zero	8
	.dword	.LC48
	.dword	prot_bits
	.section	.rodata
	.align	3
.LC49:
	.string	"%s"
	.text
	.align	2
	.globl	dump_property
	.type	dump_property, @function
dump_property:
.LFB44:
	.loc 5 171 78
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
.LBB5:
	.loc 5 173 14
	sw	zero,44(sp)
	.loc 5 173 5
	j	.L42
.L46:
.LBB6:
	.loc 5 174 42
	ld	a5,16(sp)
	ld	a4,0(a5)
	.loc 5 174 36
	ld	a5,24(sp)
	and	a4,a4,a5
	.loc 5 174 57
	ld	a5,16(sp)
	ld	a5,8(a5)
	.loc 5 174 76
	bne	a4,a5,.L43
	.loc 5 174 76 is_stmt 0 discriminator 1
	ld	a5,16(sp)
	ld	a5,16(a5)
	j	.L44
.L43:
	.loc 5 174 76 discriminator 2
	ld	a5,16(sp)
	ld	a5,24(a5)
.L44:
	.loc 5 174 21 is_stmt 1 discriminator 4
	sd	a5,32(sp)
	.loc 5 175 12 discriminator 4
	ld	a5,32(sp)
	beq	a5,zero,.L45
	.loc 5 176 13
	ld	a1,32(sp)
	lla	a0,.LC49
	call	kprintf
.L45:
.LBE6:
	.loc 5 173 31 discriminator 2
	lw	a5,44(sp)
	addiw	a5,a5,1
	sw	a5,44(sp)
	.loc 5 173 39 discriminator 2
	ld	a5,16(sp)
	addi	a5,a5,32
	sd	a5,16(sp)
.L42:
	.loc 5 173 23 discriminator 1
	lw	a5,44(sp)
	ld	a4,8(sp)
	bgtu	a4,a5,.L46
.LBE5:
	.loc 5 178 1
	nop
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE44:
	.size	dump_property, .-dump_property
	.section	.rodata
	.align	3
.LC50:
	.string	"---[ %s ]---\n"
	.align	3
.LC51:
	.string	"0x%016lX-0x%016lX    "
	.align	3
.LC52:
	.string	"%9lu%c %s"
	.align	3
.LC53:
	.string	"\n"
	.text
	.align	2
	.globl	print_page_table
	.type	print_page_table, @function
print_page_table:
.LFB45:
	.loc 5 180 81
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a5,a2
	sd	a3,0(sp)
	sw	a5,12(sp)
	.loc 5 181 16
	li	a5,1413959680
	addi	a5,a5,-693
	sw	a5,40(sp)
	sb	zero,44(sp)
	.loc 5 183 17
	addi	a5,sp,40
	sd	a5,72(sp)
	.loc 5 185 49
	lla	a4,pg_levels
	lw	a5,12(sp)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,8(a5)
	.loc 5 185 14
	ld	a4,0(sp)
	and	a5,a4,a5
	sd	a5,48(sp)
.LBB7:
	.loc 5 187 14
	sw	zero,68(sp)
	.loc 5 187 5
	j	.L48
.L50:
	.loc 5 188 42
	lla	a4,address_markers
	lw	a5,68(sp)
	slli	a5,a5,4
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 5 188 12
	ld	a4,24(sp)
	bne	a4,a5,.L49
	.loc 5 189 57
	lla	a5,.LC5
	.loc 5 189 13
	mv	a1,a5
	lla	a0,.LC50
	call	kprintf
.L49:
	.loc 5 187 94 discriminator 2
	lw	a5,68(sp)
	addiw	a5,a5,1
	sw	a5,68(sp)
.L48:
	.loc 5 187 23 discriminator 1
	lw	a5,68(sp)
	sext.w	a5,a5
	beq	a5,zero,.L50
.LBE7:
	.loc 5 192 8
	ld	a5,0(sp)
	beq	a5,zero,.L57
	.loc 5 199 5
	ld	a2,16(sp)
	ld	a1,24(sp)
	lla	a0,.LC51
	call	kprintf
	.loc 5 202 31
	ld	a4,16(sp)
	ld	a5,24(sp)
	sub	a5,a4,a5
	.loc 5 202 42
	srli	a5,a5,10
	.loc 5 202 14
	sd	a5,56(sp)
	.loc 5 203 11
	j	.L53
.L55:
	.loc 5 204 15
	ld	a5,56(sp)
	srai	a5,a5,10
	sd	a5,56(sp)
	.loc 5 205 13
	ld	a5,72(sp)
	addi	a5,a5,1
	sd	a5,72(sp)
.L53:
	.loc 5 203 20
	ld	a5,56(sp)
	andi	a5,a5,1023
	.loc 5 203 28
	bne	a5,zero,.L54
	.loc 5 203 41 discriminator 1
	lbu	a5,41(sp)
	.loc 5 203 28 discriminator 1
	bne	a5,zero,.L55
.L54:
	.loc 5 215 33
	ld	a5,72(sp)
	lbu	a5,0(a5)
	.loc 5 215 5
	sext.w	a2,a5
	lla	a4,pg_levels
	lw	a5,12(sp)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,16(a5)
	mv	a3,a5
	ld	a1,56(sp)
	lla	a0,.LC52
	call	kprintf
	.loc 5 221 25
	lla	a4,pg_levels
	lw	a5,12(sp)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,24(a5)
	.loc 5 221 8
	beq	a5,zero,.L56
	.loc 5 222 9
	lla	a4,pg_levels
	lw	a5,12(sp)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a3,24(a5)
	lla	a4,pg_levels
	lw	a5,12(sp)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,0(a5)
	mv	a2,a5
	mv	a1,a3
	ld	a0,48(sp)
	call	dump_property
.L56:
	.loc 5 223 5
	lla	a0,.LC53
	call	kprintf
	j	.L47
.L57:
	.loc 5 193 9
	nop
.L47:
	.loc 5 224 1
	ld	ra,88(sp)
	.cfi_restore 1
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE45:
	.size	print_page_table, .-print_page_table
	.align	2
	.globl	parse_pt
	.type	parse_pt, @function
parse_pt:
.LFB46:
	.loc 5 226 56
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 5 227 25
	li	a1,0
	ld	a0,16(sp)
	call	page_align
	sd	a0,56(sp)
	.loc 5 228 24
	li	a1,0
	ld	a0,8(sp)
	call	page_align
	sd	a0,40(sp)
	.loc 5 230 48
	li	a1,0
	ld	a0,56(sp)
	call	get_vpn
	mv	a5,a0
	.loc 5 230 46
	slli	a5,a5,3
	.loc 5 230 17
	ld	a4,24(sp)
	add	a5,a4,a5
	sd	a5,48(sp)
.L59:
	.loc 5 233 9 discriminator 1
	ld	a4,56(sp)
	li	a5,4096
	add	a4,a4,a5
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a3,a5
	li	a2,2
	mv	a1,a4
	ld	a0,56(sp)
	call	print_page_table
	.loc 5 234 20 discriminator 1
	ld	a5,48(sp)
	addi	a5,a5,8
	sd	a5,48(sp)
	.loc 5 234 35 discriminator 1
	ld	a4,56(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,56(sp)
	.loc 5 234 14 discriminator 1
	ld	a4,56(sp)
	ld	a5,40(sp)
	bltu	a4,a5,.L59
	.loc 5 235 1
	nop
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE46:
	.size	parse_pt, .-parse_pt
	.align	2
	.globl	parse_pmd
	.type	parse_pmd, @function
parse_pmd:
.LFB47:
	.loc 5 238 59
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 5 239 25
	li	a1,0
	ld	a0,16(sp)
	call	page_align
	sd	a0,56(sp)
	.loc 5 240 24
	li	a1,0
	ld	a0,8(sp)
	call	page_align
	sd	a0,40(sp)
	.loc 5 243 52
	li	a1,1
	ld	a0,56(sp)
	call	get_vpn
	mv	a5,a0
	.loc 5 243 50
	slli	a5,a5,3
	.loc 5 243 18
	ld	a4,24(sp)
	add	a5,a4,a5
	sd	a5,48(sp)
.L64:
	.loc 5 245 22
	li	a2,0
	ld	a1,8(sp)
	ld	a0,56(sp)
	call	get_mapping_end
	sd	a0,32(sp)
	.loc 5 246 14
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a0,a5
	call	is_valid_page
	mv	a5,a0
	.loc 5 246 12
	beq	a5,zero,.L61
	.loc 5 246 45 discriminator 1
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a0,a5
	call	is_leaf_page
	mv	a5,a0
	.loc 5 246 42 discriminator 1
	beq	a5,zero,.L62
.L61:
	.loc 5 248 13
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a3,a5
	li	a2,1
	ld	a1,32(sp)
	ld	a0,56(sp)
	call	print_page_table
	j	.L63
.L62:
	.loc 5 249 18
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a0,a5
	call	is_valid_page
	mv	a5,a0
	.loc 5 249 17
	beq	a5,zero,.L63
	.loc 5 251 13
	ld	a0,48(sp)
	call	get_pt
	mv	a5,a0
	ld	a2,40(sp)
	ld	a1,56(sp)
	mv	a0,a5
	call	parse_pt
.L63:
	.loc 5 252 21
	ld	a5,48(sp)
	addi	a5,a5,8
	sd	a5,48(sp)
	.loc 5 252 36
	ld	a5,32(sp)
	sd	a5,56(sp)
	.loc 5 252 14
	ld	a4,56(sp)
	ld	a5,40(sp)
	bltu	a4,a5,.L64
	.loc 5 253 1
	nop
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE47:
	.size	parse_pmd, .-parse_pmd
	.section	.rodata
	.align	3
.LC54:
	.string	"\"Invalid PGD Entry!\""
	.align	3
.LC55:
	.string	"False"
	.align	3
.LC56:
	.string	"kernel/paging.c"
	.text
	.align	2
	.globl	parse_pgd
	.type	parse_pgd, @function
parse_pgd:
.LFB48:
	.loc 5 255 56
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 5 256 25
	li	a1,0
	ld	a0,16(sp)
	call	page_align
	sd	a0,56(sp)
	.loc 5 257 24
	ld	a4,16(sp)
	ld	a5,8(sp)
	add	a5,a4,a5
	li	a1,1
	mv	a0,a5
	call	page_align
	sd	a0,40(sp)
	.loc 5 261 52
	li	a1,2
	ld	a0,56(sp)
	call	get_vpn
	mv	a5,a0
	.loc 5 261 50
	slli	a5,a5,3
	.loc 5 261 18
	ld	a4,24(sp)
	add	a5,a4,a5
	sd	a5,48(sp)
.L70:
	.loc 5 263 22
	li	a2,1
	ld	a1,40(sp)
	ld	a0,56(sp)
	call	get_mapping_end
	sd	a0,32(sp)
	.loc 5 264 14
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a0,a5
	call	is_valid_page
	mv	a5,a0
	.loc 5 264 12
	beq	a5,zero,.L66
	.loc 5 264 45 discriminator 1
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a0,a5
	call	is_leaf_page
	mv	a5,a0
	.loc 5 264 42 discriminator 1
	beq	a5,zero,.L67
.L66:
	.loc 5 266 13
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a3,a5
	li	a2,2
	ld	a1,32(sp)
	ld	a0,56(sp)
	call	print_page_table
	j	.L68
.L67:
	.loc 5 267 18
	ld	a5,48(sp)
	ld	a5,0(a5)
	mv	a0,a5
	call	is_valid_page
	mv	a5,a0
	.loc 5 267 17
	beq	a5,zero,.L69
	.loc 5 269 13
	ld	a0,48(sp)
	call	get_pmd
	mv	a5,a0
	ld	a2,32(sp)
	ld	a1,56(sp)
	mv	a0,a5
	call	parse_pmd
	j	.L68
.L69:
	.loc 5 272 33 discriminator 1
	lla	a4,.LC54
	lla	a3,.LC55
	lla	a2,__func__.2
	li	a1,272
	lla	a0,.LC56
	call	kpanic_spin
.L68:
	.loc 5 273 21
	ld	a5,48(sp)
	addi	a5,a5,8
	sd	a5,48(sp)
	.loc 5 273 36
	ld	a5,32(sp)
	sd	a5,56(sp)
	.loc 5 273 14
	ld	a4,56(sp)
	ld	a5,40(sp)
	bltu	a4,a5,.L70
	.loc 5 274 1
	nop
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE48:
	.size	parse_pgd, .-parse_pgd
	.align	2
	.globl	dump_pgd
	.type	dump_pgd, @function
dump_pgd:
.LFB49:
	.loc 5 276 58
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 5 277 26
	li	a1,0
	ld	a0,16(sp)
	call	page_align
	sd	a0,48(sp)
	.loc 5 278 24
	li	a1,1
	ld	a0,8(sp)
	call	page_align
	sd	a0,40(sp)
.LBB8:
	.loc 5 281 14
	sw	zero,60(sp)
	.loc 5 281 5
	j	.L72
.L76:
	.loc 5 282 25
	lla	a4,pg_levels
	lw	a5,60(sp)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a5,24(a5)
	.loc 5 282 12
	beq	a5,zero,.L73
.LBB9:
	.loc 5 283 22
	sw	zero,56(sp)
	.loc 5 283 13
	j	.L74
.L75:
	.loc 5 284 29 discriminator 3
	lla	a4,pg_levels
	lw	a5,60(sp)
	slli	a5,a5,5
	add	a5,a4,a5
	ld	a4,8(a5)
	.loc 5 284 50 discriminator 3
	lla	a3,pg_levels
	lw	a5,60(sp)
	slli	a5,a5,5
	add	a5,a3,a5
	ld	a3,24(a5)
	.loc 5 284 60 discriminator 3
	lw	a5,56(sp)
	slli	a5,a5,5
	add	a5,a3,a5
	.loc 5 284 63 discriminator 3
	ld	a5,0(a5)
	.loc 5 284 35 discriminator 3
	or	a4,a4,a5
	lla	a3,pg_levels
	lw	a5,60(sp)
	slli	a5,a5,5
	add	a5,a3,a5
	sd	a4,8(a5)
	.loc 5 283 52 discriminator 3
	lw	a5,56(sp)
	addiw	a5,a5,1
	sw	a5,56(sp)
.L74:
	.loc 5 283 31 discriminator 1
	lw	a4,56(sp)
	.loc 5 283 45 discriminator 1
	lla	a3,pg_levels
	lw	a5,60(sp)
	slli	a5,a5,5
	add	a5,a3,a5
	ld	a5,0(a5)
	.loc 5 283 31 discriminator 1
	bltu	a4,a5,.L75
.L73:
.LBE9:
	.loc 5 281 82 discriminator 2
	lw	a5,60(sp)
	addiw	a5,a5,1
	sw	a5,60(sp)
.L72:
	.loc 5 281 23 discriminator 1
	lw	a5,60(sp)
	mv	a4,a5
	li	a5,2
	bleu	a4,a5,.L76
.LBE8:
	.loc 5 287 5
	ld	a2,40(sp)
	ld	a1,48(sp)
	ld	a0,24(sp)
	call	parse_pgd
	.loc 5 288 1
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE49:
	.size	dump_pgd, .-dump_pgd
	.align	2
	.globl	make_pmd_entry
	.type	make_pmd_entry, @function
make_pmd_entry:
.LFB50:
	.loc 5 297 130
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	.cfi_offset 1, -8
	sd	a0,40(sp)
	sd	a1,32(sp)
	sd	a2,24(sp)
	sd	a3,16(sp)
	sd	a4,8(sp)
	sd	a5,0(sp)
	.loc 5 300 12
	ld	a5,16(sp)
	sd	a5,104(sp)
	.loc 5 301 12
	ld	a5,32(sp)
	sd	a5,96(sp)
	.loc 5 302 12
	ld	a5,24(sp)
	sd	a5,80(sp)
	.loc 5 305 16
	ld	a5,40(sp)
	ld	a5,0(a5)
	.loc 5 305 8
	bne	a5,zero,.L78
.LBB10:
	.loc 5 306 27
	li	a0,1
	call	alloc_ppage
	sd	a0,72(sp)
	.loc 5 307 25
	li	a5,1
	sd	a5,56(sp)
	.loc 5 309 9
	ld	a2,56(sp)
	ld	a1,72(sp)
	ld	a0,40(sp)
	call	set_pmd_entry
.L78:
.LBE10:
	.loc 5 316 16
	ld	a0,40(sp)
	call	get_pt
	sd	a0,64(sp)
	.loc 5 317 48
	li	a1,0
	ld	a0,104(sp)
	call	get_vpn
	mv	a5,a0
	.loc 5 317 46
	slli	a5,a5,3
	.loc 5 317 17
	ld	a4,64(sp)
	add	a5,a4,a5
	sd	a5,88(sp)
.L79:
	.loc 5 319 9 discriminator 1
	ld	a2,8(sp)
	ld	a1,104(sp)
	ld	a0,88(sp)
	call	set_pt_entry
	.loc 5 322 20 discriminator 1
	ld	a4,104(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,104(sp)
	.loc 5 323 20 discriminator 1
	ld	a5,88(sp)
	addi	a5,a5,8
	sd	a5,88(sp)
	.loc 5 323 35 discriminator 1
	ld	a4,96(sp)
	li	a5,4096
	add	a5,a4,a5
	sd	a5,96(sp)
	.loc 5 323 14 discriminator 1
	ld	a4,96(sp)
	ld	a5,80(sp)
	bltu	a4,a5,.L79
	.loc 5 324 1
	nop
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE50:
	.size	make_pmd_entry, .-make_pmd_entry
	.align	2
	.globl	make_pgd_entry
	.type	make_pgd_entry, @function
make_pgd_entry:
.LFB51:
	.loc 5 327 130
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	.cfi_offset 1, -8
	sd	a0,40(sp)
	sd	a1,32(sp)
	sd	a2,24(sp)
	sd	a3,16(sp)
	sd	a4,8(sp)
	sd	a5,0(sp)
	.loc 5 330 12
	ld	a5,16(sp)
	sd	a5,104(sp)
	.loc 5 331 12
	ld	a5,32(sp)
	sd	a5,96(sp)
	.loc 5 332 12
	ld	a5,24(sp)
	sd	a5,80(sp)
	.loc 5 335 16
	ld	a5,40(sp)
	ld	a5,0(a5)
	.loc 5 335 8
	bne	a5,zero,.L81
.LBB11:
	.loc 5 336 28
	li	a0,1
	call	alloc_ppage
	sd	a0,72(sp)
	.loc 5 337 25
	li	a5,1
	sd	a5,48(sp)
	.loc 5 339 9
	ld	a2,48(sp)
	ld	a1,72(sp)
	ld	a0,40(sp)
	call	set_pgd_entry
.L81:
.LBE11:
	.loc 5 346 18
	ld	a0,40(sp)
	call	get_pmd
	sd	a0,64(sp)
	.loc 5 347 51
	li	a1,1
	ld	a0,104(sp)
	call	get_vpn
	mv	a5,a0
	.loc 5 347 49
	slli	a5,a5,3
	.loc 5 347 18
	ld	a4,64(sp)
	add	a5,a4,a5
	sd	a5,88(sp)
.L82:
	.loc 5 355 22 discriminator 1
	li	a2,0
	ld	a1,80(sp)
	ld	a0,96(sp)
	call	get_mapping_end
	sd	a0,56(sp)
	.loc 5 357 9 discriminator 1
	ld	a5,0(sp)
	ld	a4,8(sp)
	ld	a3,104(sp)
	ld	a2,56(sp)
	ld	a1,96(sp)
	ld	a0,88(sp)
	call	make_pmd_entry
	.loc 5 359 35 discriminator 1
	ld	a4,56(sp)
	ld	a5,96(sp)
	sub	a5,a4,a5
	.loc 5 359 20 discriminator 1
	ld	a4,104(sp)
	add	a5,a4,a5
	sd	a5,104(sp)
	.loc 5 360 21 discriminator 1
	ld	a5,88(sp)
	addi	a5,a5,8
	sd	a5,88(sp)
	.loc 5 360 36 discriminator 1
	ld	a5,56(sp)
	sd	a5,96(sp)
	.loc 5 360 14 discriminator 1
	ld	a4,96(sp)
	ld	a5,80(sp)
	bltu	a4,a5,.L82
	.loc 5 361 1
	nop
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE51:
	.size	make_pgd_entry, .-make_pgd_entry
	.section	.rodata
	.align	3
.LC57:
	.string	"\"mapping memory size must greater than 0, but size=%d!\""
	.align	3
.LC58:
	.string	"0 < size"
	.text
	.align	2
	.globl	create_mapping
	.type	create_mapping, @function
create_mapping:
.LFB52:
	.loc 5 364 117
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,104(sp)
	.cfi_offset 1, -8
	sd	a0,40(sp)
	sd	a1,32(sp)
	sd	a2,24(sp)
	sd	a3,16(sp)
	sd	a4,8(sp)
	sd	a5,0(sp)
	.loc 5 366 8
	ld	a5,16(sp)
	bne	a5,zero,.L84
	.loc 5 366 28 discriminator 1
	ld	a5,16(sp)
	lla	a4,.LC57
	lla	a3,.LC58
	lla	a2,__func__.1
	li	a1,366
	lla	a0,.LC56
	call	kpanic_spin
.L84:
	.loc 5 369 25
	li	a1,0
	ld	a0,24(sp)
	call	page_align
	sd	a0,88(sp)
	.loc 5 370 25
	li	a1,0
	ld	a0,32(sp)
	call	page_align
	sd	a0,80(sp)
	.loc 5 372 24
	ld	a4,32(sp)
	ld	a5,16(sp)
	add	a5,a4,a5
	li	a1,1
	mv	a0,a5
	call	page_align
	sd	a0,64(sp)
	.loc 5 375 52
	li	a1,2
	ld	a0,80(sp)
	call	get_vpn
	mv	a5,a0
	.loc 5 375 50
	slli	a5,a5,3
	.loc 5 375 18
	ld	a4,40(sp)
	add	a5,a4,a5
	sd	a5,72(sp)
.L85:
	.loc 5 383 22 discriminator 1
	li	a2,1
	ld	a1,64(sp)
	ld	a0,80(sp)
	call	get_mapping_end
	sd	a0,56(sp)
	.loc 5 385 9 discriminator 1
	ld	a5,0(sp)
	ld	a4,8(sp)
	ld	a3,88(sp)
	ld	a2,56(sp)
	ld	a1,80(sp)
	ld	a0,72(sp)
	call	make_pgd_entry
	.loc 5 387 35 discriminator 1
	ld	a4,56(sp)
	ld	a5,80(sp)
	sub	a5,a4,a5
	.loc 5 387 20 discriminator 1
	ld	a4,88(sp)
	add	a5,a4,a5
	sd	a5,88(sp)
	.loc 5 388 21 discriminator 1
	ld	a5,72(sp)
	addi	a5,a5,8
	sd	a5,72(sp)
	.loc 5 388 36 discriminator 1
	ld	a5,56(sp)
	sd	a5,80(sp)
	.loc 5 388 14 discriminator 1
	ld	a4,80(sp)
	ld	a5,64(sp)
	bltu	a4,a5,.L85
	.loc 5 389 1
	nop
	nop
	ld	ra,104(sp)
	.cfi_restore 1
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE52:
	.size	create_mapping, .-create_mapping
	.section	.rodata
	.align	3
.LC59:
	.string	"\"invalid va\""
	.align	3
.LC60:
	.string	"va<=MAX_VA"
	.text
	.align	2
	.globl	get_level0_pte
	.type	get_level0_pte, @function
get_level0_pte:
.LFB53:
	.loc 5 396 61
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a5,a2
	sw	a5,12(sp)
	.loc 5 400 8
	ld	a4,16(sp)
	li	a5,1
	slli	a5,a5,38
	bleu	a4,a5,.L87
	.loc 5 400 34 discriminator 1
	li	a5,0
	lla	a4,.LC59
	lla	a3,.LC60
	lla	a2,__func__.0
	li	a1,400
	lla	a0,.LC56
	call	kpanic_spin
.L87:
.LBB12:
	.loc 5 402 14
	li	a5,2
	sw	a5,44(sp)
	.loc 5 402 5
	j	.L88
.L94:
	.loc 5 403 66
	lw	a5,44(sp)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,3
	addw	a5,a5,a4
	sext.w	a5,a5
	.loc 5 403 57
	addiw	a5,a5,12
	sext.w	a5,a5
	.loc 5 403 50
	mv	a4,a5
	ld	a5,16(sp)
	srl	a5,a5,a4
	.loc 5 403 71
	andi	a5,a5,511
	.loc 5 403 34
	slli	a4,a5,3
	ld	a5,24(sp)
	add	a5,a4,a5
	.loc 5 403 13
	sd	a5,32(sp)
	.loc 5 404 13
	ld	a5,32(sp)
	ld	a5,0(a5)
	.loc 5 404 18
	andi	a5,a5,1
	.loc 5 404 12
	beq	a5,zero,.L89
	.loc 5 405 35
	ld	a5,32(sp)
	ld	a5,0(a5)
	.loc 5 405 51
	srli	a5,a5,10
	.loc 5 405 23
	slli	a5,a5,12
	sd	a5,24(sp)
	j	.L90
.L89:
	.loc 5 407 16
	lw	a5,12(sp)
	sext.w	a5,a5
	bne	a5,zero,.L91
	.loc 5 408 24
	li	a5,0
	j	.L92
.L91:
	.loc 5 409 32
	li	a0,1
	call	alloc_ppage
	sd	a0,24(sp)
	.loc 5 410 16
	ld	a5,24(sp)
	bne	a5,zero,.L93
	.loc 5 411 24
	li	a5,0
	j	.L92
.L93:
	.loc 5 412 13
	ld	a5,24(sp)
	li	a2,4096
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 5 413 42
	ld	a5,24(sp)
	srli	a5,a5,12
	.loc 5 413 49
	slli	a5,a5,10
	.loc 5 413 56
	ori	a4,a5,1
	.loc 5 413 18
	ld	a5,32(sp)
	sd	a4,0(a5)
.L90:
	.loc 5 402 41 discriminator 2
	lw	a5,44(sp)
	addiw	a5,a5,-1
	sw	a5,44(sp)
.L88:
	.loc 5 402 31 discriminator 1
	lw	a5,44(sp)
	sext.w	a5,a5
	bgt	a5,zero,.L94
.LBE12:
	.loc 5 419 47
	ld	a5,16(sp)
	srli	a5,a5,12
	.loc 5 419 64
	andi	a5,a5,511
	.loc 5 419 31
	slli	a4,a5,3
	ld	a5,24(sp)
	add	a5,a4,a5
.L92:
	.loc 5 420 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE53:
	.size	get_level0_pte, .-get_level0_pte
	.section	.rodata
	.align	3
	.type	__func__.5, @object
	.size	__func__.5, 25
__func__.5:
	.string	"create_identical_mapping"
	.align	3
	.type	__func__.4, @object
	.size	__func__.4, 20
__func__.4:
	.string	"create_mmio_mapping"
	.section	.srodata,"a"
	.align	3
	.type	__func__.3, @object
	.size	__func__.3, 8
__func__.3:
	.string	"get_vpn"
	.section	.rodata
	.align	3
	.type	__func__.2, @object
	.size	__func__.2, 10
__func__.2:
	.string	"parse_pgd"
	.align	3
	.type	__func__.1, @object
	.size	__func__.1, 15
__func__.1:
	.string	"create_mapping"
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 15
__func__.0:
	.string	"get_level0_pte"
	.text
.Letext0:
	.file 6 "include/types.h"
	.file 7 "include/trap/trapframe.h"
	.file 8 "include/stdarg.h"
	.file 9 "include/stdfmt.h"
	.file 10 "include/kernel/kstdio.h"
	.file 11 "include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1662
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x27
	.4byte	.LASF172
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x9
	.4byte	.LASF5
	.byte	0x6
	.byte	0x17
	.byte	0x17
	.4byte	0x3a
	.byte	0x13
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x13
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x13
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x9
	.4byte	.LASF6
	.byte	0x6
	.byte	0x1a
	.byte	0x17
	.4byte	0x5b
	.byte	0x13
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x13
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0xd
	.4byte	0x62
	.byte	0x13
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0x9
	.4byte	.LASF10
	.byte	0x6
	.byte	0x1f
	.byte	0xd
	.4byte	0x81
	.byte	0x28
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x9
	.4byte	.LASF11
	.byte	0x6
	.byte	0x20
	.byte	0xe
	.4byte	0x94
	.byte	0x13
	.byte	0x8
	.byte	0x5
	.4byte	.LASF12
	.byte	0x9
	.4byte	.LASF13
	.byte	0x6
	.byte	0x23
	.byte	0x17
	.4byte	0x3a
	.byte	0x29
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x6
	.byte	0x24
	.byte	0x6
	.4byte	0xc2
	.byte	0x23
	.4byte	.LASF14
	.byte	0
	.byte	0x23
	.4byte	.LASF15
	.byte	0x1
	.byte	0
	.byte	0x9
	.4byte	.LASF16
	.byte	0x6
	.byte	0x2a
	.byte	0x12
	.4byte	0x4f
	.byte	0x9
	.4byte	.LASF17
	.byte	0x6
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0x9
	.4byte	.LASF18
	.byte	0x6
	.byte	0x30
	.byte	0x11
	.4byte	0x88
	.byte	0x9
	.4byte	.LASF19
	.byte	0x6
	.byte	0x33
	.byte	0x12
	.4byte	0x4f
	.byte	0x9
	.4byte	.LASF20
	.byte	0x6
	.byte	0x36
	.byte	0x12
	.4byte	0x4f
	.byte	0x18
	.4byte	.LASF23
	.byte	0x8
	.byte	0x1
	.byte	0x24
	.4byte	0x118
	.byte	0x1a
	.string	"val"
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.4byte	0x4f
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF21
	.byte	0x1
	.byte	0x26
	.byte	0x3
	.4byte	0xfe
	.byte	0x16
	.4byte	.LASF22
	.2byte	0x16d
	.byte	0x10
	.4byte	0xe6
	.byte	0x1d
	.4byte	.LASF24
	.2byte	0x170
	.4byte	0x147
	.byte	0x1e
	.string	"val"
	.2byte	0x171
	.4byte	0x4f
	.byte	0
	.byte	0x16
	.4byte	.LASF25
	.2byte	0x172
	.byte	0x3
	.4byte	0x130
	.byte	0x16
	.4byte	.LASF26
	.2byte	0x17d
	.byte	0x10
	.4byte	0xe6
	.byte	0x1d
	.4byte	.LASF27
	.2byte	0x180
	.4byte	0x176
	.byte	0x1e
	.string	"val"
	.2byte	0x181
	.4byte	0x4f
	.byte	0
	.byte	0x16
	.4byte	.LASF28
	.2byte	0x182
	.byte	0x3
	.4byte	0x15f
	.byte	0x16
	.4byte	.LASF29
	.2byte	0x18d
	.byte	0x10
	.4byte	0xe6
	.byte	0x1d
	.4byte	.LASF30
	.2byte	0x190
	.4byte	0x1a5
	.byte	0x1e
	.string	"val"
	.2byte	0x191
	.4byte	0x4f
	.byte	0
	.byte	0x16
	.4byte	.LASF31
	.2byte	0x192
	.byte	0x3
	.4byte	0x18e
	.byte	0xb
	.4byte	0x62
	.byte	0x4
	.byte	0x1f
	.4byte	0x1d2
	.byte	0x1
	.string	"_x1"
	.byte	0x1f
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"ra"
	.byte	0x1f
	.byte	0x20
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x21
	.4byte	0x1ee
	.byte	0x1
	.string	"_x2"
	.byte	0x21
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"sp"
	.byte	0x21
	.byte	0x20
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x23
	.4byte	0x20a
	.byte	0x1
	.string	"_x3"
	.byte	0x23
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"gp"
	.byte	0x23
	.byte	0x20
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x25
	.4byte	0x226
	.byte	0x1
	.string	"_x4"
	.byte	0x25
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"tp"
	.byte	0x25
	.byte	0x20
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x27
	.4byte	0x242
	.byte	0x1
	.string	"_x5"
	.byte	0x27
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"t0"
	.byte	0x27
	.byte	0x20
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x29
	.4byte	0x25e
	.byte	0x1
	.string	"_x6"
	.byte	0x29
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"t1"
	.byte	0x29
	.byte	0x20
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x2b
	.4byte	0x27a
	.byte	0x1
	.string	"_x7"
	.byte	0x2b
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"t2"
	.byte	0x2b
	.byte	0x20
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x2d
	.4byte	0x2a0
	.byte	0x1
	.string	"_x8"
	.byte	0x2d
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"s0"
	.byte	0x2d
	.byte	0x20
	.4byte	0xf2
	.byte	0x1
	.string	"fp"
	.byte	0x2d
	.byte	0x2b
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x2f
	.4byte	0x2bc
	.byte	0x1
	.string	"_x9"
	.byte	0x2f
	.byte	0x14
	.4byte	0xf2
	.byte	0x1
	.string	"s1"
	.byte	0x2f
	.byte	0x20
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x31
	.4byte	0x2d7
	.byte	0x7
	.4byte	.LASF32
	.byte	0x31
	.4byte	0xf2
	.byte	0x1
	.string	"a0"
	.byte	0x31
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x33
	.4byte	0x2f2
	.byte	0x7
	.4byte	.LASF33
	.byte	0x33
	.4byte	0xf2
	.byte	0x1
	.string	"a1"
	.byte	0x33
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x35
	.4byte	0x30d
	.byte	0x7
	.4byte	.LASF34
	.byte	0x35
	.4byte	0xf2
	.byte	0x1
	.string	"a2"
	.byte	0x35
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x37
	.4byte	0x328
	.byte	0x7
	.4byte	.LASF35
	.byte	0x37
	.4byte	0xf2
	.byte	0x1
	.string	"a3"
	.byte	0x37
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x39
	.4byte	0x343
	.byte	0x7
	.4byte	.LASF36
	.byte	0x39
	.4byte	0xf2
	.byte	0x1
	.string	"a4"
	.byte	0x39
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x3b
	.4byte	0x35e
	.byte	0x7
	.4byte	.LASF37
	.byte	0x3b
	.4byte	0xf2
	.byte	0x1
	.string	"a5"
	.byte	0x3b
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x3d
	.4byte	0x379
	.byte	0x7
	.4byte	.LASF38
	.byte	0x3d
	.4byte	0xf2
	.byte	0x1
	.string	"a6"
	.byte	0x3d
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x3f
	.4byte	0x394
	.byte	0x7
	.4byte	.LASF39
	.byte	0x3f
	.4byte	0xf2
	.byte	0x1
	.string	"a7"
	.byte	0x3f
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x41
	.4byte	0x3af
	.byte	0x7
	.4byte	.LASF40
	.byte	0x41
	.4byte	0xf2
	.byte	0x1
	.string	"s2"
	.byte	0x41
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x43
	.4byte	0x3ca
	.byte	0x7
	.4byte	.LASF41
	.byte	0x43
	.4byte	0xf2
	.byte	0x1
	.string	"s3"
	.byte	0x43
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x45
	.4byte	0x3e5
	.byte	0x7
	.4byte	.LASF42
	.byte	0x45
	.4byte	0xf2
	.byte	0x1
	.string	"s4"
	.byte	0x45
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x47
	.4byte	0x400
	.byte	0x7
	.4byte	.LASF43
	.byte	0x47
	.4byte	0xf2
	.byte	0x1
	.string	"s5"
	.byte	0x47
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x49
	.4byte	0x41b
	.byte	0x7
	.4byte	.LASF44
	.byte	0x49
	.4byte	0xf2
	.byte	0x1
	.string	"s6"
	.byte	0x49
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x4b
	.4byte	0x436
	.byte	0x7
	.4byte	.LASF45
	.byte	0x4b
	.4byte	0xf2
	.byte	0x1
	.string	"s7"
	.byte	0x4b
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x4d
	.4byte	0x451
	.byte	0x7
	.4byte	.LASF46
	.byte	0x4d
	.4byte	0xf2
	.byte	0x1
	.string	"s8"
	.byte	0x4d
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x4f
	.4byte	0x46c
	.byte	0x7
	.4byte	.LASF47
	.byte	0x4f
	.4byte	0xf2
	.byte	0x1
	.string	"s9"
	.byte	0x4f
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x51
	.4byte	0x488
	.byte	0x7
	.4byte	.LASF48
	.byte	0x51
	.4byte	0xf2
	.byte	0x1
	.string	"s10"
	.byte	0x51
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x53
	.4byte	0x4a4
	.byte	0x7
	.4byte	.LASF49
	.byte	0x53
	.4byte	0xf2
	.byte	0x1
	.string	"s11"
	.byte	0x53
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x55
	.4byte	0x4bf
	.byte	0x7
	.4byte	.LASF50
	.byte	0x55
	.4byte	0xf2
	.byte	0x1
	.string	"t3"
	.byte	0x55
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x57
	.4byte	0x4da
	.byte	0x7
	.4byte	.LASF51
	.byte	0x57
	.4byte	0xf2
	.byte	0x1
	.string	"t4"
	.byte	0x57
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x59
	.4byte	0x4f5
	.byte	0x7
	.4byte	.LASF52
	.byte	0x59
	.4byte	0xf2
	.byte	0x1
	.string	"t5"
	.byte	0x59
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x4
	.byte	0x5b
	.4byte	0x510
	.byte	0x7
	.4byte	.LASF53
	.byte	0x5b
	.4byte	0xf2
	.byte	0x1
	.string	"t6"
	.byte	0x5b
	.byte	0x21
	.4byte	0xf2
	.byte	0
	.byte	0x18
	.4byte	.LASF54
	.byte	0xf8
	.byte	0x7
	.byte	0x1d
	.4byte	0x5d7
	.byte	0x5
	.4byte	0x1b6
	.byte	0
	.byte	0x5
	.4byte	0x1d2
	.byte	0x8
	.byte	0x5
	.4byte	0x1ee
	.byte	0x10
	.byte	0x5
	.4byte	0x20a
	.byte	0x18
	.byte	0x5
	.4byte	0x226
	.byte	0x20
	.byte	0x5
	.4byte	0x242
	.byte	0x28
	.byte	0x5
	.4byte	0x25e
	.byte	0x30
	.byte	0x5
	.4byte	0x27a
	.byte	0x38
	.byte	0x5
	.4byte	0x2a0
	.byte	0x40
	.byte	0x5
	.4byte	0x2bc
	.byte	0x48
	.byte	0x5
	.4byte	0x2d7
	.byte	0x50
	.byte	0x5
	.4byte	0x2f2
	.byte	0x58
	.byte	0x5
	.4byte	0x30d
	.byte	0x60
	.byte	0x5
	.4byte	0x328
	.byte	0x68
	.byte	0x5
	.4byte	0x343
	.byte	0x70
	.byte	0x5
	.4byte	0x35e
	.byte	0x78
	.byte	0x5
	.4byte	0x379
	.byte	0x80
	.byte	0x5
	.4byte	0x394
	.byte	0x88
	.byte	0x5
	.4byte	0x3af
	.byte	0x90
	.byte	0x5
	.4byte	0x3ca
	.byte	0x98
	.byte	0x5
	.4byte	0x3e5
	.byte	0xa0
	.byte	0x5
	.4byte	0x400
	.byte	0xa8
	.byte	0x5
	.4byte	0x41b
	.byte	0xb0
	.byte	0x5
	.4byte	0x436
	.byte	0xb8
	.byte	0x5
	.4byte	0x451
	.byte	0xc0
	.byte	0x5
	.4byte	0x46c
	.byte	0xc8
	.byte	0x5
	.4byte	0x488
	.byte	0xd0
	.byte	0x5
	.4byte	0x4a4
	.byte	0xd8
	.byte	0x5
	.4byte	0x4bf
	.byte	0xe0
	.byte	0x5
	.4byte	0x4da
	.byte	0xe8
	.byte	0x5
	.4byte	0x4f5
	.byte	0xf0
	.byte	0
	.byte	0x9
	.4byte	.LASF55
	.byte	0x7
	.byte	0x7f
	.byte	0x3
	.4byte	0x510
	.byte	0x2a
	.4byte	.LASF56
	.2byte	0x120
	.byte	0x7
	.byte	0x8e
	.byte	0x10
	.4byte	0x63c
	.byte	0xf
	.4byte	.LASF57
	.byte	0x7
	.byte	0x90
	.byte	0xc
	.4byte	0xf2
	.byte	0
	.byte	0xf
	.4byte	.LASF58
	.byte	0x7
	.byte	0x92
	.byte	0x12
	.4byte	0x5d7
	.byte	0x8
	.byte	0x1b
	.4byte	.LASF59
	.byte	0x94
	.4byte	0xf2
	.2byte	0x100
	.byte	0x1b
	.4byte	.LASF60
	.byte	0x96
	.4byte	0xf2
	.2byte	0x108
	.byte	0x1b
	.4byte	.LASF61
	.byte	0x98
	.4byte	0xf2
	.2byte	0x110
	.byte	0x1b
	.4byte	.LASF62
	.byte	0x9a
	.4byte	0xf2
	.2byte	0x118
	.byte	0
	.byte	0x9
	.4byte	.LASF63
	.byte	0x7
	.byte	0x9b
	.byte	0x3
	.4byte	0x5e3
	.byte	0xb
	.4byte	0x69
	.byte	0x9
	.4byte	.LASF64
	.byte	0x2
	.byte	0x1f
	.byte	0x13
	.4byte	0x659
	.byte	0xb
	.4byte	0x65e
	.byte	0x2b
	.4byte	0x88
	.4byte	0x66d
	.byte	0xa
	.4byte	0x66d
	.byte	0
	.byte	0xb
	.4byte	0x63c
	.byte	0x9
	.4byte	.LASF65
	.byte	0x8
	.byte	0x22
	.byte	0x1b
	.4byte	0x67e
	.byte	0x2c
	.byte	0x8
	.4byte	.LASF173
	.byte	0xc
	.4byte	0x62
	.4byte	0x68f
	.byte	0x2d
	.byte	0
	.byte	0x11
	.4byte	.LASF66
	.byte	0x4
	.byte	0x47
	.byte	0xd
	.4byte	0x684
	.byte	0x11
	.4byte	.LASF67
	.byte	0x4
	.byte	0x49
	.byte	0xf
	.4byte	0x6a7
	.byte	0xb
	.4byte	0x124
	.byte	0x18
	.4byte	.LASF68
	.byte	0x10
	.byte	0x4
	.byte	0x50
	.4byte	0x6d3
	.byte	0xf
	.4byte	.LASF69
	.byte	0x4
	.byte	0x51
	.byte	0x9
	.4byte	0xe6
	.byte	0
	.byte	0xf
	.4byte	.LASF70
	.byte	0x4
	.byte	0x52
	.byte	0x8
	.4byte	0x1b1
	.byte	0x8
	.byte	0
	.byte	0x9
	.4byte	.LASF71
	.byte	0x4
	.byte	0x53
	.byte	0x3
	.4byte	0x6ac
	.byte	0xd
	.4byte	0x6d3
	.byte	0xc
	.4byte	0x6df
	.4byte	0x6f4
	.byte	0x10
	.4byte	0x5b
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	0x6e4
	.byte	0x3
	.4byte	.LASF76
	.byte	0x4
	.byte	0x55
	.byte	0x1c
	.4byte	0x6f4
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0x18
	.4byte	.LASF72
	.byte	0x20
	.byte	0x4
	.byte	0x5f
	.4byte	0x750
	.byte	0xf
	.4byte	.LASF73
	.byte	0x4
	.byte	0x61
	.byte	0xb
	.4byte	0x4f
	.byte	0
	.byte	0x1a
	.string	"val"
	.byte	0x4
	.byte	0x63
	.byte	0xb
	.4byte	0x4f
	.byte	0x8
	.byte	0x1a
	.string	"set"
	.byte	0x4
	.byte	0x65
	.byte	0xe
	.4byte	0x648
	.byte	0x10
	.byte	0xf
	.4byte	.LASF74
	.byte	0x4
	.byte	0x67
	.byte	0xe
	.4byte	0x648
	.byte	0x18
	.byte	0
	.byte	0x9
	.4byte	.LASF75
	.byte	0x4
	.byte	0x68
	.byte	0x3
	.4byte	0x70f
	.byte	0xd
	.4byte	0x750
	.byte	0xc
	.4byte	0x75c
	.4byte	0x771
	.byte	0x10
	.4byte	0x5b
	.byte	0x8
	.byte	0
	.byte	0xd
	.4byte	0x761
	.byte	0x3
	.4byte	.LASF77
	.byte	0x4
	.byte	0x6a
	.byte	0x1d
	.4byte	0x771
	.byte	0x9
	.byte	0x3
	.8byte	prot_bits
	.byte	0x2e
	.4byte	0x69b
	.byte	0x5
	.byte	0x14
	.byte	0x8
	.byte	0x9
	.byte	0x3
	.8byte	kernel_pgd
	.byte	0x11
	.4byte	.LASF78
	.byte	0x5
	.byte	0x15
	.byte	0xd
	.4byte	0x684
	.byte	0x11
	.4byte	.LASF79
	.byte	0x5
	.byte	0x2e
	.byte	0xd
	.4byte	0x684
	.byte	0x11
	.4byte	.LASF80
	.byte	0x5
	.byte	0x2e
	.byte	0x1d
	.4byte	0x684
	.byte	0x11
	.4byte	.LASF81
	.byte	0x5
	.byte	0x2e
	.byte	0x28
	.4byte	0x684
	.byte	0x11
	.4byte	.LASF82
	.byte	0x5
	.byte	0x2e
	.byte	0x35
	.4byte	0x684
	.byte	0x11
	.4byte	.LASF83
	.byte	0x5
	.byte	0x2e
	.byte	0x3e
	.4byte	0x684
	.byte	0x18
	.4byte	.LASF84
	.byte	0x20
	.byte	0x5
	.byte	0x9e
	.4byte	0x827
	.byte	0x1a
	.string	"num"
	.byte	0x5
	.byte	0x9f
	.byte	0xc
	.4byte	0xc2
	.byte	0
	.byte	0xf
	.4byte	.LASF73
	.byte	0x5
	.byte	0xa0
	.byte	0xe
	.4byte	0x4f
	.byte	0x8
	.byte	0xf
	.4byte	.LASF70
	.byte	0x5
	.byte	0xa1
	.byte	0x11
	.4byte	0x648
	.byte	0x10
	.byte	0xf
	.4byte	.LASF77
	.byte	0x5
	.byte	0xa2
	.byte	0x1b
	.4byte	0x827
	.byte	0x18
	.byte	0
	.byte	0xb
	.4byte	0x75c
	.byte	0x9
	.4byte	.LASF85
	.byte	0x5
	.byte	0xa3
	.byte	0x3
	.4byte	0x7e6
	.byte	0xc
	.4byte	0x82c
	.4byte	0x848
	.byte	0x10
	.4byte	0x5b
	.byte	0x2
	.byte	0
	.byte	0x3
	.4byte	.LASF86
	.byte	0x5
	.byte	0xa5
	.byte	0x13
	.4byte	0x838
	.byte	0x9
	.byte	0x3
	.8byte	pg_levels
	.byte	0x2f
	.4byte	.LASF87
	.byte	0x5
	.2byte	0x127
	.byte	0xf
	.4byte	0xe6
	.4byte	0x875
	.byte	0xa
	.4byte	0x9b
	.byte	0
	.byte	0x1f
	.4byte	.LASF88
	.byte	0x9
	.byte	0x5b
	.4byte	0xc2
	.4byte	0x894
	.byte	0xa
	.4byte	0x1b1
	.byte	0xa
	.4byte	0x648
	.byte	0xa
	.4byte	0x672
	.byte	0
	.byte	0x24
	.4byte	.LASF89
	.2byte	0x1e6
	.byte	0x24
	.4byte	.LASF90
	.2byte	0x1de
	.byte	0x30
	.4byte	.LASF174
	.byte	0x2
	.byte	0x49
	.byte	0x6
	.4byte	0x8c3
	.byte	0xa
	.4byte	0x4f
	.byte	0xa
	.4byte	0x9b
	.byte	0xa
	.4byte	0x648
	.byte	0xa
	.4byte	0x64d
	.byte	0
	.byte	0x1f
	.4byte	.LASF91
	.byte	0xa
	.byte	0x43
	.4byte	0xc2
	.4byte	0x8d9
	.byte	0xa
	.4byte	0x648
	.byte	0x25
	.byte	0
	.byte	0x1f
	.4byte	.LASF92
	.byte	0xb
	.byte	0x20
	.4byte	0xc2
	.4byte	0x8f8
	.byte	0xa
	.4byte	0x8f8
	.byte	0xa
	.4byte	0xce
	.byte	0xa
	.4byte	0xc2
	.byte	0
	.byte	0x31
	.byte	0x8
	.byte	0x32
	.4byte	.LASF175
	.byte	0x5
	.2byte	0x18c
	.byte	0x7
	.4byte	0x990
	.8byte	.LFB53
	.8byte	.LFE53-.LFB53
	.byte	0x1
	.byte	0x9c
	.4byte	0x990
	.byte	0x2
	.4byte	.LASF93
	.byte	0x5
	.2byte	0x18c
	.byte	0x1c
	.4byte	0x124
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x20
	.string	"va"
	.2byte	0x18c
	.byte	0x2e
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x2
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x18c
	.byte	0x36
	.4byte	0x81
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x17
	.4byte	.LASF101
	.4byte	0x9a5
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0x19
	.string	"pte"
	.2byte	0x191
	.byte	0xb
	.4byte	0x990
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xe
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.byte	0x6
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x192
	.byte	0xe
	.4byte	0x81
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	0x182
	.byte	0xc
	.4byte	0x69
	.4byte	0x9a5
	.byte	0x10
	.4byte	0x5b
	.byte	0xe
	.byte	0
	.byte	0xd
	.4byte	0x995
	.byte	0x1c
	.4byte	.LASF107
	.2byte	0x16c
	.8byte	.LFB52
	.8byte	.LFE52-.LFB52
	.byte	0x1
	.byte	0x9c
	.4byte	0xa90
	.byte	0x20
	.string	"pgd"
	.2byte	0x16c
	.byte	0x1c
	.4byte	0x6a7
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x2
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x16c
	.byte	0x28
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x2
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x16c
	.byte	0x36
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x2
	.4byte	.LASF98
	.byte	0x5
	.2byte	0x16c
	.byte	0x46
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x2
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x16c
	.byte	0x5c
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x2
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x16c
	.byte	0x6f
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x17
	.4byte	.LASF101
	.4byte	0x9a5
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1
	.byte	0x6
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x171
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x172
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x6
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x174
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x6
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x177
	.byte	0x12
	.4byte	0xa90
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x179
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0xb
	.4byte	0x147
	.byte	0x1c
	.4byte	.LASF108
	.2byte	0x147
	.8byte	.LFB51
	.8byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0xbac
	.byte	0x2
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x147
	.byte	0x22
	.4byte	0xa90
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x2
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x147
	.byte	0x32
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x2
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x147
	.byte	0x42
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x2
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x147
	.byte	0x52
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x2
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x147
	.byte	0x69
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0x2
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x147
	.byte	0x7c
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0x6
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x14a
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x14b
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x6
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x14c
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x19
	.string	"pmd"
	.2byte	0x15a
	.byte	0xc
	.4byte	0xbac
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x6
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x15b
	.byte	0x12
	.4byte	0xbb1
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x15d
	.byte	0xc
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0xe
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.byte	0x6
	.4byte	.LASF112
	.byte	0x5
	.2byte	0x150
	.byte	0x10
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x6
	.4byte	.LASF113
	.byte	0x5
	.2byte	0x151
	.byte	0x19
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	0x153
	.byte	0xb
	.4byte	0x176
	.byte	0x1c
	.4byte	.LASF114
	.2byte	0x129
	.8byte	.LFB50
	.8byte	.LFE50-.LFB50
	.byte	0x1
	.byte	0x9c
	.4byte	0xcbb
	.byte	0x2
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x129
	.byte	0x22
	.4byte	0xbb1
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x2
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x129
	.byte	0x32
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x2
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x129
	.byte	0x42
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x2
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x129
	.byte	0x52
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x2
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x129
	.byte	0x69
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0x2
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x129
	.byte	0x7c
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0x6
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x12c
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x12d
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x6
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x12e
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x19
	.string	"pt"
	.2byte	0x13c
	.byte	0xb
	.4byte	0x990
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x6
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x13d
	.byte	0x11
	.4byte	0xcbb
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xe
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.byte	0x6
	.4byte	.LASF116
	.byte	0x5
	.2byte	0x132
	.byte	0x10
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x6
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x133
	.byte	0x19
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	0x1a5
	.byte	0x1c
	.4byte	.LASF118
	.2byte	0x114
	.8byte	.LFB49
	.8byte	.LFE49-.LFB49
	.byte	0x1
	.byte	0x9c
	.4byte	0xd6c
	.byte	0x20
	.string	"pgd"
	.2byte	0x114
	.byte	0x16
	.4byte	0x6a7
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x2
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x114
	.byte	0x22
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x2
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x114
	.byte	0x32
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x6
	.4byte	.LASF119
	.byte	0x5
	.2byte	0x115
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x6
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x116
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xe
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0x19
	.string	"i"
	.2byte	0x119
	.byte	0xe
	.4byte	0x81
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xe
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.byte	0x19
	.string	"j"
	.2byte	0x11b
	.byte	0x16
	.4byte	0x81
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF120
	.byte	0xff
	.8byte	.LFB48
	.8byte	.LFE48-.LFB48
	.byte	0x1
	.byte	0x9c
	.4byte	0xe0a
	.byte	0x12
	.string	"pgd"
	.byte	0x5
	.byte	0xff
	.byte	0x17
	.4byte	0x6a7
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x8
	.4byte	.LASF109
	.byte	0x5
	.byte	0xff
	.byte	0x23
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x8
	.4byte	.LASF98
	.byte	0x5
	.byte	0xff
	.byte	0x33
	.4byte	0xc2
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x6
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x100
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x101
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x102
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x6
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x105
	.byte	0x12
	.4byte	0xa90
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x17
	.4byte	.LASF101
	.4byte	0xe1a
	.byte	0x9
	.byte	0x3
	.8byte	__func__.2
	.byte	0
	.byte	0xc
	.4byte	0x69
	.4byte	0xe1a
	.byte	0x10
	.4byte	0x5b
	.byte	0x9
	.byte	0
	.byte	0xd
	.4byte	0xe0a
	.byte	0x14
	.4byte	.LASF121
	.byte	0xee
	.8byte	.LFB47
	.8byte	.LFE47-.LFB47
	.byte	0x1
	.byte	0x9c
	.4byte	0xea6
	.byte	0x12
	.string	"pmd"
	.byte	0x5
	.byte	0xee
	.byte	0x17
	.4byte	0xbac
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x8
	.4byte	.LASF109
	.byte	0x5
	.byte	0xee
	.byte	0x23
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x8
	.4byte	.LASF110
	.byte	0x5
	.byte	0xee
	.byte	0x33
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x3
	.4byte	.LASF103
	.byte	0x5
	.byte	0xef
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF104
	.byte	0x5
	.byte	0xf0
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF106
	.byte	0x5
	.byte	0xf1
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF111
	.byte	0x5
	.byte	0xf3
	.byte	0x12
	.4byte	0xbb1
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x14
	.4byte	.LASF122
	.byte	0xe2
	.8byte	.LFB46
	.8byte	.LFE46-.LFB46
	.byte	0x1
	.byte	0x9c
	.4byte	0xf1d
	.byte	0x12
	.string	"pt"
	.byte	0x5
	.byte	0xe2
	.byte	0x15
	.4byte	0x990
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x8
	.4byte	.LASF109
	.byte	0x5
	.byte	0xe2
	.byte	0x20
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x8
	.4byte	.LASF110
	.byte	0x5
	.byte	0xe2
	.byte	0x30
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x3
	.4byte	.LASF103
	.byte	0x5
	.byte	0xe3
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF104
	.byte	0x5
	.byte	0xe4
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF115
	.byte	0x5
	.byte	0xe6
	.byte	0x11
	.4byte	0xcbb
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x14
	.4byte	.LASF123
	.byte	0xb4
	.8byte	.LFB45
	.8byte	.LFE45-.LFB45
	.byte	0x1
	.byte	0x9c
	.4byte	0xfd5
	.byte	0x8
	.4byte	.LASF109
	.byte	0x5
	.byte	0xb4
	.byte	0x1e
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x8
	.4byte	.LASF110
	.byte	0x5
	.byte	0xb4
	.byte	0x2e
	.4byte	0xe6
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x8
	.4byte	.LASF95
	.byte	0x5
	.byte	0xb4
	.byte	0x3b
	.4byte	0x81
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0x8
	.4byte	.LASF124
	.byte	0x5
	.byte	0xb4
	.byte	0x4b
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x3
	.4byte	.LASF125
	.byte	0x5
	.byte	0xb5
	.byte	0x10
	.4byte	0xfd5
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x3
	.4byte	.LASF126
	.byte	0x5
	.byte	0xb7
	.byte	0x11
	.4byte	0x648
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF99
	.byte	0x5
	.byte	0xb9
	.byte	0xe
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF127
	.byte	0x5
	.byte	0xca
	.byte	0xe
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xe
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x15
	.string	"i"
	.byte	0x5
	.byte	0xbb
	.byte	0xe
	.4byte	0x81
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0x69
	.4byte	0xfe5
	.byte	0x10
	.4byte	0x5b
	.byte	0x4
	.byte	0
	.byte	0x14
	.4byte	.LASF128
	.byte	0xab
	.8byte	.LFB44
	.8byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0x106d
	.byte	0x8
	.4byte	.LASF99
	.byte	0x5
	.byte	0xab
	.byte	0x1d
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x8
	.4byte	.LASF129
	.byte	0x5
	.byte	0xab
	.byte	0x3d
	.4byte	0x827
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x12
	.string	"num"
	.byte	0x5
	.byte	0xab
	.byte	0x4a
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xe
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x15
	.string	"i"
	.byte	0x5
	.byte	0xad
	.byte	0xe
	.4byte	0x81
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xe
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.byte	0x15
	.string	"s"
	.byte	0x5
	.byte	0xae
	.byte	0x15
	.4byte	0x648
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0
	.byte	0x33
	.4byte	.LASF176
	.byte	0x5
	.byte	0x6e
	.byte	0x23
	.4byte	0x88
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.4byte	0x1130
	.byte	0x8
	.4byte	.LASF130
	.byte	0x5
	.byte	0x6e
	.byte	0x5a
	.4byte	0x66d
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x3
	.4byte	.LASF131
	.byte	0x5
	.byte	0x72
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.4byte	.LASF132
	.byte	0x5
	.byte	0x74
	.byte	0x9
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF133
	.byte	0x5
	.byte	0x75
	.byte	0x9
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF134
	.byte	0x5
	.byte	0x76
	.byte	0x9
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x3
	.4byte	.LASF135
	.byte	0x5
	.byte	0x77
	.byte	0x9
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x34
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x110e
	.byte	0x15
	.string	"__v"
	.byte	0x5
	.byte	0x72
	.byte	0x31
	.4byte	0x5b
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0xe
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x15
	.string	"max"
	.byte	0x5
	.byte	0x8e
	.byte	0x12
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF136
	.byte	0x53
	.8byte	.LFB42
	.8byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0x11ab
	.byte	0x17
	.4byte	.LASF101
	.4byte	0x11bb
	.byte	0x9
	.byte	0x3
	.8byte	__func__.4
	.byte	0x3
	.4byte	.LASF137
	.byte	0x5
	.byte	0x56
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF138
	.byte	0x5
	.byte	0x56
	.byte	0x18
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.4byte	.LASF98
	.byte	0x5
	.byte	0x56
	.byte	0x29
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF139
	.byte	0x5
	.byte	0x56
	.byte	0x2f
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF140
	.byte	0x5
	.byte	0x57
	.byte	0x15
	.4byte	0x118
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0xc
	.4byte	0x69
	.4byte	0x11bb
	.byte	0x10
	.4byte	0x5b
	.byte	0x13
	.byte	0
	.byte	0xd
	.4byte	0x11ab
	.byte	0x14
	.4byte	.LASF141
	.byte	0x30
	.8byte	.LFB41
	.8byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x126a
	.byte	0x17
	.4byte	.LASF101
	.4byte	0x127a
	.byte	0x9
	.byte	0x3
	.8byte	__func__.5
	.byte	0x3
	.4byte	.LASF137
	.byte	0x5
	.byte	0x33
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF138
	.byte	0x5
	.byte	0x33
	.byte	0x18
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.4byte	.LASF98
	.byte	0x5
	.byte	0x33
	.byte	0x29
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF139
	.byte	0x5
	.byte	0x33
	.byte	0x2f
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.4byte	.LASF142
	.byte	0x5
	.byte	0x39
	.byte	0x15
	.4byte	0x118
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x3
	.4byte	.LASF143
	.byte	0x5
	.byte	0x41
	.byte	0x15
	.4byte	0x118
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x3
	.4byte	.LASF144
	.byte	0x5
	.byte	0x47
	.byte	0x15
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x3
	.4byte	.LASF145
	.byte	0x5
	.byte	0x4d
	.byte	0x15
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0
	.byte	0xc
	.4byte	0x69
	.4byte	0x127a
	.byte	0x10
	.4byte	0x5b
	.byte	0x18
	.byte	0
	.byte	0xd
	.4byte	0x126a
	.byte	0x35
	.4byte	.LASF177
	.byte	0x5
	.byte	0x16
	.byte	0x6
	.8byte	.LFB40
	.8byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.byte	0x21
	.4byte	.LASF155
	.2byte	0x177
	.byte	0x16
	.4byte	0xe6
	.8byte	.LFB39
	.8byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x12fc
	.byte	0x2
	.4byte	.LASF109
	.byte	0x4
	.2byte	0x177
	.byte	0x2d
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2
	.4byte	.LASF110
	.byte	0x4
	.2byte	0x177
	.byte	0x3d
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x2
	.4byte	.LASF146
	.byte	0x4
	.2byte	0x177
	.byte	0x4b
	.4byte	0x9b
	.byte	0x2
	.byte	0x91
	.byte	0x5f
	.byte	0x6
	.4byte	.LASF147
	.byte	0x4
	.2byte	0x178
	.byte	0xc
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x22
	.4byte	.LASF150
	.2byte	0x167
	.8byte	.LFB38
	.8byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x134a
	.byte	0x2
	.4byte	.LASF115
	.byte	0x4
	.2byte	0x167
	.byte	0x2d
	.4byte	0xcbb
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x2
	.4byte	.LASF148
	.byte	0x4
	.2byte	0x167
	.byte	0x3c
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0x2
	.4byte	.LASF149
	.byte	0x4
	.2byte	0x167
	.byte	0x55
	.4byte	0x118
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.4byte	.LASF151
	.2byte	0x14f
	.8byte	.LFB36
	.8byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0x1398
	.byte	0x2
	.4byte	.LASF111
	.byte	0x4
	.2byte	0x14f
	.byte	0x2f
	.4byte	0xbb1
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x2
	.4byte	.LASF152
	.byte	0x4
	.2byte	0x14f
	.byte	0x3f
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0x2
	.4byte	.LASF117
	.byte	0x4
	.2byte	0x14f
	.byte	0x59
	.4byte	0x118
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.4byte	.LASF153
	.2byte	0x137
	.8byte	.LFB34
	.8byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0x13e6
	.byte	0x2
	.4byte	.LASF105
	.byte	0x4
	.2byte	0x137
	.byte	0x2f
	.4byte	0xa90
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x2
	.4byte	.LASF154
	.byte	0x4
	.2byte	0x137
	.byte	0x3f
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0x2
	.4byte	.LASF113
	.byte	0x4
	.2byte	0x137
	.byte	0x5a
	.4byte	0x118
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x21
	.4byte	.LASF156
	.2byte	0x120
	.byte	0x15
	.4byte	0x990
	.8byte	.LFB32
	.8byte	.LFE32-.LFB32
	.byte	0x1
	.byte	0x9c
	.4byte	0x1419
	.byte	0x2
	.4byte	.LASF111
	.byte	0x4
	.2byte	0x120
	.byte	0x29
	.4byte	0xbb1
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x21
	.4byte	.LASF157
	.2byte	0x117
	.byte	0x16
	.4byte	0xbac
	.8byte	.LFB31
	.8byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0x144c
	.byte	0x2
	.4byte	.LASF105
	.byte	0x4
	.2byte	0x117
	.byte	0x2b
	.4byte	0xa90
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x36
	.4byte	.LASF178
	.byte	0x4
	.2byte	0x10d
	.byte	0x16
	.4byte	0x6a7
	.8byte	.LFB30
	.8byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.byte	0x26
	.4byte	.LASF158
	.byte	0x4
	.byte	0xe4
	.byte	0x18
	.4byte	0xda
	.8byte	.LFB28
	.8byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x14ce
	.byte	0x8
	.4byte	.LASF96
	.byte	0x4
	.byte	0xe4
	.byte	0x27
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.string	"vpn"
	.byte	0x4
	.byte	0xe4
	.byte	0x32
	.4byte	0x81
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x3
	.4byte	.LASF159
	.byte	0x4
	.byte	0xe5
	.byte	0xe
	.4byte	0xda
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x17
	.4byte	.LASF101
	.4byte	0x14de
	.byte	0x9
	.byte	0x3
	.8byte	__func__.3
	.byte	0
	.byte	0xc
	.4byte	0x69
	.4byte	0x14de
	.byte	0x10
	.4byte	0x5b
	.byte	0x7
	.byte	0
	.byte	0xd
	.4byte	0x14ce
	.byte	0x37
	.4byte	.LASF160
	.byte	0x4
	.byte	0xcd
	.byte	0x16
	.4byte	0xe6
	.8byte	.LFB26
	.8byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x1524
	.byte	0x8
	.4byte	.LASF161
	.byte	0x4
	.byte	0xcd
	.byte	0x28
	.4byte	0xe6
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x8
	.4byte	.LASF162
	.byte	0x4
	.byte	0xcd
	.byte	0x33
	.4byte	0x9b
	.byte	0x2
	.byte	0x91
	.byte	0x77
	.byte	0
	.byte	0x38
	.4byte	.LASF163
	.byte	0x3
	.byte	0x1c
	.byte	0x14
	.8byte	.LFB25
	.8byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x15b4
	.byte	0x8
	.4byte	.LASF164
	.byte	0x3
	.byte	0x1c
	.byte	0x26
	.4byte	0x1b1
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x77
	.byte	0x8
	.4byte	.LASF165
	.byte	0x3
	.byte	0x1c
	.byte	0x34
	.4byte	0x81
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x77
	.byte	0x8
	.4byte	.LASF166
	.byte	0x3
	.byte	0x1c
	.byte	0x46
	.4byte	0x648
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x77
	.byte	0x8
	.4byte	.LASF167
	.byte	0x3
	.byte	0x1c
	.byte	0x58
	.4byte	0x648
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x77
	.byte	0x12
	.string	"msg"
	.byte	0x3
	.byte	0x1c
	.byte	0x6e
	.4byte	0x648
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0x25
	.byte	0x15
	.string	"buf"
	.byte	0x3
	.byte	0x22
	.byte	0xa
	.4byte	0x15b4
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x77
	.byte	0x3
	.4byte	.LASF168
	.byte	0x3
	.byte	0x23
	.byte	0xd
	.4byte	0x672
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x77
	.byte	0
	.byte	0xc
	.4byte	0x62
	.4byte	0x15c5
	.byte	0x39
	.4byte	0x5b
	.2byte	0x3ff
	.byte	0
	.byte	0x3a
	.4byte	.LASF169
	.byte	0x2
	.byte	0x2c
	.byte	0x14
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x1605
	.byte	0xe
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x15
	.string	"__v"
	.byte	0x2
	.byte	0x2d
	.byte	0x16
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x26
	.4byte	.LASF170
	.byte	0x1
	.byte	0xbc
	.byte	0x14
	.4byte	0x9b
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x1637
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0xbc
	.byte	0x2a
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x3b
	.4byte	.LASF171
	.byte	0x1
	.byte	0x36
	.byte	0x14
	.4byte	0x9b
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.byte	0x12
	.string	"val"
	.byte	0x1
	.byte	0x36
	.byte	0x2b
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x78
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
	.byte	0x7
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
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
	.byte	0x5
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
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x7
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xd
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x34
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x7
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x14
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x26
	.byte	0
	.byte	0x49
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x5
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
	.byte	0x16
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x5
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
	.byte	0x1a
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
	.byte	0x1b
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x7
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
	.byte	0x1c
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x5
	.byte	0x3b
	.byte	0x5
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
	.byte	0x1d
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0x21
	.byte	0x10
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0x21
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x20
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x5
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
	.byte	0x21
	.byte	0x2e
	.byte	0x1
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
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0x21
	.byte	0x14
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
	.byte	0x23
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x5
	.byte	0x39
	.byte	0x21
	.byte	0xd
	.byte	0x27
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x18
	.byte	0
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
	.byte	0x27
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
	.byte	0x28
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
	.byte	0x29
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
	.byte	0x2a
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
	.byte	0x2b
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2c
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2d
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2e
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2f
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
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x30
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
	.byte	0x31
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x32
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
	.byte	0x33
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x34
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
	.byte	0x35
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
	.byte	0x36
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
	.byte	0x37
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
	.byte	0x38
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
	.byte	0x39
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x3a
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
	.byte	0x3b
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
.LASF46:
	.string	"_x24"
.LASF47:
	.string	"_x25"
.LASF48:
	.string	"_x26"
.LASF49:
	.string	"_x27"
.LASF50:
	.string	"_x28"
.LASF51:
	.string	"_x29"
.LASF63:
	.string	"ktrapframe_t"
.LASF90:
	.string	"enable_vm_translation"
.LASF16:
	.string	"size_t"
.LASF162:
	.string	"next"
.LASF176:
	.string	"paging_load_page_fault_exception_handler"
.LASF170:
	.string	"is_leaf_page"
.LASF68:
	.string	"__addr_marker_t"
.LASF6:
	.string	"uint64_t"
.LASF126:
	.string	"unit"
.LASF110:
	.string	"e_vaddr"
.LASF136:
	.string	"create_mmio_mapping"
.LASF65:
	.string	"va_list"
.LASF77:
	.string	"prot_bits"
.LASF116:
	.string	"pt_ppage"
.LASF102:
	.string	"curr_ppage"
.LASF112:
	.string	"pmd_ppage"
.LASF161:
	.string	"addr"
.LASF31:
	.string	"pt_entry_t"
.LASF134:
	.string	"vpn0"
.LASF133:
	.string	"vpn1"
.LASF127:
	.string	"delta"
.LASF120:
	.string	"parse_pgd"
.LASF52:
	.string	"_x30"
.LASF53:
	.string	"_x31"
.LASF22:
	.string	"pgd_t"
.LASF71:
	.string	"addr_marker_t"
.LASF108:
	.string	"make_pgd_entry"
.LASF163:
	.string	"kpanic_spin"
.LASF62:
	.string	"origin_a0"
.LASF99:
	.string	"property"
.LASF12:
	.string	"long int"
.LASF169:
	.string	"supervisor_interrupt_disable"
.LASF97:
	.string	"paddr"
.LASF117:
	.string	"pt_prot"
.LASF172:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF15:
	.string	"True"
.LASF86:
	.string	"pg_levels"
.LASF166:
	.string	"func"
.LASF115:
	.string	"pt_ent"
.LASF111:
	.string	"pmd_ent"
.LASF25:
	.string	"pgd_entry_t"
.LASF78:
	.string	"trampoline"
.LASF79:
	.string	"_s_text_boot"
.LASF54:
	.string	"__gtrapframe_t"
.LASF28:
	.string	"pmd_entry_t"
.LASF158:
	.string	"get_vpn"
.LASF17:
	.string	"byte"
.LASF73:
	.string	"mask"
.LASF89:
	.string	"disable_vm_translation"
.LASF23:
	.string	"__page_property_t"
.LASF27:
	.string	"__pmd_entry_t"
.LASF4:
	.string	"unsigned int"
.LASF129:
	.string	"bits"
.LASF165:
	.string	"line"
.LASF67:
	.string	"kernel_pgd"
.LASF151:
	.string	"set_pmd_entry"
.LASF7:
	.string	"long unsigned int"
.LASF144:
	.string	"kheap_prot"
.LASF70:
	.string	"name"
.LASF157:
	.string	"get_pmd"
.LASF95:
	.string	"level"
.LASF98:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF150:
	.string	"set_pt_entry"
.LASF82:
	.string	"_e_bss"
.LASF156:
	.string	"get_pt"
.LASF56:
	.string	"__ktrapframe_t"
.LASF124:
	.string	"entry"
.LASF155:
	.string	"get_mapping_end"
.LASF60:
	.string	"sbadaddr"
.LASF160:
	.string	"page_align"
.LASF135:
	.string	"offs"
.LASF139:
	.string	"pages"
.LASF26:
	.string	"pmd_t"
.LASF174:
	.string	"register_ktrap_handler"
.LASF113:
	.string	"pmd_prot"
.LASF20:
	.string	"ireg_t"
.LASF123:
	.string	"print_page_table"
.LASF39:
	.string	"_x17"
.LASF164:
	.string	"filename"
.LASF93:
	.string	"pageTable"
.LASF96:
	.string	"vaddr"
.LASF106:
	.string	"next_vpage"
.LASF153:
	.string	"set_pgd_entry"
.LASF84:
	.string	"__pg_level_t"
.LASF109:
	.string	"s_vaddr"
.LASF14:
	.string	"False"
.LASF178:
	.string	"get_pgd"
.LASF105:
	.string	"pgd_ent"
.LASF122:
	.string	"parse_pt"
.LASF24:
	.string	"__pgd_entry_t"
.LASF125:
	.string	"size_units"
.LASF152:
	.string	"pt_paddr"
.LASF148:
	.string	"p_paddr"
.LASF94:
	.string	"alloc"
.LASF142:
	.string	"ktext_prot"
.LASF58:
	.string	"gregisters"
.LASF10:
	.string	"int32_t"
.LASF2:
	.string	"unsigned char"
.LASF114:
	.string	"make_pmd_entry"
.LASF80:
	.string	"_e_text"
.LASF137:
	.string	"start_addr"
.LASF9:
	.string	"short int"
.LASF92:
	.string	"memset"
.LASF119:
	.string	"start_vpage"
.LASF75:
	.string	"property_bit_t"
.LASF131:
	.string	"bad_addr"
.LASF81:
	.string	"_s_rodata"
.LASF167:
	.string	"condition"
.LASF101:
	.string	"__func__"
.LASF145:
	.string	"trampoline_prot"
.LASF72:
	.string	"__property_bit_t"
.LASF143:
	.string	"kdata_prot"
.LASF61:
	.string	"scause"
.LASF69:
	.string	"start_address"
.LASF74:
	.string	"clear"
.LASF83:
	.string	"_e_kernel"
.LASF8:
	.string	"char"
.LASF18:
	.string	"offset_t"
.LASF138:
	.string	"end_addr"
.LASF118:
	.string	"dump_pgd"
.LASF57:
	.string	"sepc"
.LASF76:
	.string	"address_markers"
.LASF85:
	.string	"pg_level_t"
.LASF173:
	.string	"__builtin_va_list"
.LASF147:
	.string	"boundary"
.LASF88:
	.string	"vsprintf"
.LASF175:
	.string	"get_level0_pte"
.LASF154:
	.string	"pmd_paddr"
.LASF128:
	.string	"dump_property"
.LASF132:
	.string	"vpn2"
.LASF177:
	.string	"paging_init"
.LASF140:
	.string	"mmioreg_prot"
.LASF103:
	.string	"curr_vpage"
.LASF30:
	.string	"__pt_entry_t"
.LASF32:
	.string	"_x10"
.LASF33:
	.string	"_x11"
.LASF34:
	.string	"_x12"
.LASF35:
	.string	"_x13"
.LASF36:
	.string	"_x14"
.LASF37:
	.string	"_x15"
.LASF38:
	.string	"_x16"
.LASF21:
	.string	"page_property_t"
.LASF40:
	.string	"_x18"
.LASF41:
	.string	"_x19"
.LASF141:
	.string	"create_identical_mapping"
.LASF107:
	.string	"create_mapping"
.LASF5:
	.string	"uint8_t"
.LASF29:
	.string	"pt_t"
.LASF100:
	.string	"flags"
.LASF59:
	.string	"sstatus"
.LASF121:
	.string	"parse_pmd"
.LASF91:
	.string	"kprintf"
.LASF104:
	.string	"end_vpage"
.LASF66:
	.string	"_s_kernel_pgd"
.LASF64:
	.string	"ktrap_handler_t"
.LASF149:
	.string	"p_prot"
.LASF171:
	.string	"is_valid_page"
.LASF87:
	.string	"alloc_ppage"
.LASF19:
	.string	"addr_t"
.LASF11:
	.string	"int64_t"
.LASF13:
	.string	"Bool"
.LASF146:
	.string	"pgd_entry"
.LASF168:
	.string	"args"
.LASF55:
	.string	"gtrapframe_t"
.LASF130:
	.string	"ktf_ptr"
.LASF159:
	.string	"result"
.LASF42:
	.string	"_x20"
.LASF43:
	.string	"_x21"
.LASF44:
	.string	"_x22"
.LASF45:
	.string	"_x23"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"kernel/paging.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
