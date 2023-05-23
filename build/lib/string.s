	.file	"string.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/oskernel2023-x2w" "lib/string.c"
	.align	2
	.globl	memset
	.type	memset, @function
memset:
.LFB0:
	.file 1 "lib/string.c"
	.loc 1 15 50
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	a0,24(sp)
	mv	a5,a1
	sd	a2,8(sp)
	sb	a5,23(sp)
	.loc 1 16 12
	sd	zero,40(sp)
	.loc 1 17 14
	ld	a5,24(sp)
	sd	a5,32(sp)
	.loc 1 18 10
	j	.L2
.L3:
	.loc 1 19 14
	ld	a5,32(sp)
	addi	a4,a5,1
	sd	a4,32(sp)
	.loc 1 19 17
	lbu	a4,23(sp)
	sb	a4,0(a5)
	.loc 1 19 29
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,40(sp)
.L2:
	.loc 1 18 15
	ld	a5,8(sp)
	addi	a4,a5,-1
	sd	a4,8(sp)
	.loc 1 18 18
	bne	a5,zero,.L3
	.loc 1 20 12
	ld	a5,40(sp)
	.loc 1 21 1
	mv	a0,a5
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	memset, .-memset
	.align	2
	.globl	strmset
	.type	strmset, @function
strmset:
.LFB1:
	.loc 1 23 51
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	mv	a5,a1
	sd	a2,8(sp)
	sb	a5,23(sp)
	.loc 1 24 12
	sd	zero,56(sp)
	.loc 1 25 17
	ld	a0,24(sp)
	call	strlen
	sd	a0,48(sp)
	.loc 1 26 11
	ld	a5,24(sp)
	sd	a5,40(sp)
	.loc 1 27 10
	j	.L6
.L8:
	.loc 1 28 14
	ld	a5,40(sp)
	addi	a4,a5,1
	sd	a4,40(sp)
	.loc 1 28 17
	lbu	a4,23(sp)
	sb	a4,0(a5)
	.loc 1 28 29
	ld	a5,56(sp)
	addi	a5,a5,1
	sd	a5,56(sp)
.L6:
	.loc 1 27 15
	ld	a5,8(sp)
	addi	a4,a5,-1
	sd	a4,8(sp)
	.loc 1 27 21
	beq	a5,zero,.L7
	.loc 1 27 28 discriminator 1
	ld	a5,48(sp)
	addi	a4,a5,-1
	sd	a4,48(sp)
	.loc 1 27 21 discriminator 1
	bne	a5,zero,.L8
.L7:
	.loc 1 29 12
	ld	a5,56(sp)
	.loc 1 30 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	strmset, .-strmset
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB2:
	.loc 1 32 55
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 1 33 12
	sd	zero,56(sp)
	.loc 1 34 14
	ld	a5,24(sp)
	sd	a5,48(sp)
	.loc 1 35 20
	ld	a5,16(sp)
	sd	a5,40(sp)
	.loc 1 36 11
	j	.L11
.L12:
	.loc 1 37 24
	ld	a4,40(sp)
	addi	a5,a4,1
	sd	a5,40(sp)
	.loc 1 37 14
	ld	a5,48(sp)
	addi	a3,a5,1
	sd	a3,48(sp)
	.loc 1 37 19
	lbu	a4,0(a4)
	.loc 1 37 17
	sb	a4,0(a5)
	.loc 1 37 31
	ld	a5,56(sp)
	addi	a5,a5,1
	sd	a5,56(sp)
.L11:
	.loc 1 36 16
	ld	a5,8(sp)
	addi	a4,a5,-1
	sd	a4,8(sp)
	.loc 1 36 19
	bne	a5,zero,.L12
	.loc 1 38 12
	ld	a5,56(sp)
	.loc 1 39 1
	mv	a0,a5
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	memcpy, .-memcpy
	.align	2
	.globl	memmove
	.type	memmove, @function
memmove:
.LFB3:
	.loc 1 41 56
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 1 43 12
	sd	zero,40(sp)
	.loc 1 44 8
	ld	a4,24(sp)
	ld	a5,16(sp)
	bgtu	a4,a5,.L15
	.loc 1 45 13
	ld	a5,24(sp)
	sd	a5,56(sp)
	.loc 1 46 11
	ld	a5,16(sp)
	sd	a5,48(sp)
	.loc 1 47 15
	j	.L16
.L17:
	.loc 1 48 24
	ld	a4,48(sp)
	addi	a5,a4,1
	sd	a5,48(sp)
	.loc 1 48 17
	ld	a5,56(sp)
	addi	a3,a5,1
	sd	a3,56(sp)
	.loc 1 48 22
	lbu	a4,0(a4)
	.loc 1 48 20
	sb	a4,0(a5)
	.loc 1 49 16
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,40(sp)
.L16:
	.loc 1 47 20
	ld	a5,8(sp)
	addi	a4,a5,-1
	sd	a4,8(sp)
	.loc 1 47 16
	bne	a5,zero,.L17
	j	.L18
.L15:
	.loc 1 51 13
	ld	a4,24(sp)
	ld	a5,8(sp)
	add	a5,a4,a5
	sd	a5,56(sp)
	.loc 1 52 11
	ld	a4,16(sp)
	ld	a5,8(sp)
	add	a5,a4,a5
	sd	a5,48(sp)
	.loc 1 53 15
	j	.L19
