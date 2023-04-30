/**
 * @file mm.h
 * @author Zhuir Xiao (xzr3356142450@gmail.com)
 * @brief `mm.h`提供了一些内存管理需要的宏和函数. 
 * @version 0.1
 * @date 2023-04-26
 * 
 * @todo 
 *  1. 需要进行测试, 以测试函数正确性(已经在test_memory.c中完成)
 * 
 * @warning 
 * 
 * @copyright Copyright Zhuiri Xiao (c) 2023 with GNU Public License V3.0
 */

#ifndef	_MM_H
#define	_MM_H

/**
 * @brief 页内偏移在虚拟地址中有12位
 * 
 */
#define PAGE_SHIFT	 		12

/**
 * @brief 一个页表的偏移在虚拟地址中9位偏移
 * 
 */
#define TABLE_SHIFT 			9

/**
 * @brief 一个页的大小（2^12bit）
 * 
 */
#define PAGE_SIZE   			(1 << PAGE_SHIFT)	
#define PAGE_MASK (~(PAGE_SIZE-1))



/**
 * @brief  将一个地址使用PAGE_MASK来进行地址对齐
 * 
 */
#define PAGE_ALIGN(addr) (((addr)+PAGE_SIZE-1)&PAGE_MASK)
#define PAGE_ALIGN_UP(addr)  PAGE_ALIGN(addr)
#define PAGE_ALIGN_DOWN(addr) (addr & PAGE_MASK)

#define PFN_DOWN(x)	((x) >> PAGE_SHIFT)

/**
 * @brief  定义一个虚拟内存空间的起始地址
 * 
 */
#define K_HEAP_START 0xC0100000   

#ifndef __ASSEMBLER__
#include "pgable.h"
#include "ptregs.h"
#include "stdbitmap.h"

/**
 * @brief  开启分页制度的初始化函数
 * 
 * @note 该函数会
 *      1：建立一个PGD页，然后将其清空
 *      2：根据mem_init()统计得到的内存的信息在内存空间先建立三级页表
 *      3：建立分页机制之后使能mmu模块
 */
void paging_init(void);

/**
 * @brief  开启三级分页SV39的使能函数
 * 
 * @note 实现在kernel/mmu_enable中使用汇编语言实现
 */
void enable_mmu_relocate(void);

/**
 * @brief  分配一个物理页
 * 
 * @note 该函数会
 *      1：扫描kernel的bitmap然后返回一个空闲的物理地址
 *      2： 将bitmap相应位置设置为1
 *      3：暂未使用🔒保护，因为互斥机制还未实现
 */
unsigned long get_free_page(void);

/**
 * @brief  释放一个物理页
 * 
 * @note 该函数会
 *      1：根据输入的物理地址释放一个位
 *      2：设置位图相应位为0
 */
void free_page(unsigned long p);

/**
 * @brief  内存初始化函数，在其中实现了各种内存池的管理，位图的初始化，内存空间的统计等任务
 * 
 * @note 该函数会：
 *      1：根据初始内存管理地址start_mem，内存管理终止地址end_mem来统计内存大小，页数...
 *      2: 初始化各种内存池以及位图
 * 
 */
void mem_init(unsigned long start_mem, unsigned long end_mem);

/**
 * @brief  定义内存池的数据结构
 * 
 * @note 包含   
 *      pool_bitmap;           本内存池的位图，用于管理物理内存
 *      phy_addr_start;        本内存池所管理的物理内存的起始地址
 *      pool_size;             本内存池的字节容量
 *      mutex_t mutex;         用于实现互斥访问内存池暂时没有实现            
 */
typedef struct __pool_t {
    bitmap_t* pool_bitmap;                       // 本内存池的位图，用于管理物理内存
    uint32_t phy_addr_start;                    // 本内存池所管理的物理内存的起始地址
    uint32_t pool_size;                         // 本内存池的字节容量
   // mutex_t mutex;         //暂时没有实现                     // 内存池是共享变量，申请内存时候要保证互斥
} pool_t;

/**
 * @brief  定义虚拟地址池的数据结构
 * 
 * @note 包含   
 *      vaddr_bitmap;          虚拟内存的位图
 *      vaddr_start;           虚拟内存的起始的物理地址   
 */
typedef struct __virtual_addr_t {
    bitmap_t* vaddr_bitmap;                      // 虚拟内存的位图
    uint32_t vaddr_start;                       // 虚拟内存的起始的物理地址
} virtual_addr_t;


/**
 * @brief  PGD内存映射函数
 * 
 * @note 该函数会：
 *      1：输入的虚拟地址和物理地址还有要映射的内存大小填充PGD表项
 *      2: 将一段物理内存映射到一个指定的虚拟地址范围内。具体实现是通过对虚拟地址进行对齐和分割，逐个处理每个PGD表项，并将其指向相应的PMD表项来实现对整个虚拟地址范围的映射。在映射的过程中，函数还会调用alloc_init_pmd()函数，为每个PMD表项分配并初始化一个物理页面。该函数的参数包括PGD表基地址、需要映射的物理地址、虚拟地址、大小、保护标志、分配函数、标志等。
 * 
 */
void __create_pgd_mapping(pgd_t *pgdir, unsigned long phys,
		unsigned long virt, unsigned long size,
		pgprot_t prot,
		unsigned long (*alloc_pgtable)(void),
		unsigned long flags);


void init_phys_pool(pool_t* kpool,pool_t* upool,virtual_addr_t* k_vaddr);

unsigned long get_free_page_user(void);

void free_page_user(unsigned long p);

unsigned long get_a_virt_page(void);

unsigned long pgtable_alloc_1(void);

unsigned long get_phy_addr_by_virt(unsigned long virt);

void page_table_add(void* _vaddr, void* _page_phyaddr);

void* malloc_a_page(void);

int free_a_page(void* vaddr);

unsigned long early_pgtable_alloc(void);

void set_stage2_page_mapping(unsigned long gpa, unsigned long hpa, unsigned long size, pgprot_t prot);
void write_stage2_pg_reg(void);
void stage2_page_fault(struct pt_regs *regs);
#endif

#endif  /*_MM_H */
