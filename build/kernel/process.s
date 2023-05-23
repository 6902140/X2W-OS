	.file	"process.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "kernel/process.c"
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
	.loc 3 57 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 59 3
 #APP
# 59 "include/riscv.h" 1
	csrr a5, sstatus
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 3 60 10
	ld	a5,8(sp)
	.loc 3 61 1
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
	.loc 3 65 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 3 66 3
	ld	a5,8(sp)
 #APP
# 66 "include/riscv.h" 1
	csrw sstatus, a5
# 0 "" 2
	.loc 3 67 1
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
	.loc 3 275 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 3 276 13
	call	r_sstatus
	mv	a5,a0
	.loc 3 276 3
	ori	a5,a5,2
	mv	a0,a5
	call	w_sstatus
	.loc 3 277 1
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
	.loc 3 282 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 3 283 13
	call	r_sstatus
	mv	a5,a0
	.loc 3 283 3
	andi	a5,a5,-3
	mv	a0,a5
	call	w_sstatus
	.loc 3 284 1
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
	.loc 3 289 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 3 290 16
	call	r_sstatus
	sd	a0,8(sp)
	.loc 3 291 13
	ld	a5,8(sp)
	andi	a5,a5,2
	.loc 3 291 29
	snez	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	.loc 3 292 1
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
	.loc 4 150 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 4 152 3
 #APP
# 152 "include/process.h" 1
	mv a5, tp
# 0 "" 2
 #NO_APP
	sd	a5,8(sp)
	.loc 4 153 10
	ld	a5,8(sp)
	.loc 4 154 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE50:
	.size	read_tp, .-read_tp
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
.LC17:
	.string	"\"process[%u] stack malloc error\\n\""
	.align	3
.LC18:
	.string	"pa!=0"
	.align	3
.LC19:
	.string	"kernel/process.c"
	.text
	.align	2
	.globl	process_statck_map
	.type	process_statck_map, @function
process_statck_map:
.LFB74:
	.file 5 "kernel/process.c"
	.loc 5 31 50
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 5 32 21
	lla	a5,processes
	sd	a5,40(sp)
	.loc 5 34 5
	j	.L14
.L16:
.LBB3:
	.loc 5 35 21
	li	a0,1
	call	alloc_ppage
	sd	a0,32(sp)
	.loc 5 36 12
	ld	a5,32(sp)
	bne	a5,zero,.L15
	.loc 5 36 29 discriminator 1
	ld	a5,40(sp)
	lla	a4,.LC17
	lla	a3,.LC18
	lla	a2,__func__.1
	li	a1,36
	lla	a0,.LC19
	call	kpanic_spin
.L15:
	.loc 5 37 73
	ld	a4,40(sp)
	lla	a5,processes
	sub	a5,a4,a5
	srai	a4,a5,3
	lla	a5,.LC20
	ld	a5,0(a5)
	mul	a5,a4,a5
	.loc 5 37 64
	sext.w	a5,a5
	.loc 5 37 86
	addiw	a5,a5,1
	sext.w	a5,a5
	.loc 5 37 92
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 5 37 60
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	sub	a5,a5,a4
	.loc 5 37 18
	sd	a5,24(sp)
	.loc 5 38 25
	li	a5,231
	sd	a5,16(sp)
	.loc 5 40 9
	li	a5,0
	ld	a4,16(sp)
	li	a3,4096
	ld	a2,32(sp)
	ld	a1,24(sp)
	ld	a0,8(sp)
	call	create_mapping
.LBE3:
	.loc 5 34 28
	ld	a5,40(sp)
	addi	a5,a5,216
	sd	a5,40(sp)
.L14:
	.loc 5 34 11 discriminator 1
	ld	a4,40(sp)
	lla	a5,processes+13824
	bltu	a4,a5,.L16
	.loc 5 42 1
	nop
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE74:
	.size	process_statck_map, .-process_statck_map
	.section	.rodata
	.align	3
.LC21:
	.string	"pid_alloctor"
	.align	3
.LC22:
	.string	"wait lock"
	.align	3
.LC23:
	.string	"processes"
	.align	3
.LC24:
	.string	"total %d process init(state and virt kstack)\n"
	.text
	.align	2
	.globl	procinit
	.type	procinit, @function
procinit:
.LFB75:
	.loc 5 45 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 46 21
	lla	a5,processes
	sd	a5,8(sp)
	.loc 5 48 5
	lla	a1,.LC21
	lla	a0,pid_lock
	call	spinlock_init
	.loc 5 49 5
	lla	a1,.LC22
	lla	a0,wait_lock
	call	spinlock_init
	.loc 5 51 5
	j	.L18
.L19:
	.loc 5 54 9 discriminator 2
	ld	a5,8(sp)
	lla	a1,.LC23
	mv	a0,a5
	call	spinlock_init
	.loc 5 55 17 discriminator 2
	ld	a5,8(sp)
	sw	zero,16(a5)
	.loc 5 56 71 discriminator 2
	ld	a4,8(sp)
	lla	a5,processes
	sub	a5,a4,a5
	srai	a4,a5,3
	lla	a5,.LC20
	ld	a5,0(a5)
	mul	a5,a4,a5
	.loc 5 56 62 discriminator 2
	sext.w	a5,a5
	.loc 5 56 84 discriminator 2
	addiw	a5,a5,1
	sext.w	a5,a5
	.loc 5 56 90 discriminator 2
	slliw	a5,a5,13
	sext.w	a5,a5
	mv	a4,a5
	.loc 5 56 58 discriminator 2
	li	a5,67108864
	addi	a5,a5,-1
	slli	a5,a5,12
	sub	a5,a5,a4
	mv	a4,a5
	.loc 5 56 18 discriminator 2
	ld	a5,8(sp)
	sd	a4,56(a5)
	.loc 5 51 30 discriminator 2
	ld	a5,8(sp)
	addi	a5,a5,216
	sd	a5,8(sp)
.L18:
	.loc 5 51 11 discriminator 1
	ld	a4,8(sp)
	lla	a5,processes+13824
	bltu	a4,a5,.L19
	.loc 5 59 5
	li	a1,64
	lla	a0,.LC24
	call	kprintf
	.loc 5 61 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE75:
	.size	procinit, .-procinit
	.align	2
	.globl	cpuid
	.type	cpuid, @function
cpuid:
.LFB76:
	.loc 5 64 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 65 12
	call	read_tp
	mv	a5,a0
	.loc 5 65 9
	sw	a5,12(sp)
	.loc 5 66 12
	lw	a5,12(sp)
	.loc 5 67 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE76:
	.size	cpuid, .-cpuid
	.align	2
	.globl	mycpu
	.type	mycpu, @function
mycpu:
.LFB77:
	.loc 5 69 24
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 70 12
	call	cpuid
	mv	a5,a0
	sw	a5,12(sp)
	.loc 5 71 17
	lw	a5,12(sp)
	slli	a4,a5,7
	lla	a5,cpus
	add	a5,a4,a5
	sd	a5,0(sp)
	.loc 5 72 12
	ld	a5,0(sp)
	.loc 5 73 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE77:
	.size	mycpu, .-mycpu
	.align	2
	.globl	myproc
	.type	myproc, @function
