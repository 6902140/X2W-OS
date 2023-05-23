	.file	"process.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "kernel/process.c"
	.align	2
	.type	supervisor_interrupt_disable, @function
supervisor_interrupt_disable:
.LFB1:
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
.LFE1:
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
.LFB10:
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
.LFE10:
	.size	kpanic_spin, .-kpanic_spin
	.align	2
	.type	r_sstatus, @function
r_sstatus:
.LFB15:
	.file 3 "include/riscv.h"
	.loc 3 53 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 55 3
 #APP
# 55 "include/riscv.h" 1
	csrr a5, sstatus
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 3 56 10
	ld	a5,8(sp)
	.loc 3 57 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	r_sstatus, .-r_sstatus
	.align	2
	.type	w_sstatus, @function
w_sstatus:
.LFB16:
	.loc 3 61 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 3 62 3
	ld	a5,8(sp)
 #APP
# 62 "include/riscv.h" 1
	csrw sstatus, a5
# 0 "" 2
	.loc 3 63 1
 #NO_APP
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	w_sstatus, .-w_sstatus
	.align	2
	.type	intr_on, @function
intr_on:
.LFB42:
	.loc 3 271 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 3 272 13
	call	r_sstatus
	mv	a5,a0
	.loc 3 272 3
	ori	a5,a5,2
	mv	a0,a5
	call	w_sstatus
	.loc 3 273 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	intr_on, .-intr_on
	.align	2
	.type	intr_off, @function
intr_off:
.LFB43:
	.loc 3 278 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 3 279 13
	call	r_sstatus
	mv	a5,a0
	.loc 3 279 3
	andi	a5,a5,-3
	mv	a0,a5
	call	w_sstatus
	.loc 3 280 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE43:
	.size	intr_off, .-intr_off
	.align	2
	.type	intr_get, @function
intr_get:
.LFB44:
	.loc 3 285 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 3 286 16
	call	r_sstatus
	sd	a0,8(sp)
	.loc 3 287 13
	ld	a5,8(sp)
	andi	a5,a5,2
	.loc 3 287 29
	snez	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	.loc 3 288 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE44:
	.size	intr_get, .-intr_get
	.align	2
	.type	read_tp, @function
read_tp:
.LFB50:
	.file 4 "include/process.h"
	.loc 4 131 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 4 133 3
 #APP
# 133 "include/process.h" 1
	mv a5, tp
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 4 134 10
	ld	a5,8(sp)
	.loc 4 135 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE50:
	.size	read_tp, .-read_tp
	.align	2
	.globl	push_off
	.type	push_off, @function
push_off:
.LFB51:
	.loc 4 138 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 4 139 13
	call	intr_get
	mv	a5,a0
	sw	a5,12(sp)
	.loc 4 141 3
	call	intr_off
	.loc 4 142 6
	call	mycpu
	mv	a5,a0
	.loc 4 142 13
	lw	a5,120(a5)
	.loc 4 142 5
	bne	a5,zero,.L14
	.loc 4 143 5
	call	mycpu
	mv	a4,a0
	.loc 4 143 21
	lw	a5,12(sp)
	sw	a5,124(a4)
.L14:
	.loc 4 144 3
	call	mycpu
	mv	a5,a0
	.loc 4 144 10
	lw	a4,120(a5)
	.loc 4 144 17
	addiw	a4,a4,1
	sext.w	a4,a4
	sw	a4,120(a5)
	.loc 4 145 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE51:
	.size	push_off, .-push_off
	.section	.rodata
	.align	3
.LC5:
	.string	"\"pop_off - interruptible\""
	.align	3
.LC6:
	.string	"!intr_get()"
	.align	3
.LC7:
	.string	"include/process.h"
	.align	3
.LC8:
	.string	"\"pop_off\""
	.align	3
.LC9:
	.string	"c->noff>=1"
	.text
	.align	2
	.globl	pop_off
	.type	pop_off, @function
pop_off:
.LFB52:
	.loc 4 148 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 4 149 19
	call	mycpu
	sd	a0,8(sp)
	.loc 4 152 8
	call	intr_get
	mv	a5,a0
	.loc 4 152 6
	beq	a5,zero,.L16
	.loc 4 152 29 discriminator 1
	lla	a4,.LC5
	lla	a3,.LC6
	lla	a2,__func__.1
	li	a1,152
	lla	a0,.LC7
	call	kpanic_spin
.L16:
	.loc 4 155 8
	ld	a5,8(sp)
	lw	a5,120(a5)
	.loc 4 155 6
	bgt	a5,zero,.L17
	.loc 4 155 28 discriminator 1
	lla	a4,.LC8
	lla	a3,.LC9
	lla	a2,__func__.1
	li	a1,155
	lla	a0,.LC7
	call	kpanic_spin
.L17:
	.loc 4 156 4
	ld	a5,8(sp)
	lw	a5,120(a5)
	.loc 4 156 11
	addiw	a5,a5,-1
	sext.w	a4,a5
	ld	a5,8(sp)
	sw	a4,120(a5)
	.loc 4 157 7
	ld	a5,8(sp)
	lw	a5,120(a5)
	.loc 4 157 5
	bne	a5,zero,.L19
	.loc 4 157 23 discriminator 1
	ld	a5,8(sp)
	lw	a5,124(a5)
	.loc 4 157 19 discriminator 1
	beq	a5,zero,.L19
	.loc 4 158 5
	call	intr_on
.L19:
	.loc 4 159 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE52:
	.size	pop_off, .-pop_off
	.section	.rodata
	.align	3
.LC10:
	.string	"Identical Mapping"
	.align	3
	.type	address_markers, @object
	.size	address_markers, 16
address_markers:
	.dword	0
	.dword	.LC10
	.align	3
.LC11:
	.string	"RSW"
	.align	3
.LC12:
	.string	".."
	.align	3
