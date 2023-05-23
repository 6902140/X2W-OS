	.file	"stdfmt.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "lib/stdfmt.c"
	.align	2
	.globl	_scan_number
	.type	_scan_number, @function
_scan_number:
.LFB0:
	.file 1 "lib/stdfmt.c"
	.loc 1 46 52
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 47 9
	sw	zero,28(sp)
	.loc 1 48 11
	j	.L2
.L4:
	.loc 1 49 13
	lw	a5,28(sp)
	mv	a4,a5
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sw	a5,28(sp)
	.loc 1 50 21
	ld	a5,8(sp)
	addi	a4,a5,1
	sd	a4,8(sp)
	.loc 1 50 16
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 1 50 25
	addiw	a5,a5,-48
	sext.w	a5,a5
	.loc 1 50 13
	lw	a4,28(sp)
	addw	a5,a4,a5
	sw	a5,28(sp)
.L2:
	.loc 1 48 21
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 48 27
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L3
	.loc 1 48 31 discriminator 1
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 48 27 discriminator 1
	mv	a4,a5
	li	a5,57
	bleu	a4,a5,.L4
.L3:
	.loc 1 52 10
	ld	a5,0(sp)
	lw	a4,28(sp)
	sw	a4,0(a5)
	.loc 1 53 12
	ld	a5,8(sp)
	.loc 1 54 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	_scan_number, .-_scan_number
	.section	.rodata
	.align	3
.LC0:
	.string	"0123456789abcdefghijklmnopqrstuvwxyz"
	.align	3
.LC1:
	.string	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.text
	.align	2
	.globl	copy_number
	.type	copy_number, @function
copy_number:
.LFB1:
	.loc 1 57 94
	.cfi_startproc
	addi	sp,sp,-192
	.cfi_def_cfa_offset 192
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a1,a2
	mv	a2,a3
	mv	a3,a4
	mv	a4,a5
	mv	a5,a1
	sw	a5,12(sp)
	mv	a5,a2
	sw	a5,8(sp)
	mv	a5,a3
	sw	a5,4(sp)
	mv	a5,a4
	sw	a5,0(sp)
	.loc 1 59 10
	sb	zero,191(sp)
	.loc 1 63 17
	lla	a5,.LC0
	sd	a5,176(sp)
	.loc 1 64 14
	lw	a5,0(sp)
	andi	a5,a5,64
	sext.w	a5,a5
	.loc 1 64 8
	beq	a5,zero,.L7
	.loc 1 65 16
	lla	a5,.LC1
	sd	a5,176(sp)
.L7:
	.loc 1 67 8
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L8
	.loc 1 67 18 discriminator 1
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,36
	ble	a4,a5,.L9
.L8:
	.loc 1 68 16
	li	a5,0
	j	.L41
.L9:
	.loc 1 70 14
	lw	a5,0(sp)
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 1 70 8
	beq	a5,zero,.L11
	.loc 1 72 14
	lw	a5,0(sp)
	andi	a5,a5,-2
	sw	a5,0(sp)
.L11:
	.loc 1 74 22
	lw	a5,0(sp)
	andi	a5,a5,1
	sext.w	a5,a5
	.loc 1 74 14
	beq	a5,zero,.L12
	.loc 1 74 14 is_stmt 0 discriminator 1
	li	a5,48
	j	.L13
.L12:
	.loc 1 74 14 discriminator 2
	li	a5,32
.L13:
	.loc 1 74 14 discriminator 4
	sb	a5,171(sp)
	.loc 1 76 14 is_stmt 1 discriminator 4
	lw	a5,0(sp)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 1 76 8 discriminator 4
	beq	a5,zero,.L14
	.loc 1 77 13
	ld	a5,16(sp)
	.loc 1 77 12
	bge	a5,zero,.L15
	.loc 1 78 18
	li	a5,45
	sb	a5,191(sp)
	.loc 1 79 20
	ld	a5,16(sp)
	.loc 1 79 19
	neg	a5,a5
	.loc 1 79 17
	sd	a5,16(sp)
	j	.L14
.L15:
	.loc 1 80 25
	lw	a5,0(sp)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 1 80 19
	beq	a5,zero,.L16
	.loc 1 81 18
	li	a5,43
	sb	a5,191(sp)
	.loc 1 82 18
	lw	a5,8(sp)
	addiw	a5,a5,-1
	sw	a5,8(sp)
	j	.L14
.L16:
	.loc 1 83 25
	lw	a5,0(sp)
	andi	a5,a5,4
	sext.w	a5,a5
	.loc 1 83 19
	beq	a5,zero,.L14
	.loc 1 84 18
	li	a5,32
	sb	a5,191(sp)
	.loc 1 85 18
	lw	a5,8(sp)
	addiw	a5,a5,-1
	sw	a5,8(sp)
.L14:
	.loc 1 89 14
	lw	a5,0(sp)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 1 89 8
	beq	a5,zero,.L17
	.loc 1 90 12
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,2
	beq	a4,a5,.L18
	.loc 1 90 23 discriminator 1
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L19
.L18:
	.loc 1 91 19
	lw	a5,8(sp)
	addiw	a5,a5,-2
	sw	a5,8(sp)
	j	.L17