myproc:
.LFB78:
	.loc 5 75 29
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 76 5
	call	push_off
	.loc 5 77 23
	call	mycpu
	sd	a0,8(sp)
	.loc 5 78 20
	ld	a5,8(sp)
	ld	a5,0(a5)
	sd	a5,0(sp)
	.loc 5 79 5
	call	pop_off
	.loc 5 80 12
	ld	a5,0(sp)
	.loc 5 82 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE78:
	.size	myproc, .-myproc
	.align	2
	.globl	allocpid
	.type	allocpid, @function
allocpid:
.LFB79:
	.loc 5 84 19
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 86 5
	lla	a0,pid_lock
	call	spinlock_acquire
	.loc 5 87 8
	lla	a5,nextpid
	lw	a5,0(a5)
	sw	a5,12(sp)
	.loc 5 88 12
	lla	a5,nextpid
	lw	a5,0(a5)
	addiw	a5,a5,1
	sext.w	a4,a5
	lla	a5,nextpid
	sw	a4,0(a5)
	.loc 5 89 5
	lla	a0,pid_lock
	call	spinlock_release
	.loc 5 90 12
	lw	a5,12(sp)
	.loc 5 91 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE79:
	.size	allocpid, .-allocpid
	.align	2
	.globl	allocproc
	.type	allocproc, @function
allocproc:
.LFB80:
	.loc 5 93 32
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 95 10
	lla	a5,processes
	sd	a5,8(sp)
	.loc 5 95 5
	j	.L29
.L32:
	.loc 5 97 9
	ld	a5,8(sp)
	mv	a0,a5
	call	spinlock_acquire
	.loc 5 98 13
	ld	a5,8(sp)
	lw	a5,16(a5)
	.loc 5 98 11
	beq	a5,zero,.L36
	.loc 5 102 13 discriminator 2
	ld	a5,8(sp)
	mv	a0,a5
	call	spinlock_release
	.loc 5 95 39 discriminator 2
	ld	a5,8(sp)
	addi	a5,a5,216
	sd	a5,8(sp)
.L29:
	.loc 5 95 22 discriminator 1
	ld	a4,8(sp)
	lla	a5,processes+13824
	bltu	a4,a5,.L32
	.loc 5 105 1
	j	.L31
.L36:
	.loc 5 99 13
	nop
.L31:
	.loc 5 106 12
	call	allocpid
	mv	a5,a0
	mv	a4,a5
	.loc 5 106 11
	ld	a5,8(sp)
	sw	a4,40(a5)
	.loc 5 107 13
	ld	a5,8(sp)
	li	a4,1
	sw	a4,16(a5)
	.loc 5 108 37
	li	a1,1
	li	a0,1
	call	malloc_page
	mv	a4,a0
	.loc 5 108 17
	ld	a5,8(sp)
	sd	a4,80(a5)
	.loc 5 109 9
	ld	a5,8(sp)
	ld	a5,80(a5)
	.loc 5 109 7
	bne	a5,zero,.L33
	.loc 5 110 9
	ld	a0,8(sp)
	call	freeproc
	.loc 5 111 9
	ld	a5,8(sp)
	mv	a0,a5
	call	spinlock_release
	.loc 5 112 16
	li	a5,0
	j	.L34
.L33:
	.loc 5 115 20
	ld	a0,8(sp)
	call	proc_pagetable
	mv	a4,a0
	.loc 5 115 18
	ld	a5,8(sp)
	sd	a4,72(a5)
	.loc 5 116 9
	ld	a5,8(sp)
	ld	a5,72(a5)
	.loc 5 116 7
	bne	a5,zero,.L35
	.loc 5 117 9
	ld	a0,8(sp)
	call	freeproc
	.loc 5 118 9
	ld	a5,8(sp)
	mv	a0,a5
	call	spinlock_release
	.loc 5 119 16
	li	a5,0
	j	.L34
.L35:
	.loc 5 124 12
	ld	a5,8(sp)
	addi	a5,a5,88
	.loc 5 124 5
	li	a2,112
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 5 125 21
	lla	a4,forkret
	.loc 5 125 19
	ld	a5,8(sp)
	sd	a4,88(a5)
	.loc 5 126 22
	ld	a5,8(sp)
	ld	a4,56(a5)
	.loc 5 126 31
	li	a5,4096
	add	a4,a4,a5
	.loc 5 126 19
	ld	a5,8(sp)
	sd	a4,96(a5)
	.loc 5 128 12
	ld	a5,8(sp)
.L34:
	.loc 5 130 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE80:
	.size	allocproc, .-allocproc
	.align	2
	.globl	freeproc
	.type	freeproc, @function
freeproc:
.LFB81:
	.loc 5 134 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 5 141 18
	ld	a5,8(sp)
	sd	zero,80(a5)
	.loc 5 143 18
	ld	a5,8(sp)
	sd	zero,72(a5)
	.loc 5 144 11
	ld	a5,8(sp)
	sd	zero,64(a5)
	.loc 5 145 12
	ld	a5,8(sp)
	sw	zero,40(a5)
	.loc 5 146 15
	ld	a5,8(sp)
	sd	zero,48(a5)
	.loc 5 147 16
	ld	a5,8(sp)
	sb	zero,200(a5)
	.loc 5 148 13
	ld	a5,8(sp)
	sd	zero,24(a5)
	.loc 5 149 15
	ld	a5,8(sp)
	sw	zero,32(a5)
	.loc 5 150 15
	ld	a5,8(sp)
	sw	zero,36(a5)
	.loc 5 151 14
	ld	a5,8(sp)
	sw	zero,16(a5)
	.loc 5 152 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE81:
	.size	freeproc, .-freeproc
	.align	2
	.globl	proc_pagetable
	.type	proc_pagetable, @function
proc_pagetable:
.LFB82:
	.loc 5 154 47
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 5 158 17
	call	uvmcreate
	sd	a0,24(sp)
	.loc 5 159 7
	ld	a5,24(sp)
	bne	a5,zero,.L39
	.loc 5 160 16
	li	a5,0
	j	.L40
.L39:
	.loc 5 162 8
	lla	a5,trampoline
	li	a4,10
	mv	a3,a5
	li	a2,4096
	li	a5,67108864
	addi	a5,a5,-1
	slli	a1,a5,12
	ld	a0,24(sp)
	call	mappages
	mv	a5,a0
	.loc 5 162 7
	bge	a5,zero,.L41
	.loc 5 164 5
	li	a1,0
	ld	a0,24(sp)
	call	uvmfree
	.loc 5 165 12
	li	a5,0
	j	.L40
.L41:
	.loc 5 167 10
	li	a5,0
.L40:
	.loc 5 168 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE82:
	.size	proc_pagetable, .-proc_pagetable
	.align	2
	.globl	forkret
	.type	forkret, @function
forkret:
.LFB83:
	.loc 5 174 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 5 178 21
	call	myproc
	mv	a5,a0
	.loc 5 178 3
	mv	a0,a5
	call	spinlock_release
	.loc 5 188 3
	call	usertrapret
	.loc 5 189 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE83:
	.size	forkret, .-forkret
	.align	2
	.globl	killed
	.type	killed, @function
killed:
.LFB84:
	.loc 5 195 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 5 197 3
	ld	a5,8(sp)
	mv	a0,a5
	call	spinlock_acquire
	.loc 5 198 7
	ld	a5,8(sp)
	lw	a5,32(a5)
	sw	a5,28(sp)
	.loc 5 199 3
	ld	a5,8(sp)
	mv	a0,a5
	call	spinlock_release
	.loc 5 200 10
	lw	a5,28(sp)
	.loc 5 201 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE84:
	.size	killed, .-killed
	.align	2
	.globl	setkilled
	.type	setkilled, @function
