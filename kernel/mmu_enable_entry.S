
#include "asm/csr.h"

#include "mm.h"

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

.align 2

.global reset_pgdir

reset_pgdir:
    # Load the first parameter into a2
    mv a2, a0

    # Right shift a2 by PAGE_SHIFT
    srl a2, a2, PAGE_SHIFT

    # Load SATP_MODE_39 into a1
    li a1, SATP_MODE_39

    # OR a2 with a1
    or a2, a2, a1

    # Flush TLB (Translation Lookaside Buffer)
    sfence.vma

    # Write a2 to SPTBR
    csrw sptbr, a2

    # Return from the function
    ret