.LC13:
	.string	"D"
	.align	3
.LC14:
	.string	"."
	.align	3
.LC15:
	.string	"A"
	.align	3
.LC16:
	.string	"G"
	.align	3
.LC17:
	.string	"U"
	.align	3
.LC18:
	.string	"X"
	.align	3
.LC19:
	.string	"W"
	.align	3
.LC20:
	.string	"R"
	.align	3
.LC21:
	.string	"V"
	.align	3
	.type	prot_bits, @object
	.size	prot_bits, 288
prot_bits:
	.dword	768
	.dword	768
	.dword	.LC11
	.dword	.LC12
	.dword	128
	.dword	128
	.dword	.LC13
	.dword	.LC14
	.dword	64
	.dword	64
	.dword	.LC15
	.dword	.LC14
	.dword	32
	.dword	32
	.dword	.LC16
	.dword	.LC14
	.dword	16
	.dword	16
	.dword	.LC17
	.dword	.LC14
	.dword	8
	.dword	8
	.dword	.LC18
	.dword	.LC14
	.dword	4
	.dword	4
	.dword	.LC19
	.dword	.LC14
	.dword	2
	.dword	2
	.dword	.LC20
	.dword	.LC14
	.dword	1
	.dword	1
	.dword	.LC21
	.dword	.LC14
	.globl	cpus
	.bss
	.align	3
	.type	cpus, @object
	.size	cpus, 1024
cpus:
	.zero	1024
	.globl	processes
	.align	3
	.type	processes, @object
	.size	processes, 13824
processes:
	.zero	13824
	.globl	initproc
	.section	.sbss,"aw",@nobits
	.align	3
	.type	initproc, @object
	.size	initproc, 8
initproc:
	.zero	8
	.globl	nextpid
	.section	.sdata,"aw"
	.align	2
	.type	nextpid, @object
	.size	nextpid, 4
nextpid:
	.word	1
	.globl	pid_lock
	.bss
	.align	3
	.type	pid_lock, @object
	.size	pid_lock, 16
pid_lock:
	.zero	16
	.globl	wait_lock
	.align	3
	.type	wait_lock, @object
	.size	wait_lock, 16
wait_lock:
	.zero	16
	.section	.rodata
	.align	3
.LC22:
	.string	"\"process[%u] stack malloc error\\n\""
	.align	3
.LC23:
	.string	"pa!=0"
	.align	3
.LC24:
	.string	"kernel/process.c"
	.text
	.align	2
	.globl	process_statck_map
	.type	process_statck_map, @function
process_statck_map:
.LFB76:
	.file 5 "kernel/process.c"
	.loc 5 26 50
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 5 27 21
	lla	a5,processes
	sd	a5,40(sp)
	.loc 5 29 5
	j	.L21
.L23:
.LBB3:
	.loc 5 30 21
	li	a0,1
	call	alloc_ppage
	sd	a0,32(sp)
	.loc 5 31 12
	ld	a5,32(sp)
	bne	a5,zero,.L22
	.loc 5 31 29 discriminator 1
	ld	a5,40(sp)
	lla	a4,.LC22
	lla	a3,.LC23
	lla	a2,__func__.0
	li	a1,31
	lla	a0,.LC24
	call	kpanic_spin
.L22:
	.loc 5 32 73
	ld	a4,40(sp)
	lla	a5,processes
	sub	a5,a4,a5
	srai	a4,a5,3
	lla	a5,.LC25
	ld	a5,0(a5)
	mul	a5,a4,a5
	.loc 5 32 64
	sext.w	a5,a5
	.loc 5 32 86
	addiw	a5,a5,1
	sext.w	a5,a5
	.loc 5 32 92
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 5 32 60
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	sub	a5,a5,a4
	.loc 5 32 18
	sd	a5,24(sp)
	.loc 5 33 25
	li	a5,231
	sd	a5,16(sp)
	.loc 5 35 9
	li	a5,0
	ld	a4,16(sp)
	li	a3,4096
	ld	a2,32(sp)
	ld	a1,24(sp)
	ld	a0,8(sp)
	call	create_mapping
.LBE3:
	.loc 5 29 28
	ld	a5,40(sp)
	addi	a5,a5,216
	sd	a5,40(sp)
.L21:
	.loc 5 29 11 discriminator 1
	ld	a4,40(sp)
	lla	a5,processes+13824
	bltu	a4,a5,.L23
	.loc 5 37 1
	nop
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE76:
	.size	process_statck_map, .-process_statck_map
	.section	.rodata
	.align	3
.LC26:
	.string	"pid_alloctor"
	.align	3
.LC27:
	.string	"wait lock"
	.align	3
.LC28:
	.string	"processes"
	.text
	.align	2
	.globl	procinit
	.type	procinit, @function
procinit:
.LFB77:
	.loc 5 40 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 41 21
	lla	a5,processes
	sd	a5,8(sp)
	.loc 5 43 5
	lla	a1,.LC26
	lla	a0,pid_lock
	call	spinlock_init
	.loc 5 44 5
	lla	a1,.LC27
	lla	a0,wait_lock
	call	spinlock_init
	.loc 5 46 5
	j	.L25
.L26:
	.loc 5 49 9 discriminator 2
	ld	a5,8(sp)
	lla	a1,.LC28
	mv	a0,a5
	call	spinlock_init
	.loc 5 50 17 discriminator 2
	ld	a5,8(sp)
	sw	zero,16(a5)
	.loc 5 51 71 discriminator 2
	ld	a4,8(sp)
	lla	a5,processes
	sub	a5,a4,a5
	srai	a4,a5,3
	lla	a5,.LC25
	ld	a5,0(a5)
	mul	a5,a4,a5
	.loc 5 51 62 discriminator 2
	sext.w	a5,a5
	.loc 5 51 84 discriminator 2
	addiw	a5,a5,1
	sext.w	a5,a5
	.loc 5 51 90 discriminator 2
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 5 51 58 discriminator 2
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	sub	a5,a5,a4
	mv	a4,a5
	.loc 5 51 18 discriminator 2
	ld	a5,8(sp)
	sd	a4,56(a5)
	.loc 5 46 30 discriminator 2
	ld	a5,8(sp)
	addi	a5,a5,216
	sd	a5,8(sp)
