#ifndef _ASM_RISCV_PGTABLE_H
#define _ASM_RISCV_PGTABLE_H

#include "pg_types.h"
#include "pg_attr.h"
#include "mm.h"

/* Page protection bits */
#define _PAGE_BASE	(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER)

#define PAGE_NONE		__pgprot(_PAGE_PROT_NONE)
#define PAGE_READ		__pgprot(_PAGE_BASE | _PAGE_READ)
#define PAGE_WRITE		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_WRITE)
#define PAGE_EXEC		__pgprot(_PAGE_BASE | _PAGE_EXEC)
#define PAGE_READ_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
#define PAGE_WRITE_EXEC		__pgprot(_PAGE_BASE | _PAGE_READ |	\
					 _PAGE_EXEC | _PAGE_WRITE)

#define PAGE_COPY		PAGE_READ
#define PAGE_COPY_EXEC		PAGE_EXEC
#define PAGE_COPY_READ_EXEC	PAGE_READ_EXEC
#define PAGE_SHARED		PAGE_WRITE
#define PAGE_SHARED_EXEC	PAGE_WRITE_EXEC


#define _PAGE_KERNEL		(_PAGE_READ \
				| _PAGE_WRITE \
				| _PAGE_PRESENT \
				| _PAGE_ACCESSED \
				| _PAGE_DIRTY \
				| _PAGE_GLOBAL)

#define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
#define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
#define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
#define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
					 | _PAGE_EXEC)
#define PAGE_KERNEL_READ_WRITE_EXEC	__pgprot((_PAGE_KERNEL | _PAGE_WRITE) \
					 | _PAGE_EXEC)
#define PAGE_KERNEL_RESERVE __pgprot(_PAGE_SOFT)//宏定义一个保存给软件的页面；

#define PAGE_TABLE		__pgprot(_PAGE_TABLE)

/* 查找PGD索引 */
#define pgd_index(addr) (((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))

/* 通过地址addr查找PGD的表项 */
#define pgd_offset_raw(pgd, addr) ((pgd) + pgd_index(addr))

/*这个宏定义用于确定给定的地址范围内的页全局目录 (Page Global Directory, PGD) 的范围，并返回它们的边界地址。
具体地，该宏定义首先将给定的地址 addr 加上 PGDIR_SIZE（表示一个 PGD 的大小）并与 PGDIR_MASK（表示 PGD 的掩码）相与，
这样可以得到最接近 addr 且大于等于 addr 的 PGD 边界地址。如果这个 PGD 边界地址小于 end，那么这个地址就是下一个 PGD 边界地址，
否则下一个 PGD 边界地址就是 end。该宏定义使用了 ({}) 括号表达式，可以返回一个表达式结果。
*/
#define pgd_addr_end(addr, end)						\
({	unsigned long __boundary = ((addr) + PGDIR_SIZE) & PGDIR_MASK;	\
	(__boundary - 1 < (end) - 1) ? __boundary : (end);		\
})

#define pmd_addr_end(addr, end)						\
({	unsigned long __boundary = ((addr) + PMD_SIZE) & PMD_MASK;	\
	(__boundary - 1 < (end) - 1) ? __boundary : (end);		\
})

#define pgd_none(pgd) (!pgd_val(pgd))
#define pmd_none(pmd) (!pmd_val(pmd))
#define pte_none(pte) (!pte_val(pte))

static inline unsigned long pgd_page_paddr(pgd_t pgd)
{
	return (pgd_val(pgd) >> _PAGE_PFN_SHIFT) << PTE_SHIFT;
}

#define pmd_index(addr) ((addr) >> PMD_SHIFT & (PTRS_PER_PMD - 1))
#define pmd_offset_phys(pgd, addr) ((pmd_t *)(pgd_page_paddr(*(pgd)) + pmd_index(addr) * sizeof(pmd_t)))

static inline pmd_t *get_pmdp_from_pgdp(pgd_t *pgdp, unsigned long va)
{
	pmd_t *pmd_base;

	/* 由虚拟地址va，能找到对应的PMD表项的偏移offset */
	unsigned long index = pmd_index(va);

	/* 由PGD表项的内容，解码出下一级页表PMD的基地址 */
	pmd_base = (pmd_t *)pgd_page_paddr(*pgdp);

	/* PMD的基地址加上index，得到对应的pmd表项的地址*/
	return pmd_base + index;
}

static inline unsigned long pmd_page_paddr(pmd_t pmd)
{
	return (pmd_val(pmd) >> _PAGE_PFN_SHIFT) << PTE_SHIFT;
}

#define pte_index(addr) (((addr) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))

static inline pte_t *get_ptep_from_pmdp(pmd_t *pmdp, unsigned long va)
{
	pte_t *pte_base;
	/* 由虚拟地址va，能找到对应的PTE表项的偏移offset */

	unsigned long index = pte_index(va);

	/* 由PMD表项的内容，解码出下一级页表PTE的基地址 */
	pte_base = (pte_t *)pmd_page_paddr(*pmdp);

	/* PTE的基地址加上index，得到对应的pte表项的地址*/
	return pte_base + index;
}

static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
{
	*pgdp = pgd;
}

static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
{
	*pmdp = pmd;
}

static inline void set_pte(pte_t *ptep, pte_t pte)
{
	*ptep = pte;
}

static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
{
	return __pgd((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
}

static inline unsigned long _pgd_pfn(pgd_t pgd)
{
	return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
}

static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
{
	return __pmd((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
}

static inline unsigned long _pmd_pfn(pmd_t pmd)
{
	return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
}

//这个函数很简单，就是根据page table的处理之后的地址pfn，再结合后十位的属性描述符生成一个page_table_entry 
static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
{
	return __pte((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
}

static inline int pmd_present(pmd_t pmd)
{
       return (pmd_val(pmd) & _PAGE_PRESENT );
}

static inline int pmd_leaf(pmd_t pmd)
{
       return pmd_present(pmd) && (pmd_val(pmd) & _PAGE_LEAF);
}

static inline int pte_write(pte_t pte)
{
	return pte_val(pte) & _PAGE_WRITE;
}

static inline int pte_exec(pte_t pte)
{
	return pte_val(pte) & _PAGE_EXEC;
}

static inline int pte_dirty(pte_t pte)
{
	return pte_val(pte) & _PAGE_DIRTY;
}

static inline int pte_young(pte_t pte)
{
	return pte_val(pte) & _PAGE_ACCESSED;
}

static inline pte_t pte_wrprotect(pte_t pte)
{
	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
}

static inline pte_t pte_mkwrite(pte_t pte)
{
	return __pte(pte_val(pte) | _PAGE_WRITE);
}

static inline pte_t pte_mkdirty(pte_t pte)
{
	return __pte(pte_val(pte) | _PAGE_DIRTY);
}

static inline pte_t pte_mkclean(pte_t pte)
{
	return __pte(pte_val(pte) & ~(_PAGE_DIRTY));
}

static inline pte_t pte_mkyoung(pte_t pte)
{
	return __pte(pte_val(pte) | _PAGE_ACCESSED);
}

void dump_pgtable(void);
void walk_pgd(pgd_t *pgd, unsigned long start, unsigned long size);

#endif
