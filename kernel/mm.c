/**
 * @file mm.c
 * @author Zhuir Xiao (xzr3356142450@gmail.com)
 * @author Shihong Wang (jack4shihong@gmail.com)
 * @brief `mm.c`是`X2WOS`的内存管理模块
 * @version 0.1
 * @date 2023-05-17
 * 
 * @copyright Copyright Zhuiri Xiao, Shihong Wang (c) 2023 with GNU Public License V3.0
 */

#include "kernel/mm.h"
#include "kernel/paging.h"
#include "kernel/kdebug.h"
#include "riscv.h"

/// `KPAGES`定义了内核可用物理页数
#define KPAGES ((int) (PAGE_NUMS / MEMORY_US_RATIO))
/// `KPAGES`定义了用户可用物理页数
#define UPAGES (PAGE_NUMS - KPAGES)
#define PGSIZE 4096
/**
 * @brief `pool_btmps`是预先分配好的`bitmap`数组
 * 
 * @note `bitmap`中的`bits`字节数组要预留足够的空间
 */
struct {
    /// `kernel_ppool`是内核物理内存池的`bitmap`
    byte kernel_ppool_btmp[sizeof(bitmap_t) + KPAGES / 8 + 1];
    /// `kernel_vpool`是内核虚拟内存池`bitmap`
    byte kernel_vpool_btmp[sizeof(bitmap_t) + KPAGES / 8 + 1];
    /// `user_ppool`是用户物理内存池`bitmap`
    byte user_ppool_btmp[sizeof(bitmap_t) + UPAGES / 8 + 1];
} pool_btmps = {
    .kernel_ppool_btmp = {0},
    .kernel_vpool_btmp = {0},
    .user_ppool_btmp = {0}
};

/**
 * @brief `kernel_ppool`是内核物理内存池, `user_ppool`是用户物理内存池
 * 
 * @note 目前`X2WOS`最大支持16MB内存, 定义在`constrains.h`中
 * 
 * @note `kernel_ppool`和`user_ppool`中的`bitmap`没有初始化, 并且没有实现`kmalloc`, 因此需要提前分配位图的字节数组
 */
ppool_t kernel_ppool, user_ppool;

/**
 * @brief `kernel_ppool`是内核虚拟内存池
 * 
 * @note `kernel_vpool`中的`bitmap`没有初始化, 并且没有实现`kmalloc`, 因此需要提前分配位图的字节数组
 */
vpool_t kernel_vpool;

/// `_e_kernel`是内核映像的地址, 定义在`kernel.ld`中
extern char _e_kernel[];

void init_pools(addr_t start_paddr, size_t total_pages){
    // 计算用户/内核可用物理页面数
    size_t \
        kpages = KPAGES,
        upages = UPAGES;

    // 初始化内核物理内存池
    kernel_ppool.size = kpages;
    kernel_ppool.paddr_start = start_paddr;
    kernel_ppool.btmp = (bitmap_t *) &pool_btmps.kernel_ppool_btmp;
    kernel_ppool.btmp->bits = pool_btmps.kernel_ppool_btmp + sizeof(bitmap_t);
    bitmap_init(kernel_ppool.btmp, KPAGES / 8 + 1);
    spinlock_init(&kernel_ppool.lock, "kernel_ppool lock");

    // 初始化用户物理内存池
    user_ppool.size = upages;
    user_ppool.paddr_start = start_paddr + kpages;
    user_ppool.btmp = (bitmap_t *) &pool_btmps.user_ppool_btmp;
    user_ppool.btmp->bits = pool_btmps.user_ppool_btmp + sizeof(bitmap_t);
    bitmap_init(user_ppool.btmp, UPAGES / 8 + 1);
    spinlock_init(&user_ppool.lock, "user_ppool lock");

    // 初始化内核虚拟内存池
    /* 
     * 注意, 内核的页目录表中内核的代码段和数据段实现的是恒等映射, 所以内核的可分配的虚拟页应该从内核映像的最后开始
     * 
     * 内核映像的最后定义在`kernel.ld`中, 是`_e_kernel`
     */
    kernel_vpool.vaddr_start = page_align((addr_t)_e_kernel, True);
    kernel_vpool.btmp = (bitmap_t *) &pool_btmps.kernel_vpool_btmp;
    kernel_vpool.btmp->bits = pool_btmps.kernel_vpool_btmp + sizeof(bitmap_t);
    bitmap_init(kernel_vpool.btmp, KPAGES / 8 + 1);
    spinlock_init(&kernel_vpool.lock, "kernel_vpool lock");
}