setkilled:
.LFB85:
	.loc 5 204 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 5 205 3
	ld	a5,8(sp)
	mv	a0,a5
	call	spinlock_acquire
	.loc 5 206 13
	ld	a5,8(sp)
	li	a4,1
	sw	a4,32(a5)
	.loc 5 207 3
	ld	a5,8(sp)
	mv	a0,a5
	call	spinlock_release
	.loc 5 208 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE85:
	.size	setkilled, .-setkilled
	.align	2
	.globl	uvmfree
	.type	uvmfree, @function
uvmfree:
.LFB86:
	.loc 5 238 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 5 243 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE86:
	.size	uvmfree, .-uvmfree
	.align	2
	.globl	push_off
	.type	push_off, @function
push_off:
.LFB87:
	.loc 5 247 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 248 13
	call	intr_get
	mv	a5,a0
	sw	a5,12(sp)
	.loc 5 250 3
	call	intr_off
	.loc 5 251 6
	call	mycpu
	mv	a5,a0
	.loc 5 251 13
	lw	a5,120(a5)
	.loc 5 251 5
	bne	a5,zero,.L48
	.loc 5 252 5
	call	mycpu
	mv	a4,a0
	.loc 5 252 21
	lw	a5,12(sp)
	sw	a5,124(a4)
.L48:
	.loc 5 253 3
	call	mycpu
	mv	a5,a0
	.loc 5 253 10
	lw	a4,120(a5)
	.loc 5 253 17
	addiw	a4,a4,1
	sext.w	a4,a4
	sw	a4,120(a5)
	.loc 5 254 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE87:
	.size	push_off, .-push_off
	.section	.rodata
	.align	3
.LC25:
	.string	"\"pop_off - interruptible\""
	.align	3
.LC26:
	.string	"!intr_get()"
	.align	3
.LC27:
	.string	"\"pop_off\""
	.align	3
.LC28:
	.string	"c->noff>=1"
	.text
	.align	2
	.globl	pop_off
	.type	pop_off, @function
pop_off:
.LFB88:
	.loc 5 257 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 258 19
	call	mycpu
	sd	a0,8(sp)
	.loc 5 261 8
	call	intr_get
	mv	a5,a0
	.loc 5 261 6
	beq	a5,zero,.L50
	.loc 5 261 29 discriminator 1
	lla	a4,.LC25
	lla	a3,.LC26
	lla	a2,__func__.0
	li	a1,261
	lla	a0,.LC19
	call	kpanic_spin
.L50:
	.loc 5 264 8
	ld	a5,8(sp)
	lw	a5,120(a5)
	.loc 5 264 6
	bgt	a5,zero,.L51
	.loc 5 264 28 discriminator 1
	lla	a4,.LC27
	lla	a3,.LC28
	lla	a2,__func__.0
	li	a1,264
	lla	a0,.LC19
	call	kpanic_spin
.L51:
	.loc 5 265 4
	ld	a5,8(sp)
	lw	a5,120(a5)
	.loc 5 265 11
	addiw	a5,a5,-1
	sext.w	a4,a5
	ld	a5,8(sp)
	sw	a4,120(a5)
	.loc 5 266 7
	ld	a5,8(sp)
	lw	a5,120(a5)
	.loc 5 266 5
	bne	a5,zero,.L53
	.loc 5 266 23 discriminator 1
	ld	a5,8(sp)
	lw	a5,124(a5)
	.loc 5 266 19 discriminator 1
	beq	a5,zero,.L53
	.loc 5 267 5
	call	intr_on
.L53:
	.loc 5 268 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE88:
	.size	pop_off, .-pop_off
	.align	2
	.globl	userinit
	.type	userinit, @function
userinit:
.LFB89:
	.loc 5 271 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 5 273 5
	call	allocproc
	sd	a0,8(sp)
	.loc 5 274 11
	lla	a5,initproc
	ld	a4,8(sp)
	sd	a4,0(a5)
	.loc 5 276 9
	ld	a5,8(sp)
	li	a4,4096
	sd	a4,64(a5)
	.loc 5 279 4
	ld	a5,8(sp)
	ld	a5,80(a5)
	.loc 5 279 21
	sd	zero,24(a5)
	.loc 5 280 4
	ld	a5,8(sp)
	ld	a5,80(a5)
	.loc 5 280 20
	li	a4,4096
	sd	a4,48(a5)
	.loc 5 285 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE89:
	.size	userinit, .-userinit
	.section	.rodata
	.align	3
	.type	__func__.1, @object
	.size	__func__.1, 19
__func__.1:
	.string	"process_statck_map"
	.section	.srodata,"a"
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 8
__func__.0:
	.string	"pop_off"
	.section	.rodata
	.align	3
.LC20:
	.dword	-8881765665119413741
	.text
