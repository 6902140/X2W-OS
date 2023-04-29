#include "mm.h"
#include "asm/csr.h"


/*
   使用汇编完成了SATP_MODE_39使能的操作
 */


.global enable_mmu_relocate
enable_mmu_relocate:
	la a2, idmap_pg_dir
	srl a2, a2, PAGE_SHIFT
	li a1, SATP_MODE_39
	or a2, a2, a1
	sfence.vma
	csrw sptbr, a2
	ret