.L25:
	.loc 5 46 11 discriminator 1
	ld	a4,8(sp)
	lla	a5,processes+13824
	bltu	a4,a5,.L26
	.loc 5 54 1
	nop
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE77:
	.size	procinit, .-procinit
	.align	2
	.globl	cpuid
	.type	cpuid, @function
cpuid:
.LFB78:
	.loc 5 57 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 58 12
	call	read_tp
	mv	a5,a0
	.loc 5 58 9
	sw	a5,12(sp)
	.loc 5 59 12
	lw	a5,12(sp)
	.loc 5 60 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE78:
	.size	cpuid, .-cpuid
	.align	2
	.globl	mycpu
	.type	mycpu, @function
mycpu:
.LFB79:
	.loc 5 62 24
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 63 12
	call	cpuid
	mv	a5,a0
	sw	a5,12(sp)
	.loc 5 64 17
	lw	a5,12(sp)
	slli	a4,a5,7
	lla	a5,cpus
	add	a5,a4,a5
	sd	a5,0(sp)
	.loc 5 65 12
	ld	a5,0(sp)
	.loc 5 66 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE79:
	.size	mycpu, .-mycpu
	.align	2
	.globl	myproc
	.type	myproc, @function
myproc:
.LFB80:
	.loc 5 68 29
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 69 5
	call	push_off
	.loc 5 70 23
	call	mycpu
	sd	a0,8(sp)
	.loc 5 71 20
	ld	a5,8(sp)
	ld	a5,0(a5)
	sd	a5,0(sp)
	.loc 5 72 5
	call	pop_off
	.loc 5 73 12
	ld	a5,0(sp)
	.loc 5 75 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE80:
	.size	myproc, .-myproc
	.section	.srodata,"a"
	.align	3
	.type	__func__.1, @object
	.size	__func__.1, 8
__func__.1:
	.string	"pop_off"
	.section	.rodata
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 19
__func__.0:
	.string	"process_statck_map"
	.align	3
.LC25:
	.dword	-8881765665119413741
	.text