.Letext0:
	.file 6 "include/types.h"
	.file 7 "include/kernel/locks.h"
	.file 8 "include/stdarg.h"
	.file 9 "include/asm/svxx.h"
	.file 10 "include/kernel/paging.h"
	.file 11 "include/kernel/mm.h"
	.file 12 "include/string.h"
	.file 13 "include/stdfmt.h"
	.file 14 "include/kernel/kstdio.h"
	.file 15 "include/trap/trapret.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xd87
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x1f
	.4byte	.LASF107
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x5
	.4byte	.LASF5
	.byte	0x6
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
	.byte	0x5
	.4byte	.LASF6
	.byte	0x6
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
	.byte	0xb
	.4byte	0x62
	.byte	0xa
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0x20
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xa
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x5
	.4byte	.LASF11
	.byte	0x6
	.byte	0x23
	.byte	0x17
	.4byte	0x3a
	.byte	0x21
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x6
	.byte	0x24
	.byte	0x6
	.4byte	0xaa
	.byte	0x8
	.4byte	.LASF12
	.byte	0
	.byte	0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	.LASF14
	.byte	0x6
	.byte	0x2a
	.byte	0x12
	.4byte	0x4f
	.byte	0x5
	.4byte	.LASF15
	.byte	0x6
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0x5
	.4byte	.LASF16
	.byte	0x6
	.byte	0x33
	.byte	0x12
	.4byte	0x4f
	.byte	0x5
	.4byte	.LASF17
	.byte	0x6
	.byte	0x3b
	.byte	0x13
	.4byte	0xda
	.byte	0x6
	.4byte	0x4f
	.byte	0xf
	.4byte	.LASF22
	.byte	0x10
	.byte	0x7
	.byte	0x1b
	.byte	0x10
	.4byte	0x107
	.byte	0x2
	.4byte	.LASF18
	.byte	0x7
	.byte	0x1d
	.byte	0xa
	.4byte	0x83
	.byte	0
	.byte	0x2
	.4byte	.LASF19
	.byte	0x7
	.byte	0x1f
	.byte	0xb
	.4byte	0x107
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0x62
	.byte	0x5
	.4byte	.LASF20
	.byte	0x7
	.byte	0x20
	.byte	0x3
	.4byte	0xdf
	.byte	0x6
	.4byte	0x69
	.byte	0x5
	.4byte	.LASF21
	.byte	0x8
	.byte	0x22
	.byte	0x1b
	.4byte	0x129
	.byte	0x22
	.byte	0x8
	.4byte	.LASF108
	.byte	0xf
	.4byte	.LASF23
	.byte	0x70
	.byte	0x4
	.byte	0x29
	.byte	0x8
	.4byte	0x1e7
	.byte	0x1
	.string	"ra"
	.byte	0x4
	.byte	0x2a
	.byte	0xc
	.4byte	0x4f
	.byte	0
	.byte	0x1
	.string	"sp"
	.byte	0x4
	.byte	0x2b
	.byte	0xc
	.4byte	0x4f
	.byte	0x8
	.byte	0x1
	.string	"s0"
	.byte	0x4
	.byte	0x2e
	.byte	0xc
	.4byte	0x4f
	.byte	0x10
	.byte	0x1
	.string	"s1"
	.byte	0x4
	.byte	0x2f
	.byte	0xc
	.4byte	0x4f
	.byte	0x18
	.byte	0x1
	.string	"s2"
	.byte	0x4
	.byte	0x30
	.byte	0xc
	.4byte	0x4f
	.byte	0x20
	.byte	0x1
	.string	"s3"
	.byte	0x4
	.byte	0x31
	.byte	0xc
	.4byte	0x4f
	.byte	0x28
	.byte	0x1
	.string	"s4"
	.byte	0x4
	.byte	0x32
	.byte	0xc
	.4byte	0x4f
	.byte	0x30
	.byte	0x1
	.string	"s5"
	.byte	0x4
	.byte	0x33
	.byte	0xc
	.4byte	0x4f
	.byte	0x38
	.byte	0x1
	.string	"s6"
	.byte	0x4
	.byte	0x34
	.byte	0xc
	.4byte	0x4f
	.byte	0x40
	.byte	0x1
	.string	"s7"
	.byte	0x4
	.byte	0x35
	.byte	0xc
	.4byte	0x4f
	.byte	0x48
	.byte	0x1
	.string	"s8"
	.byte	0x4
	.byte	0x36
	.byte	0xc
	.4byte	0x4f
	.byte	0x50
	.byte	0x1
	.string	"s9"
	.byte	0x4
	.byte	0x37
	.byte	0xc
	.4byte	0x4f
	.byte	0x58
	.byte	0x1
	.string	"s10"
	.byte	0x4
	.byte	0x38
	.byte	0xc
	.4byte	0x4f
	.byte	0x60
	.byte	0x1
	.string	"s11"
	.byte	0x4
	.byte	0x39
	.byte	0xc
	.4byte	0x4f
	.byte	0x68
	.byte	0
	.byte	0x23
	.string	"cpu"
	.byte	0x80
	.byte	0x4
	.byte	0x3d
	.byte	0x8
	.4byte	0x229
	.byte	0x2
	.4byte	.LASF24
	.byte	0x4
	.byte	0x3e
	.byte	0x13
	.4byte	0x2df
	.byte	0
	.byte	0x2
	.4byte	.LASF23
	.byte	0x4
	.byte	0x3f
	.byte	0x12
	.4byte	0x12f
	.byte	0x8
	.byte	0x2
	.4byte	.LASF25
	.byte	0x4
	.byte	0x40
	.byte	0x7
	.4byte	0x75
	.byte	0x78
	.byte	0x2
	.4byte	.LASF26
	.byte	0x4
	.byte	0x41
	.byte	0x7
	.4byte	0x75
	.byte	0x7c
	.byte	0
	.byte	0xf
	.4byte	.LASF27
	.byte	0xd8
	.byte	0x4
	.byte	0x7c
	.byte	0x8
	.4byte	0x2df
	.byte	0x2
	.4byte	.LASF28
	.byte	0x4
	.byte	0x7d
	.byte	0xe
	.4byte	0x10c
	.byte	0
	.byte	0x2
	.4byte	.LASF29
	.byte	0x4
	.byte	0x80
	.byte	0x12
	.4byte	0x4c2
	.byte	0x10
	.byte	0x2
	.4byte	.LASF30
	.byte	0x4
	.byte	0x81
	.byte	0x9
	.4byte	0x4f9
	.byte	0x18
	.byte	0x2
	.4byte	.LASF31
	.byte	0x4
	.byte	0x82
	.byte	0x7
	.4byte	0x75
	.byte	0x20
	.byte	0x2
	.4byte	.LASF32
	.byte	0x4
	.byte	0x83
	.byte	0x7
	.4byte	0x75
	.byte	0x24
	.byte	0x1
	.string	"pid"
	.byte	0x4
	.byte	0x84
	.byte	0x7
	.4byte	0x75
	.byte	0x28
	.byte	0x2
	.4byte	.LASF33
	.byte	0x4
	.byte	0x87
	.byte	0x10
	.4byte	0x500
	.byte	0x30
	.byte	0x2
	.4byte	.LASF34
	.byte	0x4
	.byte	0x8a
	.byte	0xc
	.4byte	0x4f
	.byte	0x38
	.byte	0x1
	.string	"sz"
	.byte	0x4
	.byte	0x8b
	.byte	0xc
	.4byte	0x4f
	.byte	0x40
	.byte	0x2
	.4byte	.LASF35
	.byte	0x4
	.byte	0x8c
	.byte	0xf
	.4byte	0xce
	.byte	0x48
	.byte	0x2
	.4byte	.LASF36
	.byte	0x4
	.byte	0x8d
	.byte	0x15
	.4byte	0x505
	.byte	0x50
	.byte	0x2
	.4byte	.LASF23
	.byte	0x4
	.byte	0x8e
	.byte	0x12
	.4byte	0x12f
	.byte	0x58
	.byte	0x2
	.4byte	.LASF19
	.byte	0x4
	.byte	0x91
	.byte	0x8
	.4byte	0x50a
	.byte	0xc8
	.byte	0
	.byte	0x6
	.4byte	0x229
	.byte	0x7
	.4byte	0x1e7
	.4byte	0x2f4
	.byte	0xc
	.4byte	0x5b
	.byte	0x7
	.byte	0
	.byte	0x17
	.4byte	.LASF59
	.byte	0x4
	.byte	0x44
	.byte	0x13
	.4byte	0x2e4
	.byte	0x24
	.4byte	.LASF36
	.2byte	0x120
	.byte	0x4
	.byte	0x52
	.byte	0x8
	.4byte	0x4c2
	.byte	0x2
	.4byte	.LASF37
	.byte	0x4
	.byte	0x53
	.byte	0x16
	.4byte	0x4f
	.byte	0
	.byte	0x2
	.4byte	.LASF38
	.byte	0x4
	.byte	0x54
	.byte	0x16
	.4byte	0x4f
	.byte	0x8
	.byte	0x2
	.4byte	.LASF39
	.byte	0x4
	.byte	0x55
	.byte	0x16
	.4byte	0x4f
	.byte	0x10
	.byte	0x1
	.string	"epc"
	.byte	0x4
	.byte	0x56
	.byte	0x16
	.4byte	0x4f
	.byte	0x18
	.byte	0x2
	.4byte	.LASF40
	.byte	0x4
	.byte	0x57
	.byte	0x16
	.4byte	0x4f
	.byte	0x20
	.byte	0x1
	.string	"ra"
	.byte	0x4
	.byte	0x58
	.byte	0x16
	.4byte	0x4f
	.byte	0x28
	.byte	0x1
	.string	"sp"
	.byte	0x4
	.byte	0x59
	.byte	0x16
	.4byte	0x4f
	.byte	0x30
	.byte	0x1
	.string	"gp"
	.byte	0x4
	.byte	0x5a
	.byte	0x16
	.4byte	0x4f
	.byte	0x38
	.byte	0x1
	.string	"tp"
	.byte	0x4
	.byte	0x5b
	.byte	0x16
	.4byte	0x4f
	.byte	0x40
	.byte	0x1
	.string	"t0"
	.byte	0x4
	.byte	0x5c
	.byte	0x16
	.4byte	0x4f
	.byte	0x48
	.byte	0x1
	.string	"t1"
	.byte	0x4
	.byte	0x5d
	.byte	0x16
	.4byte	0x4f
	.byte	0x50
	.byte	0x1
	.string	"t2"
	.byte	0x4
	.byte	0x5e
	.byte	0x16
	.4byte	0x4f
	.byte	0x58
	.byte	0x1
	.string	"s0"
	.byte	0x4
	.byte	0x5f
	.byte	0x16
	.4byte	0x4f
	.byte	0x60
	.byte	0x1
	.string	"s1"
	.byte	0x4
	.byte	0x60
	.byte	0x16
	.4byte	0x4f
	.byte	0x68
	.byte	0x1
	.string	"a0"
	.byte	0x4
	.byte	0x61
	.byte	0x16
	.4byte	0x4f
	.byte	0x70
	.byte	0x1
	.string	"a1"
	.byte	0x4
	.byte	0x62
	.byte	0x16
	.4byte	0x4f
	.byte	0x78
	.byte	0x1
	.string	"a2"
	.byte	0x4
	.byte	0x63
	.byte	0x16
	.4byte	0x4f
	.byte	0x80
	.byte	0x1
	.string	"a3"
	.byte	0x4
	.byte	0x64
	.byte	0x16
	.4byte	0x4f
	.byte	0x88
	.byte	0x1
	.string	"a4"
	.byte	0x4
	.byte	0x65
	.byte	0x16
	.4byte	0x4f
	.byte	0x90
	.byte	0x1
	.string	"a5"
	.byte	0x4
	.byte	0x66
	.byte	0x16
	.4byte	0x4f
	.byte	0x98
	.byte	0x1
	.string	"a6"
	.byte	0x4
	.byte	0x67
	.byte	0x16
	.4byte	0x4f
	.byte	0xa0
	.byte	0x1
	.string	"a7"
	.byte	0x4
	.byte	0x68
	.byte	0x16
	.4byte	0x4f
	.byte	0xa8
	.byte	0x1
	.string	"s2"
	.byte	0x4
	.byte	0x69
	.byte	0x16
	.4byte	0x4f
	.byte	0xb0
	.byte	0x1
	.string	"s3"
	.byte	0x4
	.byte	0x6a
	.byte	0x16
	.4byte	0x4f
	.byte	0xb8
	.byte	0x1
	.string	"s4"
	.byte	0x4
	.byte	0x6b
	.byte	0x16
	.4byte	0x4f
	.byte	0xc0
	.byte	0x1
	.string	"s5"
	.byte	0x4
	.byte	0x6c
	.byte	0x16
	.4byte	0x4f
	.byte	0xc8
	.byte	0x1
	.string	"s6"
	.byte	0x4
	.byte	0x6d
	.byte	0x16
	.4byte	0x4f
	.byte	0xd0
	.byte	0x1
	.string	"s7"
	.byte	0x4
	.byte	0x6e
	.byte	0x16
	.4byte	0x4f
	.byte	0xd8
	.byte	0x1
	.string	"s8"
	.byte	0x4
	.byte	0x6f
	.byte	0x16
	.4byte	0x4f
	.byte	0xe0
	.byte	0x1
	.string	"s9"
	.byte	0x4
	.byte	0x70
	.byte	0x16
	.4byte	0x4f
	.byte	0xe8
	.byte	0x1
	.string	"s10"
	.byte	0x4
	.byte	0x71
	.byte	0x16
	.4byte	0x4f
	.byte	0xf0
	.byte	0x1
	.string	"s11"
	.byte	0x4
	.byte	0x72
	.byte	0x16
	.4byte	0x4f
	.byte	0xf8
	.byte	0x13
	.string	"t3"
	.byte	0x73
	.4byte	0x4f
	.2byte	0x100
	.byte	0x13
	.string	"t4"
	.byte	0x74
	.4byte	0x4f
	.2byte	0x108
	.byte	0x13
	.string	"t5"
	.byte	0x75
	.4byte	0x4f
	.2byte	0x110
	.byte	0x13
	.string	"t6"
	.byte	0x76
	.4byte	0x4f
	.2byte	0x118
	.byte	0
	.byte	0x25
	.4byte	.LASF109
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x4
	.byte	0x79
	.byte	0x6
	.4byte	0x4f9
	.byte	0x8
	.4byte	.LASF41
	.byte	0
	.byte	0x8
	.4byte	.LASF42
	.byte	0x1
	.byte	0x8
	.4byte	.LASF43
	.byte	0x2
	.byte	0x8
	.4byte	.LASF44
	.byte	0x3
	.byte	0x8
	.4byte	.LASF45
	.byte	0x4
	.byte	0x8
	.4byte	.LASF46
	.byte	0x5
	.byte	0
	.byte	0x26
	.byte	0x8
	.byte	0x27
	.4byte	.LASF24
	.byte	0x6
	.4byte	0x4fb
	.byte	0x6
	.4byte	0x300
	.byte	0x7
	.4byte	0x62
	.4byte	0x51a
	.byte	0xc
	.4byte	0x5b
	.byte	0xf
	.byte	0
	.byte	0xf
	.4byte	.LASF47
	.byte	0x8
	.byte	0x9
	.byte	0x24
	.byte	0x10
	.4byte	0x535
	.byte	0x1
	.string	"val"
	.byte	0x9
	.byte	0x25
	.byte	0xe
	.4byte	0x4f
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LASF48
	.byte	0x9
	.byte	0x26
	.byte	0x3
	.4byte	0x51a
	.byte	0x28
	.4byte	.LASF49
	.byte	0x9
	.2byte	0x16d
	.byte	0x10
	.4byte	0xc2
	.byte	0x7
	.4byte	0x62
	.4byte	0x559
	.byte	0x29
	.byte	0
	.byte	0x6
	.4byte	0x541
	.byte	0xf
	.4byte	.LASF50
	.byte	0x10
	.byte	0xa
	.byte	0x51
	.byte	0x10
	.4byte	0x586
	.byte	0x2
	.4byte	.LASF51
	.byte	0xa
	.byte	0x52
	.byte	0x9
	.4byte	0xc2
	.byte	0
	.byte	0x2
	.4byte	.LASF19
	.byte	0xa
	.byte	0x53
	.byte	0x8
	.4byte	0x107
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	.LASF52
	.byte	0xa
	.byte	0x54
	.byte	0x3
	.4byte	0x55e
	.byte	0xb
	.4byte	0x586
	.byte	0x7
	.4byte	0x592
	.4byte	0x5a7
	.byte	0xc
	.4byte	0x5b
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	0x597
	.byte	0x9
	.4byte	.LASF57
	.byte	0xa
	.byte	0x56
	.byte	0x1c
	.4byte	0x5a7
	.byte	0x9
	.byte	0x3
	.8byte	address_markers
	.byte	0xf
	.4byte	.LASF53
	.byte	0x20
	.byte	0xa
	.byte	0x60
	.byte	0x10
	.4byte	0x604
	.byte	0x2
	.4byte	.LASF54
	.byte	0xa
	.byte	0x62
	.byte	0xb
	.4byte	0x4f
	.byte	0
	.byte	0x1
	.string	"val"
	.byte	0xa
	.byte	0x64
	.byte	0xb
	.4byte	0x4f
	.byte	0x8
	.byte	0x1
	.string	"set"
	.byte	0xa
	.byte	0x66
	.byte	0xe
	.4byte	0x118
	.byte	0x10
	.byte	0x2
	.4byte	.LASF55
	.byte	0xa
	.byte	0x68
	.byte	0xe
	.4byte	0x118
	.byte	0x18
	.byte	0
	.byte	0x5
	.4byte	.LASF56
	.byte	0xa
	.byte	0x69
	.byte	0x3
	.4byte	0x5c2
	.byte	0xb
	.4byte	0x604
	.byte	0x7
	.4byte	0x610
	.4byte	0x625
	.byte	0xc
	.4byte	0x5b
	.byte	0x8
	.byte	0
	.byte	0xb
	.4byte	0x615
	.byte	0x9
	.4byte	.LASF58
	.byte	0xa
	.byte	0x6b
	.byte	0x1d
	.4byte	0x625
	.byte	0x9
	.byte	0x3
	.8byte	prot_bits
	.byte	0x2a
	.4byte	0x2f4
	.byte	0x5
	.byte	0x6
	.byte	0xc
	.byte	0x9
	.byte	0x3
	.8byte	cpus
	.byte	0x7
	.4byte	0x229
	.4byte	0x662
	.byte	0xc
	.4byte	0x5b
	.byte	0x3f
	.byte	0
	.byte	0x12
	.4byte	.LASF60
	.byte	0x8
	.byte	0x10
	.4byte	0x652
	.byte	0x9
	.byte	0x3
	.8byte	processes
	.byte	0x12
	.4byte	.LASF61
	.byte	0xa
	.byte	0x11
	.4byte	0x2df
	.byte	0x9
	.byte	0x3
	.8byte	initproc
	.byte	0x12
	.4byte	.LASF62
	.byte	0xc
	.byte	0x5
	.4byte	0x75
	.byte	0x9
	.byte	0x3
	.8byte	nextpid
	.byte	0x17
	.4byte	.LASF63
	.byte	0x5
	.byte	0x10
	.byte	0xd
	.4byte	0x54e
	.byte	0x12
	.4byte	.LASF64
	.byte	0x12
	.byte	0xc
	.4byte	0x10c
	.byte	0x9
	.byte	0x3
	.8byte	pid_lock
	.byte	0x12
	.4byte	.LASF65
	.byte	0x18
	.byte	0xc
	.4byte	0x10c
	.byte	0x9
	.byte	0x3
	.8byte	wait_lock
	.byte	0x2b
	.4byte	.LASF110
	.byte	0xf
	.byte	0x5
	.byte	0x6
	.byte	0x10
	.4byte	.LASF66
	.byte	0xb
	.byte	0xa6
	.byte	0x5
	.4byte	0x75
	.4byte	0x709
	.byte	0x3
	.4byte	0xce
	.byte	0x3
	.4byte	0x4f
	.byte	0x3
	.4byte	0x4f
	.byte	0x3
	.4byte	0x4f
	.byte	0x3
	.4byte	0x75
	.byte	0
	.byte	0x2c
	.4byte	.LASF111
	.byte	0xb
	.byte	0xa4
	.byte	0xd
	.4byte	0xce
	.byte	0x10
	.4byte	.LASF67
	.byte	0xc
	.byte	0x20
	.byte	0x8
	.4byte	0xaa
	.4byte	0x735
	.byte	0x3
	.4byte	0x4f9
	.byte	0x3
	.4byte	0xb6
	.byte	0x3
	.4byte	0xaa
	.byte	0
	.byte	0x10
	.4byte	.LASF68
	.byte	0xb
	.byte	0xa0
	.byte	0x7
	.4byte	0x4f9
	.4byte	0x750
	.byte	0x3
	.4byte	0xaa
	.byte	0x3
	.4byte	0x83
	.byte	0
	.byte	0x15
	.4byte	.LASF69
	.byte	0x3d
	.4byte	0x760
	.byte	0x3
	.4byte	0x760
	.byte	0
	.byte	0x6
	.4byte	0x10c
	.byte	0x15
	.4byte	.LASF70
	.byte	0x33
	.4byte	0x775
	.byte	0x3
	.4byte	0x760
	.byte	0
	.byte	0x15
	.4byte	.LASF71
	.byte	0x29
	.4byte	0x78a
	.byte	0x3
	.4byte	0x760
	.byte	0x3
	.4byte	0x107
	.byte	0
	.byte	0x10
	.4byte	.LASF72
	.byte	0xd
	.byte	0x5b
	.byte	0x8
	.4byte	0xaa
	.4byte	0x7aa
	.byte	0x3
	.4byte	0x107
	.byte	0x3
	.4byte	0x118
	.byte	0x3
	.4byte	0x11d
	.byte	0
	.byte	0x10
	.4byte	.LASF73
	.byte	0xe
	.byte	0x43
	.byte	0x8
	.4byte	0xaa
	.4byte	0x7c1
	.byte	0x3
	.4byte	0x118
	.byte	0x18
	.byte	0
	.byte	0x2d
	.4byte	.LASF74
	.byte	0xa
	.2byte	0x1c9
	.byte	0x6
	.4byte	0x7ed
	.byte	0x3
	.4byte	0x559
	.byte	0x3
	.4byte	0xc2
	.byte	0x3
	.4byte	0xc2
	.byte	0x3
	.4byte	0x4f
	.byte	0x3
	.4byte	0x535
	.byte	0x3
	.4byte	0x4f
	.byte	0
	.byte	0x10
	.4byte	.LASF75
	.byte	0xb
	.byte	0x71
	.byte	0x8
	.4byte	0xc2
	.4byte	0x803
	.byte	0x3
	.4byte	0x83
	.byte	0
	.byte	0x19
	.4byte	.LASF76
	.2byte	0x10e
	.8byte	.LFB89
	.8byte	.LFE89-.LFB89
	.byte	0x1
	.byte	0x9c
	.4byte	0x82f
	.byte	0x16
	.string	"p"
	.byte	0x5
	.2byte	0x110
	.byte	0x13
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x19
	.4byte	.LASF77
	.2byte	0x100
	.8byte	.LFB88
	.8byte	.LFE88-.LFB88
	.byte	0x1
	.byte	0x9c
	.4byte	0x86e
	.byte	0x16
	.string	"c"
	.byte	0x5
	.2byte	0x102
	.byte	0xf
	.4byte	0x86e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF93
	.4byte	0x883
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0
	.byte	0x6
	.4byte	0x1e7
	.byte	0x7
	.4byte	0x69
	.4byte	0x883
	.byte	0xc
	.4byte	0x5b
	.byte	0x7
	.byte	0
	.byte	0xb
	.4byte	0x873
	.byte	0x14
	.4byte	.LASF78
	.byte	0xf6
	.8byte	.LFB87
	.8byte	.LFE87-.LFB87
	.byte	0x1
	.byte	0x9c
	.4byte	0x8b4
	.byte	0x4
	.string	"old"
	.byte	0x5
	.byte	0xf8
	.byte	0x7
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x1b
	.4byte	.LASF79
	.byte	0xed
	.8byte	.LFB86
	.8byte	.LFE86-.LFB86
	.byte	0x1
	.byte	0x9c
	.4byte	0x8ee
	.byte	0x11
	.4byte	.LASF35
	.byte	0x5
	.byte	0xed
	.byte	0x1a
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0xd
	.string	"sz"
	.byte	0x5
	.byte	0xed
	.byte	0x2e
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0x14
	.4byte	.LASF80
	.byte	0xcb
	.8byte	.LFB85
	.8byte	.LFE85-.LFB85
	.byte	0x1
	.byte	0x9c
	.4byte	0x918
	.byte	0xd
	.string	"p"
	.byte	0x5
	.byte	0xcb
	.byte	0x20
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.4byte	.LASF31
	.byte	0xc2
	.byte	0x5
	.4byte	0x75
	.8byte	.LFB84
	.8byte	.LFE84-.LFB84
	.byte	0x1
	.byte	0x9c
	.4byte	0x954
	.byte	0xd
	.string	"p"
	.byte	0x5
	.byte	0xc2
	.byte	0x1c
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.string	"k"
	.byte	0x5
	.byte	0xc6
	.byte	0x7
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x2e
	.4byte	.LASF112
	.byte	0x5
	.byte	0xad
	.byte	0x6
	.8byte	.LFB83
	.8byte	.LFE83-.LFB83
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.4byte	.LASF81
	.byte	0x9a
	.byte	0xd
	.4byte	0xce
	.8byte	.LFB82
	.8byte	.LFE82-.LFB82
	.byte	0x1
	.byte	0x9c
	.4byte	0x9ac
	.byte	0xd
	.string	"p"
	.byte	0x5
	.byte	0x9a
	.byte	0x2d
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x9
	.4byte	.LASF35
	.byte	0x5
	.byte	0x9b
	.byte	0x11
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1b
	.4byte	.LASF82
	.byte	0x85
	.8byte	.LFB81
	.8byte	.LFE81-.LFB81
	.byte	0x1
	.byte	0x9c
	.4byte	0x9d6
	.byte	0xd
	.string	"p"
	.byte	0x5
	.byte	0x85
	.byte	0x1e
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0xe
	.4byte	.LASF83
	.byte	0x5d
	.byte	0x11
	.4byte	0x2df
	.8byte	.LFB80
	.8byte	.LFE80-.LFB80
	.byte	0x1
	.byte	0x9c
	.4byte	0xa15
	.byte	0x4
	.string	"p"
	.byte	0x5
	.byte	0x5e
	.byte	0x15
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2f
	.4byte	.LASF113
	.byte	0x5
	.byte	0x69
	.byte	0x1
	.8byte	.L31
	.byte	0
	.byte	0xe
	.4byte	.LASF84
	.byte	0x54
	.byte	0x5
	.4byte	0x75
	.8byte	.LFB79
	.8byte	.LFE79-.LFB79
	.byte	0x1
	.byte	0x9c
	.4byte	0xa46
	.byte	0x4
	.string	"pid"
	.byte	0x5
	.byte	0x55
	.byte	0x9
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xe
	.4byte	.LASF85
	.byte	0x4b
	.byte	0x11
	.4byte	0x2df
	.8byte	.LFB78
	.8byte	.LFE78-.LFB78
	.byte	0x1
	.byte	0x9c
	.4byte	0xa86
	.byte	0x9
	.4byte	.LASF86
	.byte	0x5
	.byte	0x4d
	.byte	0x11
	.4byte	0x86e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x9
	.4byte	.LASF87
	.byte	0x5
	.byte	0x4e
	.byte	0x14
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xe
	.4byte	.LASF88
	.byte	0x45
	.byte	0xd
	.4byte	0x86e
	.8byte	.LFB77
	.8byte	.LFE77-.LFB77
	.byte	0x1
	.byte	0x9c
	.4byte	0xac5
	.byte	0x4
	.string	"id"
	.byte	0x5
	.byte	0x46
	.byte	0x9
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x9
	.4byte	.LASF86
	.byte	0x5
	.byte	0x47
	.byte	0x11
	.4byte	0x86e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xe
	.4byte	.LASF89
	.byte	0x3f
	.byte	0x5
	.4byte	0x75
	.8byte	.LFB76
	.8byte	.LFE76-.LFB76
	.byte	0x1
	.byte	0x9c
	.4byte	0xaf5
	.byte	0x4
	.string	"id"
	.byte	0x5
	.byte	0x41
	.byte	0x9
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x14
	.4byte	.LASF90
	.byte	0x2c
	.8byte	.LFB75
	.8byte	.LFE75-.LFB75
	.byte	0x1
	.byte	0x9c
	.4byte	0xb1f
	.byte	0x4
	.string	"p"
	.byte	0x5
	.byte	0x2e
	.byte	0x15
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x14
	.4byte	.LASF91
	.byte	0x1f
	.8byte	.LFB74
	.8byte	.LFE74-.LFB74
	.byte	0x1
	.byte	0x9c
	.4byte	0xba8
	.byte	0x11
	.4byte	.LASF92
	.byte	0x5
	.byte	0x1f
	.byte	0x25
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x4
	.string	"p"
	.byte	0x5
	.byte	0x20
	.byte	0x15
	.4byte	0x2df
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF93
	.4byte	0xbb8
	.byte	0x9
	.byte	0x3
	.8byte	__func__.1
	.byte	0x1c
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x4
	.string	"pa"
	.byte	0x5
	.byte	0x23
	.byte	0x12
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x4
	.string	"va"
	.byte	0x5
	.byte	0x25
	.byte	0x12
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x9
	.4byte	.LASF94
	.byte	0x5
	.byte	0x26
	.byte	0x19
	.4byte	0x535
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0x69
	.4byte	0xbb8
	.byte	0xc
	.4byte	0x5b
	.byte	0x12
	.byte	0
	.byte	0xb
	.4byte	0xba8
	.byte	0x1d
	.4byte	.LASF95
	.byte	0x4
	.byte	0x95
	.byte	0x18
	.4byte	0x4f
	.8byte	.LFB50
	.8byte	.LFE50-.LFB50
	.byte	0x1
	.byte	0x9c
	.4byte	0xbed
	.byte	0x4
	.string	"x"
	.byte	0x4
	.byte	0x97
	.byte	0xc
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x30
	.4byte	.LASF96
	.byte	0x3
	.2byte	0x120
	.byte	0x1
	.4byte	0x75
	.8byte	.LFB44
	.8byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0xc1f
	.byte	0x16
	.string	"x"
	.byte	0x3
	.2byte	0x122
	.byte	0xc
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x1e
	.4byte	.LASF97
	.2byte	0x119
	.8byte	.LFB43
	.8byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.byte	0x1e
	.4byte	.LASF98
	.2byte	0x112
	.8byte	.LFB42
	.8byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.byte	0x31
	.4byte	.LASF100
	.byte	0x3
	.byte	0x40
	.byte	0x1
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0xc7d
	.byte	0xd
	.string	"x"
	.byte	0x3
	.byte	0x40
	.byte	0x14
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x1d
	.4byte	.LASF99
	.byte	0x3
	.byte	0x38
	.byte	0x1
	.4byte	0x4f
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0xcad
	.byte	0x4
	.string	"x"
	.byte	0x3
	.byte	0x3a
	.byte	0xc
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x32
	.4byte	.LASF101
	.byte	0x2
	.byte	0x1c
	.byte	0x14
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0xd3d
	.byte	0x11
	.4byte	.LASF102
	.byte	0x2
	.byte	0x1c
	.byte	0x26
	.4byte	0x107
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x77
	.byte	0x11
	.4byte	.LASF103
	.byte	0x2
	.byte	0x1c
	.byte	0x34
	.4byte	0x75
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x77
	.byte	0x11
	.4byte	.LASF104
	.byte	0x2
	.byte	0x1c
	.byte	0x46
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x77
	.byte	0x11
	.4byte	.LASF105
	.byte	0x2
	.byte	0x1c
	.byte	0x58
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x77
	.byte	0xd
	.string	"msg"
	.byte	0x2
	.byte	0x1c
	.byte	0x6e
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0x18
	.byte	0x4
	.string	"buf"
	.byte	0x2
	.byte	0x22
	.byte	0xa
	.4byte	0xd3d
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x77
	.byte	0x9
	.4byte	.LASF106
	.byte	0x2
	.byte	0x23
	.byte	0xd
	.4byte	0x11d
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x77
	.byte	0
	.byte	0x7
	.4byte	0x62
	.4byte	0xd4e
	.byte	0x33
	.4byte	0x5b
	.2byte	0x3ff
	.byte	0
	.byte	0x34
	.4byte	.LASF114
	.byte	0x1
	.byte	0x2c
	.byte	0x14
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x1c
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x4
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0x26
	.byte	0
	.byte	0x49
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x7
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x22
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x26
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x28
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
	.byte	0x29
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0x2c
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
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x2d
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
	.byte	0x2e
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
	.byte	0x2f
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x30
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
	.byte	0x31
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
	.byte	0x32
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
	.byte	0x33
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x34
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
.LASF71:
	.string	"spinlock_init"
