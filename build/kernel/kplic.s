	.file	"kplic.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "kernel/kplic.c"
	.align	2
	.type	read_32_bits, @function
read_32_bits:
.LFB2:
	.file 1 "include/io.h"
	.loc 1 162 49
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	.loc 1 162 67
	ld	a5,8(sp)
	.loc 1 162 60
	lw	a5,0(a5)
	sw	a5,28(sp)
	.loc 1 162 93
	.loc 1 162 142
	lw	a5,28(sp)
	.loc 1 162 147
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	read_32_bits, .-read_32_bits
	.align	2
	.type	write_32_bits, @function
write_32_bits:
.LFB6:
	.loc 1 167 62
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	mv	a5,a1
	sw	a5,4(sp)
	.loc 1 167 73
	lw	a5,4(sp)
	sw	a5,28(sp)
	.loc 1 167 86
	.loc 1 167 129
	ld	a5,8(sp)
	.loc 1 167 154
	lw	a4,28(sp)
	sw	a4,0(a5)
	.loc 1 167 161
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	write_32_bits, .-write_32_bits
	.align	2
	.type	plic_priority_addr, @function
plic_priority_addr:
.LFB8:
	.file 2 "include/asm/plic.h"
	.loc 2 42 56
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	mv	a5,a0
	sw	a5,12(sp)
	.loc 2 43 42
	lw	a5,12(sp)
	slliw	a5,a5,2
	sext.w	a5,a5
	slli	a4,a5,32
	srli	a4,a4,32
	.loc 2 43 12
	li	a5,201326592
	add	a5,a4,a5
	.loc 2 44 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	plic_priority_addr, .-plic_priority_addr
	.align	2
	.type	plic_enable_addr, @function
plic_enable_addr:
.LFB10:
	.loc 2 68 65
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 2 69 49
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L7
	.loc 2 69 49 is_stmt 0 discriminator 1
	li	a5,8192
	j	.L8
.L7:
	.loc 2 69 49 discriminator 2
	li	a5,8192
	addi	a5,a5,128
.L8:
	.loc 2 69 14 is_stmt 1 discriminator 4
	sd	a5,24(sp)
	.loc 2 70 49 discriminator 4
	ld	a5,8(sp)
	slli	a4,a5,7
	.loc 2 70 12 discriminator 4
	ld	a5,24(sp)
	add	a4,a4,a5
	li	a5,201326592
	add	a5,a4,a5
	.loc 2 71 1 discriminator 4
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	plic_enable_addr, .-plic_enable_addr
	.align	2
	.type	plic_threshold_addr, @function
plic_threshold_addr:
.LFB11:
	.loc 2 83 68
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 2 84 51
	lbu	a5,7(sp)
	andi	a4,a5,0xff
	li	a5,1
	bne	a4,a5,.L11
	.loc 2 84 51 is_stmt 0 discriminator 1
	li	a5,2097152
	j	.L12
.L11:
	.loc 2 84 51 discriminator 2
	li	a5,2101248
.L12:
	.loc 2 84 14 is_stmt 1 discriminator 4
	sd	a5,24(sp)
	.loc 2 85 49 discriminator 4
	ld	a5,8(sp)
	slli	a4,a5,12
	.loc 2 85 12 discriminator 4
	ld	a5,24(sp)
	add	a4,a4,a5
	li	a5,201326592
	add	a5,a4,a5
	.loc 2 86 1 discriminator 4
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	plic_threshold_addr, .-plic_threshold_addr
	.align	2
	.type	plic_claim_addr, @function
plic_claim_addr:
.LFB12:
	.loc 2 98 64
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 2 99 12
	lbu	a5,7(sp)
	mv	a1,a5
	ld	a0,8(sp)
	call	plic_threshold_addr
	mv	a5,a0
	.loc 2 99 45
	addi	a5,a5,4
	.loc 2 100 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	plic_claim_addr, .-plic_claim_addr
	.align	2
	.globl	kplic_set_priority
	.type	kplic_set_priority, @function
kplic_set_priority:
.LFB16:
	.file 3 "kernel/kplic.c"
	.loc 3 24 59
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	mv	a5,a0
	mv	a4,a1
	sw	a5,12(sp)
	mv	a5,a4
	sw	a5,8(sp)
	.loc 3 26 23
	lw	a5,12(sp)
	mv	a0,a5
	call	plic_priority_addr
	sd	a0,24(sp)
	.loc 3 30 5
	lw	a5,8(sp)
	mv	a1,a5
	ld	a0,24(sp)
	call	write_32_bits
	.loc 3 31 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	kplic_set_priority, .-kplic_set_priority
	.align	2
	.globl	kplic_enable_interrupt
	.type	kplic_enable_interrupt, @function