.Letext0:
	.file 6 "include/types.h"
	.file 7 "include/kernel/locks.h"
	.file 8 "include/stdarg.h"
	.file 9 "include/asm/svxx.h"
	.file 10 "include/kernel/paging.h"
	.file 11 "include/kernel/mm.h"
	.file 12 "include/stdfmt.h"
	.file 13 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xb02
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x1a
	.4byte	.LASF92
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
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
	.byte	0x5
	.4byte	.LASF9
	.byte	0x6
	.byte	0x1a
	.byte	0x17
	.4byte	0x4f
	.byte	0x9
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0xa
	.4byte	0x56
	.byte	0x9
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1b
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x9
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x6
	.byte	0x23
	.byte	0x17
	.4byte	0x2e
	.byte	0x1c
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x6
	.byte	0x24
	.byte	0x6
	.4byte	0x9e
	.byte	0x7
	.4byte	.LASF11
	.byte	0
	.byte	0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	.LASF13
	.byte	0x6
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x5
	.4byte	.LASF14
	.byte	0x6
	.byte	0x33
	.byte	0x12
	.4byte	0x43
	.byte	0x5
	.4byte	.LASF15
	.byte	0x6
	.byte	0x3b
	.byte	0x13
	.4byte	0xc2
	.byte	0x6
	.4byte	0x43
	.byte	0xd
	.4byte	.LASF20
	.byte	0x10
	.byte	0x7
	.byte	0x1b
	.byte	0x10
	.4byte	0xef
	.byte	0x2
	.4byte	.LASF16
	.byte	0x7
	.byte	0x1d
	.byte	0xa
	.4byte	0x77
	.byte	0
	.byte	0x2
	.4byte	.LASF17
	.byte	0x7
	.byte	0x1f
	.byte	0xb
	.4byte	0xef
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0x56
	.byte	0x5
	.4byte	.LASF18
	.byte	0x7
	.byte	0x20
	.byte	0x3
	.4byte	0xc7
	.byte	0x6
	.4byte	0x5d
	.byte	0x5
	.4byte	.LASF19
	.byte	0x8
	.byte	0x22
	.byte	0x1b
	.4byte	0x111
	.byte	0x1d
	.byte	0x8
	.4byte	.LASF93
	.byte	0xd
	.4byte	.LASF21
	.byte	0x70
	.byte	0x4
	.byte	0x16
	.byte	0x8
	.4byte	0x1cf
	.byte	0x1
	.string	"ra"
	.byte	0x4
	.byte	0x17
	.byte	0xc
	.4byte	0x43
	.byte	0
	.byte	0x1
	.string	"sp"
	.byte	0x4
	.byte	0x18
	.byte	0xc
	.4byte	0x43
	.byte	0x8
	.byte	0x1
	.string	"s0"
	.byte	0x4
	.byte	0x1b
	.byte	0xc
	.4byte	0x43
	.byte	0x10
	.byte	0x1
	.string	"s1"
	.byte	0x4
	.byte	0x1c
	.byte	0xc
	.4byte	0x43
	.byte	0x18
	.byte	0x1
	.string	"s2"
	.byte	0x4
	.byte	0x1d
	.byte	0xc
	.4byte	0x43
	.byte	0x20
	.byte	0x1
	.string	"s3"
	.byte	0x4
	.byte	0x1e
	.byte	0xc
	.4byte	0x43
	.byte	0x28
	.byte	0x1
	.string	"s4"
	.byte	0x4
	.byte	0x1f
	.byte	0xc
	.4byte	0x43
	.byte	0x30
	.byte	0x1
	.string	"s5"
	.byte	0x4
	.byte	0x20
	.byte	0xc
	.4byte	0x43
	.byte	0x38
	.byte	0x1
	.string	"s6"
	.byte	0x4
	.byte	0x21
	.byte	0xc
	.4byte	0x43
	.byte	0x40
	.byte	0x1
	.string	"s7"
	.byte	0x4
	.byte	0x22
	.byte	0xc
	.4byte	0x43
	.byte	0x48
	.byte	0x1
	.string	"s8"
	.byte	0x4
	.byte	0x23
	.byte	0xc
	.4byte	0x43
	.byte	0x50
	.byte	0x1
	.string	"s9"
	.byte	0x4
	.byte	0x24
	.byte	0xc
	.4byte	0x43
	.byte	0x58
	.byte	0x1
	.string	"s10"
	.byte	0x4
	.byte	0x25
	.byte	0xc
	.4byte	0x43
	.byte	0x60
	.byte	0x1
	.string	"s11"
	.byte	0x4
	.byte	0x26
	.byte	0xc
	.4byte	0x43
	.byte	0x68
	.byte	0
	.byte	0x1e
	.string	"cpu"
	.byte	0x80
	.byte	0x4
	.byte	0x2a
	.byte	0x8
	.4byte	0x211
	.byte	0x2
	.4byte	.LASF22
	.byte	0x4
	.byte	0x2b
	.byte	0x13
	.4byte	0x2c7
	.byte	0
	.byte	0x2
	.4byte	.LASF21
	.byte	0x4
	.byte	0x2c
	.byte	0x12
	.4byte	0x117
	.byte	0x8
	.byte	0x2
	.4byte	.LASF23
	.byte	0x4
	.byte	0x2d
	.byte	0x7
	.4byte	0x69
	.byte	0x78
	.byte	0x2
	.4byte	.LASF24
	.byte	0x4
	.byte	0x2e
	.byte	0x7
	.4byte	0x69
	.byte	0x7c
	.byte	0
	.byte	0xd
	.4byte	.LASF25
	.byte	0xd8
	.byte	0x4
	.byte	0x69
	.byte	0x8
	.4byte	0x2c7
	.byte	0x2
	.4byte	.LASF26
	.byte	0x4
	.byte	0x6a
	.byte	0xe
	.4byte	0xf4
	.byte	0
	.byte	0x2
	.4byte	.LASF27
	.byte	0x4
	.byte	0x6d
	.byte	0x12
	.4byte	0x4aa
	.byte	0x10
	.byte	0x2
	.4byte	.LASF28
	.byte	0x4
	.byte	0x6e
	.byte	0x9
	.4byte	0x4e1
	.byte	0x18
	.byte	0x2
	.4byte	.LASF29
	.byte	0x4
	.byte	0x6f
	.byte	0x7
	.4byte	0x69
	.byte	0x20
	.byte	0x2
	.4byte	.LASF30
	.byte	0x4
	.byte	0x70
	.byte	0x7
	.4byte	0x69
	.byte	0x24
	.byte	0x1
	.string	"pid"
	.byte	0x4
	.byte	0x71
	.byte	0x7
	.4byte	0x69
	.byte	0x28
	.byte	0x2
	.4byte	.LASF31
	.byte	0x4
	.byte	0x74
	.byte	0x10
	.4byte	0x4e8
	.byte	0x30
	.byte	0x2
	.4byte	.LASF32
	.byte	0x4
	.byte	0x77
	.byte	0xc
	.4byte	0x43
	.byte	0x38
	.byte	0x1
	.string	"sz"
	.byte	0x4
	.byte	0x78
	.byte	0xc
	.4byte	0x43
	.byte	0x40
	.byte	0x2
	.4byte	.LASF33
	.byte	0x4
	.byte	0x79
	.byte	0xf
	.4byte	0xb6
	.byte	0x48
	.byte	0x2
	.4byte	.LASF34
	.byte	0x4
	.byte	0x7a
	.byte	0x15
	.4byte	0x4ed
	.byte	0x50
	.byte	0x2
	.4byte	.LASF21
	.byte	0x4
	.byte	0x7b
	.byte	0x12
	.4byte	0x117
	.byte	0x58
	.byte	0x2
	.4byte	.LASF17
	.byte	0x4
	.byte	0x7e
	.byte	0x8
	.4byte	0x4f2
	.byte	0xc8
	.byte	0
	.byte	0x6
	.4byte	0x211
	.byte	0x8
	.4byte	0x1cf
	.4byte	0x2dc
	.byte	0xb
	.4byte	0x4f
	.byte	0x7
	.byte	0
	.byte	0x1f
	.4byte	.LASF57
	.byte	0x4
	.byte	0x31
	.byte	0x13
	.4byte	0x2cc
	.byte	0x20
	.4byte	.LASF34
	.2byte	0x120
	.byte	0x4
	.byte	0x3f
	.byte	0x8
	.4byte	0x4aa
	.byte	0x2
	.4byte	.LASF35
	.byte	0x4
	.byte	0x40
	.byte	0x16
	.4byte	0x43
	.byte	0
	.byte	0x2
	.4byte	.LASF36
	.byte	0x4
	.byte	0x41
	.byte	0x16
	.4byte	0x43
	.byte	0x8
	.byte	0x2
	.4byte	.LASF37
	.byte	0x4
	.byte	0x42
	.byte	0x16
	.4byte	0x43
	.byte	0x10
	.byte	0x1
	.string	"epc"
	.byte	0x4
	.byte	0x43
	.byte	0x16
	.4byte	0x43
	.byte	0x18
	.byte	0x2
	.4byte	.LASF38
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.4byte	0x43
	.byte	0x20
	.byte	0x1
	.string	"ra"
	.byte	0x4
	.byte	0x45
	.byte	0x16
	.4byte	0x43
	.byte	0x28
	.byte	0x1
	.string	"sp"
	.byte	0x4
	.byte	0x46
	.byte	0x16
	.4byte	0x43
	.byte	0x30
	.byte	0x1
	.string	"gp"
	.byte	0x4
	.byte	0x47
	.byte	0x16
	.4byte	0x43
	.byte	0x38
	.byte	0x1
	.string	"tp"
	.byte	0x4
	.byte	0x48
	.byte	0x16
	.4byte	0x43
	.byte	0x40
	.byte	0x1
	.string	"t0"
	.byte	0x4
	.byte	0x49
	.byte	0x16
	.4byte	0x43
	.byte	0x48
	.byte	0x1
	.string	"t1"
	.byte	0x4
	.byte	0x4a
	.byte	0x16
	.4byte	0x43
	.byte	0x50
	.byte	0x1
	.string	"t2"
	.byte	0x4
	.byte	0x4b
	.byte	0x16
	.4byte	0x43
	.byte	0x58
	.byte	0x1
	.string	"s0"
	.byte	0x4
	.byte	0x4c
	.byte	0x16
	.4byte	0x43
	.byte	0x60
	.byte	0x1
	.string	"s1"
	.byte	0x4
	.byte	0x4d
	.byte	0x16
	.4byte	0x43
	.byte	0x68
	.byte	0x1
	.string	"a0"
	.byte	0x4
	.byte	0x4e
	.byte	0x16
	.4byte	0x43
	.byte	0x70
	.byte	0x1
	.string	"a1"
	.byte	0x4
	.byte	0x4f
	.byte	0x16
	.4byte	0x43
	.byte	0x78
	.byte	0x1
	.string	"a2"
	.byte	0x4
	.byte	0x50
	.byte	0x16
	.4byte	0x43
	.byte	0x80
	.byte	0x1
	.string	"a3"
	.byte	0x4
	.byte	0x51
	.byte	0x16
	.4byte	0x43
	.byte	0x88
	.byte	0x1
	.string	"a4"
	.byte	0x4
	.byte	0x52
	.byte	0x16
	.4byte	0x43
	.byte	0x90
	.byte	0x1
	.string	"a5"
	.byte	0x4
	.byte	0x53
	.byte	0x16
	.4byte	0x43
	.byte	0x98
	.byte	0x1
	.string	"a6"
	.byte	0x4
	.byte	0x54
	.byte	0x16
	.4byte	0x43
	.byte	0xa0
	.byte	0x1
	.string	"a7"
	.byte	0x4
	.byte	0x55
	.byte	0x16
	.4byte	0x43
	.byte	0xa8
	.byte	0x1
	.string	"s2"
	.byte	0x4
	.byte	0x56
	.byte	0x16
	.4byte	0x43
	.byte	0xb0
	.byte	0x1
	.string	"s3"
	.byte	0x4
	.byte	0x57
	.byte	0x16
	.4byte	0x43
	.byte	0xb8
	.byte	0x1
	.string	"s4"
	.byte	0x4
	.byte	0x58
	.byte	0x16
	.4byte	0x43
	.byte	0xc0
	.byte	0x1
	.string	"s5"
	.byte	0x4
	.byte	0x59
	.byte	0x16
	.4byte	0x43
	.byte	0xc8
	.byte	0x1
	.string	"s6"
	.byte	0x4
	.byte	0x5a
	.byte	0x16
	.4byte	0x43
	.byte	0xd0
	.byte	0x1
	.string	"s7"
	.byte	0x4
	.byte	0x5b
	.byte	0x16
	.4byte	0x43
	.byte	0xd8
	.byte	0x1
	.string	"s8"
	.byte	0x4
	.byte	0x5c
	.byte	0x16
	.4byte	0x43
	.byte	0xe0
	.byte	0x1
	.string	"s9"
	.byte	0x4
	.byte	0x5d
	.byte	0x16
	.4byte	0x43
	.byte	0xe8
	.byte	0x1
	.string	"s10"
	.byte	0x4
	.byte	0x5e
	.byte	0x16
	.4byte	0x43
	.byte	0xf0
	.byte	0x1
	.string	"s11"
	.byte	0x4
	.byte	0x5f
	.byte	0x16
	.4byte	0x43
	.byte	0xf8
	.byte	0x10
	.string	"t3"
	.byte	0x60
	.4byte	0x43
	.2byte	0x100
	.byte	0x10
	.string	"t4"
	.byte	0x61
	.4byte	0x43
	.2byte	0x108
	.byte	0x10
	.string	"t5"
	.byte	0x62
	.4byte	0x43
	.2byte	0x110
	.byte	0x10
	.string	"t6"
	.byte	0x63
	.4byte	0x43
	.2byte	0x118
	.byte	0
	.byte	0x21
	.4byte	.LASF94
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x4
	.byte	0x66
	.byte	0x6
	.4byte	0x4e1
	.byte	0x7
	.4byte	.LASF39
	.byte	0
	.byte	0x7
	.4byte	.LASF40
	.byte	0x1
	.byte	0x7
	.4byte	.LASF41
	.byte	0x2
	.byte	0x7
	.4byte	.LASF42
	.byte	0x3
	.byte	0x7
	.4byte	.LASF43
	.byte	0x4
	.byte	0x7
	.4byte	.LASF44
	.byte	0x5
	.byte	0
	.byte	0x22
	.byte	0x8
	.byte	0x23
	.4byte	.LASF22
	.byte	0x6
	.4byte	0x4e3
	.byte	0x6
	.4byte	0x2e8
	.byte	0x8
	.4byte	0x56
	.4byte	0x502
	.byte	0xb
	.4byte	0x4f
	.byte	0xf
	.byte	0
	.byte	0xd
	.4byte	.LASF45
	.byte	0x8
	.byte	0x9
	.byte	0x24
	.byte	0x10
	.4byte	0x51d
	.byte	0x1
	.string	"val"
	.byte	0x9
	.byte	0x25
	.byte	0xe
	.4byte	0x43
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LASF46
	.byte	0x9
	.byte	0x26
	.byte	0x3
	.4byte	0x502
	.byte	0x24
	.4byte	.LASF47
	.byte	0x9
	.2byte	0x16d
	.byte	0x10
	.4byte	0xaa
	.byte	0x6
	.4byte	0x529
	.byte	0xd
	.4byte	.LASF48
	.byte	0x10
	.byte	0xa
	.byte	0x50
	.byte	0x10
	.4byte	0x563
	.byte	0x2
	.4byte	.LASF49
	.byte	0xa
	.byte	0x51
	.byte	0x9
	.4byte	0xaa
	.byte	0
	.byte	0x2
	.4byte	.LASF17
	.byte	0xa
	.byte	0x52
	.byte	0x8
	.4byte	0xef
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	.LASF50
	.byte	0xa
	.byte	0x53
	.byte	0x3
	.4byte	0x53b
	.byte	0xa
	.4byte	0x563
	.byte	0x8
	.4byte	0x56f
	.4byte	0x584
	.byte	0xb
	.4byte	0x4f
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	0x574
	.byte	0xc
	.4byte	.LASF55
	.byte	0xa
	.byte	0x55
	.byte	0x1c
	.4byte	0x584
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0xd
	.4byte	.LASF51
	.byte	0x20
	.byte	0xa
	.byte	0x5f
	.byte	0x10
	.4byte	0x5e1
	.byte	0x2
	.4byte	.LASF52
	.byte	0xa
	.byte	0x61
	.byte	0xb
	.4byte	0x43
	.byte	0
	.byte	0x1
	.string	"val"
	.byte	0xa
	.byte	0x63
	.byte	0xb
	.4byte	0x43
	.byte	0x8
	.byte	0x1
	.string	"set"
	.byte	0xa
	.byte	0x65
	.byte	0xe
	.4byte	0x100
	.byte	0x10
	.byte	0x2
	.4byte	.LASF53
	.byte	0xa
	.byte	0x67
	.byte	0xe
	.4byte	0x100
	.byte	0x18
	.byte	0
	.byte	0x5
	.4byte	.LASF54
	.byte	0xa
	.byte	0x68
	.byte	0x3
	.4byte	0x59f
	.byte	0xa
	.4byte	0x5e1
	.byte	0x8
	.4byte	0x5ed
	.4byte	0x602
	.byte	0xb
	.4byte	0x4f
	.byte	0x8
	.byte	0
	.byte	0xa
	.4byte	0x5f2
	.byte	0xc
	.4byte	.LASF56
	.byte	0xa
	.byte	0x6a
	.byte	0x1d
	.4byte	0x602
	.byte	0x9
	.byte	0x3
	.8byte	prot_bits
	.byte	0x25
	.4byte	0x2dc
	.byte	0x5
	.byte	0x5
	.byte	0xc
	.byte	0x9
	.byte	0x3
	.8byte	cpus
	.byte	0x8
	.4byte	0x211
	.4byte	0x63f
	.byte	0xb
	.4byte	0x4f
	.byte	0x3f
	.byte	0
	.byte	0xe
	.4byte	.LASF58
	.byte	0x7
	.byte	0x10
	.4byte	0x62f
	.byte	0x9
	.byte	0x3
	.8byte	processes
	.byte	0xe
	.4byte	.LASF59
	.byte	0x9
	.byte	0x11
	.4byte	0x2c7
	.byte	0x9
	.byte	0x3
	.8byte	initproc
	.byte	0xe
	.4byte	.LASF60
	.byte	0xb
	.byte	0x5
	.4byte	0x69
	.byte	0x9
	.byte	0x3
	.8byte	nextpid
	.byte	0xe
	.4byte	.LASF61
	.byte	0xd
	.byte	0xc
	.4byte	0xf4
	.byte	0x9
	.byte	0x3
	.8byte	pid_lock
	.byte	0xe
	.4byte	.LASF62
	.byte	0x13
	.byte	0xc
	.4byte	0xf4
	.byte	0x9
	.byte	0x3
	.8byte	wait_lock
	.byte	0x26
	.4byte	.LASF63
	.byte	0x7
	.byte	0x29
	.byte	0x6
	.4byte	0x6bf
	.byte	0x3
	.4byte	0x6bf
	.byte	0x3
	.4byte	0xef
	.byte	0
	.byte	0x6
	.4byte	0xf4
	.byte	0x27
	.4byte	.LASF64
	.byte	0xa
	.2byte	0x1c8
	.byte	0x6
	.4byte	0x6f0
	.byte	0x3
	.4byte	0x536
	.byte	0x3
	.4byte	0xaa
	.byte	0x3
	.4byte	0xaa
	.byte	0x3
	.4byte	0x43
	.byte	0x3
	.4byte	0x51d
	.byte	0x3
	.4byte	0x43
	.byte	0
	.byte	0x12
	.4byte	.LASF65
	.byte	0xb
	.byte	0x6b
	.4byte	0xaa
	.4byte	0x705
	.byte	0x3
	.4byte	0x77
	.byte	0
	.byte	0x12
	.4byte	.LASF66
	.byte	0xc
	.byte	0x5b
	.4byte	0x9e
	.4byte	0x724
	.byte	0x3
	.4byte	0xef
	.byte	0x3
	.4byte	0x100
	.byte	0x3
	.4byte	0x105
	.byte	0
	.byte	0x12
	.4byte	.LASF67
	.byte	0xd
	.byte	0x43
	.4byte	0x9e
	.4byte	0x73a
	.byte	0x3
	.4byte	0x100
	.byte	0x14
	.byte	0
	.byte	0x13
	.4byte	.LASF70
	.byte	0x44
	.byte	0x11
	.4byte	0x2c7
	.8byte	.LFB80
	.8byte	.LFE80-.LFB80
	.byte	0x1
	.byte	0x9c
	.4byte	0x77a
	.byte	0xc
	.4byte	.LASF68
	.byte	0x5
	.byte	0x46
	.byte	0x11
	.4byte	0x77a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xc
	.4byte	.LASF69
	.byte	0x5
	.byte	0x47
	.byte	0x14
	.4byte	0x2c7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x6
	.4byte	0x1cf
	.byte	0x13
	.4byte	.LASF71
	.byte	0x3e
	.byte	0xd
	.4byte	0x77a
	.8byte	.LFB79
	.8byte	.LFE79-.LFB79
	.byte	0x1
	.byte	0x9c
	.4byte	0x7be
	.byte	0x4
	.string	"id"
	.byte	0x5
	.byte	0x3f
	.byte	0x9
	.4byte	0x69
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xc
	.4byte	.LASF68
	.byte	0x5
	.byte	0x40
	.byte	0x11
	.4byte	0x77a
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x13
	.4byte	.LASF72
	.byte	0x38
	.byte	0x5
	.4byte	0x69
	.8byte	.LFB78
	.8byte	.LFE78-.LFB78
	.byte	0x1
	.byte	0x9c
	.4byte	0x7ee
	.byte	0x4
	.string	"id"
	.byte	0x5
	.byte	0x3a
	.byte	0x9
	.4byte	0x69
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x11
	.4byte	.LASF73
	.byte	0x5
	.byte	0x27
	.8byte	.LFB77
	.8byte	.LFE77-.LFB77
	.byte	0x1
	.byte	0x9c
	.4byte	0x819
	.byte	0x4
	.string	"p"
	.byte	0x5
	.byte	0x29
	.byte	0x15
	.4byte	0x2c7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x11
	.4byte	.LASF74
	.byte	0x5
	.byte	0x1a
	.8byte	.LFB76
	.8byte	.LFE76-.LFB76
	.byte	0x1
	.byte	0x9c
	.4byte	0x8a3
	.byte	0xf
	.4byte	.LASF83
	.byte	0x5
	.byte	0x1a
	.byte	0x25
	.4byte	0xb6
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x4
	.string	"p"
	.byte	0x5
	.byte	0x1b
	.byte	0x15
	.4byte	0x2c7
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x15
	.4byte	.LASF77
	.4byte	0x8b3
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0x16
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x4
	.string	"pa"
	.byte	0x5
	.byte	0x1e
	.byte	0x12
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x4
	.string	"va"
	.byte	0x5
	.byte	0x20
	.byte	0x12
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xc
	.4byte	.LASF75
	.byte	0x5
	.byte	0x21
	.byte	0x19
	.4byte	0x51d
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	0x5d
	.4byte	0x8b3
	.byte	0xb
	.4byte	0x4f
	.byte	0x12
	.byte	0
	.byte	0xa
	.4byte	0x8a3
	.byte	0x11
	.4byte	.LASF76
	.byte	0x4
	.byte	0x93
	.8byte	.LFB52
	.8byte	.LFE52-.LFB52
	.byte	0x1
	.byte	0x9c
	.4byte	0x8f6
	.byte	0x4
	.string	"c"
	.byte	0x4
	.byte	0x95
	.byte	0xf
	.4byte	0x77a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x15
	.4byte	.LASF77
	.4byte	0x906
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1
	.byte	0
	.byte	0x8
	.4byte	0x5d
	.4byte	0x906
	.byte	0xb
	.4byte	0x4f
	.byte	0x7
	.byte	0
	.byte	0xa
	.4byte	0x8f6
	.byte	0x11
	.4byte	.LASF78
	.byte	0x4
	.byte	0x89
	.8byte	.LFB51
	.8byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0x938
	.byte	0x4
	.string	"old"
	.byte	0x4
	.byte	0x8b
	.byte	0x7
	.4byte	0x69
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x17
	.4byte	.LASF79
	.byte	0x4
	.byte	0x82
	.byte	0x18
	.4byte	0x43
	.8byte	.LFB50
	.8byte	.LFE50-.LFB50
	.byte	0x1
	.byte	0x9c
	.4byte	0x968
	.byte	0x4
	.string	"x"
	.byte	0x4
	.byte	0x84
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x28
	.4byte	.LASF80
	.byte	0x3
	.2byte	0x11c
	.byte	0x1
	.4byte	0x69
	.8byte	.LFB44
	.8byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0x99a
	.byte	0x29
	.string	"x"
	.byte	0x3
	.2byte	0x11e
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x18
	.4byte	.LASF81
	.2byte	0x115
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.byte	0x18
	.4byte	.LASF82
	.2byte	0x10e
	.8byte	.LFB42
	.8byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.byte	0x2a
	.4byte	.LASF85
	.byte	0x3
	.byte	0x3c
	.byte	0x1
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x9f8
	.byte	0x19
	.string	"x"
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x17
	.4byte	.LASF84
	.byte	0x3
	.byte	0x34
	.byte	0x1
	.4byte	0x43
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0xa28
	.byte	0x4
	.string	"x"
	.byte	0x3
	.byte	0x36
	.byte	0xc
	.4byte	0x43
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x2b
	.4byte	.LASF86
	.byte	0x2
	.byte	0x1c
	.byte	0x14
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xab8
	.byte	0xf
	.4byte	.LASF87
	.byte	0x2
	.byte	0x1c
	.byte	0x26
	.4byte	0xef
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x77
	.byte	0xf
	.4byte	.LASF88
	.byte	0x2
	.byte	0x1c
	.byte	0x34
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x77
	.byte	0xf
	.4byte	.LASF89
	.byte	0x2
	.byte	0x1c
	.byte	0x46
	.4byte	0x100
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x77
	.byte	0xf
	.4byte	.LASF90
	.byte	0x2
	.byte	0x1c
	.byte	0x58
	.4byte	0x100
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x77
	.byte	0x19
	.string	"msg"
	.byte	0x2
	.byte	0x1c
	.byte	0x6e
	.4byte	0x100
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0x14
	.byte	0x4
	.string	"buf"
	.byte	0x2
	.byte	0x22
	.byte	0xa
	.4byte	0xab8
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x77
	.byte	0xc
	.4byte	.LASF91
	.byte	0x2
	.byte	0x23
	.byte	0xd
	.4byte	0x105
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x77
	.byte	0
	.byte	0x8
	.4byte	0x56
	.4byte	0xac9
	.byte	0x2c
	.4byte	0x4f
	.2byte	0x3ff
	.byte	0
	.byte	0x2d
	.4byte	.LASF95
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x16
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x2d
	.byte	0x16
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x78
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
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x5
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
	.byte	0x10
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x16
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
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
	.byte	0x13
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
	.byte	0x14
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0x21
	.byte	0x1
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
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
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
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
	.byte	0x22
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x2e
	.byte	0x1
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
	.byte	0x29
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
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
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0x2c
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
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
.LASF63:
	.string	"spinlock_init"
