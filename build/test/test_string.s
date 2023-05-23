	.file	"test_string.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/lighthouse/xzr/X2W-OS" "test/test_string.c"
	.section	.rodata
	.align	3
.LC0:
	.string	"=> "
	.align	3
.LC1:
	.string	": \n"
	.align	3
.LC4:
	.string	"ffffffffffffffffffffffff"
	.string	""
	.align	3
.LC5:
	.string	"tttttttttttttttttttttttt"
	.string	""
	.align	3
.LC6:
	.string	"\ttest memset within bound:%s:return val=%d;\n"
	.align	3
.LC7:
	.string	"\ttest memcpy within bound%s;no return val\n"
	.align	3
.LC8:
	.string	"\ttest memcmp within bound%d\n"
	.align	3
.LC9:
	.string	"\ttest strcpy wthin bound %s;\n"
	.align	3
.LC10:
	.string	"abbbbbbbbbd"
	.align	3
.LC11:
	.string	"abbbbbbbbbc"
	.align	3
.LC12:
	.string	"\ttest memcmp,return num:%d \n"
	.align	3
.LC13:
	.string	"\ttest strcat:%s\n"
	.align	3
.LC14:
	.string	"abbc"
	.align	3
.LC15:
	.string	"\ttest strchr:%s\n"
	.align	3
.LC16:
	.string	"abbc"
	.string	""
	.align	3
.LC17:
	.string	"\ttest strrchr:%s\n"
	.align	3
.LC18:
	.string	"abbbbc"
	.align	3
.LC19:
	.string	"\ttest strchrs:%d\n"
	.align	3
.LC20:
	.string	"#############################3333333########"
	.string	""
	.align	3
.LC21:
	.string	"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	.string	""
	.align	3
.LC22:
	.string	""
	.string	""
	.align	3
.LC23:
	.string	"\ttest strmset within bound:%s:return val=%d;\n"
	.align	3
.LC24:
	.string	"\ttest strmset out of bound:%s:return val=%d;\n"
	.align	3
.LC25:
	.string	"\ttest strslice within bound:%s:return val=%d;\n"
	.align	3
.LC26:
	.string	"\ttest encrypt_decrypt in coding thr string : after coding:%s\n"
	.align	3
.LC27:
	.string	"\ttest encrypt_decrypt in break-coding thr string : after break-coding:%s\n"
	.align	3
.LC28:
	.string	"abcmmm"
	.align	3
.LC29:
	.string	"def\n"
	.align	3
.LC30:
	.string	"\ttest memmove ,return value: %d\n"
	.align	3
.LC2:
	.string	"123456789qwertyuiop@#$$&*())"
	.string	""
	.align	3
.LC3:
	.string	"eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
	.string	""
	.text
	.align	2
	.globl	test_string
	.type	test_string, @function