kplic_enable_interrupt:
.LFB17:
	.loc 3 33 84
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	mv	a5,a1
	mv	a4,a3
	sw	a5,4(sp)
	mv	a5,a2
	sb	a5,3(sp)
	mv	a5,a4
	sb	a5,2(sp)
	.loc 3 35 39
	lw	a5,4(sp)
	andi	a5,a5,31
	sext.w	a5,a5
	.loc 3 35 29
	li	a4,1
	sllw	a5,a4,a5
	sext.w	a5,a5
	.loc 3 35 14
	sw	a5,28(sp)
	.loc 3 36 26
	ld	a5,8(sp)
	sext.w	a5,a5
	addiw	a5,a5,1
	sext.w	a5,a5
	.loc 3 36 9
	sw	a5,24(sp)
	.loc 3 38 23
	lw	a5,24(sp)
	lbu	a4,2(sp)
	mv	a1,a4
	mv	a0,a5
	call	plic_enable_addr
	mv	a4,a0
	.loc 3 38 70
	lw	a5,4(sp)
	srliw	a5,a5,5
	sext.w	a5,a5
	.loc 3 38 61
	slliw	a5,a5,2
	sext.w	a5,a5
	slli	a5,a5,32
	srli	a5,a5,32
	.loc 3 38 12
	add	a5,a4,a5
	sd	a5,16(sp)
	.loc 3 44 8
	lbu	a5,3(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L18
	.loc 3 45 33
	ld	a0,16(sp)
	call	read_32_bits
	mv	a5,a0
	sext.w	a5,a5
	.loc 3 45 9
	lw	a4,28(sp)
	or	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	ld	a0,16(sp)
	call	write_32_bits
	.loc 3 48 1
	j	.L20
.L18:
	.loc 3 47 33
	ld	a0,16(sp)
	call	read_32_bits
	mv	a5,a0
	sext.w	a4,a5
	.loc 3 47 58
	lw	a5,28(sp)
	not	a5,a5
	sext.w	a5,a5
	.loc 3 47 9
	and	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	ld	a0,16(sp)
	call	write_32_bits
.L20:
	.loc 3 48 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	kplic_enable_interrupt, .-kplic_enable_interrupt
	.section	.rodata
	.align	3
.LC0:
	.string	"KPLIC Info:"
	.align	3
.LC1:
	.string	"\tSet priority off INTR_NO %d~%d to 1\n"
	.align	3
.LC2:
	.string	"\tDisable INTR_NO %d~%d of all CPU\n"
	.align	3
.LC3:
	.string	"\tSet Interrupt Priority Threshold Register of all CPU to 0\n"
	.align	3
.LC4:
	.string	"\tSet Software External Interrupt (SEIE) of sie\n"
	.align	3
.LC5:
	.string	"\tEnable UART0 Interrupt (SEIE) of CPU 0\n"
	.text
	.align	2
	.globl	kplic_init
	.type	kplic_init, @function
kplic_init:
.LFB18:
	.loc 3 50 22
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	.loc 3 51 5
	lla	a0,.LC0
	call	kprintf
	.loc 3 52 5
	li	a2,53
	li	a1,1
	lla	a0,.LC1
	call	kprintf
.LBB2:
	.loc 3 54 14
	li	a5,1
	sw	a5,28(sp)
	.loc 3 54 5
	j	.L22
.L23:
	.loc 3 55 9 discriminator 3
	lw	a5,28(sp)
	li	a1,1
	mv	a0,a5
	call	kplic_set_priority
	.loc 3 54 43 discriminator 3
	lw	a5,28(sp)
	addiw	a5,a5,1
	sw	a5,28(sp)
.L22:
	.loc 3 54 31 discriminator 1
	lw	a5,28(sp)
	sext.w	a4,a5
	li	a5,53
	ble	a4,a5,.L23
.LBE2:
	.loc 3 57 5
	li	a2,53
	li	a1,1
	lla	a0,.LC2
	call	kprintf
	.loc 3 58 5
	lla	a0,.LC3
	call	kprintf
.LBB3:
	.loc 3 59 14
	sw	zero,24(sp)
	.loc 3 59 5
	j	.L24
.L27:
	.loc 3 61 53
	lw	a5,24(sp)
	addiw	a5,a5,1
	sext.w	a5,a5
	.loc 3 61 9
	li	a1,1
	mv	a0,a5
	call	plic_threshold_addr
	mv	a5,a0
	li	a1,0
	mv	a0,a5
	call	write_32_bits
.LBB4:
	.loc 3 63 18
	li	a5,1
	sw	a5,20(sp)
	.loc 3 63 9
	j	.L25
.L26:
	.loc 3 64 13 discriminator 3
	lw	a5,24(sp)
	lw	a4,20(sp)
	li	a3,1
	li	a2,0
	mv	a1,a4
	mv	a0,a5
	call	kplic_enable_interrupt
	.loc 3 63 47 discriminator 3
	lw	a5,20(sp)
	addiw	a5,a5,1
	sw	a5,20(sp)
.L25:
	.loc 3 63 35 discriminator 1
	lw	a5,20(sp)
	sext.w	a4,a5
	li	a5,53
	ble	a4,a5,.L26
.LBE4:
	.loc 3 59 44 discriminator 2
	lw	a5,24(sp)
	addiw	a5,a5,1
	sw	a5,24(sp)
.L24:
	.loc 3 59 33 discriminator 1
	lw	a5,24(sp)
	sext.w	a5,a5
	ble	a5,zero,.L27
.LBE3:
	.loc 3 68 5
	lla	a0,.LC4
	call	kprintf
.LBB5:
	.loc 3 69 22
	li	a5,512
	sd	a5,8(sp)
	.loc 3 69 61
	ld	a5,8(sp)
 #APP
# 69 "kernel/kplic.c" 1
	csrs sie, a5
# 0 "" 2
 #NO_APP
.LBE5:
	.loc 3 72 5
	lla	a0,.LC5
	call	kprintf
	.loc 3 73 5
	li	a3,1
	li	a2,1
	li	a1,10
	li	a0,0
	call	kplic_enable_interrupt
	.loc 3 74 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	kplic_init, .-kplic_init
	.globl	plic_intr_msg
	.section	.rodata
	.align	3
.LC6:
	.string	"Error"
	.align	3
.LC7:
	.string	"VIRTIO_IRQ Interrupt"
	.align	3
.LC8:
	.string	"UART0 Interrupt"
	.align	3
.LC9:
	.string	"RTC Interrupt"
	.align	3
.LC10:
	.string	"PCIe Interrupt"
	.data
	.align	3
	.type	plic_intr_msg, @object
	.size	plic_intr_msg, 424
plic_intr_msg:
	.dword	.LC6
	.dword	.LC7
	.dword	.LC7
	.dword	.LC7
	.dword	.LC7
	.dword	.LC7
	.dword	.LC7
	.dword	.LC7
	.dword	.LC7
	.dword	.LC6
	.dword	.LC8
	.dword	.LC9
	.zero	160
	.dword	.LC10
	.dword	.LC10
	.dword	.LC10
	.dword	.LC10
	.zero	136
	.text
	.align	2
	.globl	kplic_interrupt_handler
	.type	kplic_interrupt_handler, @function
kplic_interrupt_handler:
.LFB19:
	.loc 3 90 55
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
.LBB6:
	.loc 3 92 22
	li	a5,512
	sd	a5,56(sp)
	.loc 3 92 61
	ld	a5,56(sp)
 #APP
# 92 "kernel/kplic.c" 1
	csrc sie, a5
# 0 "" 2
 #NO_APP
.LBE6:
	.loc 3 95 9
	li	a5,1
	sw	a5,52(sp)
	.loc 3 97 29
	lw	a5,52(sp)
	li	a1,1
	mv	a0,a5
	call	plic_claim_addr
	sd	a0,40(sp)
	.loc 3 98 14
	li	a5,-1
	sw	a5,36(sp)
	.loc 3 101 11
	j	.L29
.L31:
	.loc 3 106 12
	lw	a5,36(sp)
	sext.w	a4,a5
	li	a5,10
	bne	a4,a5,.L30
	.loc 3 107 13
	call	uart_interrupt_handler
.L30:
	.loc 3 110 9
	lw	a5,36(sp)
	mv	a1,a5
	ld	a0,40(sp)
	call	write_32_bits
.L29:
	.loc 3 103 18
	ld	a0,40(sp)
	call	read_32_bits
	mv	a5,a0
	sw	a5,36(sp)
	.loc 3 103 48
	lw	a5,36(sp)
	sext.w	a5,a5
	bne	a5,zero,.L31
.LBB7:
	.loc 3 114 22
	li	a5,512
	sd	a5,24(sp)
	.loc 3 114 61
	ld	a5,24(sp)
 #APP
# 114 "kernel/kplic.c" 1
	csrs sie, a5
# 0 "" 2
 #NO_APP
.LBE7:
	.loc 3 115 12
	li	a5,0
	.loc 3 116 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	kplic_interrupt_handler, .-kplic_interrupt_handler
.Letext0:
	.file 4 "include/types.h"
	.file 5 "include/trap/trapframe.h"
	.file 6 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x991
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0x13
	.4byte	.LASF74
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x8
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x7
	.4byte	.LASF5
	.byte	0x4
	.byte	0x19
	.byte	0x16
	.4byte	0x48
	.byte	0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x4
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
	.byte	0x14
	.4byte	0x62
	.byte	0x8
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0x15
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x7
	.4byte	.LASF10
	.byte	0x4
	.byte	0x20
	.byte	0xe
	.4byte	0x88
	.byte	0x8
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x7
	.4byte	.LASF12
	.byte	0x4
	.byte	0x23
	.byte	0x17
	.4byte	0x2e
	.byte	0x16
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x4
	.byte	0x24
	.byte	0x6
	.4byte	0xb6
	.byte	0xc
	.4byte	.LASF13
	.byte	0
	.byte	0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0
	.byte	0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2a
	.byte	0x12
	.4byte	0x4f
	.byte	0x7
	.4byte	.LASF16
	.byte	0x4
	.byte	0x30
	.byte	0x11
	.4byte	0x7c
	.byte	0x7
	.4byte	.LASF17
	.byte	0x4
	.byte	0x33
	.byte	0x12
	.4byte	0x4f
	.byte	0x7
	.4byte	.LASF18
	.byte	0x4
	.byte	0x36
	.byte	0x12
	.4byte	0x4f
	.byte	0x2
	.byte	0x1f
	.4byte	0x102
	.byte	0x1
	.string	"_x1"
	.byte	0x1f
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"ra"
	.byte	0x1f
	.byte	0x20
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x21
	.4byte	0x11e
	.byte	0x1
	.string	"_x2"
	.byte	0x21
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"sp"
	.byte	0x21
	.byte	0x20
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x23
	.4byte	0x13a
	.byte	0x1
	.string	"_x3"
	.byte	0x23
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"gp"
	.byte	0x23
	.byte	0x20
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x25
	.4byte	0x156
	.byte	0x1
	.string	"_x4"
	.byte	0x25
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"tp"
	.byte	0x25
	.byte	0x20
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x27
	.4byte	0x172
	.byte	0x1
	.string	"_x5"
	.byte	0x27
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"t0"
	.byte	0x27
	.byte	0x20
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x29
	.4byte	0x18e
	.byte	0x1
	.string	"_x6"
	.byte	0x29
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"t1"
	.byte	0x29
	.byte	0x20
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x2b
	.4byte	0x1aa
	.byte	0x1
	.string	"_x7"
	.byte	0x2b
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"t2"
	.byte	0x2b
	.byte	0x20
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x2d
	.4byte	0x1d0
	.byte	0x1
	.string	"_x8"
	.byte	0x2d
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"s0"
	.byte	0x2d
	.byte	0x20
	.4byte	0xda
	.byte	0x1
	.string	"fp"
	.byte	0x2d
	.byte	0x2b
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x2f
	.4byte	0x1ec
	.byte	0x1
	.string	"_x9"
	.byte	0x2f
	.byte	0x14
	.4byte	0xda
	.byte	0x1
	.string	"s1"
	.byte	0x2f
	.byte	0x20
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x31
	.4byte	0x207
	.byte	0x4
	.4byte	.LASF19
	.byte	0x31
	.4byte	0xda
	.byte	0x1
	.string	"a0"
	.byte	0x31
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x33
	.4byte	0x222
	.byte	0x4
	.4byte	.LASF20
	.byte	0x33
	.4byte	0xda
	.byte	0x1
	.string	"a1"
	.byte	0x33
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x35
	.4byte	0x23d
	.byte	0x4
	.4byte	.LASF21
	.byte	0x35
	.4byte	0xda
	.byte	0x1
	.string	"a2"
	.byte	0x35
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x37
	.4byte	0x258
	.byte	0x4
	.4byte	.LASF22
	.byte	0x37
	.4byte	0xda
	.byte	0x1
	.string	"a3"
	.byte	0x37
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x39
	.4byte	0x273
	.byte	0x4
	.4byte	.LASF23
	.byte	0x39
	.4byte	0xda
	.byte	0x1
	.string	"a4"
	.byte	0x39
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x3b
	.4byte	0x28e
	.byte	0x4
	.4byte	.LASF24
	.byte	0x3b
	.4byte	0xda
	.byte	0x1
	.string	"a5"
	.byte	0x3b
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x3d
	.4byte	0x2a9
	.byte	0x4
	.4byte	.LASF25
	.byte	0x3d
	.4byte	0xda
	.byte	0x1
	.string	"a6"
	.byte	0x3d
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x3f
	.4byte	0x2c4
	.byte	0x4
	.4byte	.LASF26
	.byte	0x3f
	.4byte	0xda
	.byte	0x1
	.string	"a7"
	.byte	0x3f
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x41
	.4byte	0x2df
	.byte	0x4
	.4byte	.LASF27
	.byte	0x41
	.4byte	0xda
	.byte	0x1
	.string	"s2"
	.byte	0x41
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x43
	.4byte	0x2fa
	.byte	0x4
	.4byte	.LASF28
	.byte	0x43
	.4byte	0xda
	.byte	0x1
	.string	"s3"
	.byte	0x43
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x45
	.4byte	0x315
	.byte	0x4
	.4byte	.LASF29
	.byte	0x45
	.4byte	0xda
	.byte	0x1
	.string	"s4"
	.byte	0x45
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x47
	.4byte	0x330
	.byte	0x4
	.4byte	.LASF30
	.byte	0x47
	.4byte	0xda
	.byte	0x1
	.string	"s5"
	.byte	0x47
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x49
	.4byte	0x34b
	.byte	0x4
	.4byte	.LASF31
	.byte	0x49
	.4byte	0xda
	.byte	0x1
	.string	"s6"
	.byte	0x49
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x4b
	.4byte	0x366
	.byte	0x4
	.4byte	.LASF32
	.byte	0x4b
	.4byte	0xda
	.byte	0x1
	.string	"s7"
	.byte	0x4b
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x4d
	.4byte	0x381
	.byte	0x4
	.4byte	.LASF33
	.byte	0x4d
	.4byte	0xda
	.byte	0x1
	.string	"s8"
	.byte	0x4d
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x4f
	.4byte	0x39c
	.byte	0x4
	.4byte	.LASF34
	.byte	0x4f
	.4byte	0xda
	.byte	0x1
	.string	"s9"
	.byte	0x4f
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x51
	.4byte	0x3b8
	.byte	0x4
	.4byte	.LASF35
	.byte	0x51
	.4byte	0xda
	.byte	0x1
	.string	"s10"
	.byte	0x51
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x53
	.4byte	0x3d4
	.byte	0x4
	.4byte	.LASF36
	.byte	0x53
	.4byte	0xda
	.byte	0x1
	.string	"s11"
	.byte	0x53
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x55
	.4byte	0x3ef
	.byte	0x4
	.4byte	.LASF37
	.byte	0x55
	.4byte	0xda
	.byte	0x1
	.string	"t3"
	.byte	0x55
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x57
	.4byte	0x40a
	.byte	0x4
	.4byte	.LASF38
	.byte	0x57
	.4byte	0xda
	.byte	0x1
	.string	"t4"
	.byte	0x57
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x59
	.4byte	0x425
	.byte	0x4
	.4byte	.LASF39
	.byte	0x59
	.4byte	0xda
	.byte	0x1
	.string	"t5"
	.byte	0x59
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x2
	.byte	0x5b
	.4byte	0x440
	.byte	0x4
	.4byte	.LASF40
	.byte	0x5b
	.4byte	0xda
	.byte	0x1
	.string	"t6"
	.byte	0x5b
	.byte	0x21
	.4byte	0xda
	.byte	0
	.byte	0x17
	.4byte	.LASF42
	.byte	0xf8
	.byte	0x5
	.byte	0x1d
	.byte	0x10
	.4byte	0x508
	.byte	0x3
	.4byte	0xe6
	.byte	0
	.byte	0x3
	.4byte	0x102
	.byte	0x8
	.byte	0x3
	.4byte	0x11e
	.byte	0x10
	.byte	0x3
	.4byte	0x13a
	.byte	0x18
	.byte	0x3
	.4byte	0x156
	.byte	0x20
	.byte	0x3
	.4byte	0x172
	.byte	0x28
	.byte	0x3
	.4byte	0x18e
	.byte	0x30
	.byte	0x3
	.4byte	0x1aa
	.byte	0x38
	.byte	0x3
	.4byte	0x1d0
	.byte	0x40
	.byte	0x3
	.4byte	0x1ec
	.byte	0x48
	.byte	0x3
	.4byte	0x207
	.byte	0x50
	.byte	0x3
	.4byte	0x222
	.byte	0x58
	.byte	0x3
	.4byte	0x23d
	.byte	0x60
	.byte	0x3
	.4byte	0x258
	.byte	0x68
	.byte	0x3
	.4byte	0x273
	.byte	0x70
	.byte	0x3
	.4byte	0x28e
	.byte	0x78
	.byte	0x3
	.4byte	0x2a9
	.byte	0x80
	.byte	0x3
	.4byte	0x2c4
	.byte	0x88
	.byte	0x3
	.4byte	0x2df
	.byte	0x90
	.byte	0x3
	.4byte	0x2fa
	.byte	0x98
	.byte	0x3
	.4byte	0x315
	.byte	0xa0
	.byte	0x3
	.4byte	0x330
	.byte	0xa8
	.byte	0x3
	.4byte	0x34b
	.byte	0xb0
	.byte	0x3
	.4byte	0x366
	.byte	0xb8
	.byte	0x3
	.4byte	0x381
	.byte	0xc0
	.byte	0x3
	.4byte	0x39c
	.byte	0xc8
	.byte	0x3
	.4byte	0x3b8
	.byte	0xd0
	.byte	0x3
	.4byte	0x3d4
	.byte	0xd8
	.byte	0x3
	.4byte	0x3ef
	.byte	0xe0
	.byte	0x3
	.4byte	0x40a
	.byte	0xe8
	.byte	0x3
	.4byte	0x425
	.byte	0xf0
	.byte	0
	.byte	0x7
	.4byte	.LASF41
	.byte	0x5
	.byte	0x7f
	.byte	0x3
	.4byte	0x440
	.byte	0x18
	.4byte	.LASF43
	.2byte	0x120
	.byte	0x5
	.byte	0x8e
	.byte	0x10
	.4byte	0x56b
	.byte	0x11
	.4byte	.LASF44
	.byte	0x90
	.byte	0xc
	.4byte	0xda
	.byte	0
	.byte	0x11
	.4byte	.LASF45
	.byte	0x92
	.byte	0x12
	.4byte	0x508
	.byte	0x8
	.byte	0xa
	.4byte	.LASF46
	.byte	0x94
	.4byte	0xda
	.2byte	0x100
	.byte	0xa
	.4byte	.LASF47
	.byte	0x96
	.4byte	0xda
	.2byte	0x108
	.byte	0xa
	.4byte	.LASF48
	.byte	0x98
	.4byte	0xda
	.2byte	0x110
	.byte	0xa
	.4byte	.LASF49
	.byte	0x9a
	.4byte	0xda
	.2byte	0x118
	.byte	0
	.byte	0x7
	.4byte	.LASF50
	.byte	0x5
	.byte	0x9b
	.byte	0x3
	.4byte	0x514
	.byte	0x12
	.4byte	0x69
	.byte	0x12
	.4byte	0x56b
	.byte	0x19
	.4byte	.LASF75
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x3
	.byte	0x11
	.byte	0xe
	.4byte	0x59a
	.byte	0xc
	.4byte	.LASF51
	.byte	0xa
	.byte	0
	.byte	0x1a
	.4byte	0x577
	.4byte	0x5aa
	.byte	0x1b
	.4byte	0x5b
	.byte	0x34
	.byte	0
	.byte	0x1c
	.4byte	.LASF76
	.byte	0x3
	.byte	0x4e
	.byte	0xd
	.4byte	0x59a
	.byte	0x9
	.byte	0x3
	.8byte	plic_intr_msg
	.byte	0x1d
	.4byte	.LASF77
	.byte	0x3
	.byte	0x58
	.byte	0xd
	.byte	0x1e
	.4byte	.LASF78
	.byte	0x6
	.byte	0x43
	.byte	0x8
	.4byte	0xb6
	.4byte	0x5df
	.byte	0x1f
	.4byte	0x577
	.byte	0x20
	.byte	0
	.byte	0x21
	.4byte	.LASF79
	.byte	0x3
	.byte	0x5a
	.byte	0x9
	.4byte	0x7c
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x685
	.byte	0x5
	.4byte	.LASF58
	.byte	0x3
	.byte	0x5a
	.byte	0x2f
	.4byte	0x57c
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x6
	.4byte	.LASF52
	.byte	0x3
	.byte	0x5f
	.byte	0x9
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x6
	.4byte	.LASF53
	.byte	0x3
	.byte	0x61
	.byte	0xc
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.4byte	.LASF54
	.byte	0x3
	.byte	0x62
	.byte	0xe
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0xd
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x663
	.byte	0x9
	.string	"__v"
	.byte	0x3
	.byte	0x5c
	.byte	0x16
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.byte	0x9
	.string	"__v"
	.byte	0x3
	.byte	0x72
	.byte	0x16
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LASF56
	.byte	0x32
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x72e
	.byte	0xd
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x6c6
	.byte	0x6
	.4byte	.LASF54
	.byte	0x3
	.byte	0x36
	.byte	0xe
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xd
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x70c
	.byte	0x6
	.4byte	.LASF55
	.byte	0x3
	.byte	0x3b
	.byte	0xe
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xe
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x6
	.4byte	.LASF54
	.byte	0x3
	.byte	0x3f
	.byte	0x12
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0
	.byte	0xe
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.byte	0x9
	.string	"__v"
	.byte	0x3
	.byte	0x45
	.byte	0x16
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LASF57
	.byte	0x21
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x7b4
	.byte	0xb
	.string	"cid"
	.byte	0x3
	.byte	0x21
	.byte	0x26
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.4byte	.LASF54
	.byte	0x3
	.byte	0x21
	.byte	0x34
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x5
	.4byte	.LASF59
	.byte	0x3
	.byte	0x21
	.byte	0x40
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x53
	.byte	0x5
	.4byte	.LASF60
	.byte	0x3
	.byte	0x21
	.byte	0x4d
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x52
	.byte	0x6
	.4byte	.LASF61
	.byte	0x3
	.byte	0x23
	.byte	0xe
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.4byte	.LASF52
	.byte	0x3
	.byte	0x24
	.byte	0x9
	.4byte	0x75
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF62
	.byte	0x3
	.byte	0x26
	.byte	0xc
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xf
	.4byte	.LASF63
	.byte	0x18
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x7fe
	.byte	0x5
	.4byte	.LASF54
	.byte	0x3
	.byte	0x18
	.byte	0x22
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x5
	.4byte	.LASF64
	.byte	0x3
	.byte	0x18
	.byte	0x32
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.4byte	.LASF62
	.byte	0x3
	.byte	0x1a
	.byte	0xc
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x22
	.4byte	.LASF65
	.byte	0x2
	.byte	0x62
	.byte	0x16
	.4byte	0xce
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x83f
	.byte	0xb
	.string	"hid"
	.byte	0x2
	.byte	0x62
	.byte	0x2f
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x5
	.4byte	.LASF60
	.byte	0x2
	.byte	0x62
	.byte	0x39
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0
	.byte	0x10
	.4byte	.LASF66
	.byte	0x53
	.4byte	0xce
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x88d
	.byte	0xb
	.string	"hid"
	.byte	0x2
	.byte	0x53
	.byte	0x33
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x5
	.4byte	.LASF60
	.byte	0x2
	.byte	0x53
	.byte	0x3d
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x6
	.4byte	.LASF67
	.byte	0x2
	.byte	0x54
	.byte	0xe
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x10
	.4byte	.LASF68
	.byte	0x44
	.4byte	0xce
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x8db
	.byte	0xb
	.string	"hid"
	.byte	0x2
	.byte	0x44
	.byte	0x30
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x5
	.4byte	.LASF60
	.byte	0x2
	.byte	0x44
	.byte	0x3a
	.4byte	0x8f
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x6
	.4byte	.LASF67
	.byte	0x2
	.byte	0x45
	.byte	0xe
	.4byte	0xc2
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x10
	.4byte	.LASF69
	.byte	0x2a
	.4byte	0xce
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x90b
	.byte	0x5
	.4byte	.LASF54
	.byte	0x2
	.byte	0x2a
	.byte	0x32
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x7c
	.byte	0
	.byte	0x23
	.4byte	.LASF72
	.byte	0x1
	.byte	0xa7
	.byte	0x14
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x957
	.byte	0x5
	.4byte	.LASF70
	.byte	0x1
	.byte	0xa7
	.byte	0x29
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x5
	.4byte	.LASF71
	.byte	0x1
	.byte	0xa7
	.byte	0x38
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x9
	.string	"__v"
	.byte	0x1
	.byte	0xa7
	.byte	0x49
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x7c
	.byte	0
	.byte	0x24
	.4byte	.LASF73
	.byte	0x1
	.byte	0xa2
	.byte	0x18
	.4byte	0x3c
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.4byte	.LASF70
	.byte	0x1
	.byte	0xa2
	.byte	0x2c
	.4byte	0xce
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x9
	.string	"__v"
	.byte	0x1
	.byte	0xa2
	.byte	0x3c
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x7c
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x7
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
	.byte	0xa
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x5
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
	.byte	0xb
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
	.byte	0xc
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
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
	.byte	0x10
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x16
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
	.byte	0x11
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1d
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
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
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
.LASF70:
	.string	"addr"
.LASF48:
	.string	"scause"
.LASF64:
	.string	"priority"
.LASF6:
	.string	"uint64_t"
.LASF9:
	.string	"short int"
.LASF15:
	.string	"size_t"
.LASF54:
	.string	"hwiid"
.LASF79:
	.string	"kplic_interrupt_handler"
.LASF68:
	.string	"plic_enable_addr"
.LASF78:
	.string	"kprintf"
.LASF51:
	.string	"UART0_INTERRUPT"
.LASF18:
	.string	"ireg_t"
.LASF53:
	.string	"claim_reg_addr"
.LASF40:
	.string	"_x31"
.LASF39:
	.string	"_x30"
.LASF10:
	.string	"int64_t"
.LASF59:
	.string	"enable"
.LASF46:
	.string	"sstatus"
.LASF65:
	.string	"plic_claim_addr"
.LASF75:
	.string	"__plic_interrupt_id_t"
.LASF17:
	.string	"addr_t"
.LASF76:
	.string	"plic_intr_msg"
.LASF72:
	.string	"write_32_bits"
.LASF41:
	.string	"gtrapframe_t"
.LASF52:
	.string	"hart_id"
.LASF13:
	.string	"False"
.LASF57:
	.string	"kplic_enable_interrupt"
.LASF63:
	.string	"kplic_set_priority"
.LASF11:
	.string	"long int"
.LASF67:
	.string	"offset"
.LASF60:
	.string	"m_mode"
.LASF56:
	.string	"kplic_init"
.LASF33:
	.string	"_x24"
.LASF69:
	.string	"plic_priority_addr"
.LASF73:
	.string	"read_32_bits"
.LASF34:
	.string	"_x25"
.LASF50:
	.string	"ktrapframe_t"
.LASF35:
	.string	"_x26"
.LASF62:
	.string	"reg_addr"
.LASF2:
	.string	"unsigned char"
.LASF43:
	.string	"__ktrapframe_t"
.LASF5:
	.string	"uint32_t"
.LASF4:
	.string	"unsigned int"
.LASF44:
	.string	"sepc"
.LASF49:
	.string	"origin_a0"
.LASF3:
	.string	"short unsigned int"
.LASF58:
	.string	"ktf_ptr"
.LASF61:
	.string	"hwiid_mask"
.LASF8:
	.string	"char"
.LASF42:
	.string	"__gtrapframe_t"
.LASF45:
	.string	"gregisters"
.LASF19:
	.string	"_x10"
.LASF20:
	.string	"_x11"
.LASF21:
	.string	"_x12"
.LASF22:
	.string	"_x13"
.LASF23:
	.string	"_x14"
.LASF24:
	.string	"_x15"
.LASF25:
	.string	"_x16"
.LASF26:
	.string	"_x17"
.LASF27:
	.string	"_x18"
.LASF28:
	.string	"_x19"
.LASF36:
	.string	"_x27"
.LASF37:
	.string	"_x28"
.LASF38:
	.string	"_x29"
.LASF7:
	.string	"long unsigned int"
.LASF77:
	.string	"uart_interrupt_handler"
.LASF74:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF16:
	.string	"offset_t"
.LASF14:
	.string	"True"
.LASF66:
	.string	"plic_threshold_addr"
.LASF55:
	.string	"cpu_id"
.LASF71:
	.string	"value"
.LASF29:
	.string	"_x20"
.LASF30:
	.string	"_x21"
.LASF31:
	.string	"_x22"
.LASF32:
	.string	"_x23"
.LASF47:
	.string	"sbadaddr"
.LASF12:
	.string	"Bool"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"kernel/kplic.c"
	.ident	"GCC: (g) 12.2.0"
