#include "types.h"

#include "param.h"

#include "memlayout.h"

#include "riscv.h"

#include "kernel/locks.h"

#include "kernel/kalloc.h"

#include "string.h"

#include "elf.h"

#include "kernel/kstdio.h"

#include "kernel/vm.h"




extern char _s_kernel_pgd[];

pagetable_t kernel_pagetable=(uint64_t*)_s_kernel_pgd;

extern char _e_text[];

extern char trampoline[]; // trampoline.S




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

// 在页表 `pagetable` 中查找虚拟地址 `va` 对应的页表项pte，并返回其地址。
// 如果 `alloc` 非零，则在必要时创建所需的页表页面。

pte_t *walk(pagetable_t pagetable, uint64 va, int alloc)
{
  // 检查虚拟地址是否超出最大允许的地址范围
  if (va >= MAXVA)
    panic("walk");

  // 遍历页表的各级索引，从高级到低级
  for (int level = 2; level > 0; level--) {
    // 获取当前级别的页表项地址
    pte_t *pte = &pagetable[PX(level, va)];
    if (*pte & PTE_V) {
      // 如果页表项有效（已映射），则更新当前页表为下一级页表的地址
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      // 如果页表项无效（未映射）
      if (!alloc || (pagetable = (pde_t *)kalloc()) == NULL)
        return NULL; // 如果不需要分配新页表或者分配失败，则返回 NULL

      // 初始化新分配的页表页面，并将其地址存储到当前页表项
      memset(pagetable, 0, PGSIZE);
      *pte = PA2PTE(pagetable) | PTE_V;
    }
  }
  
  // 返回虚拟地址 `va` 对应的页表项地址
  return &pagetable[PX(0, va)];
}











/*
 * create a direct-map page table for the kernel.
 */
void kvminit()
{
//   kernel_pagetable = (pagetable_t) kalloc();
  // printf("kernel_pagetable: %p\n", kernel_pagetable);

  memset(kernel_pagetable, 0, PGSIZE);
  
  //uint64 FAT32_SIZE=(FAT32_END-FAT32_START+PGSIZE-1)/PGSIZE*PGSIZE;
  //printf("fat32end:%p\n",FAT32_END);
  // file system
  //kvmmap(FAT32_START_V, FAT32_START, FAT32_SIZE, PTE_R | PTE_W);
  // uart registers
  kvmmap(UART0, UART0, PGSIZE, PTE_R | PTE_W);
  

  // virtio mmio disk interface
  //kvmmap(VIRTIO0_V, VIRTIO0, PGSIZE, PTE_R | PTE_W);
  // CLINT
  kvmmap(CLINT, CLINT, 0x10000, PTE_R | PTE_W);

  // PLIC
  kvmmap(PLIC, PLIC, 0x400000, PTE_R | PTE_W);
  
  kvmmap(RAMDISK, RAMDISK, 0x5000000, PTE_R | PTE_W);

  #ifdef SIFIVE_U
  // SPI
  kvmmap(SPI2_CTRL_ADDR, SPI2_CTRL_ADDR_P, SPI2_CTRL_SIZE, PTE_R | PTE_W);
  #endif
  
  // map rustsbi
  // kvmmap(RUSTSBI_BASE, RUSTSBI_BASE, KERNBASE - RUSTSBI_BASE, PTE_R | PTE_X);
  // map kernel text executable and read-only.
  kvmmap(KERNBASE, KERNBASE, (uint64)_e_text - KERNBASE, PTE_R | PTE_X);
  // map kernel data and the physical RAM we'll make use of.

  //唯一需要注意的是这里，和之前的X2W—os不同的是：我们没有内核虚拟地址的管理了
  //我们选择所有可用内存全部恒等映射了

  kvmmap((uint64)_e_text, (uint64)_e_text, PHYSTOP - (uint64)_e_text, PTE_R | PTE_W);
  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.

  //把在trampoline.S中定义的代码全部映射到虚拟最高地址所在的页
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
  
  #ifdef DEBUG
  kprintf("kvminit\n");
  #endif
}