.L20:
	.loc 1 54 20
	ld	a5,48(sp)
	addi	a5,a5,-1
	sd	a5,48(sp)
	ld	a5,56(sp)
	addi	a5,a5,-1
	sd	a5,56(sp)
	.loc 1 54 22
	ld	a5,48(sp)
	lbu	a4,0(a5)
	.loc 1 54 20
	ld	a5,56(sp)
	sb	a4,0(a5)
	.loc 1 55 16
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,40(sp)
.L19:
	.loc 1 53 20
	ld	a5,8(sp)
	addi	a4,a5,-1
	sd	a4,8(sp)
	.loc 1 53 16
	bne	a5,zero,.L20
.L18:
	.loc 1 58 12
	ld	a5,40(sp)
	.loc 1 59 1
	mv	a0,a5
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	memmove, .-memmove
	.align	2
	.globl	memcmp
	.type	memcmp, @function
memcmp:
.LFB4:
	.loc 1 61 57
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 1 62 17
	ld	a5,24(sp)
	sd	a5,40(sp)
	.loc 1 63 17
	ld	a5,16(sp)
	sd	a5,32(sp)
	.loc 1 64 11
	j	.L23
.L28:
	.loc 1 65 13
	ld	a5,40(sp)
	lbu	a4,0(a5)
	.loc 1 65 20
	ld	a5,32(sp)
	lbu	a5,0(a5)
	.loc 1 65 12
	beq	a4,a5,.L24
	.loc 1 66 29
	ld	a5,40(sp)
	lbu	a4,0(a5)
	.loc 1 66 35
	ld	a5,32(sp)
	lbu	a5,0(a5)
	.loc 1 66 20
	bleu	a4,a5,.L25
	.loc 1 66 20 is_stmt 0 discriminator 1
	li	a5,1
	j	.L27
.L25:
	.loc 1 66 20 discriminator 2
	li	a5,255
	j	.L27
.L24:
	.loc 1 67 11 is_stmt 1
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,40(sp)
	.loc 1 67 17
	ld	a5,32(sp)
	addi	a5,a5,1
	sd	a5,32(sp)
.L23:
	.loc 1 64 16
	ld	a5,8(sp)
	addi	a4,a5,-1
	sd	a4,8(sp)
	.loc 1 64 19
	bne	a5,zero,.L28
	.loc 1 69 12
	li	a5,0
.L27:
	.loc 1 70 1
	mv	a0,a5
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	memcmp, .-memcmp
	.align	2
	.globl	strcpy
	.type	strcpy, @function
strcpy:
.LFB5:
	.loc 1 73 41
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 74 11
	ld	a5,8(sp)
	sd	a5,24(sp)
	.loc 1 76 11
	nop
.L30:
	.loc 1 76 26 discriminator 1
	ld	a4,0(sp)
	addi	a5,a4,1
	sd	a5,0(sp)
	.loc 1 76 17 discriminator 1
	ld	a5,8(sp)
	addi	a3,a5,1
	sd	a3,8(sp)
	.loc 1 76 22 discriminator 1
	lbu	a4,0(a4)
	.loc 1 76 20 discriminator 1
	sb	a4,0(a5)
	.loc 1 76 13 discriminator 1
	lbu	a5,0(a5)
	.loc 1 76 12 discriminator 1
	bne	a5,zero,.L30
	.loc 1 77 12
	ld	a5,24(sp)
	.loc 1 78 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	strcpy, .-strcpy
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
.LFB6:
	.loc 1 81 31
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	.loc 1 82 17
	ld	a5,8(sp)
	sd	a5,24(sp)
	.loc 1 83 10
	nop
.L33:
	.loc 1 83 13 discriminator 1
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 83 11 discriminator 1
	lbu	a5,0(a5)
	bne	a5,zero,.L33
	.loc 1 85 24
	ld	a5,24(sp)
	addi	a4,a5,-1
	.loc 1 85 29
	ld	a5,8(sp)
	sub	a5,a4,a5
	.loc 1 86 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	strlen, .-strlen
	.align	2
	.globl	strcmp
	.type	strcmp, @function
strcmp:
.LFB7:
	.loc 1 89 44
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 90 10
	j	.L36
.L38:
	.loc 1 92 10
	ld	a5,8(sp)
	addi	a5,a5,1
	sd	a5,8(sp)
	.loc 1 92 15
	ld	a5,0(sp)
	addi	a5,a5,1
	sd	a5,0(sp)
.L36:
	.loc 1 90 11
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 90 19
	beq	a5,zero,.L37
	.loc 1 90 22 discriminator 1
	ld	a5,8(sp)
	lbu	a4,0(a5)
	.loc 1 90 28 discriminator 1
	ld	a5,0(sp)
	lbu	a5,0(a5)
	.loc 1 90 19 discriminator 1
	beq	a4,a5,.L38
.L37:
	.loc 1 93 12
	ld	a5,8(sp)
	lbu	a4,0(a5)
	.loc 1 93 17
	ld	a5,0(sp)
	lbu	a5,0(a5)
	.loc 1 93 25
	bltu	a4,a5,.L39
	.loc 1 93 27 discriminator 1
	ld	a5,8(sp)
	lbu	a4,0(a5)
	.loc 1 93 32 discriminator 1
	ld	a5,0(sp)
	lbu	a5,0(a5)
	.loc 1 93 30 discriminator 1
	sext.w	a4,a4
	sext.w	a5,a5
	sgtu	a5,a4,a5
	andi	a5,a5,0xff
	j	.L40
.L39:
	.loc 1 93 25 discriminator 2
	li	a5,255
