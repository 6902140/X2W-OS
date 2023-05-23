	.file	"stdlist.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "lib/stdlist.c"
	.align	2
	.globl	list_init
	.type	list_init, @function
list_init:
.LFB0:
	.file 1 "lib/stdlist.c"
	.loc 1 15 33
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 1 16 25
	ld	a5,8(sp)
	sd	zero,0(a5)
	.loc 1 17 27
	ld	a5,8(sp)
	addi	a4,a5,16
	.loc 1 17 25
	ld	a5,8(sp)
	sd	a4,8(a5)
	.loc 1 18 27
	ld	a4,8(sp)
	.loc 1 18 25
	ld	a5,8(sp)
	sd	a4,16(a5)
	.loc 1 19 25
	ld	a5,8(sp)
	sd	zero,24(a5)
	.loc 1 20 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	list_init, .-list_init
	.align	2
	.globl	list_insert
	.type	list_insert, @function
list_insert:
.LFB1:
	.loc 1 22 64
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 24 15
	ld	a5,8(sp)
	ld	a5,0(a5)
	.loc 1 24 28
	ld	a4,0(sp)
	sd	a4,8(a5)
	.loc 1 25 31
	ld	a5,8(sp)
	ld	a4,0(a5)
	.loc 1 25 19
	ld	a5,0(sp)
	sd	a4,0(a5)
	.loc 1 26 19
	ld	a5,0(sp)
	ld	a4,8(sp)
	sd	a4,8(a5)
	.loc 1 27 22
	ld	a5,8(sp)
	ld	a4,0(sp)
	sd	a4,0(a5)
	.loc 1 28 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	list_insert, .-list_insert
	.align	2
	.globl	list_append
	.type	list_append, @function
list_append:
.LFB2:
	.loc 1 30 58
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 32 5
	ld	a5,0(sp)
	addi	a5,a5,16
	ld	a1,8(sp)
	mv	a0,a5
	call	list_insert
	.loc 1 33 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	list_append, .-list_append
	.align	2
	.globl	list_remove
	.type	list_remove, @function
list_remove:
.LFB3:
	.loc 1 35 40
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 1 38 13
	ld	a5,8(sp)
	ld	a5,0(a5)
	.loc 1 38 36
	ld	a4,8(sp)
	ld	a4,8(a4)
	.loc 1 38 26
	sd	a4,8(a5)
	.loc 1 39 13
	ld	a5,8(sp)
	ld	a5,8(a5)
	.loc 1 39 36
	ld	a4,8(sp)
	ld	a4,0(a4)
	.loc 1 39 26
	sd	a4,0(a5)
	.loc 1 40 1
	nop
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	list_remove, .-list_remove
	.align	2
	.globl	list_push
	.type	list_push, @function
list_push:
.LFB4:
	.loc 1 42 56
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 44 31
	ld	a5,0(sp)
	ld	a5,8(a5)
	.loc 1 44 5
	ld	a1,8(sp)
	mv	a0,a5
	call	list_insert
	.loc 1 45 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	list_push, .-list_push
	.align	2
	.globl	list_pop
	.type	list_pop, @function
list_pop:
.LFB5:
	.loc 1 47 40
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 1 48 18
	ld	a5,8(sp)
	ld	a5,8(a5)
	sd	a5,24(sp)
	.loc 1 49 31
	ld	a5,8(sp)
	ld	a5,8(a5)
	.loc 1 49 5
	mv	a0,a5
	call	list_remove
	.loc 1 50 12
	ld	a5,24(sp)
	.loc 1 51 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	list_pop, .-list_pop
	.align	2
	.globl	list_empty
	.type	list_empty, @function
list_empty:
.LFB6:
	.loc 1 53 34
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 1 54 26
	ld	a5,8(sp)
	ld	a4,8(a5)
	.loc 1 54 35
	ld	a5,8(sp)
	addi	a5,a5,16
	.loc 1 54 58
	sub	a5,a4,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	.loc 1 55 1
	mv	a0,a5
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	list_empty, .-list_empty
	.align	2
	.globl	list_size
	.type	list_size, @function
list_size:
.LFB7:
	.loc 1 57 35
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	.loc 1 58 12
	sd	zero,24(sp)
	.loc 1 59 18
	ld	a5,8(sp)
	ld	a5,8(a5)
	sd	a5,16(sp)
	.loc 1 60 11
	j	.L11
.L12:
	.loc 1 61 21
	ld	a5,16(sp)
	ld	a5,8(a5)
	sd	a5,16(sp)
	.loc 1 62 13
	ld	a5,24(sp)
	addi	a5,a5,1
	sd	a5,24(sp)
.L11:
	.loc 1 60 23
	ld	a5,16(sp)
	ld	a4,8(a5)
	.loc 1 60 33
	ld	a5,8(sp)
	addi	a5,a5,16
	.loc 1 60 30
	bne	a4,a5,.L12
	.loc 1 64 17
	ld	a5,24(sp)
	addi	a5,a5,-1
	.loc 1 65 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	list_size, .-list_size
	.align	2
	.globl	list_search
	.type	list_search, @function
