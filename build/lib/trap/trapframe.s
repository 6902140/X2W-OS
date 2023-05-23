	.file	"trapframe.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "lib/trap/trapframe.c"
	.section	.rodata
	.align	3
.LC0:
	.string	" gp : %#016lX tp : %#016lX t0 : %#016lX\n"
	.align	3
.LC1:
	.string	" t1 : %#016lX t2 : %#016lX t3 : %#016lX\n"
	.align	3
.LC2:
	.string	" s1 : %#016lX a0 : %#016lX a1 : %#016lX\n"
	.align	3
.LC3:
	.string	" a2 : %#016lX a3 : %#016lX a4 : %#016lX\n"
	.align	3
.LC4:
	.string	" a5 : %#016lX a6 : %#016lX a7 : %#016lX\n"
	.align	3
.LC5:
	.string	" s2 : %#016lX s3 : %#016lX s4 : %#016lX\n"
	.align	3
.LC6:
	.string	" s5 : %#016lX s6 : %#016lX s7 : %#016lX\n"
	.align	3
.LC7:
	.string	" s8 : %#016lX s9 : %#016lX s10: %#016lX\n"
	.align	3
.LC8:
	.string	" s11: %#016lX t3 : %#016lX t4 : %#016lX\n"
	.align	3
.LC9:
	.string	" t5 : %#016lX t6 : %#016lX sp : %#016lX\n"
	.align	3
.LC10:
	.string	" ra : %#016lX\n"
	.text
	.align	2
	.globl	print_gtrapframe
	.type	print_gtrapframe, @function