.L40:
	.loc 1 94 1 discriminator 4
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	strcmp, .-strcmp
	.align	2
	.globl	strcat
	.type	strcat, @function
strcat:
.LFB8:
	.loc 1 97 41
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 98 11
	ld	a5,8(sp)
	sd	a5,24(sp)
	.loc 1 100 11
	nop
.L43:
	.loc 1 100 16 discriminator 1
	ld	a5,24(sp)
	addi	a4,a5,1
	sd	a4,24(sp)
	.loc 1 100 12 discriminator 1
	lbu	a5,0(a5)
	bne	a5,zero,.L43
	.loc 1 101 5
	ld	a5,24(sp)
	addi	a5,a5,-1
	sd	a5,24(sp)
	.loc 1 102 10
	nop
.L44:
	.loc 1 102 25 discriminator 1
	ld	a4,0(sp)
	addi	a5,a4,1
	sd	a5,0(sp)
	.loc 1 102 16 discriminator 1
	ld	a5,24(sp)
	addi	a3,a5,1
	sd	a3,24(sp)
	.loc 1 102 21 discriminator 1
	lbu	a4,0(a4)
	.loc 1 102 19 discriminator 1
	sb	a4,0(a5)
	.loc 1 102 12 discriminator 1
	lbu	a5,0(a5)
	.loc 1 102 11 discriminator 1
	bne	a5,zero,.L44
	.loc 1 103 12
	ld	a5,8(sp)
	.loc 1 104 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	strcat, .-strcat
	.align	2
	.globl	strchr
	.type	strchr, @function
strchr:
.LFB9:
	.loc 1 107 48
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 1 108 11
	j	.L47
.L50:
	.loc 1 109 12
	ld	a5,8(sp)
	lbu	a4,0(a5)
	.loc 1 109 11
	lbu	a5,7(sp)
	andi	a5,a5,0xff
	bne	a5,a4,.L48
	.loc 1 110 20
	ld	a5,8(sp)
	j	.L49
.L48:
	.loc 1 112 12
	ld	a5,8(sp)
	addi	a5,a5,1
	sd	a5,8(sp)
.L47:
	.loc 1 108 12
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 108 17
	bne	a5,zero,.L50
	.loc 1 114 12
	li	a5,0
.L49:
	.loc 1 115 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	strchr, .-strchr
	.align	2
	.globl	strrchr
	.type	strrchr, @function
strrchr:
.LFB10:
	.loc 1 118 49
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 1 119 17
	sd	zero,24(sp)
	.loc 1 120 11
	j	.L52
.L54:
	.loc 1 121 13
	ld	a5,8(sp)
	lbu	a4,0(a5)
	.loc 1 121 12
	lbu	a5,7(sp)
	andi	a5,a5,0xff
	bne	a5,a4,.L53
	.loc 1 122 23
	ld	a5,8(sp)
	sd	a5,24(sp)
.L53:
	.loc 1 124 12
	ld	a5,8(sp)
	addi	a5,a5,1
	sd	a5,8(sp)
.L52:
	.loc 1 120 12
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 1 120 17
	bne	a5,zero,.L54
	.loc 1 126 12
	ld	a5,24(sp)
	.loc 1 127 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	strrchr, .-strrchr
	.align	2
	.globl	strchrs
	.type	strchrs, @function
strchrs:
.LFB11:
	.loc 1 130 44
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	mv	a5,a1
	sb	a5,7(sp)
	.loc 1 131 12
	sd	zero,24(sp)
	.loc 1 132 17
	ld	a5,8(sp)
	sd	a5,16(sp)
	.loc 1 133 11
	j	.L57
.L59:
	.loc 1 134 13
	ld	a5,16(sp)
	lbu	a4,0(a5)
	.loc 1 134 12
	lbu	a5,7(sp)
	andi	a5,a5,0xff
	bne	a5,a4,.L58
	.loc 1 135 19
	ld	a5,24(sp)
	addi	a5,a5,1
	sd	a5,24(sp)
.L58:
	.loc 1 136 10
	ld	a5,16(sp)
	addi	a5,a5,1
	sd	a5,16(sp)
.L57:
	.loc 1 133 12
	ld	a5,16(sp)
	lbu	a5,0(a5)
	.loc 1 133 15
	bne	a5,zero,.L59
	.loc 1 138 12
	ld	a5,24(sp)
	.loc 1 139 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	strchrs, .-strchrs
	.align	2
	.globl	strslice
	.type	strslice, @function
strslice:
.LFB12:
	.loc 1 141 72
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	sd	a3,0(sp)
	.loc 1 142 26
	ld	a5,8(sp)
	.loc 1 142 11
	ld	a4,24(sp)
	add	a5,a4,a5
	sd	a5,56(sp)
	.loc 1 143 18
	ld	a0,56(sp)
	call	strlen
	mv	a5,a0
	.loc 1 143 13
	sd	a5,40(sp)
	.loc 1 144 12
	sd	zero,48(sp)
	.loc 1 145 7
	ld	a4,0(sp)
	ld	a5,40(sp)
	ble	a4,a5,.L63
	.loc 1 145 20 discriminator 1
	ld	a5,40(sp)
	sd	a5,0(sp)
	.loc 1 146 10 discriminator 1
	j	.L63
.L64:
	.loc 1 147 12
	ld	a5,48(sp)
	addi	a5,a5,1
	sd	a5,48(sp)
	.loc 1 148 24
	ld	a4,56(sp)
	addi	a5,a4,1
	sd	a5,56(sp)
	.loc 1 148 14
	ld	a5,16(sp)
	addi	a3,a5,1
	sd	a3,16(sp)
	.loc 1 148 18
	lbu	a4,0(a4)
	.loc 1 148 17
	sb	a4,0(a5)