.L19:
	.loc 1 92 17
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,8
	bne	a4,a5,.L17
	.loc 1 93 19
	lw	a5,8(sp)
	addiw	a5,a5,-1
	sw	a5,8(sp)
.L17:
	.loc 1 97 9
	sw	zero,172(sp)
	.loc 1 98 8
	ld	a5,16(sp)
	bne	a5,zero,.L22
	.loc 1 99 19
	lw	a5,172(sp)
	addiw	a4,a5,1
	sw	a4,172(sp)
	.loc 1 99 23
	addi	a5,a5,192
	add	a5,a5,sp
	li	a4,48
	sb	a4,-160(a5)
	j	.L21
.L23:
.LBB2:
	.loc 1 102 52
	lw	a5,12(sp)
	sw	a5,164(sp)
	.loc 1 102 126
	lwu	a5,164(sp)
	ld	a4,16(sp)
	remu	a5,a4,a5
	.loc 1 102 101
	sw	a5,160(sp)
	.loc 1 102 167
	lwu	a5,164(sp)
	.loc 1 102 142
	ld	a4,16(sp)
	divu	a5,a4,a5
	sd	a5,16(sp)
	.loc 1 102 177
	lw	a5,160(sp)
.LBE2:
	.loc 1 102 37
	slli	a5,a5,32
	srli	a5,a5,32
	.loc 1 102 35
	ld	a4,176(sp)
	add	a4,a4,a5
	.loc 1 102 23
	lw	a5,172(sp)
	addiw	a3,a5,1
	sw	a3,172(sp)
	.loc 1 102 35
	lbu	a4,0(a4)
	.loc 1 102 27
	addi	a5,a5,192
	add	a5,a5,sp
	sb	a4,-160(a5)
.L22:
	.loc 1 101 20
	ld	a5,16(sp)
	bne	a5,zero,.L23
.L21:
	.loc 1 105 15
	lw	a5,172(sp)
	mv	a2,a5
	lw	a5,4(sp)
	sext.w	a3,a5
	sext.w	a4,a2
	bge	a3,a4,.L24
	mv	a5,a2
.L24:
	sw	a5,4(sp)
	.loc 1 106 11
	lw	a5,8(sp)
	mv	a4,a5
	lw	a5,4(sp)
	subw	a5,a4,a5
	sw	a5,8(sp)
	.loc 1 109 16
	lw	a5,0(sp)
	andi	a5,a5,9
	sext.w	a5,a5
	.loc 1 109 8
	bne	a5,zero,.L25
	.loc 1 110 14
	j	.L26
.L27:
	.loc 1 111 17
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 111 20
	li	a4,32
	sb	a4,0(a5)
.L26:
	.loc 1 110 21
	lw	a5,8(sp)
	addiw	a4,a5,-1
	sw	a4,8(sp)
	.loc 1 110 24
	bgt	a5,zero,.L27