print_gtrapframe:
.LFB0:
	.file 1 "lib/trap/trapframe.c"
	.loc 1 14 66
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 15 14
	ld	a5,0(sp)
	sd	a5,24(sp)
	.loc 1 16 2
	ld	a5,8(sp)
	ld	a4,16(a5)
	ld	a5,8(sp)
	ld	a2,24(a5)
	ld	a5,8(sp)
	ld	a3,32(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC0
	jalr	a5
.LVL0:
	.loc 1 17 2
	ld	a5,8(sp)
	ld	a4,40(a5)
	ld	a5,8(sp)
	ld	a2,48(a5)
	ld	a5,8(sp)
	ld	a3,56(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC1
	jalr	a5
.LVL1:
	.loc 1 18 2
	ld	a5,8(sp)
	ld	a4,64(a5)
	ld	a5,8(sp)
	ld	a2,72(a5)
	ld	a5,8(sp)
	ld	a3,80(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC2
	jalr	a5
.LVL2:
	.loc 1 19 2
	ld	a5,8(sp)
	ld	a4,88(a5)
	ld	a5,8(sp)
	ld	a2,96(a5)
	ld	a5,8(sp)
	ld	a3,104(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC3
	jalr	a5
.LVL3:
	.loc 1 20 2
	ld	a5,8(sp)
	ld	a4,112(a5)
	ld	a5,8(sp)
	ld	a2,120(a5)
	ld	a5,8(sp)
	ld	a3,128(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC4
	jalr	a5
.LVL4:
	.loc 1 21 2
	ld	a5,8(sp)
	ld	a4,136(a5)
	ld	a5,8(sp)
	ld	a2,144(a5)
	ld	a5,8(sp)
	ld	a3,152(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC5
	jalr	a5
.LVL5:
	.loc 1 22 2
	ld	a5,8(sp)
	ld	a4,160(a5)
	ld	a5,8(sp)
	ld	a2,168(a5)
	ld	a5,8(sp)
	ld	a3,176(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC6
	jalr	a5
.LVL6:
	.loc 1 23 2
	ld	a5,8(sp)
	ld	a4,184(a5)
	ld	a5,8(sp)
	ld	a2,192(a5)
	ld	a5,8(sp)
	ld	a3,200(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC7
	jalr	a5
.LVL7:
	.loc 1 24 2
	ld	a5,8(sp)
	ld	a4,208(a5)
	ld	a5,8(sp)
	ld	a2,216(a5)
	ld	a5,8(sp)
	ld	a3,224(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC8
	jalr	a5
.LVL8:
	.loc 1 25 2
	ld	a5,8(sp)
	ld	a4,232(a5)
	ld	a5,8(sp)
	ld	a2,240(a5)
	ld	a5,8(sp)
	ld	a3,8(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC9
	jalr	a5
.LVL9:
	.loc 1 26 2
	ld	a5,8(sp)
	ld	a4,0(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC10
	jalr	a5
.LVL10:
	.loc 1 27 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	print_gtrapframe, .-print_gtrapframe
	.section	.rodata
	.align	3
.LC11:
	.string	"Print SBI Trap Frame at: %#016X\n"
	.align	3
.LC12:
	.string	"mepc: %#016lX                  mstatus : %#016lX\n"
	.text
	.align	2
	.globl	print_strapframe
	.type	print_strapframe, @function
print_strapframe:
.LFB1:
	.loc 1 30 66
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 31 14
	ld	a5,0(sp)
	sd	a5,24(sp)
	.loc 1 32 5
	ld	a5,24(sp)
	ld	a1,8(sp)
	lla	a0,.LC11
	jalr	a5
.LVL11:
	.loc 1 33 5
	ld	a5,8(sp)
	ld	a4,0(a5)
	ld	a5,8(sp)
	ld	a3,256(a5)
	ld	a5,24(sp)
	mv	a2,a3
	mv	a1,a4
	lla	a0,.LC12
	jalr	a5
.LVL12:
	.loc 1 34 2
	ld	a5,8(sp)
	addi	a5,a5,8
	ld	a1,24(sp)
	mv	a0,a5
	call	print_gtrapframe
	.loc 1 35 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	print_strapframe, .-print_strapframe
	.section	.rodata
	.align	3
.LC13:
	.string	"Print Kernel Trap Frame at: %#016X\n"
	.align	3
.LC14:
	.string	"origin_a0: %#016lX\n"
	.align	3
.LC15:
	.string	"sepc: %#016lX                  sstatus : %#016lX\n"
	.align	3
.LC16:
	.string	"scause: %#016lX               sbadaddr : %#016lX\n"
	.text
	.align	2
	.globl	print_ktrapframe
	.type	print_ktrapframe, @function
print_ktrapframe:
.LFB2:
	.loc 1 38 66
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 39 14
	ld	a5,0(sp)
	sd	a5,24(sp)
	.loc 1 40 5
	ld	a5,24(sp)
	ld	a1,8(sp)
	lla	a0,.LC13
	jalr	a5
.LVL13:
	.loc 1 41 2
	ld	a5,8(sp)
	ld	a4,280(a5)
	ld	a5,24(sp)
	mv	a1,a4
	lla	a0,.LC14
	jalr	a5
.LVL14:
	.loc 1 42 5
	ld	a5,8(sp)
	ld	a4,0(a5)
	ld	a5,8(sp)
	ld	a3,256(a5)
	ld	a5,24(sp)
	mv	a2,a3
	mv	a1,a4
	lla	a0,.LC15
	jalr	a5
.LVL15:
	.loc 1 43 5
	ld	a5,8(sp)
	ld	a4,272(a5)
	ld	a5,8(sp)
	ld	a3,264(a5)
	ld	a5,24(sp)
	mv	a2,a3
	mv	a1,a4
	lla	a0,.LC16
	jalr	a5
.LVL16:
	.loc 1 44 2
	ld	a5,8(sp)
	addi	a5,a5,8
	ld	a1,24(sp)
	mv	a0,a5
	call	print_gtrapframe
	.loc 1 45 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	print_ktrapframe, .-print_ktrapframe
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/trap/trapframe.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x65f
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xe
	.4byte	.LASF57
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x6
	.4byte	.LASF9
	.byte	0x2
	.byte	0x1a
	.byte	0x17
	.4byte	0x4f
	.byte	0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0xf
	.4byte	0x56
	.byte	0x5
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x10
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x6
	.4byte	.LASF10
	.byte	0x2
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x6
	.4byte	.LASF11
	.byte	0x2
	.byte	0x36
	.byte	0x12
	.4byte	0x43
	.byte	0x2
	.byte	0x1f
	.4byte	0xab
	.byte	0x1
	.string	"_x1"
	.byte	0x1f
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"ra"
	.byte	0x1f
	.byte	0x20
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x21
	.4byte	0xc7
	.byte	0x1
	.string	"_x2"
	.byte	0x21
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"sp"
	.byte	0x21
	.byte	0x20
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x23
	.4byte	0xe3
	.byte	0x1
	.string	"_x3"
	.byte	0x23
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"gp"
	.byte	0x23
	.byte	0x20
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x25
	.4byte	0xff
	.byte	0x1
	.string	"_x4"
	.byte	0x25
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"tp"
	.byte	0x25
	.byte	0x20
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x27
	.4byte	0x11b
	.byte	0x1
	.string	"_x5"
	.byte	0x27
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"t0"
	.byte	0x27
	.byte	0x20
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x29
	.4byte	0x137
	.byte	0x1
	.string	"_x6"
	.byte	0x29
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"t1"
	.byte	0x29
	.byte	0x20
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x2b
	.4byte	0x153
	.byte	0x1
	.string	"_x7"
	.byte	0x2b
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"t2"
	.byte	0x2b
	.byte	0x20
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x2d
	.4byte	0x179
	.byte	0x1
	.string	"_x8"
	.byte	0x2d
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"s0"
	.byte	0x2d
	.byte	0x20
	.4byte	0x83
	.byte	0x1
	.string	"fp"
	.byte	0x2d
	.byte	0x2b
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x2f
	.4byte	0x195
	.byte	0x1
	.string	"_x9"
	.byte	0x2f
	.byte	0x14
	.4byte	0x83
	.byte	0x1
	.string	"s1"
	.byte	0x2f
	.byte	0x20
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x31
	.4byte	0x1b0
	.byte	0x4
	.4byte	.LASF12
	.byte	0x31
	.4byte	0x83
	.byte	0x1
	.string	"a0"
	.byte	0x31
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x33
	.4byte	0x1cb
	.byte	0x4
	.4byte	.LASF13
	.byte	0x33
	.4byte	0x83
	.byte	0x1
	.string	"a1"
	.byte	0x33
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x35
	.4byte	0x1e6
	.byte	0x4
	.4byte	.LASF14
	.byte	0x35
	.4byte	0x83
	.byte	0x1
	.string	"a2"
	.byte	0x35
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x37
	.4byte	0x201
	.byte	0x4
	.4byte	.LASF15
	.byte	0x37
	.4byte	0x83
	.byte	0x1
	.string	"a3"
	.byte	0x37
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x39
	.4byte	0x21c
	.byte	0x4
	.4byte	.LASF16
	.byte	0x39
	.4byte	0x83
	.byte	0x1
	.string	"a4"
	.byte	0x39
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x3b
	.4byte	0x237
	.byte	0x4
	.4byte	.LASF17
	.byte	0x3b
	.4byte	0x83
	.byte	0x1
	.string	"a5"
	.byte	0x3b
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x3d
	.4byte	0x252
	.byte	0x4
	.4byte	.LASF18
	.byte	0x3d
	.4byte	0x83
	.byte	0x1
	.string	"a6"
	.byte	0x3d
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x3f
	.4byte	0x26d
	.byte	0x4
	.4byte	.LASF19
	.byte	0x3f
	.4byte	0x83
	.byte	0x1
	.string	"a7"
	.byte	0x3f
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x41
	.4byte	0x288
	.byte	0x4
	.4byte	.LASF20
	.byte	0x41
	.4byte	0x83
	.byte	0x1
	.string	"s2"
	.byte	0x41
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x43
	.4byte	0x2a3
	.byte	0x4
	.4byte	.LASF21
	.byte	0x43
	.4byte	0x83
	.byte	0x1
	.string	"s3"
	.byte	0x43
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x45
	.4byte	0x2be
	.byte	0x4
	.4byte	.LASF22
	.byte	0x45
	.4byte	0x83
	.byte	0x1
	.string	"s4"
	.byte	0x45
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x47
	.4byte	0x2d9
	.byte	0x4
	.4byte	.LASF23
	.byte	0x47
	.4byte	0x83
	.byte	0x1
	.string	"s5"
	.byte	0x47
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x49
	.4byte	0x2f4
	.byte	0x4
	.4byte	.LASF24
	.byte	0x49
	.4byte	0x83
	.byte	0x1
	.string	"s6"
	.byte	0x49
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x4b
	.4byte	0x30f
	.byte	0x4
	.4byte	.LASF25
	.byte	0x4b
	.4byte	0x83
	.byte	0x1
	.string	"s7"
	.byte	0x4b
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x4d
	.4byte	0x32a
	.byte	0x4
	.4byte	.LASF26
	.byte	0x4d
	.4byte	0x83
	.byte	0x1
	.string	"s8"
	.byte	0x4d
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x4f
	.4byte	0x345
	.byte	0x4
	.4byte	.LASF27
	.byte	0x4f
	.4byte	0x83
	.byte	0x1
	.string	"s9"
	.byte	0x4f
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x51
	.4byte	0x361
	.byte	0x4
	.4byte	.LASF28
	.byte	0x51
	.4byte	0x83
	.byte	0x1
	.string	"s10"
	.byte	0x51
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x53
	.4byte	0x37d
	.byte	0x4
	.4byte	.LASF29
	.byte	0x53
	.4byte	0x83
	.byte	0x1
	.string	"s11"
	.byte	0x53
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x55
	.4byte	0x398
	.byte	0x4
	.4byte	.LASF30
	.byte	0x55
	.4byte	0x83
	.byte	0x1
	.string	"t3"
	.byte	0x55
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x57
	.4byte	0x3b3
	.byte	0x4
	.4byte	.LASF31
	.byte	0x57
	.4byte	0x83
	.byte	0x1
	.string	"t4"
	.byte	0x57
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x59
	.4byte	0x3ce
	.byte	0x4
	.4byte	.LASF32
	.byte	0x59
	.4byte	0x83
	.byte	0x1
	.string	"t5"
	.byte	0x59
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x2
	.byte	0x5b
	.4byte	0x3e9
	.byte	0x4
	.4byte	.LASF33
	.byte	0x5b
	.4byte	0x83
	.byte	0x1
	.string	"t6"
	.byte	0x5b
	.byte	0x21
	.4byte	0x83
	.byte	0
	.byte	0x11
	.4byte	.LASF35
	.byte	0xf8
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0x4b1
	.byte	0x3
	.4byte	0x8f
	.byte	0
	.byte	0x3
	.4byte	0xab
	.byte	0x8
	.byte	0x3
	.4byte	0xc7
	.byte	0x10
	.byte	0x3
	.4byte	0xe3
	.byte	0x18
	.byte	0x3
	.4byte	0xff
	.byte	0x20
	.byte	0x3
	.4byte	0x11b
	.byte	0x28
	.byte	0x3
	.4byte	0x137
	.byte	0x30
	.byte	0x3
	.4byte	0x153
	.byte	0x38
	.byte	0x3
	.4byte	0x179
	.byte	0x40
	.byte	0x3
	.4byte	0x195
	.byte	0x48
	.byte	0x3
	.4byte	0x1b0
	.byte	0x50
	.byte	0x3
	.4byte	0x1cb
	.byte	0x58
	.byte	0x3
	.4byte	0x1e6
	.byte	0x60
	.byte	0x3
	.4byte	0x201
	.byte	0x68
	.byte	0x3
	.4byte	0x21c
	.byte	0x70
	.byte	0x3
	.4byte	0x237
	.byte	0x78
	.byte	0x3
	.4byte	0x252
	.byte	0x80
	.byte	0x3
	.4byte	0x26d
	.byte	0x88
	.byte	0x3
	.4byte	0x288
	.byte	0x90
	.byte	0x3
	.4byte	0x2a3
	.byte	0x98
	.byte	0x3
	.4byte	0x2be
	.byte	0xa0
	.byte	0x3
	.4byte	0x2d9
	.byte	0xa8
	.byte	0x3
	.4byte	0x2f4
	.byte	0xb0
	.byte	0x3
	.4byte	0x30f
	.byte	0xb8
	.byte	0x3
	.4byte	0x32a
	.byte	0xc0
	.byte	0x3
	.4byte	0x345
	.byte	0xc8
	.byte	0x3
	.4byte	0x361
	.byte	0xd0
	.byte	0x3
	.4byte	0x37d
	.byte	0xd8
	.byte	0x3
	.4byte	0x398
	.byte	0xe0
	.byte	0x3
	.4byte	0x3b3
	.byte	0xe8
	.byte	0x3
	.4byte	0x3ce
	.byte	0xf0
	.byte	0
	.byte	0x6
	.4byte	.LASF34
	.byte	0x3
	.byte	0x7f
	.byte	0x3
	.4byte	0x3e9
	.byte	0xd
	.4byte	.LASF36
	.2byte	0x108
	.byte	0x83
	.4byte	0x4ee
	.byte	0xa
	.4byte	.LASF37
	.byte	0x85
	.byte	0xc
	.4byte	0x83
	.byte	0
	.byte	0xa
	.4byte	.LASF38
	.byte	0x87
	.byte	0x12
	.4byte	0x4b1
	.byte	0x8
	.byte	0x8
	.4byte	.LASF39
	.byte	0x89
	.4byte	0x83
	.2byte	0x100
	.byte	0
	.byte	0x6
	.4byte	.LASF40
	.byte	0x3
	.byte	0x8a
	.byte	0x3
	.4byte	0x4bd
	.byte	0xd
	.4byte	.LASF41
	.2byte	0x120
	.byte	0x8e
	.4byte	0x54f
	.byte	0xa
	.4byte	.LASF42
	.byte	0x90
	.byte	0xc
	.4byte	0x83
	.byte	0
	.byte	0xa
	.4byte	.LASF38
	.byte	0x92
	.byte	0x12
	.4byte	0x4b1
	.byte	0x8
	.byte	0x8
	.4byte	.LASF43
	.byte	0x94
	.4byte	0x83
	.2byte	0x100
	.byte	0x8
	.4byte	.LASF44
	.byte	0x96
	.4byte	0x83
	.2byte	0x108
	.byte	0x8
	.4byte	.LASF45
	.byte	0x98
	.4byte	0x83
	.2byte	0x110
	.byte	0x8
	.4byte	.LASF46
	.byte	0x9a
	.4byte	0x83
	.2byte	0x118
	.byte	0
	.byte	0x6
	.4byte	.LASF47
	.byte	0x3
	.byte	0x9b
	.byte	0x3
	.4byte	0x4fa
	.byte	0x6
	.4byte	.LASF48
	.byte	0x3
	.byte	0x9f
	.byte	0x12
	.4byte	0x567
	.byte	0x9
	.4byte	0x56c
	.byte	0x12
	.4byte	0x77
	.4byte	0x57c
	.byte	0x13
	.4byte	0x57c
	.byte	0x14
	.byte	0
	.byte	0x9
	.4byte	0x5d
	.byte	0xb
	.4byte	.LASF51
	.byte	0x26
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x5c7
	.byte	0x7
	.4byte	.LASF49
	.byte	0x26
	.byte	0x25
	.4byte	0x5c7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x7
	.4byte	.LASF50
	.byte	0x26
	.byte	0x37
	.4byte	0x55b
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xc
	.4byte	.LASF54
	.byte	0x27
	.4byte	0x55b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x9
	.4byte	0x54f
	.byte	0xb
	.4byte	.LASF52
	.byte	0x1e
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x612
	.byte	0x7
	.4byte	.LASF53
	.byte	0x1e
	.byte	0x25
	.4byte	0x612
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x7
	.4byte	.LASF50
	.byte	0x1e
	.byte	0x37
	.4byte	0x55b
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xc
	.4byte	.LASF54
	.byte	0x1f
	.4byte	0x55b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x9
	.4byte	0x4ee
	.byte	0xb
	.4byte	.LASF55
	.byte	0xe
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x65d
	.byte	0x7
	.4byte	.LASF56
	.byte	0xe
	.byte	0x25
	.4byte	0x65d
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x7
	.4byte	.LASF50
	.byte	0xe
	.byte	0x37
	.4byte	0x55b
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xc
	.4byte	.LASF54
	.byte	0xf
	.4byte	0x55b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x9
	.4byte	0x4b1
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
	.byte	0x5
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0xb
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
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
	.byte	0xc
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
	.byte	0x21
	.byte	0xe
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
	.byte	0x5
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x10
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x18
	.byte	0
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
.LASF36:
	.string	"__strapframe_t"
.LASF52:
	.string	"print_strapframe"
.LASF9:
	.string	"uint64_t"
.LASF7:
	.string	"short int"
.LASF10:
	.string	"size_t"
.LASF51:
	.string	"print_ktrapframe"
.LASF11:
	.string	"ireg_t"
.LASF33:
	.string	"_x31"
.LASF32:
	.string	"_x30"
.LASF43:
	.string	"sstatus"
.LASF55:
	.string	"print_gtrapframe"
.LASF34:
	.string	"gtrapframe_t"
.LASF8:
	.string	"long int"
.LASF54:
	.string	"printf"
.LASF26:
	.string	"_x24"
.LASF27:
	.string	"_x25"
.LASF39:
	.string	"mstatus"
.LASF56:
	.string	"gtf_ptr"
.LASF28:
	.string	"_x26"
.LASF53:
	.string	"stf_ptr"
.LASF2:
	.string	"unsigned char"
.LASF41:
	.string	"__ktrapframe_t"
.LASF37:
	.string	"mepc"
.LASF4:
	.string	"unsigned int"
.LASF48:
	.string	"printf_t"
.LASF42:
	.string	"sepc"
.LASF46:
	.string	"origin_a0"
.LASF3:
	.string	"short unsigned int"
.LASF49:
	.string	"ktf_ptr"
.LASF6:
	.string	"char"
.LASF35:
	.string	"__gtrapframe_t"
.LASF38:
	.string	"gregisters"
.LASF12:
	.string	"_x10"
.LASF13:
	.string	"_x11"
.LASF14:
	.string	"_x12"
.LASF15:
	.string	"_x13"
.LASF16:
	.string	"_x14"
.LASF17:
	.string	"_x15"
.LASF18:
	.string	"_x16"
.LASF19:
	.string	"_x17"
.LASF20:
	.string	"_x18"
.LASF21:
	.string	"_x19"
.LASF29:
	.string	"_x27"
.LASF30:
	.string	"_x28"
.LASF31:
	.string	"_x29"
.LASF50:
	.string	"print_func"
.LASF5:
	.string	"long unsigned int"
.LASF40:
	.string	"strapframe_t"
.LASF57:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF47:
	.string	"ktrapframe_t"
.LASF22:
	.string	"_x20"
.LASF23:
	.string	"_x21"
.LASF24:
	.string	"_x22"
.LASF25:
	.string	"_x23"
.LASF44:
	.string	"sbadaddr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"lib/trap/trapframe.c"
	.ident	"GCC: (g) 12.2.0"
