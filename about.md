# references(mainly based on xv6)

#### refs0: https://github.com/mit-pdos/xv6-public.git
#### refs1:https://gitlab.eduxiji.net/educg-group-13484-858191/test-xv6.git


# 关于xv6的特性：

## （1） 内存管理：详细见 ./include/memlayout.h

总共可用内存：128MB

### 系统内存的管理
```c
//KERNBASE是内核的起始位置
//PHYSTOP是可用物理地址的终止位置
#define KERNBASE 0x80200000ULL
#define PHYSTOP (0x80000000ULL + (unsigned long long)(1ULL * 128 * 1024 * 1024)) // 128MB
```

### 关于用户虚拟空间的管理
```c
#define MAXVA (1L << (9 + 9 + 9 + 12 - 1))  // 256 GB
#define USER_TOP (MAXVA)    // 用户虚拟地址的最高地址
#define TRAMPOLINE (USER_TOP - PGSIZE)  // 跳转页的虚拟地址
#define TRAPFRAME (TRAMPOLINE - PGSIZE) // trapframe 的虚拟地址
```

### 关于进程用户空间的管理
```c
#define USER_STACK_BOTTOM 0xC0000000   // 3GB，用户栈的较低地址
#define USER_TEXT_START 0x1000
```
---------------------------------------------

`vm.c`中的`kvminit`函数构建并初始化了内核态的页表,执行了下面的操作:

- 对中断控制`context`以及有关设备进行地址映射.其中所用到的宏定义在`memlayout.h`文件中.
- 内核代码区、数据区以及自由空间按照直接映射的方式进行映射,并且设置相应的访存权限.
- 将虚拟地址区域的顶部即`TRAMPOLINE`指向的虚拟地址映射到`trampoline`(trap出入口).

```C
void
kvminit()
{
  kernel_pagetable = (pagetable_t) kalloc();
  // printf("kernel_pagetable: %p\n", kernel_pagetable);

  memset(kernel_pagetable, 0, PGSIZE);
  
  //uint64 FAT32_SIZE=(FAT32_END-FAT32_START+PGSIZE-1)/PGSIZE*PGSIZE;
  //printf("fat32end:%p\n",FAT32_END);
  // file system
  //kvmmap(FAT32_START_V, FAT32_START, FAT32_SIZE, PTE_R | PTE_W);
  // uart registers
  kvmmap(UART0_V, UART0, PGSIZE, PTE_R | PTE_W);
  
  #if QEMU!=SIFIVE_U
  // virtio mmio disk interface
  kvmmap(VIRTIO0_V, VIRTIO0, PGSIZE, PTE_R | PTE_W);
  #endif
  // CLINT
  kvmmap(CLINT_V, CLINT, 0x10000, PTE_R | PTE_W);

  // PLIC
  kvmmap(PLIC_V, PLIC, 0x400000, PTE_R | PTE_W);

  #if QEMU==SIFIVE_U
  // GPIOHS
  kvmmap(GPIOHS_V, GPIOHS, 0x1000, PTE_R | PTE_W);

  // DMAC
  kvmmap(DMAC_V, DMAC, 0x1000, PTE_R | PTE_W);

  // GPIO
  // kvmmap(GPIO_V, GPIO, 0x1000, PTE_R | PTE_W);

  // SPI_SLAVE
  kvmmap(SPI_SLAVE_V, SPI_SLAVE, 0x1000, PTE_R | PTE_W);

  // FPIOA
  kvmmap(FPIOA_V, FPIOA, 0x1000, PTE_R | PTE_W);

  // SPI0
  kvmmap(SPI0_V, SPI0, 0x1000, PTE_R | PTE_W);

  // SPI1
  kvmmap(SPI1_V, SPI1, 0x1000, PTE_R | PTE_W);

  // SPI2
  kvmmap(SPI2_V, SPI2, 0x1000, PTE_R | PTE_W);

  // SYSCTL
  kvmmap(SYSCTL_V, SYSCTL, 0x1000, PTE_R | PTE_W);
  
  #endif
  
  // kvmmap(RUSTSBI_BASE, RUSTSBI_BASE, KERNBASE - RUSTSBI_BASE, PTE_R | PTE_X);
  // map kernel text executable and read-only.
  kvmmap(KERNBASE, KERNBASE, (uint64)etext - KERNBASE, PTE_R | PTE_X);
  // map kernel data and the physical RAM we'll make use of.
  kvmmap((uint64)etext, (uint64)etext, PHYSTOP - (uint64)etext, PTE_R | PTE_W);
  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);

  #ifdef DEBUG
  printf("kvminit\n");
  #endif
}
```
---------------------------------------
上述函数构建好内核态使用的页表`kernel_pagetable时`,所有核就可以调用`kvminithart`函数把页表首地址载入到`satp`寄存器中.
```C
void
kvminithart()
{
  w_satp(MAKE_SATP(kernel_pagetable));
  // reg_info();
  sfence_vma();
  #ifdef DEBUG
  printf("kvminithart\n");
  #endif
}
```
-------------------------------------------------
#### 内存管理系统关键函数