.L63:
	.loc 1 146 14
	ld	a5,0(sp)
	addi	a4,a5,-1
	sd	a4,0(sp)
	.loc 1 146 16
	bgt	a5,zero,.L64
	.loc 1 150 9
	ld	a5,16(sp)
	sb	zero,0(a5)
	.loc 1 151 12
	ld	a5,48(sp)
	.loc 1 152 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	strslice, .-strslice
	.align	2
	.globl	encrypt_decrypt
	.type	encrypt_decrypt, @function
encrypt_decrypt:
.LFB13:
	.loc 1 155 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	mv	a5,a1
	mv	a4,a2
	sw	a5,4(sp)
	mv	a5,a4
	sb	a5,3(sp)
	.loc 1 157 12
	sw	zero,28(sp)
	.loc 1 157 5
	j	.L67
.L68:
	.loc 1 158 12 discriminator 3
	lw	a5,28(sp)
	ld	a4,8(sp)
	add	a5,a4,a5
	lbu	a4,0(a5)
	lw	a5,28(sp)
	ld	a3,8(sp)
	add	a5,a3,a5
	.loc 1 158 16 discriminator 3
	lbu	a3,3(sp)
	xor	a4,a4,a3
	andi	a4,a4,0xff
	sb	a4,0(a5)
	.loc 1 157 27 discriminator 3
	lw	a5,28(sp)
	addiw	a5,a5,1
	sw	a5,28(sp)
.L67:
	.loc 1 157 19 discriminator 1
	lw	a5,28(sp)
	mv	a4,a5
	lw	a5,4(sp)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L68
	.loc 1 160 1
	nop
	nop
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	encrypt_decrypt, .-encrypt_decrypt
	.align	2
	.globl	regu_match
	.type	regu_match, @function
regu_match:
.LFB14:
	.loc 1 164 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 1 166 19
	ld	a0,24(sp)
	call	strlen
	mv	a5,a0
	.loc 1 166 9
	sw	a5,44(sp)
	.loc 1 167 19
	ld	a0,16(sp)
	call	strlen
	mv	a5,a0
	.loc 1 167 9
	sw	a5,40(sp)
	.loc 1 168 9
	sw	zero,48(sp)
	.loc 1 169 12
	sw	zero,60(sp)
	.loc 1 169 5
	j	.L70
.L75:
	.loc 1 170 16
	lw	a5,60(sp)
	ld	a4,24(sp)
	add	a5,a4,a5
	lbu	a4,0(a5)
	.loc 1 170 30
	ld	a5,16(sp)
	lbu	a5,0(a5)
	.loc 1 170 12
	bne	a4,a5,.L71
	.loc 1 171 15
	lw	a5,60(sp)
	sw	a5,52(sp)
	.loc 1 172 20
	sw	zero,56(sp)
	.loc 1 172 13
	j	.L72