list_search:
.LFB8:
	.loc 1 67 58
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 1 68 18
	ld	a5,0(sp)
	ld	a5,8(a5)
	sd	a5,24(sp)
	.loc 1 69 11
	j	.L15
.L19:
	.loc 1 70 12
	ld	a4,24(sp)
	ld	a5,8(sp)
	bne	a4,a5,.L16
	.loc 1 71 20
	li	a5,1
	j	.L17
.L16:
	.loc 1 72 21
	ld	a5,24(sp)
	ld	a5,8(a5)
	sd	a5,24(sp)
.L15:
	.loc 1 69 27
	ld	a5,0(sp)
	addi	a5,a5,16
	.loc 1 69 43
	ld	a4,24(sp)
	beq	a4,a5,.L18
	.loc 1 69 43 is_stmt 0 discriminator 1
	ld	a5,24(sp)
	bne	a5,zero,.L19
.L18:
	.loc 1 74 12 is_stmt 1
	li	a5,0
.L17:
	.loc 1 75 1
	mv	a0,a5
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	list_search, .-list_search
	.align	2
	.globl	list_walking
	.type	list_walking, @function
list_walking:
.LFB9:
	.loc 1 77 79
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	.cfi_offset 1, -8
	sd	a0,24(sp)
	sd	a1,16(sp)
	mv	a5,a2
	sw	a5,12(sp)
	.loc 1 78 18
	ld	a5,24(sp)
	ld	a5,8(a5)
	sd	a5,40(sp)
	.loc 1 79 9
	ld	a0,24(sp)
	call	list_empty
	mv	a5,a0
	.loc 1 79 8
	beq	a5,zero,.L23
	.loc 1 80 16
	li	a5,0
	j	.L22
.L25:
	.loc 1 82 13
	lw	a4,12(sp)
	ld	a5,16(sp)
	mv	a1,a4
	ld	a0,40(sp)
	jalr	a5
.LVL0:
	mv	a5,a0
	.loc 1 82 12
	beq	a5,zero,.L24
	.loc 1 83 20
	ld	a5,40(sp)
	j	.L22
.L24:
	.loc 1 84 21
	ld	a5,40(sp)
	ld	a5,8(a5)
	sd	a5,40(sp)
.L23:
	.loc 1 81 27
	ld	a5,24(sp)
	addi	a5,a5,16
	.loc 1 81 24
	ld	a4,40(sp)
	bne	a4,a5,.L25
	.loc 1 86 12
	li	a5,0