test_string:
.LFB8:
	.file 1 "test/test_string.c"
	.loc 1 18 22
	.cfi_startproc
	addi	sp,sp,-2032
	.cfi_def_cfa_offset 2032
	sd	ra,2024(sp)
	sd	s0,2016(sp)
	sd	s1,2008(sp)
	addi	sp,sp,-128
	.cfi_def_cfa_offset 2160
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	.loc 1 19 5
	lla	a0,.LC0
	call	uart_puts
	.loc 1 19 23
	lla	a0,__func__.0
	call	uart_puts
	.loc 1 19 44
	lla	a0,.LC1
	call	uart_puts
	.loc 1 20 10
	lla	a4,.LC2
	addi	a5,sp,1032
	mv	a3,a4
	li	a4,30
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	memcpy
	addi	a5,sp,1062
	li	a4,994
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 21 10
	li	a5,-4096
	li	s1,4096
	addi	a4,s1,-1968
	add	a4,a4,a5
	add	s0,a4,sp
	lla	a4,.LC3
	addi	a5,s0,1976
	mv	a3,a4
	li	a4,44
	mv	a2,a4
	mv	a1,a3
	mv	a0,a5
	call	memcpy
	addi	a5,s0,2020
	li	a4,980
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 22 11
	lla	a5,.LC4
	mv	s0,s1
	addi	a4,s0,-1976
	add	a4,a4,sp
	sd	a5,0(a4)
	.loc 1 23 11
	lla	a5,.LC5
	addi	a4,s0,-1984
	add	a4,a4,sp
	sd	a5,0(a4)
	.loc 1 26 8
	addi	a5,sp,1032
	li	a2,19
	li	a1,64
	mv	a0,a5
	call	memset
	addi	a5,s0,-1992
	add	a5,a5,sp
	sd	a0,0(a5)
	.loc 1 27 5
	addi	a5,sp,1032
	addi	a4,s0,-1992
	add	a4,a4,sp
	ld	a2,0(a4)
	mv	a1,a5
	lla	a0,.LC6
	call	kprintf
	.loc 1 28 16
	addi	a5,sp,1032
	mv	a0,a5
	call	strlen
	mv	a5,a0
	.loc 1 28 5
	srli	a3,a5,1
	addi	a4,sp,1032
	li	a5,-4096
	addi	a5,a5,1976
	addi	a2,s0,-1968
	add	a2,a2,a5
	add	a5,a2,sp
	mv	a2,a3
	mv	a1,a4
	mv	a0,a5
	call	memcpy
	.loc 1 29 5
	li	a5,-4096
	addi	a5,a5,1976
	addi	a4,s0,-1968
	add	a4,a4,a5
	add	a5,a4,sp
	mv	a1,a5
	lla	a0,.LC7
	call	kprintf
	.loc 1 30 46
	li	a5,-4096
	addi	a5,a5,1976
	addi	a4,s0,-1968
	add	a4,a4,a5
	add	a4,a4,sp
	addi	a5,sp,1032
	li	a2,20
	mv	a1,a4
	mv	a0,a5
	call	memcmp
	mv	a5,a0
	.loc 1 30 5
	sext.w	a5,a5
	mv	a1,a5
	lla	a0,.LC8
	call	kprintf
	.loc 1 31 5
	li	a5,-4096
	addi	a5,a5,1976
	addi	a4,s0,-1968
	add	a4,a4,a5
	add	a4,a4,sp
	addi	a5,sp,1032
	mv	a1,a4
	mv	a0,a5
	call	strcpy
	mv	a5,a0
	mv	a1,a5
	lla	a0,.LC9
	call	kprintf
	.loc 1 32 20
	li	a2,6
	lla	a1,.LC10
	lla	a0,.LC11
	call	memcmp
	mv	a5,a0
	addi	a4,s0,-1993
	add	a4,a4,sp
	sb	a5,0(a4)
	.loc 1 33 5
	addi	a5,s0,-1993
	add	a5,a5,sp
	lbu	a5,0(a5)
	sext.w	a5,a5
	mv	a1,a5
	lla	a0,.LC12
	call	kprintf
	.loc 1 34 5
	addi	a5,s0,-1984
	add	a5,a5,sp
	ld	a1,0(a5)
	addi	a5,s0,-1976
	add	a5,a5,sp
	ld	a0,0(a5)
	call	strcat
	.loc 1 35 5
	addi	a5,s0,-1976
	add	a5,a5,sp
	ld	a1,0(a5)
	lla	a0,.LC13
	call	kprintf
	.loc 1 37 5
	li	a1,98
	lla	a0,.LC14
	call	strchr
	mv	a5,a0
	mv	a1,a5
	lla	a0,.LC15
	call	kprintf
	.loc 1 39 5
	li	a1,98
	lla	a0,.LC16
	call	strrchr
	mv	a5,a0
	mv	a1,a5
	lla	a0,.LC17
	call	kprintf
	.loc 1 41 20
	li	a1,98
	lla	a0,.LC18
	call	strchrs
	addi	a5,s0,-2008
	add	a5,a5,sp
	sd	a0,0(a5)
	.loc 1 42 5
	addi	a5,s0,-2008
	add	a5,a5,sp
	ld	a1,0(a5)
	lla	a0,.LC19
	call	kprintf
	.loc 1 45 11
	lla	a5,.LC20
	mv	a4,s0
	addi	a3,a4,-2016
	add	a3,a3,sp
	sd	a5,0(a3)
	.loc 1 46 11
	lla	a5,.LC21
	addi	a3,a4,-2024
	add	a3,a3,sp
	sd	a5,0(a3)
	.loc 1 47 11
	lla	a5,.LC22
	mv	s0,a4
	addi	a4,s0,-2032
	add	a4,a4,sp
	sd	a5,0(a4)
	.loc 1 48 8
	li	a2,10
	li	a1,36
	addi	a5,s0,-2016
	add	a5,a5,sp
	ld	a0,0(a5)
	call	strmset
	addi	a5,s0,-1992
	add	a5,a5,sp
	sd	a0,0(a5)
	.loc 1 49 5
	addi	a5,s0,-1992
	add	a5,a5,sp
	ld	a2,0(a5)
	addi	a5,s0,-2016
	add	a5,a5,sp
	ld	a1,0(a5)
	lla	a0,.LC23
	call	kprintf
	.loc 1 50 8
	li	a5,8192
	addi	a2,a5,1808
	li	a1,36
	addi	a5,s0,-2024
	add	a5,a5,sp
	ld	a0,0(a5)
	call	strmset
	addi	a5,s0,-1992
	add	a5,a5,sp
	sd	a0,0(a5)
	.loc 1 51 5
	addi	a5,s0,-1992
	add	a5,a5,sp
	ld	a2,0(a5)
	addi	a5,s0,-2016
	add	a5,a5,sp
	ld	a1,0(a5)
	lla	a0,.LC24
	call	kprintf
	.loc 1 52 8
	li	a2,10
	li	a1,64
	addi	a5,s0,-2016
	add	a5,a5,sp
	ld	a0,0(a5)
	call	strmset
	addi	a5,s0,-1992
	add	a5,a5,sp
	sd	a0,0(a5)
	.loc 1 53 8
	li	a3,20
	li	a2,3
	addi	a5,s0,-2032
	add	a5,a5,sp
	ld	a1,0(a5)
	addi	a5,s0,-2016
	add	a5,a5,sp
	ld	a0,0(a5)
	call	strslice
	addi	a5,s0,-1992
	add	a5,a5,sp
	sd	a0,0(a5)
	.loc 1 54 5
	addi	a5,s0,-1992
	add	a5,a5,sp
	ld	a2,0(a5)
	addi	a5,s0,-2032
	add	a5,a5,sp
	ld	a1,0(a5)
	lla	a0,.LC25
	call	kprintf
	.loc 1 55 8
	li	a5,200704
	addi	a3,a5,-704
	li	a2,3
	addi	a5,s0,-2032
	add	a5,a5,sp
	ld	a1,0(a5)
	addi	a5,s0,-2016
	add	a5,a5,sp
	ld	a0,0(a5)
	call	strslice
	addi	a5,s0,-1992
	add	a5,a5,sp
	sd	a0,0(a5)
	.loc 1 56 5
	addi	a5,s0,-1992
	add	a5,a5,sp
	ld	a2,0(a5)
	addi	a5,s0,-2032
	add	a5,a5,sp
	ld	a1,0(a5)
	lla	a0,.LC25
	call	kprintf
	.loc 1 58 24
	addi	a5,s0,-2024
	add	a5,a5,sp
	ld	a0,0(a5)
	call	strlen
	mv	a5,a0
	.loc 1 58 34
	sext.w	a5,a5
	addiw	a5,a5,-3
	sext.w	a5,a5
	.loc 1 58 5
	sext.w	a5,a5
	li	a2,84
	mv	a1,a5
	addi	a5,s0,-2024
	add	a5,a5,sp
	ld	a0,0(a5)
	call	encrypt_decrypt
	.loc 1 59 5
	addi	a5,s0,-2024
	add	a5,a5,sp
	ld	a1,0(a5)
	lla	a0,.LC26
	call	kprintf
	.loc 1 60 24
	addi	a5,s0,-2024
	add	a5,a5,sp
	ld	a0,0(a5)
	call	strlen
	mv	a5,a0
	.loc 1 60 34
	sext.w	a5,a5
	addiw	a5,a5,-3
	sext.w	a5,a5
	.loc 1 60 5
	sext.w	a5,a5
	li	a2,84
	mv	a1,a5
	addi	a5,s0,-2024
	add	a5,a5,sp
	ld	a0,0(a5)
	call	encrypt_decrypt
	.loc 1 61 5
	addi	a5,s0,-2024
	add	a5,a5,sp
	ld	a1,0(a5)
	lla	a0,.LC27
	call	kprintf
	.loc 1 62 11
	lla	a5,.LC28
	addi	a4,s0,-2040
	add	a4,a4,sp
	sd	a5,0(a4)
	.loc 1 63 5
	li	a2,3
	lla	a1,.LC29
	addi	a5,s0,-2040
	add	a5,a5,sp
	ld	a0,0(a5)
	call	memmove
	mv	a5,a0
	mv	a1,a5
	lla	a0,.LC30
	call	kprintf
	.loc 1 70 12
	li	a5,-1
	.loc 1 71 1
	mv	a0,a5
	addi	sp,sp,128
	.cfi_def_cfa_offset 2032
	ld	ra,2024(sp)
	.cfi_restore 1
	ld	s0,2016(sp)
	.cfi_restore 8
	ld	s1,2008(sp)
	.cfi_restore 9
	addi	sp,sp,2032
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	test_string, .-test_string
	.section	.rodata
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 12
__func__.0:
	.string	"test_string"
	.text
