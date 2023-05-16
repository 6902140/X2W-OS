/**
 * @file memory.c
 * @author Zhuiri Xiao (xzr3356142450@gmail.com)
 * @brief 'memory.c'是系统内存管理的核心模块的实现
 * @version 0.1
 * @date 2023-04-26
 * 
 * @copyright Copyright Zhuiri Xiao (c) 2023 with GNU Public License V3.0
 */



#include "asm/uart.h"
#include "kernel/memory.h"
#include "types.h"
#include "test/test.h"
#include "kernel/kstdio.h"
#include "kernel/kmain.h"
#include "kernel/kinit.h"
#include "pgable.h"
#include"mm.h"
#include"clint.h"
#include "kernel/kstdio.h"

//定义总共需要的页数
#define NR_PAGES (TOTAL_MEMORY / PAGE_SIZE)


/*
 * __create_pgd_mapping: 创建页表
 *
 * pgdir: PGD页表的基地址
 * phys: 物理地址PA
 * virt: 虚拟地址VA
 * size: 映射的大小
 * prot: 页表项PTE的属性
 * alloc_pgtable: 分配各级页表的分配函数
 * flags: 标志位
 */

//定义一个外部指针指向内核进程的PGD基地址
extern char idmap_pg_dir[];

//定义外部指针指向文本段开头和结束，具体在kernel.ld中赋值
extern char _text_boot[], _etext_boot[];

//定义自己的文本代码段的起始和结束地址；可以自行在kernel.ld连接脚本中查看
extern char _text[], _etext[];






/***
 * 这段代码的作用是在给定的虚拟地址范围内，建立或更新页表（page table）中对应的页表项（page table entry, PTE）。具体来说，它完成以下几个任务：
   1 检查给定地址范围内的PTE是否已经存在，如果不存在则为该地址范围内的每一页创建新的PTE。

   2 为新创建的PTE设置物理页面的地址和访问权限。

   3 如果需要的话，还会分配一个新的PTE页表，并将其与父级的PMD表项相关联。

总体来说，这段代码的作用是为虚拟地址空间建立页表，并将物理地址映射到相应的虚拟地址。
这是操作系统内存管理的核心部分，以便应用程序可以使用虚拟地址，而不必关心物理地址的分配和管理。
*/
static void alloc_init_pte(pmd_t *pmdp, unsigned long addr,
		unsigned long end, unsigned long phys,
		pgprot_t prot,
		unsigned long (*alloc_pgtable)(void),
		unsigned long flags)
{
	pmd_t pmd = *pmdp;
	pte_t *ptep;

	/*pmd表项内容为空，说明对应的PTE页表还没建立*/
	if (pmd_none(pmd)) {
		unsigned long pte_phys;
		/*分配一个page，用于PTE页表*/
		pte_phys = alloc_pgtable();//强调：这是*PTE页表*的物理实际地址
		/* 由PTE基地址来回填pmdp表项 */
		//kprintf("pte_phy=%u,\n",pte_phys);
		set_pmd(pmdp, pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE));
		pmd = *pmdp;
	}

	/*由pmd表项和虚拟地址va，能找到对应的PTE表项*/
	ptep = get_ptep_from_pmdp(pmdp, addr);
	do {
		/* 设置PTE*/

		set_pte(ptep, pfn_pte(PFN_DOWN(phys), prot));
		phys += PAGE_SIZE;

	} while (ptep++, addr += PAGE_SIZE, addr != end);
}


/**
 * 同上面的alloc_init_pte函数一个道理；
 * 
 * 这是初始化一个pmd的地址，然后将其回填PGD中的函数
 * 
*/
static void alloc_init_pmd(pgd_t *pgdp, unsigned long addr,
		unsigned long end, unsigned long phys,
		pgprot_t prot,
		unsigned long (*alloc_pgtable)(void),
		unsigned long flags)
{
	pgd_t pgd = *pgdp;
	pmd_t *pmdp;
	unsigned long next;

	/*pgd表项内容为空，说明对应的PMD页表还没建立*/
	if (pgd_none(pgd)) {
		unsigned long pmd_phys;

		/*分配一个page，用于PMD页表*/
		pmd_phys = alloc_pgtable();
		/* 由PMD基地址来回填pgdp表项 */
		set_pgd(pgdp, pfn_pgd(PFN_DOWN(pmd_phys), PAGE_TABLE));
		pgd = *pgdp;
	}

	/*由pgd表项和虚拟地址va，能找到对应的PMD表项*/
	pmdp = get_pmdp_from_pgdp(pgdp, addr);
	do {
		next = pmd_addr_end(addr, end);

		alloc_init_pte(pmdp, addr, next, phys,
					prot,  alloc_pgtable, flags);

		phys += next - addr;
	} while (pmdp++, addr = next, addr != end);
}