.L25:
	.loc 1 114 8
	lbu	a5,191(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L28
	.loc 1 115 13
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 115 16
	lbu	a4,191(sp)
	sb	a4,0(a5)
.L28:
	.loc 1 118 14
	lw	a5,0(sp)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 1 118 8
	beq	a5,zero,.L29
	.loc 1 119 12
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,2
	bne	a4,a5,.L30
	.loc 1 120 17
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 120 20
	li	a4,48
	sb	a4,0(a5)
	.loc 1 121 17
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 121 20
	li	a4,98
	sb	a4,0(a5)
	j	.L29
.L30:
	.loc 1 122 19
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,8
	bne	a4,a5,.L31
	.loc 1 123 17
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 123 20
	li	a4,48
	sb	a4,0(a5)
	j	.L29
.L31:
	.loc 1 124 17
	lw	a5,12(sp)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L29
	.loc 1 125 17
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 125 20
	li	a4,48
	sb	a4,0(a5)
	.loc 1 126 17
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 126 20
	li	a4,120
	sb	a4,0(a5)
.L29:
	.loc 1 131 16
	lw	a5,0(sp)
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 1 131 8
	bne	a5,zero,.L35
	.loc 1 132 15
	j	.L33
.L34:
	.loc 1 133 17
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 133 20
	lbu	a4,171(sp)
	sb	a4,0(a5)
.L33:
	.loc 1 132 21
	lw	a5,8(sp)
	addiw	a4,a5,-1
	sw	a4,8(sp)
	.loc 1 132 24
	bgt	a5,zero,.L34
	.loc 1 136 11
	j	.L35
.L36:
	.loc 1 137 13
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 137 16
	li	a4,48
	sb	a4,0(a5)
.L35:
	.loc 1 136 25
	lw	a5,4(sp)
	addiw	a4,a5,-1
	sw	a4,4(sp)
	.loc 1 136 14
	lw	a4,172(sp)
	sext.w	a4,a4
	blt	a4,a5,.L36
	.loc 1 138 11
	j	.L37
.L38:
	.loc 1 139 13
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 139 26
	lw	a4,172(sp)
	addi	a4,a4,192
	add	a4,a4,sp
	lbu	a4,-160(a4)
	.loc 1 139 16
	sb	a4,0(a5)
.L37:
	.loc 1 138 13
	lw	a5,172(sp)
	addiw	a4,a5,-1
	sw	a4,172(sp)
	.loc 1 138 16
	bgt	a5,zero,.L38
	.loc 1 140 11
	j	.L39
.L40:
	.loc 1 141 13
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 141 16
	li	a4,32
	sb	a4,0(a5)
.L39:
	.loc 1 140 17
	lw	a5,8(sp)
	addiw	a4,a5,-1
	sw	a4,8(sp)
	.loc 1 140 20
	bgt	a5,zero,.L40
	.loc 1 143 12
	ld	a5,24(sp)
.L41:
	.loc 1 144 1 discriminator 1
	mv	a0,a5
	addi	sp,sp,192
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	copy_number, .-copy_number
	.section	.rodata
	.align	3
.LC2:
	.string	"<NULL>"
	.text
	.align	2
	.globl	vsprintf
	.type	vsprintf, @function
vsprintf:
.LFB2:
	.loc 1 147 59
	.cfi_startproc
	addi	sp,sp,-128
	.cfi_def_cfa_offset 128
	sd	ra,120(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 1 159 11
	ld	a5,24(sp)
	sd	a5,104(sp)
	.loc 1 160 17
	ld	a5,16(sp)
	sd	a5,96(sp)
	.loc 1 172 18
	ld	a5,16(sp)
	sd	a5,96(sp)
	.loc 1 172 5
	j	.L43
.L103:
.LBB3:
	.loc 1 174 13
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 174 12
	mv	a4,a5
	li	a5,37
	beq	a4,a5,.L44
	.loc 1 175 21 discriminator 1
	ld	a5,104(sp)
	addi	a4,a5,1
	sd	a4,104(sp)
	.loc 1 175 26 discriminator 1
	ld	a4,96(sp)
	lbu	a4,0(a4)
	.loc 1 175 24 discriminator 1
	sb	a4,0(a5)
	.loc 1 176 13 discriminator 1
	j	.L45
.L44:
	.loc 1 182 9
	ld	a5,96(sp)
	addi	a5,a5,1
	sd	a5,96(sp)
	.loc 1 185 14
	sw	zero,92(sp)
	.loc 1 186 14
	li	a5,1
	sb	a5,67(sp)
	.loc 1 187 15
	j	.L46
.L55:
	.loc 1 188 21
	ld	a5,96(sp)
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 1 188 13
	addiw	a3,a5,-32
	sext.w	a4,a3
	li	a5,16
	bgtu	a4,a5,.L47
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L49
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L49
	add	a5,a4,a5
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L49:
	.word	.L53-.L49
	.word	.L47-.L49
	.word	.L47-.L49
	.word	.L52-.L49
	.word	.L47-.L49
	.word	.L47-.L49
	.word	.L47-.L49
	.word	.L47-.L49
	.word	.L47-.L49
	.word	.L47-.L49
	.word	.L47-.L49
	.word	.L51-.L49
	.word	.L47-.L49
	.word	.L50-.L49
	.word	.L47-.L49
	.word	.L47-.L49
	.word	.L48-.L49
	.text
.L50:
	.loc 1 191 26
	lw	a5,92(sp)
	ori	a5,a5,8
	sw	a5,92(sp)
	.loc 1 192 21
	j	.L54
.L51:
	.loc 1 195 26
	lw	a5,92(sp)
	ori	a5,a5,2
	sw	a5,92(sp)
	.loc 1 196 21
	j	.L54
.L53:
	.loc 1 199 26
	lw	a5,92(sp)
	ori	a5,a5,4
	sw	a5,92(sp)
	.loc 1 200 21
	j	.L54
.L52:
	.loc 1 203 26
	lw	a5,92(sp)
	ori	a5,a5,16
	sw	a5,92(sp)
	.loc 1 204 21
	j	.L54
.L48:
	.loc 1 207 26
	lw	a5,92(sp)
	ori	a5,a5,1
	sw	a5,92(sp)
	.loc 1 208 21
	j	.L54
.L47:
	.loc 1 211 34
	sb	zero,67(sp)
.L54:
	.loc 1 213 20
	ld	a5,96(sp)
	addi	a5,a5,1
	sd	a5,96(sp)
.L46:
	.loc 1 187 16
	lbu	a5,67(sp)
	andi	a5,a5,0xff
	bne	a5,zero,.L55
	.loc 1 215 16
	ld	a5,96(sp)
	addi	a5,a5,-1
	sd	a5,96(sp)
	.loc 1 219 15
	li	a5,-1
	sw	a5,44(sp)
	.loc 1 220 22
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 220 12
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L56
	.loc 1 220 36 discriminator 1
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 220 32 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L56
	.loc 1 222 23
	addi	a5,sp,44
	mv	a1,a5
	ld	a0,96(sp)
	call	_scan_number
	sd	a0,96(sp)
	.loc 1 222 21
	j	.L57
.L56:
	.loc 1 223 20
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 223 19
	mv	a4,a5
	li	a5,42
	bne	a4,a5,.L57
	.loc 1 225 42
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	lw	a5,0(a5)
	.loc 1 225 19
	sw	a5,44(sp)
	.loc 1 227 23
	lw	a5,44(sp)
	.loc 1 227 16
	bge	a5,zero,.L58
	.loc 1 228 25
	lw	a5,44(sp)
	negw	a5,a5
	sext.w	a5,a5
	.loc 1 228 23
	sw	a5,44(sp)
	.loc 1 229 22
	lw	a5,92(sp)
	ori	a5,a5,8
	sw	a5,92(sp)
.L58:
	.loc 1 231 20
	ld	a5,96(sp)
	addi	a5,a5,1
	sd	a5,96(sp)
.L57:
	.loc 1 237 19
	li	a5,-1
	sw	a5,40(sp)
	.loc 1 238 13
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 238 12
	mv	a4,a5
	li	a5,46
	bne	a4,a5,.L59
	.loc 1 240 13
	ld	a5,96(sp)
	addi	a5,a5,1
	sd	a5,96(sp)
	.loc 1 241 26
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 241 16
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L60
	.loc 1 241 40 discriminator 1
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 241 36 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L60
	.loc 1 243 27
	addi	a5,sp,40
	mv	a1,a5
	ld	a0,96(sp)
	call	_scan_number
	sd	a0,96(sp)
	.loc 1 243 25
	j	.L61
.L60:
	.loc 1 244 22
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 244 21
	mv	a4,a5
	li	a5,42
	bne	a4,a5,.L61
	.loc 1 246 50
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	lw	a5,0(a5)
	.loc 1 246 27
	sw	a5,40(sp)
	.loc 1 247 24
	ld	a5,96(sp)
	addi	a5,a5,1
	sd	a5,96(sp)
.L61:
	.loc 1 251 27
	lw	a5,40(sp)
	.loc 1 251 16
	bge	a5,zero,.L59
	.loc 1 252 27
	sw	zero,40(sp)
.L59:
	.loc 1 258 16
	li	a5,-1
	sw	a5,88(sp)
	.loc 1 259 13
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 259 12
	mv	a4,a5
	li	a5,104
	beq	a4,a5,.L62
	.loc 1 259 32 discriminator 1
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 259 29 discriminator 1
	mv	a4,a5
	li	a5,108
	beq	a4,a5,.L62
	.loc 1 259 51 discriminator 2
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 259 48 discriminator 2
	mv	a4,a5
	li	a5,76
	bne	a4,a5,.L63
.L62:
	.loc 1 260 30
	ld	a5,96(sp)
	addi	a4,a5,1
	sd	a4,96(sp)
	.loc 1 260 22
	lbu	a5,0(a5)
	.loc 1 260 20
	sw	a5,88(sp)
	.loc 1 262 16
	lw	a5,88(sp)
	sext.w	a4,a5
	li	a5,108
	bne	a4,a5,.L63
	.loc 1 262 34 discriminator 1
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 262 31 discriminator 1
	mv	a4,a5
	li	a5,108
	bne	a4,a5,.L63
	.loc 1 263 24
	li	a5,76
	sw	a5,88(sp)
	.loc 1 264 24
	ld	a5,96(sp)
	addi	a5,a5,1
	sd	a5,96(sp)
.L63:
	.loc 1 269 17
	ld	a5,96(sp)
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 1 269 9
	addiw	a3,a5,-37
	sext.w	a4,a3
	li	a5,83
	bgtu	a4,a5,.L64
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L66
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L66
	add	a5,a4,a5
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L66:
	.word	.L76-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L75-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L74-.L66
	.word	.L73-.L66
	.word	.L72-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L72-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L71-.L66
	.word	.L70-.L66
	.word	.L69-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L68-.L66
	.word	.L64-.L66
	.word	.L67-.L66
	.word	.L64-.L66
	.word	.L64-.L66
	.word	.L65-.L66
	.text
.L76:
.LBB4:
	.loc 1 271 25 discriminator 1
	ld	a5,104(sp)
	addi	a4,a5,1
	sd	a4,104(sp)
	.loc 1 271 28 discriminator 1
	li	a4,37
	sb	a4,0(a5)
	.loc 1 272 17 discriminator 1
	j	.L45
.L73:
	.loc 1 275 28
	lw	a5,92(sp)
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 1 275 20
	bne	a5,zero,.L77
	.loc 1 276 27
	j	.L78
.L79:
	.loc 1 277 33
	ld	a5,104(sp)
	addi	a4,a5,1
	sd	a4,104(sp)
	.loc 1 277 36
	li	a4,32
	sb	a4,0(a5)
.L78:
	.loc 1 276 28
	lw	a5,44(sp)
	addiw	a5,a5,-1
	sext.w	a5,a5
	.loc 1 276 36
	sw	a5,44(sp)
	.loc 1 276 28
	lw	a5,44(sp)
	.loc 1 276 36
	bgt	a5,zero,.L79
.L77:
	.loc 1 278 67
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	lw	a3,0(a5)
	.loc 1 278 25
	ld	a5,104(sp)
	addi	a4,a5,1
	sd	a4,104(sp)
	.loc 1 278 30
	andi	a4,a3,0xff
	.loc 1 278 28
	sb	a4,0(a5)
	.loc 1 280 23
	j	.L80
.L81:
	.loc 1 281 29
	ld	a5,104(sp)
	addi	a4,a5,1
	sd	a4,104(sp)
	.loc 1 281 32
	li	a4,32
	sb	a4,0(a5)
.L80:
	.loc 1 280 24
	lw	a5,44(sp)
	addiw	a5,a5,-1
	sext.w	a5,a5
	.loc 1 280 32
	sw	a5,44(sp)
	.loc 1 280 24
	lw	a5,44(sp)
	.loc 1 280 32
	bgt	a5,zero,.L81
	.loc 1 282 17
	j	.L45
.L68:
	.loc 1 284 25
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	a5,0(a5)
	sd	a5,80(sp)
	.loc 1 285 21
	ld	a5,80(sp)
	lbu	a5,0(a5)
	.loc 1 285 20
	bne	a5,zero,.L82
	.loc 1 286 29
	lla	a5,.LC2
	sd	a5,80(sp)
.L82:
	.loc 1 287 41
	ld	a0,80(sp)
	call	strlen
	mv	a5,a0
	.loc 1 287 21
	sw	a5,60(sp)
	.loc 1 288 39
	lw	a5,40(sp)
	.loc 1 288 55
	ble	a5,zero,.L83
	.loc 1 288 55 is_stmt 0 discriminator 1
	lw	a5,40(sp)
	j	.L84
.L83:
	.loc 1 288 55 discriminator 2
	lw	a5,60(sp)
.L84:
	.loc 1 288 27 is_stmt 1 discriminator 4
	sw	a5,40(sp)
	.loc 1 289 67 discriminator 4
	lw	a5,40(sp)
	.loc 1 289 29 discriminator 4
	mv	a2,a5
	lw	a5,60(sp)
	sext.w	a3,a5
	sext.w	a4,a2
	ble	a3,a4,.L85
	mv	a5,a2
.L85:
	sw	a5,60(sp)
	.loc 1 292 28 discriminator 4
	lw	a5,92(sp)
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 1 292 20 discriminator 4
	bne	a5,zero,.L86
	.loc 1 293 27
	j	.L87
.L88:
	.loc 1 294 33
	ld	a5,104(sp)
	addi	a4,a5,1
	sd	a4,104(sp)
	.loc 1 294 36
	li	a4,32
	sb	a4,0(a5)
.L87:
	.loc 1 293 47
	lw	a5,44(sp)
	addiw	a4,a5,-1
	sext.w	a4,a4
	sw	a4,44(sp)
	.loc 1 293 40
	lw	a4,60(sp)
	sext.w	a4,a4
	blt	a4,a5,.L88
.L86:
	.loc 1 295 17
	ld	a1,80(sp)
	ld	a0,104(sp)
	call	strcpy
	.loc 1 296 25
	lw	a5,60(sp)
	ld	a4,104(sp)
	add	a5,a4,a5
	sd	a5,104(sp)
	.loc 1 298 23
	j	.L89
.L90:
	.loc 1 299 29
	ld	a5,104(sp)
	addi	a4,a5,1
	sd	a4,104(sp)
	.loc 1 299 32
	li	a4,32
	sb	a4,0(a5)
.L89:
	.loc 1 298 43
	lw	a5,44(sp)
	addiw	a4,a5,-1
	sext.w	a4,a4
	sw	a4,44(sp)
	.loc 1 298 36
	lw	a4,60(sp)
	sext.w	a4,a4
	blt	a4,a5,.L90
	.loc 1 300 17
	j	.L45
.L71:
	.loc 1 302 29 discriminator 2
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	a5,0(a5)
	sd	a5,48(sp)
	.loc 1 303 49 discriminator 2
	ld	a4,104(sp)
	ld	a5,24(sp)
	sub	a5,a4,a5
	.loc 1 303 32 discriminator 2
	mv	a4,a5
	.loc 1 303 30 discriminator 2
	ld	a5,48(sp)
	sd	a4,0(a5)
	.loc 1 304 17 discriminator 2
	j	.L45
.L69:
	.loc 1 306 27
	lw	a5,44(sp)
	.loc 1 306 20
	mv	a4,a5
	li	a5,-1
	bne	a4,a5,.L91
	.loc 1 307 27
	li	a5,16
	sw	a5,44(sp)
	.loc 1 308 26
	lw	a5,92(sp)
	ori	a5,a5,1
	sw	a5,92(sp)
.L91:
	.loc 1 311 67
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	a5,0(a5)
	.loc 1 310 27
	mv	a1,a5
	lw	a3,44(sp)
	lw	a4,40(sp)
	lw	a5,92(sp)
	li	a2,16
	ld	a0,104(sp)
	call	copy_number
	sd	a0,104(sp)
	.loc 1 314 17
	j	.L45
.L74:
	.loc 1 316 22
	li	a5,2
	sw	a5,68(sp)
	.loc 1 317 17
	j	.L92
.L70:
	.loc 1 319 22
	li	a5,8
	sw	a5,68(sp)
	.loc 1 320 17
	j	.L92
.L75:
	.loc 1 322 22
	lw	a5,92(sp)
	ori	a5,a5,64
	sw	a5,92(sp)
.L65:
	.loc 1 324 22
	li	a5,16
	sw	a5,68(sp)
	.loc 1 325 17
	j	.L92
.L72:
	.loc 1 328 22
	lw	a5,92(sp)
	ori	a5,a5,32
	sw	a5,92(sp)
.L67:
	.loc 1 330 22
	li	a5,10
	sw	a5,68(sp)
	.loc 1 331 17
	j	.L92
.L64:
	.loc 1 334 21
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 334 20
	beq	a5,zero,.L93
	.loc 1 335 29
	ld	a5,104(sp)
	addi	a4,a5,1
	sd	a4,104(sp)
	.loc 1 335 34
	ld	a4,96(sp)
	lbu	a4,0(a4)
	.loc 1 335 32
	sb	a4,0(a5)
	.loc 1 338 17
	j	.L105
.L93:
	.loc 1 337 28
	ld	a5,96(sp)
	addi	a5,a5,-1
	sd	a5,96(sp)
.L105:
	.loc 1 338 17
	nop
.L92:
.LBE4:
	.loc 1 342 12
	lw	a5,88(sp)
	sext.w	a4,a5
	li	a5,76
	bne	a4,a5,.L95
	.loc 1 343 22
	lw	a5,92(sp)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 1 343 16
	beq	a5,zero,.L96
	.loc 1 344 48
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	a5,0(a5)
	.loc 1 344 25
	sd	a5,72(sp)
	j	.L97
.L96:
	.loc 1 346 48
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	a5,0(a5)
	.loc 1 346 25
	sd	a5,72(sp)
	j	.L97
.L95:
	.loc 1 347 19
	lw	a5,88(sp)
	sext.w	a4,a5
	li	a5,104
	bne	a4,a5,.L98
	.loc 1 348 22
	lw	a5,92(sp)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 1 348 16
	beq	a5,zero,.L99
	.loc 1 349 56
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	lw	a5,0(a5)
	.loc 1 349 27
	slliw	a5,a5,16
	sraiw	a5,a5,16
	.loc 1 349 25
	sd	a5,72(sp)
	j	.L97
.L99:
	.loc 1 351 65
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	lw	a5,0(a5)
	.loc 1 351 27
	slli	a5,a5,48
	srli	a5,a5,48
	.loc 1 351 25
	sd	a5,72(sp)
	j	.L97
.L98:
	.loc 1 352 19
	lw	a5,88(sp)
	sext.w	a4,a5
	li	a5,108
	bne	a4,a5,.L100
	.loc 1 353 22
	lw	a5,92(sp)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 1 353 16
	beq	a5,zero,.L101
	.loc 1 354 48
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	a5,0(a5)
	.loc 1 354 25
	sd	a5,72(sp)
	j	.L97
.L101:
	.loc 1 356 25
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	ld	a5,0(a5)
	sd	a5,72(sp)
	j	.L97
.L100:
	.loc 1 358 22
	lw	a5,92(sp)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 1 358 16
	beq	a5,zero,.L102
	.loc 1 359 27
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	lw	a5,0(a5)
	.loc 1 359 25
	sd	a5,72(sp)
	j	.L97
.L102:
	.loc 1 361 48
	ld	a5,8(sp)
	addi	a4,a5,8
	sd	a4,8(sp)
	lw	a5,0(a5)
	.loc 1 361 25
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,72(sp)
.L97:
	.loc 1 364 19
	lw	a3,44(sp)
	lw	a4,40(sp)
	lw	a5,92(sp)
	lw	a2,68(sp)
	ld	a1,72(sp)
	ld	a0,104(sp)
	call	copy_number
	sd	a0,104(sp)
.L45:
.LBE3:
	.loc 1 172 53 discriminator 2
	ld	a5,96(sp)
	addi	a5,a5,1
	sd	a5,96(sp)
.L43:
	.loc 1 172 28 discriminator 1
	ld	a5,96(sp)
	lbu	a5,0(a5)
	.loc 1 172 37 discriminator 1
	bne	a5,zero,.L103
	.loc 1 367 14
	ld	a5,104(sp)
	sb	zero,0(a5)
	.loc 1 368 20
	ld	a4,104(sp)
	ld	a5,24(sp)
	sub	a5,a4,a5
	.loc 1 369 1
	mv	a0,a5
	ld	ra,120(sp)
	.cfi_restore 1
	addi	sp,sp,128
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	vsprintf, .-vsprintf
	.align	2
	.globl	sprintf
	.type	sprintf, @function
sprintf:
.LFB3:
	.loc 1 371 51
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,56(sp)
	.cfi_offset 1, -56
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,64(sp)
	sd	a3,72(sp)
	sd	a4,80(sp)
	sd	a5,88(sp)
	sd	a6,96(sp)
	sd	a7,104(sp)
	.loc 1 374 5
	addi	a5,sp,112
	sd	a5,8(sp)
	ld	a5,8(sp)
	addi	a5,a5,-48
	sd	a5,32(sp)
	.loc 1 375 14
	ld	a5,32(sp)
	mv	a2,a5
	ld	a1,16(sp)
	ld	a0,24(sp)
	call	vsprintf
	sd	a0,40(sp)
	.loc 1 377 12
	ld	a5,40(sp)
	.loc 1 378 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	sprintf, .-sprintf
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/stdarg.h"
	.file 4 "include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3cc
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xe
	.4byte	.LASF42
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x5
	.4byte	.LASF9
	.byte	0x2
	.byte	0x1a
	.byte	0x17
	.4byte	0x4f
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0xf
	.4byte	0x56
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x10
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x5
	.4byte	.LASF10
	.byte	0x2
	.byte	0x23
	.byte	0x17
	.4byte	0x2e
	.byte	0x11
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x2
	.byte	0x24
	.byte	0x6
	.4byte	0x9e
	.byte	0xa
	.4byte	.LASF11
	.byte	0
	.byte	0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	.LASF13
	.byte	0x2
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x5
	.4byte	.LASF14
	.byte	0x3
	.byte	0x22
	.byte	0x1b
	.4byte	0xb6
	.byte	0x12
	.byte	0x8
	.4byte	.LASF43
	.byte	0x6
	.4byte	0x56
	.byte	0xb
	.4byte	.LASF15
	.byte	0x63
	.byte	0x7
	.4byte	0xbc
	.4byte	0xdb
	.byte	0x7
	.4byte	0xbc
	.byte	0x7
	.4byte	0xdb
	.byte	0
	.byte	0x6
	.4byte	0x5d
	.byte	0xb
	.4byte	.LASF16
	.byte	0x6d
	.byte	0x8
	.4byte	0x9e
	.4byte	0xf5
	.byte	0x7
	.4byte	0xdb
	.byte	0
	.byte	0x13
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x173
	.byte	0x8
	.4byte	0x9e
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x15c
	.byte	0x14
	.string	"buf"
	.byte	0x1
	.2byte	0x173
	.byte	0x16
	.4byte	0xbc
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x15
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x173
	.byte	0x27
	.4byte	0xdb
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x16
	.byte	0x8
	.4byte	.LASF18
	.2byte	0x174
	.byte	0xd
	.4byte	0xaa
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x8
	.4byte	.LASF19
	.2byte	0x175
	.byte	0xc
	.4byte	0x9e
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0
	.byte	0x17
	.4byte	.LASF21
	.byte	0x1
	.byte	0x93
	.byte	0x8
	.4byte	0x9e
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x27c
	.byte	0x3
	.string	"str"
	.byte	0x93
	.byte	0x17
	.4byte	0xbc
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x4
	.4byte	.LASF17
	.byte	0x93
	.byte	0x28
	.4byte	0xdb
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x3
	.string	"ap"
	.byte	0x93
	.byte	0x38
	.4byte	0xaa
	.byte	0x3
	.byte	0x91
	.byte	0x88,0x7f
	.byte	0x1
	.4byte	.LASF22
	.byte	0x9f
	.byte	0xb
	.4byte	0xbc
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF23
	.byte	0xa0
	.byte	0x11
	.4byte	0xdb
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1
	.4byte	.LASF24
	.byte	0xa3
	.byte	0x9
	.4byte	0x69
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x1
	.4byte	.LASF25
	.byte	0xa3
	.byte	0xf
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0x1
	.4byte	.LASF26
	.byte	0xa3
	.byte	0x16
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x1
	.4byte	.LASF27
	.byte	0xa3
	.byte	0x21
	.4byte	0x69
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1
	.4byte	.LASF28
	.byte	0xa6
	.byte	0xb
	.4byte	0xbc
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1
	.4byte	.LASF29
	.byte	0xa6
	.byte	0x22
	.4byte	0x4f
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1
	.4byte	.LASF30
	.byte	0xa6
	.byte	0x33
	.4byte	0x27c
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x1
	.4byte	.LASF31
	.byte	0xa9
	.byte	0x9
	.4byte	0x69
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x9
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x1
	.4byte	.LASF32
	.byte	0xba
	.byte	0xe
	.4byte	0x77
	.byte	0x2
	.byte	0x91
	.byte	0x43
	.byte	0x9
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x8
	.4byte	.LASF33
	.2byte	0x11f
	.byte	0x15
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0
	.byte	0
	.byte	0
	.byte	0x6
	.4byte	0x9e
	.byte	0xc
	.4byte	.LASF34
	.byte	0x39
	.byte	0x7
	.4byte	0xbc
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x36f
	.byte	0x3
	.string	"str"
	.byte	0x39
	.byte	0x19
	.4byte	0xbc
	.byte	0x3
	.byte	0x91
	.byte	0xd8,0x7e
	.byte	0x3
	.string	"num"
	.byte	0x39
	.byte	0x2c
	.4byte	0x4f
	.byte	0x3
	.byte	0x91
	.byte	0xd0,0x7e
	.byte	0x4
	.4byte	.LASF31
	.byte	0x39
	.byte	0x35
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xcc,0x7e
	.byte	0x4
	.4byte	.LASF25
	.byte	0x39
	.byte	0x3f
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x7e
	.byte	0x4
	.4byte	.LASF26
	.byte	0x39
	.byte	0x4a
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xc4,0x7e
	.byte	0x4
	.4byte	.LASF24
	.byte	0x39
	.byte	0x59
	.4byte	0x69
	.byte	0x3
	.byte	0x91
	.byte	0xc0,0x7e
	.byte	0x1
	.4byte	.LASF35
	.byte	0x3a
	.byte	0xa
	.4byte	0x56
	.byte	0x2
	.byte	0x91
	.byte	0x6b
	.byte	0x1
	.4byte	.LASF36
	.byte	0x3b
	.byte	0xa
	.4byte	0x56
	.byte	0x2
	.byte	0x91
	.byte	0x7f
	.byte	0x1
	.4byte	.LASF37
	.byte	0x3c
	.byte	0xa
	.4byte	0x36f
	.byte	0x3
	.byte	0x91
	.byte	0xe0,0x7e
	.byte	0x1
	.4byte	.LASF38
	.byte	0x3f
	.byte	0x11
	.4byte	0xdb
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0xd
	.string	"i"
	.byte	0x61
	.4byte	0x69
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x9
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x1
	.4byte	.LASF39
	.byte	0x66
	.byte	0x34
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1
	.4byte	.LASF40
	.byte	0x66
	.byte	0x52
	.4byte	0x3c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	0x56
	.4byte	0x37f
	.byte	0x19
	.4byte	0x4f
	.byte	0x7f
	.byte	0
	.byte	0xc
	.4byte	.LASF41
	.byte	0x2e
	.byte	0xd
	.4byte	0xdb
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ca
	.byte	0x3
	.string	"str"
	.byte	0x2e
	.byte	0x26
	.4byte	0xdb
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.string	"num"
	.byte	0x2e
	.byte	0x30
	.4byte	0x3ca
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xd
	.string	"tmp"
	.byte	0x2f
	.4byte	0x69
	.byte	0x2
	.byte	0x91
	.byte	0x7c
	.byte	0
	.byte	0x6
	.4byte	0x69
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
	.byte	0x3
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
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
	.byte	0x4
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
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x34
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
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
	.byte	0x4
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
	.byte	0xc
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
	.byte	0xd
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x9
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
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
	.byte	0x12
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
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
	.byte	0x14
	.byte	0x5
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
	.byte	0x15
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
	.byte	0x16
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
.LASF38:
	.string	"digits"
.LASF13:
	.string	"size_t"
.LASF43:
	.string	"__builtin_va_list"
.LASF29:
	.string	"num_arg"
.LASF37:
	.string	"char_num"
.LASF9:
	.string	"uint64_t"
.LASF34:
	.string	"copy_number"
.LASF39:
	.string	"__base"
.LASF16:
	.string	"strlen"
.LASF14:
	.string	"va_list"
.LASF26:
	.string	"precision"
.LASF2:
	.string	"unsigned char"
.LASF19:
	.string	"retval"
.LASF12:
	.string	"True"
.LASF15:
	.string	"strcpy"
.LASF10:
	.string	"Bool"
.LASF5:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF33:
	.string	"str_arg_len"
.LASF28:
	.string	"str_arg"
.LASF11:
	.string	"False"
.LASF17:
	.string	"format"
.LASF24:
	.string	"flag"
.LASF31:
	.string	"base"
.LASF4:
	.string	"unsigned int"
.LASF40:
	.string	"__remain"
.LASF6:
	.string	"char"
.LASF22:
	.string	"out_pos"
.LASF30:
	.string	"int_ptr_arg"
.LASF42:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF32:
	.string	"is_flag_char"
.LASF25:
	.string	"width"
.LASF7:
	.string	"short int"
.LASF18:
	.string	"args"
.LASF23:
	.string	"fmt_pos"
.LASF41:
	.string	"_scan_number"
.LASF8:
	.string	"long int"
.LASF36:
	.string	"sign"
.LASF35:
	.string	"pad_char"
.LASF27:
	.string	"length"
.LASF20:
	.string	"sprintf"
.LASF21:
	.string	"vsprintf"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
.LASF0:
	.string	"lib/stdfmt.c"
	.ident	"GCC: (g) 12.2.0"