.Letext0:
	.file 2 "include/types.h"
	.file 3 "include/string.h"
	.file 4 "include/kernel/kstdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x359
	.2byte	0x5
	.byte	0x1
	.byte	0x8
	.4byte	.Ldebug_abbrev0
	.byte	0xa
	.4byte	.LASF33
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x5
	.4byte	.LASF5
	.byte	0x17
	.byte	0x17
	.4byte	0x3e
	.byte	0x6
	.4byte	0x2e
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
	.byte	0x5
	.4byte	.LASF6
	.byte	0x1a
	.byte	0x17
	.4byte	0x5e
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1d
	.byte	0xe
	.4byte	0x70
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x6
	.4byte	0x70
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF10
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x5
	.4byte	.LASF11
	.byte	0x20
	.byte	0xe
	.4byte	0x95
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF12
	.byte	0x5
	.4byte	.LASF13
	.byte	0x2a
	.byte	0x12
	.4byte	0x53
	.byte	0x5
	.4byte	.LASF14
	.byte	0x2d
	.byte	0x11
	.4byte	0x2e
	.byte	0x7
	.4byte	0x70
	.byte	0x2
	.4byte	.LASF15
	.byte	0x3
	.byte	0x48
	.byte	0x8
	.4byte	0x9c
	.4byte	0xd7
	.byte	0x1
	.4byte	0xd7
	.byte	0x1
	.4byte	0xd9
	.byte	0x1
	.4byte	0x9c
	.byte	0
	.byte	0xc
	.byte	0x8
	.byte	0x7
	.4byte	0xde
	.byte	0xd
	.byte	0x9
	.4byte	.LASF28
	.byte	0x3
	.byte	0xc4
	.byte	0x6
	.4byte	0xfb
	.byte	0x1
	.4byte	0xb2
	.byte	0x1
	.4byte	0x83
	.byte	0x1
	.4byte	0x70
	.byte	0
	.byte	0x2
	.4byte	.LASF16
	.byte	0x3
	.byte	0xbb
	.byte	0x8
	.4byte	0x9c
	.4byte	0x120
	.byte	0x1
	.4byte	0x120
	.byte	0x1
	.4byte	0xb2
	.byte	0x1
	.4byte	0x8a
	.byte	0x1
	.4byte	0x8a
	.byte	0
	.byte	0x7
	.4byte	0x77
	.byte	0x2
	.4byte	.LASF17
	.byte	0x3
	.byte	0x2b
	.byte	0x8
	.4byte	0x9c
	.4byte	0x145
	.byte	0x1
	.4byte	0xd7
	.byte	0x1
	.4byte	0x70
	.byte	0x1
	.4byte	0x9c
	.byte	0
	.byte	0x2
	.4byte	.LASF18
	.byte	0x3
	.byte	0xb0
	.byte	0x8
	.4byte	0x9c
	.4byte	0x160
	.byte	0x1
	.4byte	0x120
	.byte	0x1
	.4byte	0x39
	.byte	0
	.byte	0x2
	.4byte	.LASF19
	.byte	0x3
	.byte	0xa6
	.byte	0x7
	.4byte	0xb2
	.4byte	0x17b
	.byte	0x1
	.4byte	0x120
	.byte	0x1
	.4byte	0x39
	.byte	0
	.byte	0x2
	.4byte	.LASF20
	.byte	0x3
	.byte	0x97
	.byte	0x7
	.4byte	0xb2
	.4byte	0x196
	.byte	0x1
	.4byte	0x120
	.byte	0x1
	.4byte	0x39
	.byte	0
	.byte	0x2
	.4byte	.LASF21
	.byte	0x3
	.byte	0x88
	.byte	0x7
	.4byte	0xb2
	.4byte	0x1b1
	.byte	0x1
	.4byte	0xb2
	.byte	0x1
	.4byte	0x120
	.byte	0
	.byte	0x2
	.4byte	.LASF22
	.byte	0x3
	.byte	0x63
	.byte	0x7
	.4byte	0xb2
	.4byte	0x1cc
	.byte	0x1
	.4byte	0xb2
	.byte	0x1
	.4byte	0x120
	.byte	0
	.byte	0x2
	.4byte	.LASF23
	.byte	0x3
	.byte	0x57
	.byte	0x8
	.4byte	0x65
	.4byte	0x1ec
	.byte	0x1
	.4byte	0xd9
	.byte	0x1
	.4byte	0xd9
	.byte	0x1
	.4byte	0x9c
	.byte	0
	.byte	0x2
	.4byte	.LASF24
	.byte	0x3
	.byte	0x39
	.byte	0x8
	.4byte	0x9c
	.4byte	0x20c
	.byte	0x1
	.4byte	0xd7
	.byte	0x1
	.4byte	0xd9
	.byte	0x1
	.4byte	0x9c
	.byte	0
	.byte	0x2
	.4byte	.LASF25
	.byte	0x3
	.byte	0x6d
	.byte	0x8
	.4byte	0x9c
	.4byte	0x222
	.byte	0x1
	.4byte	0x120
	.byte	0
	.byte	0x2
	.4byte	.LASF26
	.byte	0x4
	.byte	0x43
	.byte	0x8
	.4byte	0x9c
	.4byte	0x239
	.byte	0x1
	.4byte	0x120
	.byte	0xe
	.byte	0
	.byte	0x2
	.4byte	.LASF27
	.byte	0x3
	.byte	0x20
	.byte	0x8
	.4byte	0x9c
	.4byte	0x259
	.byte	0x1
	.4byte	0xd7
	.byte	0x1
	.4byte	0xa7
	.byte	0x1
	.4byte	0x9c
	.byte	0
	.byte	0x9
	.4byte	.LASF29
	.byte	0x1
	.byte	0xf
	.byte	0xd
	.4byte	0x26b
	.byte	0x1
	.4byte	0x120
	.byte	0
	.byte	0xf
	.4byte	.LASF34
	.byte	0x1
	.byte	0x12
	.byte	0x5
	.4byte	0x83
	.8byte	.LFB8
	.8byte	.LFE8-.LFB8
	.byte	0x1
	.byte	0x9c
	.4byte	0x33a
	.byte	0x10
	.4byte	.LASF35
	.4byte	0x34a
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0x3
	.string	"s"
	.byte	0x14
	.byte	0xa
	.4byte	0x34f
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x77
	.byte	0x3
	.string	"t"
	.byte	0x15
	.byte	0xa
	.4byte	0x34f
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x6f
	.byte	0x3
	.string	"dst"
	.byte	0x16
	.byte	0xb
	.4byte	0xb2
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x3
	.string	"src"
	.byte	0x17
	.byte	0xb
	.4byte	0xb2
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x3
	.string	"lm"
	.byte	0x19
	.byte	0xc
	.4byte	0x9c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x8
	.4byte	.LASF30
	.byte	0x20
	.byte	0xc
	.4byte	0x65
	.byte	0x2
	.byte	0x91
	.byte	0x47
	.byte	0x8
	.4byte	.LASF31
	.byte	0x29
	.byte	0xc
	.4byte	0x9c
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x3
	.string	"t1"
	.byte	0x2d
	.byte	0xb
	.4byte	0xb2
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x3
	.string	"t2"
	.byte	0x2e
	.byte	0xb
	.4byte	0xb2
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x3
	.string	"t3"
	.byte	0x2f
	.byte	0xb
	.4byte	0xb2
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x8
	.4byte	.LASF32
	.byte	0x3e
	.byte	0xb
	.4byte	0xb2
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0
	.byte	0x11
	.4byte	0x77
	.4byte	0x34a
	.byte	0x12
	.4byte	0x5e
	.byte	0xb
	.byte	0
	.byte	0x6
	.4byte	0x33a
	.byte	0x13
	.4byte	0x70
	.byte	0x14
	.4byte	0x5e
	.2byte	0x3ff
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2
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
	.byte	0x3
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
	.byte	0x6
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x8
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x18
	.byte	0
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
	.byte	0x10
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
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
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
.LASF15:
	.string	"memmove"