.L22:
	.loc 1 87 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	list_walking, .-list_walking
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/stdlist.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x394
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xe
	.4byte	.LASF40
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
	.byte	0x3
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
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x23
	.byte	0x17
	.4byte	0x2e
	.byte	0x10
	.byte	0x7
	.byte	0x4
	.4byte	0x3c
	.byte	0x2
	.byte	0x24
	.byte	0x6
	.4byte	0x99
	.byte	0x8
	.4byte	.LASF11
	.byte	0
	.byte	0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0
	.byte	0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x2a
	.byte	0x12
	.4byte	0x43
	.byte	0x9
	.4byte	.LASF17
	.byte	0x10
	.byte	0x19
	.4byte	0xc9
	.byte	0x5
	.4byte	.LASF14
	.byte	0x1b
	.byte	0x1b
	.4byte	0xc9
	.byte	0
	.byte	0x5
	.4byte	.LASF15
	.byte	0x1d
	.byte	0x1b
	.4byte	0xc9
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	0xa5
	.byte	0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x1e
	.byte	0x3
	.4byte	0xa5
	.byte	0x9
	.4byte	.LASF18
	.byte	0x20
	.byte	0x23
	.4byte	0xfe
	.byte	0x5
	.4byte	.LASF19
	.byte	0x25
	.byte	0x11
	.4byte	0xce
	.byte	0
	.byte	0x5
	.4byte	.LASF20
	.byte	0x27
	.byte	0x11
	.4byte	0xce
	.byte	0x10
	.byte	0
	.byte	0x3
	.4byte	.LASF21
	.byte	0x3
	.byte	0x28
	.byte	0x3
	.4byte	0xda
	.byte	0x3
	.4byte	.LASF22
	.byte	0x3
	.byte	0x30
	.byte	0xf
	.4byte	0x116
	.byte	0x11
	.4byte	0x72
	.4byte	0x12a
	.byte	0xa
	.4byte	0x12a
	.byte	0xa
	.4byte	0x64
	.byte	0
	.byte	0x6
	.4byte	0xce
	.byte	0xb
	.4byte	.LASF25
	.byte	0x4d
	.4byte	0x12a
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x189
	.byte	0x1
	.4byte	.LASF23
	.byte	0x4d
	.byte	0x23
	.4byte	0x189
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x1
	.4byte	.LASF24
	.byte	0x4d
	.byte	0x41
	.4byte	0x18e
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x12
	.string	"arg"
	.byte	0x1
	.byte	0x4d
	.byte	0x4b
	.4byte	0x64
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x4
	.4byte	.LASF28
	.byte	0x4e
	.byte	0x12
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x6
	.4byte	0xfe
	.byte	0x6
	.4byte	0x10a
	.byte	0x7
	.4byte	.LASF26
	.byte	0x43
	.byte	0x6
	.4byte	0x72
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x1df
	.byte	0x1
	.4byte	.LASF27
	.byte	0x43
	.byte	0x1f
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF23
	.byte	0x43
	.byte	0x31
	.4byte	0x189
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x4
	.4byte	.LASF28
	.byte	0x44
	.byte	0x12
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x7
	.4byte	.LASF29
	.byte	0x39
	.byte	0x8
	.4byte	0x99
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x22b
	.byte	0x1
	.4byte	.LASF23
	.byte	0x39
	.byte	0x1a
	.4byte	0x189
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.4byte	.LASF30
	.byte	0x3a
	.byte	0xc
	.4byte	0x99
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x4
	.4byte	.LASF28
	.byte	0x3b
	.byte	0x12
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0x7
	.4byte	.LASF31
	.byte	0x35
	.byte	0x6
	.4byte	0x72
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x25b
	.byte	0x1
	.4byte	.LASF23
	.byte	0x35
	.byte	0x19
	.4byte	0x189
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0xb
	.4byte	.LASF32
	.byte	0x2f
	.4byte	0x12a
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x298
	.byte	0x1
	.4byte	.LASF23
	.byte	0x2f
	.byte	0x1f
	.4byte	0x189
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.4byte	.LASF33
	.byte	0x30
	.byte	0x12
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xc
	.4byte	.LASF34
	.byte	0x2a
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x2d1
	.byte	0x1
	.4byte	.LASF27
	.byte	0x2a
	.byte	0x1d
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF23
	.byte	0x2a
	.byte	0x2f
	.4byte	0x189
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xd
	.4byte	.LASF35
	.byte	0x23
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x2fc
	.byte	0x1
	.4byte	.LASF27
	.byte	0x23
	.byte	0x1f
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0xc
	.4byte	.LASF36
	.byte	0x1e
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x335
	.byte	0x1
	.4byte	.LASF27
	.byte	0x1e
	.byte	0x1f
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.4byte	.LASF23
	.byte	0x1e
	.byte	0x31
	.4byte	0x189
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xd
	.4byte	.LASF37
	.byte	0x16
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x36e
	.byte	0x1
	.4byte	.LASF38
	.byte	0x16
	.byte	0x1f
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x1
	.4byte	.LASF39
	.byte	0x16
	.byte	0x38
	.4byte	0x12a
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0x13
	.4byte	.LASF41
	.byte	0x1
	.byte	0xf
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.4byte	.LASF23
	.byte	0xf
	.byte	0x18
	.4byte	0x189
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x5
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
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
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
	.byte	0xa
	.byte	0x5
	.byte	0
	.byte	0x49
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
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0xe
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
	.byte	0xd
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
	.byte	0x7a
	.byte	0x19
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
	.byte	0x10
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
	.byte	0x11
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
.LASF36:
	.string	"list_append"
.LASF13:
	.string	"size_t"
.LASF15:
	.string	"next"
.LASF23:
	.string	"list_ptr"
.LASF25:
	.string	"list_walking"
.LASF38:
	.string	"before_ptr"
.LASF9:
	.string	"uint64_t"
.LASF31:
	.string	"list_empty"
.LASF2:
	.string	"unsigned char"
.LASF18:
	.string	"__list_t"
.LASF12:
	.string	"True"
.LASF10:
	.string	"Bool"
.LASF5:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF41:
	.string	"list_init"
.LASF32:
	.string	"list_pop"
.LASF11:
	.string	"False"
.LASF34:
	.string	"list_push"
.LASF24:
	.string	"func"
.LASF19:
	.string	"head"
.LASF21:
	.string	"list_t"
.LASF22:
	.string	"list_walking_func_t"
.LASF37:
	.string	"list_insert"
.LASF27:
	.string	"elem_ptr"
.LASF4:
	.string	"unsigned int"
.LASF6:
	.string	"char"
.LASF26:
	.string	"list_search"
.LASF29:
	.string	"list_size"
.LASF40:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF35:
	.string	"list_remove"
.LASF17:
	.string	"__list_elem_t"
.LASF7:
	.string	"short int"
.LASF20:
	.string	"tail"
.LASF8:
	.string	"long int"
.LASF39:
	.string	"add_ptr"
.LASF28:
	.string	"walking_ptr"
.LASF30:
	.string	"size"
.LASF16:
	.string	"list_elem_t"
.LASF14:
	.string	"prev"
.LASF33:
	.string	"deleted_ptr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"lib/stdlist.c"
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
	.ident	"GCC: (g) 12.2.0"