.LASF40:
	.string	"_USED"
.LASF93:
	.string	"__builtin_va_list"
.LASF13:
	.string	"size_t"
.LASF9:
	.string	"uint64_t"
.LASF19:
	.string	"va_list"
.LASF56:
	.string	"prot_bits"
.LASF35:
	.string	"kernel_satp"
.LASF90:
	.string	"condition"
.LASF78:
	.string	"push_off"
.LASF62:
	.string	"wait_lock"
.LASF41:
	.string	"SLEEPING"
.LASF47:
	.string	"pgd_t"
.LASF50:
	.string	"addr_marker_t"
.LASF86:
	.string	"kpanic_spin"
.LASF76:
	.string	"pop_off"
.LASF31:
	.string	"parent"
.LASF54:
	.string	"property_bit_t"
.LASF27:
	.string	"state"
.LASF8:
	.string	"long int"
.LASF95:
	.string	"supervisor_interrupt_disable"
.LASF72:
	.string	"cpuid"
.LASF92:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF12:
	.string	"True"
.LASF59:
	.string	"initproc"
.LASF18:
	.string	"spinlock_t"
.LASF25:
	.string	"process"
.LASF45:
	.string	"__page_property_t"
.LASF4:
	.string	"unsigned int"
.LASF15:
	.string	"pagetable_t"
