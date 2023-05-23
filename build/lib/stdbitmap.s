	.file	"stdbitmap.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "lib/stdbitmap.c"
	.align	2
	.globl	bitmap_init
	.type	bitmap_init, @function
bitmap_init:
.LFB0:
	.file 1 "lib/stdbitmap.c"
	.loc 1 19 50
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 20 20
	ld	a5,8(sp)
	ld	a4,0(sp)
	sd	a4,0(a5)
	.loc 1 21 20
	ld	a5,8(sp)
	ld	a5,8(a5)
	.loc 1 21 5
	ld	a2,0(sp)
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 22 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	bitmap_init, .-bitmap_init
	.align	2
	.globl	bitmap_set
	.type	bitmap_set, @function
bitmap_set:
.LFB1:
	.loc 1 24 66
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a5,a2
	sb	a5,15(sp)
	.loc 1 26 14
	ld	a5,16(sp)
	srai	a4,a5,63
	andi	a4,a4,7
	add	a5,a4,a5
	srai	a5,a5,3
	sd	a5,40(sp)
	.loc 1 28 14
	ld	a4,16(sp)
	srai	a5,a4,63
	srli	a5,a5,61
	add	a4,a4,a5
	andi	a4,a4,7
	sub	a5,a4,a5
	sd	a5,32(sp)
	.loc 1 30 8
	lbu	a5,15(sp)
	andi	a5,a5,0xff
	beq	a5,zero,.L3
	.loc 1 32 17
	ld	a5,24(sp)
	ld	a4,8(a5)
	.loc 1 32 23
	ld	a5,40(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	slliw	a4,a5,24
	sraiw	a4,a4,24
	.loc 1 32 40
	ld	a5,32(sp)
	sext.w	a5,a5
	li	a3,1
	sllw	a5,a3,a5
	sext.w	a5,a5
	.loc 1 32 34
	slliw	a5,a5,24
	sraiw	a5,a5,24
	or	a5,a4,a5
	slliw	a3,a5,24
	sraiw	a3,a3,24
	.loc 1 32 17
	ld	a5,24(sp)
	ld	a4,8(a5)
	.loc 1 32 23
	ld	a5,40(sp)
	add	a5,a4,a5
	.loc 1 32 34
	andi	a4,a3,0xff
	sb	a4,0(a5)
	.loc 1 36 1
	j	.L5
.L3:
	.loc 1 35 17
	ld	a5,24(sp)
	ld	a4,8(a5)
	.loc 1 35 23
	ld	a5,40(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	slliw	a4,a5,24
	sraiw	a4,a4,24
	.loc 1 35 41
	ld	a5,32(sp)
	sext.w	a5,a5
	li	a3,1
	sllw	a5,a3,a5
	sext.w	a5,a5
	.loc 1 35 34
	slliw	a5,a5,24
	sraiw	a5,a5,24
	not	a5,a5
	slliw	a5,a5,24
	sraiw	a5,a5,24
	and	a5,a4,a5
	slliw	a3,a5,24
	sraiw	a3,a3,24
	.loc 1 35 17
	ld	a5,24(sp)
	ld	a4,8(a5)
	.loc 1 35 23
	ld	a5,40(sp)
	add	a5,a4,a5
	.loc 1 35 34
	andi	a4,a3,0xff
	sb	a4,0(a5)
.L5:
	.loc 1 36 1
	nop
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	bitmap_set, .-bitmap_set
	.align	2
	.globl	bitmap_test
	.type	bitmap_test, @function
bitmap_test:
.LFB2:
	.loc 1 38 55
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 40 14
	ld	a5,0(sp)
	sd	a5,24(sp)
	.loc 1 42 14
	sd	zero,16(sp)
	.loc 1 43 21
	ld	a5,8(sp)
	ld	a4,8(a5)
	.loc 1 43 27
	ld	a5,24(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	sext.w	a4,a5
	.loc 1 43 57
	ld	a5,16(sp)
	sext.w	a5,a5
	sraw	a5,a4,a5
	sext.w	a5,a5
	andi	a5,a5,1
	sext.w	a5,a5
	.loc 1 43 70
	snez	a5,a5
	andi	a5,a5,0xff
	.loc 1 44 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	bitmap_test, .-bitmap_test
	.align	2
	.globl	bitmap_scan
	.type	bitmap_scan, @function
bitmap_scan:
.LFB3:
	.loc 1 46 53
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 49 36
	sd	zero,40(sp)
	.loc 1 49 25
	ld	a5,40(sp)
	sd	a5,48(sp)
	.loc 1 49 14
	ld	a5,48(sp)
	sd	a5,56(sp)
	.loc 1 52 11
	j	.L9
.L11:
	.loc 1 53 17
	ld	a5,56(sp)
	addi	a5,a5,1
	sd	a5,56(sp)
.L9:
	.loc 1 52 20
	ld	a5,8(sp)
	ld	a4,8(a5)
	.loc 1 52 26
	ld	a5,56(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 1 52 45
	mv	a4,a5
	li	a5,255
	bne	a4,a5,.L10
	.loc 1 52 67 discriminator 1
	ld	a5,8(sp)
	ld	a4,0(a5)
	.loc 1 52 57 discriminator 1
	ld	a5,56(sp)
	.loc 1 52 45 discriminator 1
	bgtu	a4,a5,.L11
.L10:
	.loc 1 55 29
	ld	a5,8(sp)
	ld	a4,0(a5)
	.loc 1 55 18
	ld	a5,56(sp)
	.loc 1 55 8
	bne	a4,a5,.L14
	.loc 1 56 16
	li	a5,-1
	j	.L13
.L15:
	.loc 1 60 17
	ld	a5,48(sp)
	addi	a5,a5,1
	sd	a5,48(sp)
.L14:
	.loc 1 59 22
	ld	a5,48(sp)
	sext.w	a5,a5
	li	a4,1
	sllw	a5,a4,a5
	sext.w	a5,a5
	.loc 1 59 12
	andi	a4,a5,0xff
	.loc 1 59 45
	ld	a5,8(sp)
	ld	a3,8(a5)
	.loc 1 59 51
	ld	a5,56(sp)
	add	a5,a3,a5
	lbu	a5,0(a5)
	.loc 1 59 12
	and	a5,a4,a5
	andi	a5,a5,0xff
	bne	a5,zero,.L15
	.loc 1 63 25
	ld	a5,56(sp)
	slli	a5,a5,3
	.loc 1 63 14
	ld	a4,48(sp)
	add	a5,a4,a5
	sd	a5,40(sp)
	.loc 1 66 8
	ld	a4,0(sp)
	li	a5,1
	bne	a4,a5,.L16
	.loc 1 67 16
	ld	a5,40(sp)
	j	.L13
.L16:
	.loc 1 70 31
	ld	a5,8(sp)
	ld	a5,0(a5)
	.loc 1 70 38
	slli	a4,a5,3
	.loc 1 70 42
	ld	a5,40(sp)
	.loc 1 70 12
	sub	a5,a4,a5
	sd	a5,32(sp)
	.loc 1 71 14
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,24(sp)
	.loc 1 72 12
	li	a5,1
	sd	a5,16(sp)
	.loc 1 73 14
	li	a5,-1
	sd	a5,40(sp)
	.loc 1 74 11
	j	.L17
.L22:
	.loc 1 75 14
	ld	a1,24(sp)
	ld	a0,8(sp)
	call	bitmap_test
	mv	a5,a0
	.loc 1 75 12
	bne	a5,zero,.L18
	.loc 1 76 23
	ld	a5,16(sp)
	addi	a5,a5,1
	sd	a5,16(sp)
	j	.L19
.L18:
	.loc 1 78 24
	sd	zero,16(sp)
.L19:
	.loc 1 80 12
	ld	a4,16(sp)
	ld	a5,0(sp)
	bne	a4,a5,.L20
	.loc 1 81 33
	ld	a4,24(sp)
	ld	a5,0(sp)
	sub	a5,a4,a5
	.loc 1 81 39
	addi	a5,a5,1
	.loc 1 81 22
	sd	a5,40(sp)
	.loc 1 82 13
	j	.L21
.L20:
	.loc 1 84 17
	ld	a5,24(sp)
	addi	a5,a5,1
	sd	a5,24(sp)
.L17:
	.loc 1 74 20
	ld	a5,32(sp)
	addi	a4,a5,-1
	sd	a4,32(sp)
	.loc 1 74 23
	bne	a5,zero,.L22
.L21:
	.loc 1 86 12
	ld	a5,40(sp)
.L13:
	.loc 1 87 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	bitmap_scan, .-bitmap_scan
	.align	2
	.globl	bitmap_acquire
	.type	bitmap_acquire, @function
bitmap_acquire:
.LFB4:
	.loc 1 89 68
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
	.loc 1 90 12
	sd	zero,40(sp)
	.loc 1 91 14
	sd	zero,32(sp)
	.loc 1 92 11
	j	.L24
.L26:
	.loc 1 93 20
	li	a1,1
	ld	a0,24(sp)
	call	bitmap_scan
	sd	a0,32(sp)
	.loc 1 94 12
	ld	a5,40(sp)
	slli	a5,a5,3
	ld	a4,16(sp)
	add	a5,a4,a5
	.loc 1 94 16
	ld	a4,32(sp)
	sd	a4,0(a5)
.L24:
	.loc 1 92 27
	ld	a4,32(sp)
	li	a5,-1
	beq	a4,a5,.L25
	.loc 1 92 31 discriminator 1
	ld	a5,40(sp)
	addi	a4,a5,1
	sd	a4,40(sp)
	.loc 1 92 27 discriminator 1
	ld	a4,8(sp)
	bgtu	a4,a5,.L26
.L25:
	.loc 1 97 8
	ld	a4,32(sp)
	li	a5,-1
	bne	a4,a5,.L27
	.loc 1 98 15
	j	.L28
.L33:
	.loc 1 99 16
	ld	a5,40(sp)
	slli	a5,a5,3
	ld	a4,16(sp)
	add	a5,a4,a5
	.loc 1 99 20
	li	a4,-1
	sd	a4,0(a5)
.L28:
	.loc 1 98 17
	ld	a5,40(sp)
	addi	a5,a5,-1
	sd	a5,40(sp)
	j	.L33
.L27:
	.loc 1 103 12
	sd	zero,40(sp)
	.loc 1 103 5
	j	.L30
.L31:
	.loc 1 104 33 discriminator 3
	ld	a5,40(sp)
	slli	a5,a5,3
	ld	a4,16(sp)
	add	a5,a4,a5
	.loc 1 104 9 discriminator 3
	ld	a5,0(a5)
	li	a2,1
	mv	a1,a5
	ld	a0,24(sp)
	call	bitmap_set
	.loc 1 103 27 discriminator 3
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,40(sp)
.L30:
	.loc 1 103 19 discriminator 1
	ld	a4,40(sp)
	ld	a5,8(sp)
	bltu	a4,a5,.L31
	.loc 1 105 12
	li	a5,1
	.loc 1 106 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	bitmap_acquire, .-bitmap_acquire
	.align	2
	.globl	bitmap_release
	.type	bitmap_release, @function
bitmap_release:
.LFB5:
	.loc 1 108 67
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	sd	a2,8(sp)
.LBB2:
	.loc 1 109 17
	sd	zero,40(sp)
	.loc 1 109 5
	j	.L35
.L36:
	.loc 1 110 32 discriminator 3
	ld	a5,40(sp)
	slli	a5,a5,3
	ld	a4,16(sp)
	add	a5,a4,a5
	.loc 1 110 9 discriminator 3
	ld	a5,0(a5)
	li	a2,0
	mv	a1,a5
	ld	a0,24(sp)
	call	bitmap_set
	.loc 1 109 34 discriminator 3
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,40(sp)
.L35:
	.loc 1 109 26 discriminator 1
	ld	a4,40(sp)
	ld	a5,8(sp)
	bltu	a4,a5,.L36
.LBE2:
	.loc 1 111 1
	nop
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	bitmap_release, .-bitmap_release
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/stdbitmap.h"
	.file 4 "include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x38c
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xc
	.4byte	.LASF35
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x17
	.byte	0x17
	.4byte	0x3a
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x1a
	.byte	0x17
	.4byte	0x5b
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.byte	0xd
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x20
	.byte	0xe
	.4byte	0x83
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x23
	.byte	0x17
	.4byte	0x3a
	.byte	0xe
	.byte	0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x2
	.byte	0x24
	.byte	0x6
	.4byte	0xb1
	.byte	0x8
	.4byte	.LASF13
	.byte	0
	.byte	0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x2a
	.byte	0x12
	.4byte	0x4f
	.byte	0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0x30
	.byte	0x11
	.4byte	0x77
	.byte	0xf
	.4byte	.LASF36
	.byte	0x10
	.byte	0x3
	.byte	0x1d
	.byte	0x10
	.4byte	0xfb
	.byte	0x9
	.4byte	.LASF18
	.byte	0x1f
	.byte	0xc
	.4byte	0xb1
	.byte	0
	.byte	0x9
	.4byte	.LASF19
	.byte	0x21
	.byte	0xb
	.4byte	0xfb
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0xbd
	.byte	0x3
	.4byte	.LASF20
	.byte	0x3
	.byte	0x22
	.byte	0x3
	.4byte	0xd5
	.byte	0x10
	.4byte	.LASF37
	.byte	0x4
	.byte	0x20
	.byte	0x8
	.4byte	0xb1
	.4byte	0x12c
	.byte	0x7
	.4byte	0x12c
	.byte	0x7
	.4byte	0xbd
	.byte	0x7
	.4byte	0xb1
	.byte	0
	.byte	0x11
	.byte	0x8
	.byte	0x12
	.4byte	.LASF32
	.byte	0x1
	.byte	0x6c
	.byte	0x6
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x194
	.byte	0x2
	.4byte	.LASF21
	.byte	0x6c
	.byte	0x1f
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.string	"in"
	.byte	0x6c
	.byte	0x32
	.4byte	0x199
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x5
	.string	"cnt"
	.byte	0x6c
	.byte	0x3f
	.4byte	0xb1
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x13
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xa
	.string	"i"
	.byte	0x6d
	.byte	0x11
	.4byte	0xb1
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x6
	.4byte	0x100
	.byte	0x6
	.4byte	0xc9
	.byte	0xb
	.4byte	.LASF23
	.byte	0x59
	.byte	0x6
	.4byte	0x8a
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x204
	.byte	0x2
	.4byte	.LASF21
	.byte	0x59
	.byte	0x1f
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x5
	.string	"out"
	.byte	0x59
	.byte	0x32
	.4byte	0x199
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x5
	.string	"cnt"
	.byte	0x59
	.byte	0x40
	.4byte	0xb1
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xa
	.string	"i"
	.byte	0x5a
	.byte	0xc
	.4byte	0xb1
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF22
	.byte	0x5b
	.byte	0xe
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xb
	.4byte	.LASF24
	.byte	0x2e
	.byte	0xa
	.4byte	0xc9
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x298
	.byte	0x2
	.4byte	.LASF21
	.byte	0x2e
	.byte	0x20
	.4byte	0x194
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x5
	.string	"cnt"
	.byte	0x2e
	.byte	0x31
	.4byte	0xb1
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x1
	.4byte	.LASF25
	.byte	0x30
	.byte	0xe
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF26
	.byte	0x30
	.byte	0x18
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1
	.4byte	.LASF22
	.byte	0x30
	.byte	0x22
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1
	.4byte	.LASF27
	.byte	0x46
	.byte	0xc
	.4byte	0xb1
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x1
	.4byte	.LASF28
	.byte	0x47
	.byte	0xe
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x1
	.4byte	.LASF29
	.byte	0x48
	.byte	0xc
	.4byte	0xb1
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0x14
	.4byte	.LASF30
	.byte	0x1
	.byte	0x26
	.byte	0x6
	.4byte	0x8a
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x2f3
	.byte	0x2
	.4byte	.LASF21
	.byte	0x26
	.byte	0x1c
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2
	.4byte	.LASF31
	.byte	0x26
	.byte	0x2f
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x1
	.4byte	.LASF25
	.byte	0x28
	.byte	0xe
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x1
	.4byte	.LASF26
	.byte	0x2a
	.byte	0xe
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0x15
	.4byte	.LASF33
	.byte	0x1
	.byte	0x18
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x358
	.byte	0x2
	.4byte	.LASF21
	.byte	0x18
	.byte	0x1b
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2
	.4byte	.LASF31
	.byte	0x18
	.byte	0x2e
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x2
	.4byte	.LASF34
	.byte	0x18
	.byte	0x3c
	.4byte	0x8a
	.byte	0x2
	.byte	0x91
	.byte	0x5f
	.byte	0x1
	.4byte	.LASF25
	.byte	0x1a
	.byte	0xe
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x1
	.4byte	.LASF26
	.byte	0x1c
	.byte	0xe
	.4byte	0xc9
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0x16
	.4byte	.LASF38
	.byte	0x1
	.byte	0x13
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x2
	.4byte	.LASF21
	.byte	0x13
	.byte	0x1c
	.4byte	0x194
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x2
	.4byte	.LASF18
	.byte	0x13
	.byte	0x2d
	.4byte	0xb1
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xf
	.byte	0
	.byte	0xb
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
	.byte	0x15
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
	.byte	0x16
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
.LASF10:
	.string	"int64_t"
.LASF23:
	.string	"bitmap_acquire"
.LASF15:
	.string	"size_t"
.LASF30:
	.string	"bitmap_test"
.LASF6:
	.string	"uint64_t"
.LASF25:
	.string	"byte_idx"
.LASF28:
	.string	"next_bit"
.LASF2:
	.string	"unsigned char"
.LASF14:
	.string	"True"
.LASF12:
	.string	"Bool"
.LASF7:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF21:
	.string	"btmp_ptr"
.LASF26:
	.string	"rbit_idx"
.LASF37:
	.string	"memset"
.LASF13:
	.string	"False"
.LASF17:
	.string	"offset_t"
.LASF4:
	.string	"unsigned int"
.LASF31:
	.string	"bit_idx"
.LASF8:
	.string	"char"
.LASF5:
	.string	"uint8_t"
.LASF38:
	.string	"bitmap_init"
.LASF22:
	.string	"gbit_idx"
.LASF24:
	.string	"bitmap_scan"
.LASF35:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF36:
	.string	"__bitmap_t"
.LASF19:
	.string	"bits"
.LASF9:
	.string	"short int"
.LASF16:
	.string	"byte"
.LASF32:
	.string	"bitmap_release"
.LASF11:
	.string	"long int"
.LASF33:
	.string	"bitmap_set"
.LASF34:
	.string	"taken"
.LASF29:
	.string	"found_bits"
.LASF18:
	.string	"size"
.LASF20:
	.string	"bitmap_t"
.LASF27:
	.string	"num_bits"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"lib/stdbitmap.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