/*
 * 分配一个page用于各级页表
 * 就是找到一个空闲页，并且将清空然后返回这个地址
 */
unsigned long early_pgtable_alloc(void)
{
	unsigned long phys;

	phys = get_free_page();
	memset((void *)phys, 0, PAGE_SIZE);

	return phys;
}

/*
 * __create_pgd_mapping: 创建页表
 *
 * pgdir: PGD页表的基地址
 * phys: 物理地址PA
 * virt: 虚拟地址VA
 * size: 映射的大小
 * prot: 页表项PTE的属性
 * alloc_pgtable: 分配各级页表的分配函数
 * flags: 标志位
 */
void __create_pgd_mapping(pgd_t *pgdir, unsigned long phys,
		unsigned long virt, unsigned long size,
		pgprot_t prot,
		unsigned long (*alloc_pgtable)(void),
		unsigned long flags)
{
	/* 由虚拟地址va和PGD基地址，找到对应PGD表项 */
	pgd_t *pgdp = pgd_offset_raw(pgdir, virt);
	
	unsigned long addr, end, next;

	phys &= PAGE_MASK;
	addr = virt & PAGE_MASK;
	//根据virt地址加上需求的字节数对齐之后得到需要分配的终结地址
	end = PAGE_ALIGN(virt + size);

	do {
		/* 找到pgd表项管辖的范围*/
		next = pgd_addr_end(addr, end);
		
		alloc_init_pmd(pgdp, addr, next, phys,
				prot, alloc_pgtable, flags);
		phys += next - addr;
		
	} while (pgdp++, addr = next, addr != end);

}


/**
 * @brief create_identical_mapping(void)完成一个内核虚拟和物理空间初始化为恒等映射
 * 
 * 
 * @return no return
 */
static void create_identical_mapping(void)
{
	unsigned long start;
	unsigned long end;

	/*map text*/
	//代码段的映射
	//kprintf("start create_identical_mapping\n");
	start = (unsigned long)_text_boot;
	end = (unsigned long)_etext;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			end - start, PAGE_KERNEL_READ_EXEC,
			early_pgtable_alloc,
			0);

	//kprintf("map text done\n");

	/*map memory*/
	//为内存创建恒等映射
	start = PAGE_ALIGN((unsigned long)_etext);
	end =  (unsigned long)(_e_bss+(PAGE_SIZE)*32);
	
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			end - start, PAGE_KERNEL,
			early_pgtable_alloc,
			0);
			
	start = PAGE_ALIGN((unsigned long)(_e_bss+(PAGE_SIZE)*32));
	end =  DDR_END;
	
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			end - start, PAGE_KERNEL,
			early_pgtable_alloc,
			0);
	//kprintf("map memory done\n");
}

static void create_mmio_mapping(void)
{
	unsigned long start;
	//unsigned long end;

#ifdef CONFIG_BOARD_QEMU
	/*map PLIC*/
	start = PLIC_BASE;
	end = PLIC_END;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			end - start, PAGE_KERNEL,
			early_pgtable_alloc,
			0);
#endif

	/*map CLINT*/
	start = VIRT_CLINT_ADDR;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			VIRT_CLINT_SIZE, PAGE_KERNEL,
			early_pgtable_alloc,
			0);

	/*map UART0*/
	start = UART_MMAP_BASE;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			4096, PAGE_KERNEL,
			early_pgtable_alloc,
			0);

	/*map CLINT*/
	start = VIRT_CLINT_ADDR;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			VIRT_CLINT_SIZE, PAGE_KERNEL_READ_WRITE_EXEC,
			early_pgtable_alloc,
			0);
	
}

void paging_init(void)
{
	//kprintf("------------------start paging-------------------\n");
	memset(idmap_pg_dir, 0, PAGE_SIZE);
	//将PGD每一位给清零，防止数据污染
	create_identical_mapping();
	
	create_mmio_mapping();
	//kprintf("\n***************paging finished********************\n");
	enable_mmu_relocate();
	//kprintf("\n***************enable mmu finished sucessfully********************\n");
}