.LASF22:
	.string	"proc"
.LASF5:
	.string	"long unsigned int"
.LASF17:
	.string	"name"
.LASF42:
	.string	"RUNNABLE"
.LASF3:
	.string	"short unsigned int"
.LASF37:
	.string	"kernel_trap"
.LASF57:
	.string	"cpus"
.LASF81:
	.string	"intr_off"
.LASF29:
	.string	"killed"
.LASF94:
	.string	"procstate"
.LASF36:
	.string	"kernel_sp"
.LASF34:
	.string	"trapframe"
.LASF44:
	.string	"ZOMBIE"
.LASF53:
	.string	"clear"
.LASF87:
	.string	"filename"
.LASF16:
	.string	"locked"
.LASF11:
	.string	"False"
.LASF70:
	.string	"myproc"
.LASF83:
	.string	"kernel_pgdir"
.LASF58:
	.string	"processes"
.LASF39:
	.string	"_UNUSED"
.LASF32:
	.string	"kstack"
.LASF33:
	.string	"pagetable"
.LASF2:
	.string	"unsigned char"
.LASF30:
	.string	"xstate"
.LASF52:
	.string	"mask"
.LASF7:
	.string	"short int"
.LASF82:
	.string	"intr_on"
.LASF24:
	.string	"intena"