.LASF42:
	.string	"_USED"
.LASF108:
	.string	"__builtin_va_list"
.LASF111:
	.string	"uvmcreate"
.LASF112:
	.string	"forkret"
.LASF14:
	.string	"size_t"
.LASF50:
	.string	"__addr_marker_t"
.LASF6:
	.string	"uint64_t"
.LASF21:
	.string	"va_list"
.LASF58:
	.string	"prot_bits"
.LASF37:
	.string	"kernel_satp"
.LASF105:
	.string	"condition"
.LASF78:
	.string	"push_off"
.LASF65:
	.string	"wait_lock"
.LASF43:
	.string	"SLEEPING"
.LASF80:
	.string	"setkilled"
.LASF49:
	.string	"pgd_t"
.LASF52:
	.string	"addr_marker_t"
.LASF101:
	.string	"kpanic_spin"
.LASF77:
	.string	"pop_off"
.LASF33:
	.string	"parent"
.LASF56:
	.string	"property_bit_t"
.LASF29:
	.string	"state"
.LASF10:
	.string	"long int"
.LASF114:
	.string	"supervisor_interrupt_disable"
.LASF89:
	.string	"cpuid"
.LASF107:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF13:
	.string	"True"
.LASF61:
	.string	"initproc"
.LASF20:
	.string	"spinlock_t"
