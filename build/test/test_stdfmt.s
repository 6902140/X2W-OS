	.file	"test_stdfmt.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "test/test_stdfmt.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"=> "
	.align	3
.LC1:
	.string	": \n"
	.text
	.align	2
	.globl	test_stdfmt
	.type	test_stdfmt, @function
test_stdfmt:
.LFB0:
	.file 1 "test/test_stdfmt.c"
	.loc 1 32 22
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 33 5
	lla	a0,.LC0
	call	uart_puts
	.loc 1 33 23
	lla	a0,__func__.0
	call	uart_puts
	.loc 1 33 44
	lla	a0,.LC1
	call	uart_puts
	.loc 1 35 5
	call	_test_types
	.loc 1 36 5
	call	_test_flags
	.loc 1 37 5
	call	_test_width
	.loc 1 38 5
	call	_test_precision
	.loc 1 39 5
	call	_test_length
	.loc 1 41 12
	li	a5,0
	.loc 1 42 1
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	test_stdfmt, .-test_stdfmt
	.section	.rodata
	.align	3
.LC2:
	.string	"Output a single percent sign: %%\n"
	.align	3
.LC3:
	.string	"Output a single char: %c\n"
	.align	3
.LC4:
	.string	"'Hello World'"
	.align	3
.LC5:
	.string	"Output a string: %s\n"
	.align	3
.LC6:
	.string	"Output a pointer: %p\n"
	.align	3
.LC7:
	.string	"Output a binary: %b\n"
	.align	3
.LC8:
	.string	"Output a octal: %o\n"
	.align	3
.LC9:
	.string	"Output a hex: %x\n"
	.align	3
.LC10:
	.string	"Output a capitcal-hex: %X\n"
	.align	3
.LC11:
	.string	"Output a decimal: %i\n"
	.align	3
.LC12:
	.string	"Output a decimal: %d\n"
	.align	3
.LC13:
	.string	"Output a unsigned decimal: %u\n"
	.align	3
.LC14:
	.string	"Output a string: %s, char been output:%n"
	.align	3
.LC15:
	.string	"%d\n"
	.text
	.align	2
	.globl	_test_types
	.type	_test_types, @function
_test_types:
.LFB1:
	.loc 1 44 23
	.cfi_startproc
	addi	sp,sp,-240
	.cfi_def_cfa_offset 240
	sd	ra,232(sp)
	.cfi_offset 1, -8
.LBB2:
	.loc 1 46 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 47 9
	addi	a5,sp,112
	lla	a1,.LC2
	mv	a0,a5
	call	sprintf
	.loc 1 48 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE2:
.LBB3:
	.loc 1 51 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 52 9
	addi	a5,sp,112
	li	a2,74
	lla	a1,.LC3
	mv	a0,a5
	call	sprintf
	.loc 1 53 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE3:
.LBB4:
	.loc 1 56 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 57 9
	addi	a5,sp,112
	lla	a2,.LC4
	lla	a1,.LC5
	mv	a0,a5
	call	sprintf
	.loc 1 58 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE4:
.LBB5:
	.loc 1 61 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 62 9
	addi	a4,sp,112
	addi	a5,sp,112
	mv	a2,a4
	lla	a1,.LC6
	mv	a0,a5
	call	sprintf
	.loc 1 63 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE5:
.LBB6:
	.loc 1 66 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 67 9
	addi	a4,sp,112
	li	a5,65536
	addi	a2,a5,-1
	lla	a1,.LC7
	mv	a0,a4
	call	sprintf
	.loc 1 68 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE6:
.LBB7:
	.loc 1 71 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 72 9
	addi	a4,sp,112
	li	a5,344064
	addi	a2,a5,-1673
	lla	a1,.LC8
	mv	a0,a4
	call	sprintf
	.loc 1 73 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE7:
.LBB8:
	.loc 1 76 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 77 9
	addi	a4,sp,112
	li	a5,11259904
	addi	a2,a5,-529
	lla	a1,.LC9
	mv	a0,a4
	call	sprintf
	.loc 1 78 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE8:
.LBB9:
	.loc 1 81 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 82 9
	addi	a4,sp,112
	li	a5,11259904
	addi	a2,a5,-529
	lla	a1,.LC10
	mv	a0,a4
	call	sprintf
	.loc 1 83 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE9:
.LBB10:
	.loc 1 86 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 87 9
	addi	a4,sp,112
	li	a5,123457536
	addi	a2,a5,-747
	lla	a1,.LC11
	mv	a0,a4
	call	sprintf
	.loc 1 88 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE10:
.LBB11:
	.loc 1 91 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 92 9
	addi	a4,sp,112
	li	a5,123457536
	addi	a2,a5,-747
	lla	a1,.LC12
	mv	a0,a4
	call	sprintf
	.loc 1 93 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE11:
.LBB12:
	.loc 1 96 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 97 9
	addi	a5,sp,112
	li	a2,-1
	lla	a1,.LC13
	mv	a0,a5
	call	sprintf
	.loc 1 98 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE12:
.LBB13:
	.loc 1 101 16
	sd	zero,216(sp)
	.loc 1 102 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 103 14
	sd	zero,112(sp)
	sd	zero,120(sp)
	sd	zero,128(sp)
	sd	zero,136(sp)
	sd	zero,144(sp)
	sd	zero,152(sp)
	sd	zero,160(sp)
	sd	zero,168(sp)
	sd	zero,176(sp)
	sd	zero,184(sp)
	sd	zero,192(sp)
	sd	zero,200(sp)
	sw	zero,208(sp)
	.loc 1 104 9
	addi	a4,sp,216
	addi	a5,sp,8
	mv	a3,a4
	lla	a2,.LC4
	lla	a1,.LC14
	mv	a0,a5
	call	sprintf
	.loc 1 105 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
	.loc 1 106 9
	ld	a5,216(sp)
	sext.w	a4,a5
	addi	a5,sp,112
	mv	a2,a4
	lla	a1,.LC15
	mv	a0,a5
	call	sprintf
	.loc 1 107 9
	addi	a5,sp,112
	mv	a0,a5
	call	uart_puts
.LBE13:
	.loc 1 109 1
	nop
	ld	ra,232(sp)
	.cfi_restore 1
	addi	sp,sp,240
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	_test_types, .-_test_types
	.section	.rodata
	.align	3
.LC16:
	.string	"Output a 20-bit  left-aligned decimal: %-20d\n"
	.align	3
.LC17:
	.string	"Output a 20-bit right-aligned decimal: %20d\n"
	.align	3
.LC18:
	.string	"Output a 20-bit right-aligned space-padded decimal: %20d\n"
	.align	3
.LC19:
	.string	"Output a 20-bit right-aligned     0-padded decimal: %020d\n"
	.align	3
.LC20:
	.string	"Output a positive decimal: %d\n"
	.align	3
.LC21:
	.string	"Output a negative decimal: %d\n"
	.align	3
.LC22:
	.string	"Output a signed positive decimal: %+d\n"
	.align	3
.LC23:
	.string	"Output a signed negative decimal: %+d\n"
	.align	3
.LC24:
	.string	"Output a suffixed binary: %#b\n"
	.align	3
.LC25:
	.string	"Output a suffixed octal: %#o\n"
	.align	3
.LC26:
	.string	"Output a suffixed hex: %#x\n"
	.text
	.align	2
	.globl	_test_flags
	.type	_test_flags, @function
_test_flags:
.LFB2:
	.loc 1 111 23
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	.cfi_offset 1, -8
.LBB14:
	.loc 1 113 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 114 9
	addi	a4,sp,8
	li	a5,1234567168
	addi	a2,a5,722
	lla	a1,.LC16
	mv	a0,a4
	call	sprintf
	.loc 1 115 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE14:
.LBB15:
	.loc 1 118 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 119 9
	addi	a4,sp,8
	li	a5,1234567168
	addi	a2,a5,722
	lla	a1,.LC17
	mv	a0,a4
	call	sprintf
	.loc 1 120 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE15:
.LBB16:
	.loc 1 123 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 124 9
	addi	a4,sp,8
	li	a5,1234567168
	addi	a2,a5,722
	lla	a1,.LC18
	mv	a0,a4
	call	sprintf
	.loc 1 125 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE16:
.LBB17:
	.loc 1 128 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 129 9
	addi	a4,sp,8
	li	a5,1234567168
	addi	a2,a5,722
	lla	a1,.LC19
	mv	a0,a4
	call	sprintf
	.loc 1 130 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE17:
.LBB18:
	.loc 1 133 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 134 9
	addi	a5,sp,8
	li	a2,100
	lla	a1,.LC20
	mv	a0,a5
	call	sprintf
	.loc 1 135 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE18:
.LBB19:
	.loc 1 138 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 139 9
	addi	a5,sp,8
	li	a2,-100
	lla	a1,.LC21
	mv	a0,a5
	call	sprintf
	.loc 1 140 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE19:
.LBB20:
	.loc 1 143 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 144 9
	addi	a5,sp,8
	li	a2,100
	lla	a1,.LC22
	mv	a0,a5
	call	sprintf
	.loc 1 145 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE20:
.LBB21:
	.loc 1 148 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 149 9
	addi	a5,sp,8
	li	a2,-100
	lla	a1,.LC23
	mv	a0,a5
	call	sprintf
	.loc 1 150 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE21:
.LBB22:
	.loc 1 153 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 154 9
	addi	a5,sp,8
	li	a2,15
	lla	a1,.LC24
	mv	a0,a5
	call	sprintf
	.loc 1 155 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE22:
.LBB23:
	.loc 1 158 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 159 9
	addi	a4,sp,8
	li	a5,2056192
	addi	a2,a5,-1839
	lla	a1,.LC25
	mv	a0,a4
	call	sprintf
	.loc 1 160 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE23:
.LBB24:
	.loc 1 163 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 164 9
	addi	a4,sp,8
	li	a5,11259904
	addi	a2,a5,-529
	lla	a1,.LC26
	mv	a0,a4
	call	sprintf
	.loc 1 165 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE24:
	.loc 1 167 1
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	_test_flags, .-_test_flags
	.section	.rodata
	.align	3
.LC27:
	.string	"                              : 01234567890123456789\n"
	.align	3
.LC28:
	.string	"Output a fixed-width decimal  : %20d\n"
	.align	3
.LC29:
	.string	"Output a dynamic-width decimal: %*d\n"
	.text
	.align	2
	.globl	_test_width
	.type	_test_width, @function
_test_width:
.LFB3:
	.loc 1 170 23
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	.cfi_offset 1, -8
	.loc 1 171 5
	lla	a0,.LC27
	call	uart_puts
.LBB25:
	.loc 1 173 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 174 9
	addi	a4,sp,8
	li	a5,122880
	addi	a2,a5,576
	lla	a1,.LC28
	mv	a0,a4
	call	sprintf
	.loc 1 175 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE25:
.LBB26:
	.loc 1 178 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 179 9
	addi	a4,sp,8
	li	a5,122880
	addi	a3,a5,576
	li	a2,15
	lla	a1,.LC29
	mv	a0,a4
	call	sprintf
	.loc 1 180 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE26:
	.loc 1 182 1
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	_test_width, .-_test_width
	.section	.rodata
	.align	3
.LC30:
	.string	"                                  : 01234567890123456789\n"
	.align	3
.LC31:
	.string	"Output a fixed-precision decimal  : %.2d\n"
	.align	3
.LC32:
	.string	"Output a fixed-precision decimal  : %.9d\n"
	.align	3
.LC33:
	.string	"Output a dynamic-precision decimal: %.*d\n"
	.text
	.align	2
	.globl	_test_precision
	.type	_test_precision, @function
_test_precision:
.LFB4:
	.loc 1 185 27
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	.cfi_offset 1, -8
	.loc 1 186 5
	lla	a0,.LC30
	call	uart_puts
.LBB27:
	.loc 1 188 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 189 9
	addi	a4,sp,8
	li	a5,122880
	addi	a2,a5,576
	lla	a1,.LC31
	mv	a0,a4
	call	sprintf
	.loc 1 190 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE27:
.LBB28:
	.loc 1 193 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 194 9
	addi	a4,sp,8
	li	a5,122880
	addi	a2,a5,576
	lla	a1,.LC32
	mv	a0,a4
	call	sprintf
	.loc 1 195 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE28:
.LBB29:
	.loc 1 198 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 199 9
	addi	a4,sp,8
	li	a5,122880
	addi	a3,a5,576
	li	a2,15
	lla	a1,.LC33
	mv	a0,a4
	call	sprintf
	.loc 1 200 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE29:
	.loc 1 202 1
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	_test_precision, .-_test_precision
	.section	.rodata
	.align	3
.LC34:
	.string	"Output a short: %hd\n"
	.align	3
.LC36:
	.string	"Output a long: %ld\n"
	.align	3
.LC38:
	.string	"Output a long long: %ld\n"
	.text
	.align	2
	.globl	_test_length
	.type	_test_length, @function
_test_length:
.LFB5:
	.loc 1 205 24
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	.cfi_offset 1, -8
.LBB30:
	.loc 1 207 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 208 9
	addi	a4,sp,8
	li	a5,12288
	addi	a2,a5,57
	lla	a1,.LC34
	mv	a0,a4
	call	sprintf
	.loc 1 209 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE30:
.LBB31:
	.loc 1 212 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 213 9
	lla	a5,.LC35
	ld	a4,0(a5)
	addi	a5,sp,8
	mv	a2,a4
	lla	a1,.LC36
	mv	a0,a5
	call	sprintf
	.loc 1 214 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE31:
.LBB32:
	.loc 1 217 14
	sd	zero,8(sp)
	sd	zero,16(sp)
	sd	zero,24(sp)
	sd	zero,32(sp)
	sd	zero,40(sp)
	sd	zero,48(sp)
	sd	zero,56(sp)
	sd	zero,64(sp)
	sd	zero,72(sp)
	sd	zero,80(sp)
	sd	zero,88(sp)
	sd	zero,96(sp)
	sw	zero,104(sp)
	.loc 1 218 9
	lla	a5,.LC37
	ld	a4,0(a5)
	addi	a5,sp,8
	mv	a2,a4
	lla	a1,.LC38
	mv	a0,a5
	call	sprintf
	.loc 1 219 9
	addi	a5,sp,8
	mv	a0,a5
	call	uart_puts
.LBE32:
	.loc 1 221 1
	nop
	ld	ra,120(sp)
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	_test_length, .-_test_length
	.section	.rodata
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 12
__func__.0:
	.string	"test_stdfmt"
	.align	3
.LC35:
	.dword	123456789987654321
	.align	3