.LASF43:
	.string	"RUNNING"
.LASF77:
	.string	"__func__"
.LASF51:
	.string	"__property_bit_t"
.LASF71:
	.string	"mycpu"
.LASF49:
	.string	"start_address"
.LASF74:
	.string	"process_statck_map"
.LASF28:
	.string	"chan"
.LASF6:
	.string	"char"
.LASF89:
	.string	"func"
.LASF68:
	.string	"tempc"
.LASF80:
	.string	"intr_get"
.LASF55:
	.string	"address_markers"
.LASF88:
	.string	"line"
.LASF66:
	.string	"vsprintf"
.LASF21:
	.string	"context"
.LASF60:
	.string	"nextpid"
.LASF61:
	.string	"pid_lock"
.LASF73:
	.string	"procinit"
.LASF79:
	.string	"read_tp"
.LASF46:
	.string	"page_property_t"
.LASF85:
	.string	"w_sstatus"
.LASF64:
	.string	"create_mapping"
.LASF84:
	.string	"r_sstatus"
.LASF48:
	.string	"__addr_marker_t"
.LASF67:
	.string	"kprintf"
.LASF23:
	.string	"noff"
.LASF38:
	.string	"kernel_hartid"
.LASF65:
	.string	"alloc_ppage"
.LASF14:
	.string	"addr_t"
.LASF10:
	.string	"Bool"
.LASF75:
	.string	"pproperty"
.LASF91:
	.string	"args"
.LASF26:
	.string	"lock"
.LASF20:
	.string	"__spinlock_t"
.LASF69:
	.string	"tempp"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"kernel/process.c"
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
	.ident	"GCC: (g) 12.2.0"