首先需要关注数据结构`pagetable_t`. `pagetable_t`本质上就是一个`uint64*`类型的一个指针, 即第一级页表的首地址. 可以是用户进程页表的首地址, 也可以是内核页表的首地址.

1、`walk`函数, 这个函数根据虚拟地址`va`, 找到对应的页表项`PTE`并返回.

```C
pte_t * walk(pagetable_t pagetable, uint64 va, int alloc)
{
  
  if(va >= MAXVA)
    panic("walk");

  for(int level = 2; level > 0; level--) {
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == NULL)
        return NULL;
      memset(pagetable, 0, PGSIZE);
      *pte = PA2PTE(pagetable) | PTE_V;
    }
  }
  return &pagetable[PX(0, va)];
}
```


--------------------------------------------------------

2、`mappages`函数. 该函数完成虚拟地址`va`到物理地址`pa`的映射, 添加对应页表项.

```C
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
  last = PGROUNDDOWN(va + size - 1);
  
  for(;;){
    if((pte = walk(pagetable, a, 1)) == NULL)
      return -1;
    if(*pte & PTE_V)
      panic("remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
```

找到虚拟地址对应的待插入页表项地址, 然后对页表项进行写入即可.

3、`copyin`函数: 可把用户态或者内核态的数据写入到内核态的地址空间中.

4、`copyout`函数: 可把内核态的数据写入到用户态或者内核态的地址空间中.

5、`walkaddr`函数: 该函数以虚拟地址`va`为输入, 返回对应的物理地址`pa`. 该函数的功能基于`walk`函数.

6、`vmunmap`函数: 该函数通过给定一个`va`地址和待释放的页数, 将`[va,va+npages*PGSIZE]`这段虚拟地址空间释放.


----------------------------------------------------------
#### 物理块管理函数

基本的物理块管理函数在`kalloc.c`中定义

基本思想就是使用一个*kmem*的结构体来管理物理内存块

```c
struct {
  struct spinlock lock;
  struct run *freelist;//空闲物理块链表
  uint64 npage;
} kmem;
```


1、`kinit`函数,这个函数初始化可用的物理地址空间.

```C
void
kinit()
{
  initlock(&kmem.lock, "kmem");
  freerange(end, (void*)PHYSTOP);//调用kfree加入空闲物理页链表
  //很有意思的方法，不需要位图，极致利用空间：)
}
```

2、`kalloc`函数,这个函数可以返回一个可用的物理地址空间首地址.

```C
void *
kalloc(void)
{
  struct run *r;

  acquire(&kmem.lock);
  r = kmem.freelist;
  if(r)
    kmem.freelist = r->next;//弹出链表第一个元素
  release(&kmem.lock);

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
  return (void*)r;
}
```

我们知道, 每次申请页面都会调用一次kalloc函数. kalloc函数会从freelist中获取还未使用的物理页面并返回其首地址. 这个freelist已经在kinit函数中初始化好了.

3、`kfree`函数, 该函数释放`pa`所指的物理页面, 并将其加入到可用的物理地址空间中(即放置到freelist中).

```C
void
kfree(void *pa)
{
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);

  r = (struct run*)pa;

  acquire(&kmem.lock);
  r->next = kmem.freelist;
  kmem.freelist = r;//插入头部，这可能是为了充分利用局部性原理
  release(&kmem.lock);
}
```
---------------------------------------------

#### 用户进程地址空间



下面有几个要提及的点:

- 每个用户进程使用单独的页表, 以保证程序的独立性.
- 用户看见的虚拟地址是连续的, 但对应程序的物理地址不是连续的, 这样加大了内存空间分配的灵活性.
- `trampoline`(trap出入口)是所有用户通用的, 每个用户的页表都有`MAXVA-PGSIZE->trampoline`的映射, 即把用户可用虚拟地址顶部的最后一个页面映射到trap的出入口处理程序, 方便用户态和内核态的切换.

`trapframe`页直接映射到可用物理空间,在`kernel`态是直接映射的,所以说不用担心`kernel`态访问不了用户态的`trapframe`.

`stack`页存放由exec程序创建的各种参数以及参数的地址.并且还保存`main`执行完应该返回的`PC`.

在每个用户进程创建之前都会调用一次`uvminit`函数以创建对应用户进程的页表:页表的映射与上文描述相同.

```C
void
uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();//分配得到一个空闲物理页
  // printf("[uvminit]kalloc: %p\n", mem);
  memset(mem, 0, PGSIZE);//物理页清零
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);
  memmove(mem, src, sz);
  // for (int i = 0; i < sz; i ++) {
  //   printf("[uvminit]mem: %p, %x\n", mem + i, mem[i]);
  // }
}
```