void memory_init(addr_t start_paddr, addr_t end_paddr){
    start_paddr = page_align(start_paddr, True);
    end_paddr = page_align(end_paddr, False);
    size_t total_pages = (end_paddr - start_paddr) / PAGE_SIZE + 1;

    // 初始化内存池
    init_pools(start_paddr, total_pages);

    // debug
    kprintf("Memory Management Info:\n");
    kprintf("\ttotal physical pages available: %#X\n", total_pages);
    kprintf("\tkernel physical pool is at: %#X\n", &kernel_ppool);
    kprintf("\t%#X kernel physical pages available, start from %#X\n", kernel_ppool.size, kernel_ppool.paddr_start);
    kprintf("\tuser physical pool is at: %#X\n", &user_ppool);
    kprintf("\t%#X user physical pages available, start from %#X\n", user_ppool.size, user_ppool.paddr_start);
}


addr_t alloc_ppage(Bool kpage){
    ppool_t *pool = (kpage == True) ? &kernel_ppool : &user_ppool;

    offset_t bit_idx = bitmap_scan(pool->btmp, 1);
    // TODO: 未来实现换页机制后, 这里需要修改为换出物理页
    ASSERT(bit_idx != -1, "bit_idx=%d, cannot find a physical page!", bit_idx);

    spinlock_acquire(&pool->lock);
    bitmap_set(pool->btmp, bit_idx, BITMAP_TAKEN);
    spinlock_release(&pool->lock);


    addr_t ppage = pool->paddr_start + bit_idx * PAGE_SIZE;
    memset((void *)ppage, 0, PAGE_SIZE);

    return ppage;
}


void free_ppage(addr_t ppage, Bool kpage){
    ppool_t *pool = (kpage == True) ? &kernel_ppool : &user_ppool;

    offset_t bit_idx = (ppage - pool->paddr_start) / PAGE_SIZE;
    ASSERT(bit_idx >= 0, "bit_idx shouldn't be negative, bit_idx = %d!", bit_idx);

    spinlock_acquire(&pool->lock);
    bitmap_set(pool->btmp, bit_idx, BITMAP_FREE);
    spinlock_release(&pool->lock);
}


addr_t alloc_vpage(vpool_t *vpool, size_t cnt){
    ASSERT(vpool != NULL, "vpool shouldn't be NULL!");

    offset_t bit_idx = bitmap_scan(vpool->btmp, cnt);
    // TODO: 未来实现换页机制后, 这里需要修改为换出虚拟页
    ASSERT(bit_idx != -1, "bit_idx=%d, cannot find a virtual page!", bit_idx);
    spinlock_acquire(&vpool->lock);
    bitmap_set(vpool->btmp, bit_idx, BITMAP_TAKEN);
    spinlock_release(&vpool->lock);

    return vpool->vaddr_start + bit_idx * PAGE_SIZE;
}


void free_vpage(vpool_t *vpool, addr_t vpage){
    ASSERT(vpool != NULL, "vpool shouldn't be NULL!");

    offset_t bit_idx = (vpage - vpool->vaddr_start) / PAGE_SIZE;
    ASSERT(bit_idx >= 0, "bit_idx shouldn't be negative, bit_idx = %d!", bit_idx);
    spinlock_acquire(&vpool->lock);
    bitmap_set(vpool->btmp, bit_idx, BITMAP_FREE);
    spinlock_release(&vpool->lock);
}


ppool_t *get_ppool(void){
    // TODO: 目前仅返回内核物理内存池, 返回用户虚拟内存池需要在用户进程实现了之后实现
    return &kernel_ppool;
}


vpool_t *get_vpool(void){
    // TODO: 目前仅返回内核虚拟内存池, 返回用户虚拟内存池需要在用户进程实现了之后实现
    return &kernel_vpool;
}



// 操作页目录表的函数, 定义在`paging.h`中, 这里声明为extern是为了避免交叉引用
extern inline pgd_t *get_pgd(void);
extern void create_mapping(pgd_t *pgd, addr_t vaddr, addr_t paddr, uint64_t size, page_property_t property, uint64_t flags);