.LASF63:
	.string	"trampoline"
.LASF27:
	.string	"process"
.LASF15:
	.string	"byte"
.LASF47:
	.string	"__page_property_t"
.LASF4:
	.string	"unsigned int"
.LASF17:
	.string	"pagetable_t"
.LASF24:
	.string	"proc"
.LASF7:
	.string	"long unsigned int"
.LASF70:
	.string	"spinlock_acquire"
.LASF81:
	.string	"proc_pagetable"
.LASF19:
	.string	"name"
.LASF44:
	.string	"RUNNABLE"
.LASF3:
	.string	"short unsigned int"
.LASF39:
	.string	"kernel_trap"
.LASF59:
	.string	"cpus"
.LASF97:
	.string	"intr_off"
.LASF31:
	.string	"killed"
.LASF109:
	.string	"procstate"
.LASF38:
	.string	"kernel_sp"
.LASF36:
	.string	"trapframe"
.LASF46:
	.string	"ZOMBIE"
.LASF55:
	.string	"clear"
.LASF102:
	.string	"filename"
.LASF83:
	.string	"allocproc"
.LASF18:
	.string	"locked"
.LASF12:
	.string	"False"
.LASF76:
	.string	"userinit"
.LASF85:
	.string	"myproc"
.LASF92:
	.string	"kernel_pgdir"