void kvmmap(uint64 va, uint64 pa, uint64 sz, int perm)
{
    //按照perm权限进行一个从虚拟地址到物理地址的映射，专用于内核页表
  if(mappages(kernel_pagetable, va, sz, pa, perm) != 0)
    panic("kvmmap");
}

int mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{

    //核心是一个walk函数，咱们直接调用walk函数写pte就可以进行改写kgd进行映射
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
  last = PGROUNDDOWN(va + size - 1);
  
  for(;;){
    if((pte = walk(pagetable, a, 1)) == NULL)
      return -1;
    if(*pte & PTE_V)
      panic("remap");
    *pte = PA2PTE(pa) | perm | PTE_V | PTE_A | PTE_D;
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  
  return 0;
}


//专用于进程自己的页目录表查询吧
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64 walkaddr(pagetable_t pagetable, uint64 va)
{
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    return (uint64_t)NULL;

  pte = walk(pagetable, va, 0);
  if(pte == 0)
    return (uint64)NULL;
  if((*pte & PTE_V) == 0)
    return (uint64)NULL;
  if((*pte & PTE_U) == 0)
    return (uint64)NULL;
  pa = PTE2PA(*pte);
  return pa;
}


// 根据给定的内核页表 `kpt` 和虚拟地址 `va`，计算出对应的物理地址。
// 该函数主要用于在内核中访问用户进程的地址空间。
// 
// 参数：
// - `kpt`：内核页表
// - `va`：虚拟地址
//
// 返回值：
// - 如果虚拟地址 `va` 在内核页表 `kpt` 中不存在映射，则返回0。
// - 如果虚拟地址 `va` 对应的页表项无效（未被映射），则返回0。
// - 否则，返回虚拟地址 `va` 对应的物理地址。

uint64
kwalkaddr1(pagetable_t kpt, uint64 va)
{
  uint64 off = va % PGSIZE; // 计算虚拟地址在页面内的偏移量
  pte_t *pte; // 页表项指针
  uint64 pa; // 物理地址
  
  pte = walk(kpt, va, 0); // 根据虚拟地址 `va` 在内核页表中找到对应的页表项
  if (pte == 0)
    return 0; // 如果找不到对应的页表项，返回0
  if ((*pte & PTE_V) == 0)
    return 0; // 如果页表项无效（未被映射），返回0
  pa = PTE2PA(*pte); // 获取页表项中的物理地址
  return pa + off; // 计算虚拟地址对应的物理地址并返回
}

//相似的功能，区别在于对错误的处理上面
uint64
kwalkaddr(pagetable_t kpt, uint64 va)
{
  uint64 off = va % PGSIZE;
  pte_t *pte;
  uint64 pa;
  
  pte = walk(kpt, va, 0);
  if(pte == 0)
    panic("kvmpa");
  if((*pte & PTE_V) == 0)
    panic("kvmpa");
  pa = PTE2PA(*pte);
  return pa+off;
}

//专用于内核页目录表的查询，这是一个方便兼容的接口
// translate a kernel virtual address to
// a physical address. only needed for
// addresses on the stack.
// assumes va is page aligned.
uint64 kvmpa(uint64 va)
{
  return kwalkaddr(kernel_pagetable, va);
}


// 打印内核页表中虚拟地址为0的页面的物理地址，只适用于检查
void checkkpt(int num) {
    kprintf("%d check0:%p\n", num, kwalkaddr1(kernel_pagetable, 0));
}


// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
//相应的取消某页目录表的映射的函数
void vmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    panic("vmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    if((pte = walk(pagetable, a, 0)) == 0)
      panic("vmunmap: walk");
    if((*pte & PTE_V) == 0)
      panic("vmunmap: not mapped");
    if(PTE_FLAGS(*pte) == PTE_V)
      panic("vmunmap: not a leaf");
    if(do_free){
        //选择性的释放物理页
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}


//创建一个进程专用的页目录表
// create an empty user page table.
// returns 0 if out of memory.
pagetable_t uvmcreate()
{
  pagetable_t pagetable;
  //页目录表也是使用kalloc直接从内核空闲页链表中直接获取
  pagetable = (pagetable_t) kalloc();
  if(pagetable == NULL)
    return (uint64_t*)NULL;
  memset(pagetable, 0, PGSIZE);
  return pagetable;
}

// 将用户初始化代码加载到页表的地址0处，用于第一个进程。
// sz 必须小于一页的大小。
void uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");

  mem = kalloc(); // 分配一个物理页作为内存
  // printf("[uvminit]kalloc: %p\n", mem);
  memset(mem, 0, PGSIZE); // 将物理页清零

  // 将物理页映射到用户页表的虚拟地址0处，设置为可读、可写、可执行、用户态权限
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);

  // 将物理页映射到内核页表的虚拟地址0处，设置为可读、可写、可执行权限
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);

  // 将用户初始化代码复制到分配的物理页中
  memmove(mem, src, sz);

  // 打印复制的内容（可选）
  // for (int i = 0; i < sz; i ++) {
  //   printf("[uvminit]mem: %p, %x\n", mem + i, mem[i]);
  // }
}