void *malloc_page(size_t cnt, Bool kpage){
    ASSERT(cnt > 0, "cnt must greater than zero, but cut = %d!", cnt);
    // TODO: 目前仅支持分配内核页, 未来需要在用户进程部分实现一下用户页分配
    ASSERT(kpage == True, "Only kernel page is supported now, you're trying to malloc a user page, kpage=%d!", kpage);

    // debug only
    kprintf("Malloc a %s page\n", kpage == True ? "kernel" : "user");

    // 首先获取需要添加映射的全局页目录表
    pgd_t *pgd = get_pgd();
    
    // 获取要操作的虚拟内存池
    vpool_t *vpool = get_vpool();

    // 分配虚拟页
    addr_t vpage UNUSED = alloc_vpage(vpool, cnt);
    // 逐虚拟页操作
    while (cnt-- > 0){
        // 分配和该虚拟页对应的物理页
        addr_t ppage UNUSED = alloc_ppage(kpage);
        page_property_t pproperty = { (uint64_t) KERNEL_PAGE};

        // 操作页目录表完成虚拟页-物理页映射
        create_mapping(pgd, vpage, ppage, PAGE_SIZE, pproperty, 0);

        // 映射下一个虚拟页
        vpage += PAGE_SIZE;
    }
    return (void *) vpage;
}

// void *free_page(void* vpage,Bool kpage){
    
//     // ASSERT(kpage == True, "Only kernel page is supported now, you're trying to malloc a user page, kpage=%d!", kpage);

//     // // debug only
//     // kprintf("free a %s page\n", kpage == True ? "kernel" : "user");

//     // // 首先获取需要添加映射的全局页目录表
//     // pgd_t *pgd = get_pgd();
    
//     // // 获取要操作的虚拟内存池
//     // vpool_t *vpool = get_vpool();

//     // 分配虚拟页
//    // addr_t vpage UNUSED = alloc_vpage(vpool, cnt);
//     // 逐虚拟页操作
//     // while (cnt-- > 0){
//     //     // 分配和该虚拟页对应的物理页
//     //     addr_t ppage UNUSED = alloc_ppage(kpage);
//     //     page_property_t pproperty = { (uint64_t) KERNEL_PAGE};

//     //     // 操作页目录表完成虚拟页-物理页映射
//     //     create_mapping(pgd, vpage, ppage, PAGE_SIZE, pproperty, 0);

//     //     // 映射下一个虚拟页
//     //     vpage += PAGE_SIZE;
//     // }
//     return (void *) vpage;
// }

// Return the address of the PTE in page table pagetable
// that corresponds to virtual address va.  If alloc!=0,
// create any required page-table pages.
//
// The risc-v Sv39 scheme has three levels of page-table
// pages. A page-table page contains 512 64-bit PTEs.
// A 64-bit virtual address is split into five fields:
//   39..63 -- must be zero.
//   30..38 -- 9 bits of level-2 index.
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t * walk(pagetable_t pagetable, uint64_t va, int alloc)
{
//   if(va >= MAXVA)
//     panic("walk");
    ASSERT(va<MAXVA,"walk va too much",0);
  for(int level = 2; level > 0; level--) {
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)alloc_ppage(True)) == 0)
        return 0;
      memset(pagetable, 0, PGSIZE);
      *pte = PA2PTE(pagetable) | PTE_V;
    }
  }
  return &pagetable[PX(0, va)];
}


// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int mappages(pagetable_t pagetable, uint64_t va, uint64_t size, uint64_t pa, int perm)
{
  uint64_t a, last;
  pte_t *pte;

//   if(size == 0)
//     panic("mappages: size");
  ASSERT(size>0,"mappages:size error",1)

  
  a = PGROUNDDOWN(va);
  last = PGROUNDDOWN(va + size - 1);
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
      return -1;
    // if(*pte & PTE_V)
    //   panic("mappages: remap");
    ASSERT(!(*pte&PTE_V),"mappage:repeat map",0);
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}





//注意：内核恒等映射就ok了，对内核的mem就不用操作了，内核mem对外提供的唯一接口就是alloc_ppage()

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t uvmcreate(void)
{
  pagetable_t pagetable;
  pagetable = (pagetable_t) alloc_ppage(True);
  if(pagetable == 0)
    return 0;
  memset(pagetable, 0, PGSIZE);
  return pagetable;
}

// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void uvmfirst(pagetable_t pagetable, char *src, unsigned int sz)
{
  char *mem;

//   if(sz >= PGSIZE)
//     panic("uvmfirst: more than a page");
  ASSERT(sz<=PGSIZE,"uvmfirst: more than a page",0);
  mem = (char*)alloc_ppage(True);
  memset(mem, 0, PGSIZE);
  mappages(pagetable, 0, PGSIZE, (uint64_t)mem, PTE_W|PTE_R|PTE_X|PTE_U);
  memmove(mem, src, sz);
}