.LASF60:
	.string	"processes"
.LASF66:
	.string	"mappages"
.LASF41:
	.string	"_UNUSED"
.LASF34:
	.string	"kstack"
.LASF35:
	.string	"pagetable"
.LASF2:
	.string	"unsigned char"
.LASF32:
	.string	"xstate"
.LASF54:
	.string	"mask"
.LASF82:
	.string	"freeproc"
.LASF9:
	.string	"short int"
.LASF98:
	.string	"intr_on"
.LASF26:
	.string	"intena"
.LASF45:
	.string	"RUNNING"
.LASF93:
	.string	"__func__"
.LASF53:
	.string	"__property_bit_t"
.LASF88:
	.string	"mycpu"
.LASF51:
	.string	"start_address"
.LASF91:
	.string	"process_statck_map"
.LASF30:
	.string	"chan"
.LASF8:
	.string	"char"
.LASF104:
	.string	"func"
.LASF113:
	.string	"FOUND"
.LASF96:
	.string	"intr_get"
.LASF57:
	.string	"address_markers"
.LASF103:
	.string	"line"
.LASF72:
	.string	"vsprintf"
.LASF23:
	.string	"context"
.LASF62:
	.string	"nextpid"
.LASF64:
	.string	"pid_lock"
.LASF84:
	.string	"allocpid"
.LASF90:
	.string	"procinit"
.LASF69:
	.string	"spinlock_release"
.LASF95:
	.string	"read_tp"
.LASF67:
	.string	"memset"
.LASF48:
	.string	"page_property_t"
.LASF79:
	.string	"uvmfree"
.LASF100:
	.string	"w_sstatus"
.LASF74:
	.string	"create_mapping"
.LASF99:
	.string	"r_sstatus"
.LASF5:
	.string	"uint8_t"
.LASF68:
	.string	"malloc_page"
.LASF110:
	.string	"usertrapret"
.LASF73:
	.string	"kprintf"
.LASF25:
	.string	"noff"
.LASF40:
	.string	"kernel_hartid"
.LASF75:
	.string	"alloc_ppage"
.LASF86:
	.string	"tempc"
.LASF16:
	.string	"addr_t"
.LASF11:
	.string	"Bool"
.LASF94:
	.string	"pproperty"
.LASF106:
	.string	"args"
.LASF28:
	.string	"lock"
.LASF22:
	.string	"__spinlock_t"
.LASF87:
	.string	"tempp"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"kernel/process.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