.LASF13:
	.string	"size_t"
.LASF20:
	.string	"strchr"
.LASF23:
	.string	"memcmp"
.LASF6:
	.string	"uint64_t"
.LASF26:
	.string	"kprintf"
.LASF31:
	.string	"test6"
.LASF8:
	.string	"int8_t"
.LASF35:
	.string	"__func__"
.LASF25:
	.string	"strlen"
.LASF2:
	.string	"unsigned char"
.LASF22:
	.string	"strcpy"
.LASF7:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF21:
	.string	"strcat"
.LASF27:
	.string	"memset"
.LASF16:
	.string	"strslice"
.LASF32:
	.string	"test"
.LASF4:
	.string	"unsigned int"
.LASF9:
	.string	"char"
.LASF5:
	.string	"uint8_t"
.LASF34:
	.string	"test_string"
.LASF33:
	.string	"GNU C17 12.2.0 -mabi=lp64 -mcmodel=medany -mtune=rocket -misa-spec=2.2 -march=rv64imafd -g -O0 -fno-builtin -fno-pie -fomit-frame-pointer"
.LASF28:
	.string	"encrypt_decrypt"
.LASF24:
	.string	"memcpy"
.LASF10:
	.string	"short int"
.LASF14:
	.string	"byte"
.LASF18:
	.string	"strchrs"
.LASF12:
	.string	"long int"
.LASF17:
	.string	"strmset"
.LASF29:
	.string	"uart_puts"
.LASF30:
	.string	"test5"
.LASF19:
	.string	"strrchr"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/lighthouse/xzr/X2W-OS"
.LASF0:
	.string	"test/test_string.c"
	.ident	"GCC: (g) 12.2.0"