.L74:
	.loc 1 173 20
	lw	a5,52(sp)
	mv	a4,a5
	lw	a5,44(sp)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L73
	.loc 1 173 40 discriminator 1
	lw	a5,52(sp)
	ld	a4,24(sp)
	add	a5,a4,a5
	lbu	a3,0(a5)
	.loc 1 173 54 discriminator 1
	lw	a5,56(sp)
	ld	a4,16(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 1 173 34 discriminator 1
	mv	a4,a3
	bne	a4,a5,.L73
	.loc 1 176 18 discriminator 2
	lw	a5,52(sp)
	addiw	a5,a5,1
	sw	a5,52(sp)
	.loc 1 172 39 discriminator 2
	lw	a5,56(sp)
	addiw	a5,a5,1
	sw	a5,56(sp)
.L72:
	.loc 1 172 27 discriminator 1
	lw	a5,56(sp)
	mv	a4,a5
	lw	a5,40(sp)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L74
.L73:
	.loc 1 178 16
	lw	a5,56(sp)
	mv	a4,a5
	lw	a5,40(sp)
	sext.w	a4,a4
	sext.w	a5,a5
	bne	a4,a5,.L71
	.loc 1 179 36
	lw	a5,48(sp)
	addiw	a4,a5,1
	sw	a4,48(sp)
	.loc 1 179 26
	slli	a5,a5,2
	ld	a4,8(sp)
	add	a5,a4,a5
	.loc 1 179 40
	lw	a4,60(sp)
	sw	a4,0(a5)
	.loc 1 180 19
	lw	a5,52(sp)
	addiw	a5,a5,-1
	sw	a5,60(sp)
.L71:
	.loc 1 169 31 discriminator 2
	lw	a5,60(sp)
	addiw	a5,a5,1
	sw	a5,60(sp)
.L70:
	.loc 1 169 19 discriminator 1
	lw	a5,60(sp)
	mv	a4,a5
	lw	a5,44(sp)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L75
	.loc 1 184 12
	lw	a5,48(sp)
	.loc 1 185 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	regu_match, .-regu_match
	.align	2
	.globl	regu_replace
	.type	regu_replace, @function
regu_replace:
.LFB15:
	.loc 1 188 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	li	t0,-8192
	add	sp,sp,t0
	.cfi_def_cfa_offset 8272
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	li	a5,-8192
	li	a4,8192
	addi	a6,a4,64
	add	a6,a6,a5
	add	a5,a6,sp
	sd	a0,-40(a5)
	li	a5,-8192
	addi	a0,a4,64
	add	a0,a0,a5
	add	a5,a0,sp
	sd	a1,-48(a5)
	li	a5,-8192
	mv	a1,a4
	addi	a4,a4,64
	add	a4,a4,a5
	add	a5,a4,sp
	sd	a2,-56(a5)
	mv	a4,a3
	li	a5,-8192
	mv	a3,a1
	addi	a2,a3,64
	add	a2,a2,a5
	add	a5,a2,sp
	sw	a4,-60(a5)
	.loc 1 190 19
	li	a5,-8192
	mv	s0,a3
	addi	a4,s0,64
	add	a4,a4,a5
	add	a5,a4,sp
	ld	a0,-40(a5)
	call	strlen
	mv	a5,a0
	.loc 1 190 9
	addi	a4,s0,48
	add	a4,a4,sp
	sw	a5,0(a4)
	.loc 1 191 19
	li	a5,-8192
	addi	a4,s0,64
	add	a4,a4,a5
	add	a5,a4,sp
	ld	a0,-48(a5)
	call	strlen
	mv	a5,a0
	.loc 1 191 9
	addi	a4,s0,44
	add	a4,a4,sp
	sw	a5,0(a4)
	.loc 1 192 19
	li	a5,-8192
	addi	a4,s0,64
	add	a4,a4,a5
	add	a5,a4,sp
	ld	a0,-56(a5)
	call	strlen
	mv	a5,a0
	.loc 1 192 9
	addi	a4,s0,40
	add	a4,a4,sp
	sw	a5,0(a4)
	.loc 1 194 21
	li	a5,-8192
	addi	a5,a5,-32
	addi	a4,s0,64
	add	a4,a4,a5
	add	a3,a4,sp
	li	a5,-8192
	addi	a4,s0,64
	add	a4,a4,a5
	add	a4,a4,sp
	li	a5,-8192
	addi	a2,s0,64
	add	a2,a2,a5
	add	a5,a2,sp
	mv	a2,a3
	ld	a1,-48(a4)
	ld	a0,-40(a5)
	call	regu_match
	mv	a5,a0
	mv	a3,s0
	addi	a4,a3,36
	add	a4,a4,sp
	sw	a5,0(a4)
	.loc 1 195 8
	addi	a5,a3,36
	add	a5,a5,sp
	lw	a5,0(a5)
	sext.w	a5,a5
	beq	a5,zero,.L86
	.loc 1 198 50
	addi	a5,a3,40
	add	a5,a5,sp
	lw	a5,0(a5)
	mv	a4,a5
	addi	a5,a3,44
	add	a5,a5,sp
	lw	a5,0(a5)
	subw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 198 39
	addi	a4,a3,36
	add	a4,a4,sp
	lw	a4,0(a4)
	mulw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 198 9
	addi	a4,a3,48
	add	a4,a4,sp
	lw	a4,0(a4)
	addw	a5,a4,a5
	addi	a4,a3,32
	add	a4,a4,sp
	sw	a5,0(a4)
	.loc 1 199 8
	li	a5,-8192
	addi	a4,a3,64
	add	a4,a4,a5
	add	a5,a4,sp
	addi	a4,a3,32
	add	a4,a4,sp
	lw	a4,0(a4)
	lw	a5,-60(a5)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L87
	.loc 1 202 7
	addi	a5,a3,52
	add	a5,a5,sp
	sw	zero,0(a5)
	.loc 1 203 7
	addi	a5,a3,56
	add	a5,a5,sp
	sw	zero,0(a5)
	.loc 1 204 12
	addi	a5,a3,60
	add	a5,a5,sp
	sw	zero,0(a5)
	.loc 1 204 5
	j	.L81
.L84:
	.loc 1 205 27
	li	a5,-8192
	li	a3,8192
	addi	a4,a3,64
	add	a4,a4,a5
	add	a4,a4,sp
	addi	a5,a3,56
	add	a5,a5,sp
	lw	a5,0(a5)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-32(a5)
	.loc 1 205 12
	addi	a5,a3,60
	add	a5,a5,sp
	lw	a5,0(a5)
	sext.w	a5,a5
	bne	a5,a4,.L82
	.loc 1 206 13
	addi	a5,a3,52
	add	a5,a5,sp
	lw	a5,0(a5)
	.loc 1 206 20
	li	a4,-8192
	addi	a2,a3,64
	add	a2,a2,a4
	add	a4,a2,sp
	ld	a4,-40(a4)
	add	a4,a4,a5
	.loc 1 206 13
	mv	s0,a3
	addi	a5,s0,40
	add	a5,a5,sp
	lw	a3,0(a5)
	li	a5,-8192
	addi	a2,s0,64
	add	a2,a2,a5
	add	a5,a2,sp
	mv	a2,a3
	ld	a1,-56(a5)
	mv	a0,a4
	call	memcpy
	.loc 1 207 15
	mv	a3,s0
	addi	a5,a3,52
	add	a5,a5,sp
	lw	a5,0(a5)
	mv	a4,a5
	addi	a5,a3,40
	add	a5,a5,sp
	lw	a5,0(a5)
	addw	a5,a4,a5
	mv	a4,a3
	addi	a3,a4,52
	add	a3,a3,sp
	sw	a5,0(a3)
	.loc 1 208 26
	addi	a5,a4,44
	add	a5,a5,sp
	lw	a5,0(a5)
	addiw	a5,a5,-1
	sext.w	a5,a5
	.loc 1 208 15
	mv	a3,a4
	addi	a4,a4,60
	add	a4,a4,sp
	lw	a4,0(a4)
	addw	a5,a4,a5
	mv	a4,a3
	addi	a3,a4,60
	add	a3,a3,sp
	sw	a5,0(a3)
	.loc 1 209 14
	addi	a5,a4,56
	add	a5,a5,sp
	lw	a5,0(a5)
	addiw	a5,a5,1
	addi	a4,a4,56
	add	a4,a4,sp
	sw	a5,0(a4)
	j	.L83
.L82:
	.loc 1 211 27
	li	a3,8192
	addi	a5,a3,60
	add	a5,a5,sp
	lw	a5,0(a5)
	li	a4,-8192
	addi	a2,a3,64
	add	a2,a2,a4
	add	a4,a2,sp
	ld	a4,-40(a4)
	add	a4,a4,a5
	.loc 1 211 18
	mv	a2,a3
	addi	a5,a2,52
	add	a5,a5,sp
	lw	a5,0(a5)
	addiw	a3,a5,1
	addi	a1,a2,52
	add	a1,a1,sp
	sw	a3,0(a1)
	mv	a3,a5
	.loc 1 211 16
	li	a5,-8192
	addi	a2,a2,64
	add	a2,a2,a5
	add	a5,a2,sp
	ld	a5,-40(a5)
	add	a5,a5,a3
	.loc 1 211 27
	lbu	a4,0(a4)
	.loc 1 211 22
	sb	a4,0(a5)
.L83:
	.loc 1 204 31 discriminator 2
	li	a4,8192
	addi	a5,a4,60
	add	a5,a5,sp
	lw	a5,0(a5)
	addiw	a5,a5,1
	addi	a4,a4,60
	add	a4,a4,sp
	sw	a5,0(a4)
.L81:
	.loc 1 204 19 discriminator 1
	li	a3,8192
	addi	a5,a3,60
	add	a5,a5,sp
	lw	a5,0(a5)
	mv	a4,a5
	addi	a5,a3,48
	add	a5,a5,sp
	lw	a5,0(a5)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L84
	.loc 1 214 8
	addi	a5,a3,52
	add	a5,a5,sp
	lw	a5,0(a5)
	li	a4,-8192
	addi	a3,a3,64
	add	a3,a3,a4
	add	a4,a3,sp
	ld	a4,-40(a4)
	add	a5,a4,a5
	.loc 1 214 12
	sb	zero,0(a5)
	j	.L77
.L86:
	.loc 1 196 9
	nop
	j	.L77
.L87:
	.loc 1 200 9
	nop
.L77:
	.loc 1 215 1
	li	t0,8192
	add	sp,sp,t0
	.cfi_def_cfa_offset 80
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	regu_replace, .-regu_replace
.Letext0:
	.file 2 "include/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x743
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xb
	.4byte	.LASF49
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.LASF5
	.byte	0x17
	.byte	0x17
	.4byte	0x3e
	.byte	0xa
	.4byte	0x2e
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x6
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x1a
	.byte	0x17
	.4byte	0x5e
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1d
	.byte	0xe
	.4byte	0x70
	.byte	0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0xa
	.4byte	0x70
	.byte	0x6
	.byte	0x2
	.byte	0x5
	.4byte	.LASF10
	.byte	0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x7
	.4byte	.LASF11
	.byte	0x20
	.byte	0xe
	.4byte	0x95
	.byte	0x6
	.byte	0x8
	.byte	0x5
	.4byte	.LASF12
	.byte	0x7
	.4byte	.LASF13
	.byte	0x2a
	.byte	0x12
	.4byte	0x53
	.byte	0x7
	.4byte	.LASF14
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0xd
	.4byte	.LASF24
	.byte	0x1
	.byte	0xbb
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x18b
	.byte	0x1
	.string	"str"
	.byte	0xbb
	.byte	0x19
	.4byte	0x18b
	.byte	0x4
	.byte	0x91
	.byte	0xc8,0xbf,0x7f
	.byte	0x4
	.4byte	.LASF15
	.byte	0xbb
	.byte	0x2a
	.4byte	0x190
	.byte	0x4
	.byte	0x91
	.byte	0xc0,0xbf,0x7f
	.byte	0x4
	.4byte	.LASF16
	.byte	0xbb
	.byte	0x3f
	.4byte	0x190
	.byte	0x4
	.byte	0x91
	.byte	0xb8,0xbf,0x7f
	.byte	0x4
	.4byte	.LASF17
	.byte	0xbb
	.byte	0x50
	.4byte	0x83
	.byte	0x4
	.byte	0x91
	.byte	0xb4,0xbf,0x7f
	.byte	0x2
	.string	"i"
	.byte	0xbd
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x2
	.string	"j"
	.byte	0xbd
	.byte	0xc
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2
	.string	"k"
	.byte	0xbd
	.byte	0xf
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x3
	.4byte	.LASF18
	.byte	0xbe
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.4byte	.LASF19
	.byte	0xbf
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x3
	.4byte	.LASF20
	.byte	0xc0
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF21
	.byte	0xc1
	.byte	0x9
	.4byte	0x195
	.byte	0x4
	.byte	0x91
	.byte	0xd0,0xbf,0x7f
	.byte	0x3
	.4byte	.LASF22
	.byte	0xc2
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x3
	.4byte	.LASF23
	.byte	0xc6
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x8
	.4byte	0x70
	.byte	0x8
	.4byte	0x77
	.byte	0xe
	.4byte	0x83
	.4byte	0x1a6
	.byte	0xf
	.4byte	0x5e
	.2byte	0x7ff
	.byte	0
	.byte	0x9
	.4byte	.LASF26
	.byte	0xa3
	.byte	0x5
	.4byte	0x83
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x241
	.byte	0x1
	.string	"str"
	.byte	0xa3
	.byte	0x1c
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x4
	.4byte	.LASF15
	.byte	0xa3
	.byte	0x2d
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x4
	.4byte	.LASF21
	.byte	0xa3
	.byte	0x3a
	.4byte	0x241
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x2
	.string	"i"
	.byte	0xa5
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x2
	.string	"j"
	.byte	0xa5
	.byte	0xc
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2
	.string	"k"
	.byte	0xa5
	.byte	0xf
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x3
	.4byte	.LASF18
	.byte	0xa6
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x3
	.4byte	.LASF19
	.byte	0xa7
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.4byte	.LASF22
	.byte	0xa8
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x8
	.4byte	0x83
	.byte	0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x9a
	.byte	0x6
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x29b
	.byte	0x1
	.string	"str"
	.byte	0x9a
	.byte	0x1c
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.string	"len"
	.byte	0x9a
	.byte	0x25
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1
	.string	"key"
	.byte	0x9a
	.byte	0x2f
	.4byte	0x70
	.byte	0x2
	.byte	0x91
	.byte	0x63
	.byte	0x2
	.string	"i"
	.byte	0x9c
	.byte	0x9
	.4byte	0x83
	.byte	0x2
	.byte	0x91
	.byte	0x7c
	.byte	0
	.byte	0x9
	.4byte	.LASF27
	.byte	0x8d
	.byte	0x8
	.4byte	0x9c
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x321
	.byte	0x1
	.string	"src"
	.byte	0x8d
	.byte	0x1d
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1
	.string	"dst"
	.byte	0x8d
	.byte	0x28
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x4
	.4byte	.LASF28
	.byte	0x8d
	.byte	0x35
	.4byte	0x8a
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x1
	.string	"len"
	.byte	0x8d
	.byte	0x44
	.4byte	0x8a
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x3
	.4byte	.LASF29
	.byte	0x8e
	.byte	0xb
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF30
	.byte	0x8f
	.byte	0xd
	.4byte	0x8a
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x2
	.string	"num"
	.byte	0x90
	.byte	0xc
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x5
	.4byte	.LASF31
	.byte	0x82
	.byte	0x8
	.4byte	0x9c
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x378
	.byte	0x1
	.string	"str"
	.byte	0x82
	.byte	0x1c
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.string	"ch"
	.byte	0x82
	.byte	0x29
	.4byte	0x2e
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x3
	.4byte	.LASF32
	.byte	0x83
	.byte	0xc
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x2
	.string	"p"
	.byte	0x84
	.byte	0x11
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0x5
	.4byte	.LASF33
	.byte	0x76
	.byte	0x7
	.4byte	0x18b
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x3c3
	.byte	0x1
	.string	"str"
	.byte	0x76
	.byte	0x1b
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.string	"ch"
	.byte	0x76
	.byte	0x2e
	.4byte	0x39
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x3
	.4byte	.LASF34
	.byte	0x77
	.byte	0x11
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x5
	.4byte	.LASF35
	.byte	0x6b
	.byte	0x7
	.4byte	0x18b
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x400
	.byte	0x1
	.string	"str"
	.byte	0x6b
	.byte	0x1a
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x1
	.string	"ch"
	.byte	0x6b
	.byte	0x2d
	.4byte	0x39
	.byte	0x2
	.byte	0x91
	.byte	0x77
	.byte	0
	.byte	0x5
	.4byte	.LASF36
	.byte	0x61
	.byte	0x7
	.4byte	0x18b
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x44c
	.byte	0x1
	.string	"dst"
	.byte	0x61
	.byte	0x14
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.string	"src"
	.byte	0x61
	.byte	0x25
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x2
	.string	"str"
	.byte	0x62
	.byte	0xb
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x5
	.4byte	.LASF37
	.byte	0x59
	.byte	0x8
	.4byte	0x65
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x486
	.byte	0x1
	.string	"a"
	.byte	0x59
	.byte	0x1b
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x1
	.string	"b"
	.byte	0x59
	.byte	0x2a
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0x5
	.4byte	.LASF38
	.byte	0x51
	.byte	0x8
	.4byte	0x9c
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x4c2
	.byte	0x1
	.string	"str"
	.byte	0x51
	.byte	0x1b
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2
	.string	"p"
	.byte	0x52
	.byte	0x11
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x5
	.4byte	.LASF39
	.byte	0x49
	.byte	0x7
	.4byte	0x18b
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x50c
	.byte	0x1
	.string	"dst"
	.byte	0x49
	.byte	0x14
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.string	"src"
	.byte	0x49
	.byte	0x25
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x2
	.string	"r"
	.byte	0x4a
	.byte	0xb
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x5
	.4byte	.LASF40
	.byte	0x3d
	.byte	0x8
	.4byte	0x65
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x56e
	.byte	0x1
	.string	"a"
	.byte	0x3d
	.byte	0x1b
	.4byte	0x56e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.string	"b"
	.byte	0x3d
	.byte	0x2a
	.4byte	0x56e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x4
	.4byte	.LASF41
	.byte	0x3d
	.byte	0x34
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x2
	.string	"a_"
	.byte	0x3e
	.byte	0x11
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x2
	.string	"b_"
	.byte	0x3f
	.byte	0x11
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0x8
	.4byte	0x573
	.byte	0x11
	.byte	0x5
	.4byte	.LASF42
	.byte	0x29
	.byte	0x8
	.4byte	0x9c
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x5e8
	.byte	0x1
	.string	"dst"
	.byte	0x29
	.byte	0x16
	.4byte	0x5e8
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1
	.string	"src"
	.byte	0x29
	.byte	0x27
	.4byte	0x56e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x4
	.4byte	.LASF41
	.byte	0x29
	.byte	0x33
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x2
	.string	"tmp"
	.byte	0x2a
	.byte	0xb
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x2
	.string	"s"
	.byte	0x2a
	.byte	0x11
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0x2
	.string	"num"
	.byte	0x2b
	.byte	0xc
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x12
	.byte	0x8
	.byte	0x5
	.4byte	.LASF43
	.byte	0x20
	.byte	0x8
	.4byte	0x9c
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x660
	.byte	0x1
	.string	"dst"
	.byte	0x20
	.byte	0x15
	.4byte	0x5e8
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1
	.string	"src"
	.byte	0x20
	.byte	0x26
	.4byte	0x56e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x4
	.4byte	.LASF41
	.byte	0x20
	.byte	0x32
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x2
	.string	"num"
	.byte	0x21
	.byte	0xc
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x3
	.4byte	.LASF44
	.byte	0x22
	.byte	0xe
	.4byte	0x660
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0x3
	.4byte	.LASF45
	.byte	0x23
	.byte	0x14
	.4byte	0x665
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x8
	.4byte	0x2e
	.byte	0x8
	.4byte	0x39
	.byte	0x9
	.4byte	.LASF46
	.byte	0x17
	.byte	0x8
	.4byte	0x9c
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x6e1
	.byte	0x1
	.string	"dst"
	.byte	0x17
	.byte	0x16
	.4byte	0x5e8
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x4
	.4byte	.LASF47
	.byte	0x17
	.byte	0x20
	.4byte	0x70
	.byte	0x2
	.byte	0x91
	.byte	0x47
	.byte	0x4
	.4byte	.LASF41
	.byte	0x17
	.byte	0x2e
	.4byte	0x9c
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x2
	.string	"num"
	.byte	0x18
	.byte	0xc
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x3
	.4byte	.LASF30
	.byte	0x19
	.byte	0xc
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x3
	.4byte	.LASF44
	.byte	0x1a
	.byte	0xb
	.4byte	0x18b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x13
	.4byte	.LASF48
	.byte	0x1
	.byte	0xf
	.byte	0x8
	.4byte	0x9c
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.string	"dst"
	.byte	0xf
	.byte	0x15
	.4byte	0x5e8
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.4byte	.LASF47
	.byte	0xf
	.byte	0x1f
	.4byte	0xa7
	.byte	0x2
	.byte	0x91
	.byte	0x67
	.byte	0x4
	.4byte	.LASF41
	.byte	0xf
	.byte	0x2d
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x2
	.string	"num"
	.byte	0x10
	.byte	0xc
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x3
	.4byte	.LASF44
	.byte	0x11
	.byte	0xe
	.4byte	0x660
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
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
	.byte	0x6
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
	.byte	0xc
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
	.byte	0xe
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
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
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
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
.LASF11:
	.string	"int64_t"
.LASF21:
	.string	"match_pos"
.LASF13:
	.string	"size_t"
.LASF40:
	.string	"memcmp"
.LASF47:
	.string	"value"
.LASF28:
	.string	"start"
.LASF6:
	.string	"uint64_t"
.LASF35:
	.string	"strchr"
.LASF26:
	.string	"regu_match"
.LASF8:
	.string	"int8_t"
.LASF32:
	.string	"ch_cnt"
.LASF45:
	.string	"src_"
.LASF38:
	.string	"strlen"
.LASF34:
	.string	"last_char"
.LASF2:
	.string	"unsigned char"
.LASF39:
	.string	"strcpy"
.LASF7:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF30:
	.string	"maxl"
.LASF24:
	.string	"regu_replace"
.LASF48:
	.string	"memset"
.LASF27:
	.string	"strslice"
.LASF37:
	.string	"strcmp"
.LASF44:
	.string	"dst_"
.LASF17:
	.string	"max_len"
.LASF23:
	.string	"new_len"
.LASF25:
	.string	"encrypt_decrypt"
.LASF4:
	.string	"unsigned int"
.LASF19:
	.string	"len_pat"
.LASF9:
	.string	"char"
.LASF5:
	.string	"uint8_t"
.LASF18:
	.string	"len_str"
.LASF20:
	.string	"len_rep"
.LASF16:
	.string	"replacement"
.LASF49:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF15:
	.string	"pattern"
.LASF42:
	.string	"memmove"
.LASF36:
	.string	"strcat"
.LASF10:
	.string	"short int"
.LASF14:
	.string	"byte"
.LASF31:
	.string	"strchrs"
.LASF43:
	.string	"memcpy"
.LASF29:
	.string	"sour"
.LASF12:
	.string	"long int"
.LASF46:
	.string	"strmset"
.LASF22:
	.string	"num_match"
.LASF41:
	.string	"size"
.LASF33:
	.string	"strrchr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/oskernel2023-x2w"
.LASF0:
	.string	"lib/string.c"
	.ident	"GCC: (g) 12.2.0"