.LC37:
	.dword	987654321123456789
	.text
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/stdfmt.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x626
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xc
	.4byte	.LASF20
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x1a
	.byte	0x17
	.4byte	0x4e
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x8
	.4byte	0x55
	.byte	0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0xd
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x9
	.4byte	0x55
	.byte	0xe
	.4byte	.LASF21
	.byte	0x3
	.byte	0x88
	.byte	0x8
	.4byte	0x76
	.4byte	0xa2
	.byte	0x6
	.4byte	0x81
	.byte	0x6
	.4byte	0xa2
	.byte	0xf
	.byte	0
	.byte	0x9
	.4byte	0x5c
	.byte	0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0xe
	.byte	0xd
	.4byte	0xb9
	.byte	0x6
	.4byte	0xa2
	.byte	0
	.byte	0x4
	.4byte	.LASF12
	.byte	0xcd
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x141
	.byte	0x2
	.8byte	.LBB30
	.8byte	.LBE30-.LBB30
	.4byte	0xfa
	.byte	0x1
	.4byte	.LASF11
	.byte	0xcf
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB31
	.8byte	.LBE31-.LBB31
	.4byte	0x11f
	.byte	0x1
	.4byte	.LASF11
	.byte	0xd4
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x5
	.8byte	.LBB32
	.8byte	.LBE32-.LBB32
	.byte	0x1
	.4byte	.LASF11
	.byte	0xd9
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	0x55
	.4byte	0x151
	.byte	0xb
	.4byte	0x4e
	.byte	0x63
	.byte	0
	.byte	0x4
	.4byte	.LASF13
	.byte	0xb9
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x1d9
	.byte	0x2
	.8byte	.LBB27
	.8byte	.LBE27-.LBB27
	.4byte	0x192
	.byte	0x1
	.4byte	.LASF11
	.byte	0xbc
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB28
	.8byte	.LBE28-.LBB28
	.4byte	0x1b7
	.byte	0x1
	.4byte	.LASF11
	.byte	0xc1
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x5
	.8byte	.LBB29
	.8byte	.LBE29-.LBB29
	.byte	0x1
	.4byte	.LASF11
	.byte	0xc6
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF14
	.byte	0xaa
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x23c
	.byte	0x2
	.8byte	.LBB25
	.8byte	.LBE25-.LBB25
	.4byte	0x21a
	.byte	0x1
	.4byte	.LASF11
	.byte	0xad
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x5
	.8byte	.LBB26
	.8byte	.LBE26-.LBB26
	.byte	0x1
	.4byte	.LASF11
	.byte	0xb2
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF15
	.byte	0x6f
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ec
	.byte	0x2
	.8byte	.LBB14
	.8byte	.LBE14-.LBB14
	.4byte	0x27d
	.byte	0x1
	.4byte	.LASF11
	.byte	0x71
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB15
	.8byte	.LBE15-.LBB15
	.4byte	0x2a2
	.byte	0x1
	.4byte	.LASF11
	.byte	0x76
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB16
	.8byte	.LBE16-.LBB16
	.4byte	0x2c7
	.byte	0x1
	.4byte	.LASF11
	.byte	0x7b
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB17
	.8byte	.LBE17-.LBB17
	.4byte	0x2ec
	.byte	0x1
	.4byte	.LASF11
	.byte	0x80
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB18
	.8byte	.LBE18-.LBB18
	.4byte	0x311
	.byte	0x1
	.4byte	.LASF11
	.byte	0x85
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB19
	.8byte	.LBE19-.LBB19
	.4byte	0x336
	.byte	0x1
	.4byte	.LASF11
	.byte	0x8a
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB20
	.8byte	.LBE20-.LBB20
	.4byte	0x35b
	.byte	0x1
	.4byte	.LASF11
	.byte	0x8f
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB21
	.8byte	.LBE21-.LBB21
	.4byte	0x380
	.byte	0x1
	.4byte	.LASF11
	.byte	0x94
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB22
	.8byte	.LBE22-.LBB22
	.4byte	0x3a5
	.byte	0x1
	.4byte	.LASF11
	.byte	0x99
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB23
	.8byte	.LBE23-.LBB23
	.4byte	0x3ca
	.byte	0x1
	.4byte	.LASF11
	.byte	0x9e
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0x5
	.8byte	.LBB24
	.8byte	.LBE24-.LBB24
	.byte	0x1
	.4byte	.LASF11
	.byte	0xa3
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF16
	.byte	0x2c
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x5de
	.byte	0x2
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x42d
	.byte	0x1
	.4byte	.LASF11
	.byte	0x2e
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x452
	.byte	0x1
	.4byte	.LASF11
	.byte	0x33
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x477
	.byte	0x1
	.4byte	.LASF11
	.byte	0x38
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x49c
	.byte	0x1
	.4byte	.LASF11
	.byte	0x3d
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x4c1
	.byte	0x1
	.4byte	.LASF11
	.byte	0x42
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x4e6
	.byte	0x1
	.4byte	.LASF11
	.byte	0x47
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x50b
	.byte	0x1
	.4byte	.LASF11
	.byte	0x4c
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.4byte	0x530
	.byte	0x1
	.4byte	.LASF11
	.byte	0x51
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.4byte	0x555
	.byte	0x1
	.4byte	.LASF11
	.byte	0x56
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.4byte	0x57a
	.byte	0x1
	.4byte	.LASF11
	.byte	0x5b
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x2
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.4byte	0x59f
	.byte	0x1
	.4byte	.LASF11
	.byte	0x60
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0x5
	.8byte	.LBB13
	.8byte	.LBE13-.LBB13
	.byte	0x1
	.4byte	.LASF17
	.byte	0x65
	.byte	0x10
	.4byte	0x76
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF18
	.byte	0x66
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7e
	.byte	0x1
	.4byte	.LASF19
	.byte	0x67
	.byte	0xe
	.4byte	0x141
	.byte	0x3
	.byte	0x91
	.byte	0x80,0x7f
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF23
	.byte	0x1
	.byte	0x20
	.byte	0x5
	.4byte	0x68
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x614
	.byte	0x12
	.4byte	.LASF24
	.4byte	0x624
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0
	.byte	0xa
	.4byte	0x5c
	.4byte	0x624
	.byte	0xb
	.4byte	0x4e
	.byte	0xb
	.byte	0
	.byte	0x8
	.4byte	0x614
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x16
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
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
	.byte	0xd
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
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x18
	.byte	0
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
	.byte	0x12
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
.LASF13:
	.string	"_test_precision"
.LASF4:
	.string	"unsigned int"
.LASF16:
	.string	"_test_types"
.LASF10:
	.string	"size_t"
.LASF21:
	.string	"sprintf"
.LASF23:
	.string	"test_stdfmt"
.LASF5:
	.string	"long unsigned int"
.LASF12:
	.string	"_test_length"
.LASF17:
	.string	"nums"
.LASF9:
	.string	"uint64_t"
.LASF15:
	.string	"_test_flags"
.LASF20:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"char"
.LASF22:
	.string	"uart_puts"
.LASF8:
	.string	"long int"
.LASF18:
	.string	"sprintf_buffer1"
.LASF19:
	.string	"sprintf_buffer2"
.LASF14:
	.string	"_test_width"
.LASF3:
	.string	"short unsigned int"
.LASF11:
	.string	"sprintf_buffer"
.LASF7:
	.string	"short int"
.LASF24:
	.string	"__func__"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
.LASF0:
	.string	"test/test_stdfmt.c"
	.ident	"GCC: (g) 12.2.0"