----------------------------

## （2）关于多核启动

对于基本的xv6操作系统,系统开机之后,先进行sbi初始化,当初始化完成的时候,先执行`entry.S`文件的指令,在`entry.S`文件中,操作系统会:

- 给每一个CPU分配一个大小为$2^{15}$B的栈空间.
- 把当前CPU的核号传递给`a0`寄存器,由于RISC-V架构特性,`a0`寄存器的值会传递给`main`函数的`hartid`参数.
- 分配完之后跳转到main函数执行进一步的初始化.
```asm
    .section .text
    .globl _entry
_entry:
    add t0, a0, 1
    slli t0, t0, 15
    la sp, boot_stack
    add sp, sp, t0
    call main
```
当`entry.S`文件执行完之后,操作系统会跳转到位于`main.c`文件中的`main`函数.

1、首先先调用`inithartid(hartid)`函数把当前核的核号放置到`tp`寄存器中.

2、标记这个核已经成功启动,并且

3、如果还有核没有启动,就会执行多核启动的操作,通过核间中断的方式启动其他还没有成功启动的核,通知这些核核从`_entry`处开始执行:如果所有核都已经启动,for循环会循环一遍,但不会进入到if块中.
```C
for(int i = 1; i < NCPU; i++) {
  //不是当前核并且这个核没有被唤醒.
	if(hartid!=i&&booted[i]==0){
  	start_hart(i, (uint64)_entry, 0);
  }
}
//通过调用sbi提供的中断函数来进行核间中断
static inline void start_hart(uint64 hartid,uint64 start_addr, uint64 a1) {
    a_sbi_ecall(0x48534D, 0, hartid, start_addr, a1, 0, 0, 0);
}
```
3、如果是第一个启动的核(主核),要执行一系列的初始化操作,包括printf函数,页表,各种中断,进程,文件系统等等.如果不是第一个启动的核,就只需要配置中断以及本CPU核的页表部件.

4、调用`scheduler()`函数,转到U态,执行第一个用户进程,操作系统启动结束.
-------------------------------------------------------

## （？）进程管理（proc.h）

### *关于struct cpu和struct proc的关系：* 

在 xv6 操作系统中，cpu 和 proc 结构体之间存在着一种父子关系。

cpu 结构体代表了处理器（CPU），它包含了与处理器相关的信息和状态。每个处理器都有一个对应的 cpu 结构体。

proc 结构体代表了进程（process），它包含了进程的各种信息和状态，如进程的状态、进程 ID、页表等。每个进程都有一个对应的 proc 结构体。

在 xv6 中，每个处理器都有一个当前运行的进程（current process），这个信息被保存在 cpu 结构体的 current_p 字段中。

通过这种方式，处理器可以跟踪当前运行的进程，而进程可以通过访问 cpu 结构体来获取与处理器相关的信息。这种关系使得进程可以与处理器进行交互，例如切换进程的上下文、获取处理器的状态等。

总结起来，cpu 结构体和 proc 结构体之间的关系是一种父子关系，通过这种关系，进程可以与其所在的处理器进行交互并获取处理器相关的信息。

```c
// 每个 CPU 的状态
struct cpu {
  struct proc *proc;       // 在此 CPU 上运行的进程，如果没有则为 null
  struct context context;  // 用于在此处执行 swtch() 进入调度器
  int noff;                // push_off() 嵌套的深度
  int intena;              // 在 push_off() 之前中断是否已启用
};



// 进程的状态
struct proc {
  struct spinlock lock;        // 进程锁

  // 使用这些字段时必须持有 p->lock：
  enum procstate state;        // 进程状态
  struct proc *parent;         // 父进程
  void *chan;                  // 如果非零，表示正在等待 chan
  int killed;                  // 如果非零，表示已被杀死
  int xstate;                  // 返回给父进程的退出状态
  int pid;                     // 进程ID

  // 这些字段是进程私有的，因此不需要持有 p->lock。
  uint64 kstack;               // 内核栈的虚拟地址
  uint64 sz;                   // 进程内存的大小（字节）
  pagetable_t pagetable;       // 用户页表
  pagetable_t kpagetable;      // 内核页表
  struct trapframe *trapframe; // 用于 trampoline.S 的数据页
  struct context context;      // 运行进程的 swtch() 上下文
  struct file **ofile;         // 打开的文件
  struct dirent *cwd;          // 当前目录
  char name[16];               // 进程名称（用于调试）
  int tmask;                   // 跟踪掩码
  struct tms proc_tms;         // 进程的时间统计信息
  struct mmap_info mmap_pool[MMAPNUM]; // 进程的内存映射信息
};

extern struct cpu cpus[NCPU];
//定义的全局处理器数组：NCPU在该代码中定义为5，表示启用了5个处理器

enum procstate { UNUSED, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };
//定义的进程的所有状态


```