// 为进程从 oldsz 扩展到 newsz 分配 PTE 和物理内存，newsz 不需要对齐到页边界。
// 如果成功，返回新的大小；如果失败，返回 0。
uint64 uvmalloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    return oldsz;

  oldsz = PGROUNDUP(oldsz); // 对齐 oldsz 到页边界
  for(a = oldsz; a < newsz; a += PGSIZE){
    mem = kalloc(); // 分配一个物理页作为内存
    if(mem == NULL){
      uvmdealloc(pagetable, kpagetable, a, oldsz); // 分配失败，释放之前分配的内存
      return 0;
    }
    memset(mem, 0, PGSIZE); // 将物理页清零
    if (mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
      kfree(mem); // 映射失败，释放之前分配的内存
      uvmdealloc(pagetable, kpagetable, a, oldsz); // 释放之前分配的内存
      return 0;
    }
    if (mappages(kpagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R) != 0){
      int npages = (a - oldsz) / PGSIZE;
      vmunmap(pagetable, oldsz, npages + 1, 1); // 取消之前的映射，包括以上分配的页
      vmunmap(kpagetable, oldsz, npages, 0);
      return 0;
    }
  }
  return newsz;
}




// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
  if(newsz >= oldsz)
    return oldsz;

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}


// initialize kernel pagetable for each process.
pagetable_t proc_kpagetable(void)
{
  pagetable_t kpt = (pagetable_t) kalloc();
  if (kpt == NULL)
    return NULL;
    
  memmove(kpt, kernel_pagetable, PGSIZE);
  
  // remap stack and trampoline, because they share the same page table of level 1 and 0
  char *pstack = kalloc();
  if(pstack == NULL)
    goto fail;
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    goto fail;
  return kpt;

fail:
  kvmfree(kpt, 1);
  return NULL;
}


void kvmfreeusr(pagetable_t kpt)
{
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}


void kvmfree(pagetable_t kpt, int stack_free)
{
  if (stack_free) {
    vmunmap(kpt, VKSTACK, 1, 1);
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
  kfree(kpt);
}



// only free page table, not physical pages
void kfreewalk(pagetable_t kpt)
{
  for (int i = 0; i < 512; i++) {
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    } else if (pte & PTE_V) {
      break;
    }
  }
  kfree((void *) kpt);
}



void
uvmfree(pagetable_t pagetable, uint64 sz)
{
  if(sz > 0){
    uint64 npages = PGROUNDUP(sz)/PGSIZE;
    uint64 a;
    pte_t *pte;
    for(a = 0; a < npages * PGSIZE; a += PGSIZE){
      if((pte = walk(pagetable, a, 0)) == 0)
        continue;
      if((*pte & PTE_V) == 0)
        continue;
      if(PTE_FLAGS(*pte) == PTE_V)
        continue;
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
      *pte = 0;
    }
  }
  // vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
}


// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
      freewalk((pagetable_t)child);
      pagetable[i] = 0;
    } else if(pte & PTE_V){
      panic("freewalk: leaf");
    }
  }
  kfree((void*)pagetable);
}
