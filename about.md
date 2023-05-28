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

## (3)文件系统实现

对于文件系统,相比于xv6存在大的改动,我们将自底而上地来介绍文件系统的每一个层次:

#### 用户代码的加载

我们在`mkfs.c`中把所有的用户标准`shell`程序全部加载到`fs.img`中:

在`link_app.S`中,我们规定了`fs.img`的数据全部放在数据段中:

```asm
    .align 4
    .section .data
    .section .data.fs_img
    .global fs_img_start
    .global fs_img_end
fs_img_start:
    .incbin "./fs.img"
fs_img_end:
    .quad 0xffffffff
```
数据段的开头就是`fs_img_start`,结尾就是`fs_img_end`:

#### sd卡读写驱动
我们也实现了读取sd卡的模式，文件系统也可以不放在数据段，而放在sd卡中，此处参考了两个地方：
- sifive官方提供的驱动u540-bootloader
- 南开大学的ucore-SMP到sifive的移植
此处使用的是spi协议映射在0x10050000的地址处，但只能逐字读
注：在make时加入fat=SD即可使文件系统变成基于SD卡的模式


#### Ramdisk读写

最底层的就是磁盘硬件的读和写,对于磁盘的操作,我们可以使用sd卡,我们也可以使用内存来模拟磁盘(Ramdisk),现在介绍Ramdisk的相关读写操作.

- 首先先从buf数据结构中找到磁盘块的扇区号.
- 根据扇区号找到应该的内存地址.
- 根据write的值确定是读操作还是写操作.

```C
void 
ramdisk_rw(struct buf *b, int write)
{
  acquire(&ramdisklock);
  uint sectorno = b->sectorno;
  if(b->dev != ROOTDEV)
  	panic("wrong device number");
  lookup_ramdisk_addr(sectorno);
  char *addr = fs_img_start+sectorno*BSIZE;
  if (write)
  {
    memmove((void*)addr, b->data, BSIZE);
  }
  else
  {
    memmove(b->data, (void*)addr, BSIZE);
  }
  release(&ramdisklock);
}
```

#### buf读写

对于block一级的读写,这一层读写为上层提供了在`buf`层级的读写:包括允许值,磁盘的扇区号以及暂时存储的位置.

```C
struct buf {
  int valid;  // valid or not
  int disk;		// does disk "own" buf? 
  uint dev;   
  uint sectorno;	// sector number 
  struct sleeplock lock;
  uint refcnt;  
  struct buf *prev;//prev buf
  struct buf *next;//next buf
  uchar data[BSIZE];//data
};
```
实现方式很简单:根据设备的不同调用不同的底层读写接口.
```C
void disk_read(struct buf *b)
{
    #ifdef QEMU
    #if QEMU!=SIFIVE_U
	virtio_disk_rw(b, 0);
    
    #else
	// sdcard_read_sector(b->data, b->sectorno);
	ramdisk_rw(b, 0);
    #endif
    #else 
	// sdcard_read_sector(b->data, b->sectorno);
	ramdisk_rw(b, 0);
	#endif
}

void disk_write(struct buf *b)
{
    #ifdef QEMU
    #if QEMU!=SIFIVE_U
	virtio_disk_rw(b, 1);    
    #else
    	// sdcard_write_sector(b->data, b->sectorno);
    	ramdisk_rw(b, 1);
    #endif
    #else 
	// sdcard_write_sector(b->data, b->sectorno);
	ramdisk_rw(b, 1);
	#endif
}
```

这里是调用`ramdisk`提供的接口.

#### FAT32文件系统读写

(*需要补充:FAT32文件系统的结构以及相关操作*)

对于每一个文件,都可以表示成FAT32中的一个表项,在FAT32文件系统中,我们维护一个叫做`cluster`的变量,所有的文件都在理论的`cluster`中存储.其中有对`cluster`最基本的读写操作:

- 根据`cluster`的值找到扇区号.
- 调用底层buf操作的接口获取对应扇区的存储数据.
- 根据读还是写操作来进行读写:

```C
static uint rw_clus(uint32 cluster, int write, int user, uint64 data, uint off, uint n)
{
    if (off + n > fat.byts_per_clus)
        panic("offset out of range");
    uint tot, m;
    struct buf *bp;
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    off = off % fat.bpb.byts_per_sec;

    int bad = 0;
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
        bp = bread(0, sec);
        m = BSIZE - off % BSIZE;
        if (n - tot < m) {
            m = n - tot;
        }
        
        if (write) {
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
                bwrite(bp);
            }
        } else {
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
        }
        brelse(bp);
        if (bad == -1) {
            break;
        }
    }
    return tot;
}
```

上层的文件系统调用`rw_clus()`是通过`eread\ewrite`函数通过调用的,`eread\ewrite`通过给定的文件描述符找到文件对应的`cluster`编号,然后再调用`rw_clus`.至于文件描述符`struct dirent*`,请读者自行查阅.

#### FAT32多文件系统

每一个FAT32文件系统主要由以下组成部分构成
```
struct fs{
    uint devno;                    \\设备号
    int  valid;                    \\有效
    struct dirent* image;          \\镜像文件
    struct Fat fat;                \\FAT32相关信息
    struct entry_cache ecache;     \\路径节点cache
    struct dirent root;            \\文件系统根目录
    void (*disk_init)(struct dirent*image);                 \\文件系统磁盘读写初始化
    void (*disk_read)(struct buf* b,struct dirent* image);  \\磁盘读
    void (*disk_write)(struct buf* b,struct dirent* image); \\磁盘写
};
```
- 对于一个FAT32文件系统首先需要知道其扇区块数、首扇区号等，这些信息存储在第0块扇区中，读出后放入Fat结构体
- 每个文件系统的底层读写不一样，有的可能基于磁盘，有的基于某个镜像文件，根据需求填写对应image和磁盘读写函数等

##### 关于挂载
 挂载目录节点的mnt置1，访问此节点时，当作成对于其dirent设备号对应的文件系统的根目录进行处理



#### fileread和filewrite

首先我们先了解一下file的数据结构:

```C
struct file {
  enum { FD_NONE, FD_PIPE, FD_ENTRY, FD_DEVICE } type;
  int ref; // reference count
  char readable;
  char writable;
  struct pipe *pipe; // FD_PIPE
  struct dirent *ep;//文件描述符号
  uint off;          // FD_ENTRY
  short major;       // FD_DEVICE
};
```

数据结构有以下元素:

- 文件类型
- 引用数
- 读写性
- 文件描述符

`fileread`和`filewrite`会根据不同的文件类别进行读写操作,这一点我们在控制台输入输出的时候已经说明,具体分成三类:

- `FD_PIPE`:管道,直接调用`piperead\pipewrite`.
- `FD_DEVICE`:设备,调用设备相关的读写函数,其函数存放在`ftable`.
- `FD_ENTRY`:普通文件,引用文件控制块并调用`eread\ewrite`.把文件操作交付给FAT32模块.

----------------------------------------------------
## （3）内核实现--时钟中断

RISC-V的CPU在一定的时间段就会触发一次时钟中断,RISC-V希望时钟中断能在M态处理而不是在S态处理.我们选择在一个特殊的方法来处理时钟中断.

在`start.c`中,我们设置了把所有中断都放在S态进行处理.但是我们在`timerinit`函数中创建了一个专属于时钟中断的处理模式,在这个函数中,我们主要是获得了时钟中断的锁.

当时钟中断产生的时候,我们一般认为这个中断是一个设备中断:在`devintr`函数中我们看到了时钟中断的处理逻辑:

```C
	else if (0x8000000000000005L == scause) {
		timer_tick();
		return 2;
	}
```

每一次时钟中断都会调用`timer_tick`函数:

- 通知因为sleep导致睡眠的进程.
- 设置下一次时钟中断的时间.

```C
void timer_tick() {
    acquire(&tickslock);
    ticks++;
    wakeup(&ticks);
    release(&tickslock);
    set_next_timeout();
}
```

在`set_next_timeout`函数中,我们通过sbi接口设置了下一次时钟中断的时间:

```C
void
set_next_timeout() {
    // There is a very strange bug,
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
}
```

为了适配进程的时间计数,我们在每一次时钟中断的时候添加了`proc_tick()`函数:

```C
void proc_tick(void) {
	// runnable 
    struct proc* p;
    struct proc* np;
	for(p = proc; p < &proc[NPROC]; p++) {
      acquire(&p->lock);
      p->proc_tms.utime += 1;
      p->proc_tms.stime += 1;
      np = p->parent;
      while(np){
        np->proc_tms.cstime += p->proc_tms.stime + p->proc_tms.cstime;
				np->proc_tms.cutime += p->proc_tms.utime + p->proc_tms.cutime;
        np = np->parent;
      }
      release(&p->lock);
  }
}
```

这个函数我们主要是处理tms结构体里面的数据:
```C
struct tms {
	uint64 utime;		// user time 
	uint64 stime;		// system time 
	uint64 cutime;		// user time of children 
	uint64 cstime;		// system time of children 
};
```
我们在每一个时钟周期对tms进行一次处理即可.

-------------------------------------------------

## （4） 内核实现--系统调用

#### 中断的概念

在RISC-V的体系结构中,存在三种事件会使得CPU放弃对当前执行的程序的运行转而去处理这些事件.

- 系统调用,当当前程序执行ecall指令的时候
- 异常:指令的执行出现问题,比如说除0等.内部
- 中断:当设备传来需要中断的信号.外部

所以说对于中断的处理,基本上可以分成4步:

- 硬件的中断响应.
- 中断进入,进入内核态.
- 进入中断例程,进入中断处理.
- 中断返回

#### RISC-V中断寄存器

RISC-V保留了关键的寄存器来保存一些关键信息.

- `stvec`寄存器:存储中断处理程序(例程)的第一条指令,当中断发生的时候RISC-V的CPU会跳转到`stvec`寄存器对应的地址.这个寄存器也叫中断入口寄存器
- `sepc`寄存器:当中断发生的时候RISC-V CPU会保存当前PC寄存器的值在sepc中.
- `scause`寄存器:表示中断的原因和来源,为什么会发生此中断.
- `sscratch`寄存器:内核会放一个值在这里,这一个值对于中断程序的开始很有用.
- `sstatus`寄存器:设置中断屏蔽的寄存器.

上述寄存器在U态下不可读写.

#### 中断响应

1. 如果当前中断是设备中断,并且sstatus寄存器内设置了屏蔽,就不做任何事.
2. 设置sstatus寄存器的值,屏蔽中断.
3. 把当前PC寄存器的值copy给sepc寄存器.
4. 保存当前的模式,在sstatus寄存器.
5. 设置scause,保存中断的原因.
6. 设置当前状态为S态.
7. 把stvec寄存器的值给PC.
8. 转而执行PC寄存器对应的指令.

#### 系统调用的过程

当系统申请系统调用时,会按照顺序执行下面的函数:

- `uservec`
- `usertrap`
- 中断处理函数
-  `usertrapret`
- `userret`

在上一部分中我们知道内核态空间和用户态空间都维持了页表,但是RISC-V并没有在中断响应的时候更换页表,这代表操作系统需要在处理中断的时候把页表替换成内核的页表,这个时候可能会出现缺页中断.

解决之道就是添加一个`trampoline`页,`trampoline`就是以个特殊的页,这个页包含了`uservec`和`userret`两部分,这个特殊的页作为页表项存在于内核态和所有的进程的页表中.所以说无论是什么进程请求系统调用,都可以进入到统一的`trampoline`的代码中.

由于`stvec`寄存器存储了`uservec`的地址,所以中断一开始的时候会进入uservec这个部分执行:

```assembly
uservec:    
	#
        # trap.c sets stvec to point here, so
        # traps from user space start here,
        # in supervisor mode, but with a
        # user page table.
        #
        # sscratch points to where the process's p->trapframe is
        # mapped into user space, at TRAPFRAME.
        #
        
	      # swap a0 and sscratch
        # so that a0 is TRAPFRAME
        csrrw a0, sscratch, a0

        # save the user registers in TRAPFRAME
        sd ra, 40(a0)
        sd sp, 48(a0)
        sd gp, 56(a0)
        sd tp, 64(a0)
        sd t0, 72(a0)
        sd t1, 80(a0)
        sd t2, 88(a0)
        sd s0, 96(a0)
        sd s1, 104(a0)
        sd a1, 120(a0)
        sd a2, 128(a0)
        sd a3, 136(a0)
        sd a4, 144(a0)
        sd a5, 152(a0)
        sd a6, 160(a0)
        sd a7, 168(a0)
        sd s2, 176(a0)
        sd s3, 184(a0)
        sd s4, 192(a0)
        sd s5, 200(a0)
        sd s6, 208(a0)
        sd s7, 216(a0)
        sd s8, 224(a0)
        sd s9, 232(a0)
        sd s10, 240(a0)
        sd s11, 248(a0)
        sd t3, 256(a0)
        sd t4, 264(a0)
        sd t5, 272(a0)
        sd t6, 280(a0)

	# save the user a0 in p->trapframe->a0
        csrr t0, sscratch
        sd t0, 112(a0)

        # restore kernel stack pointer from p->trapframe->kernel_sp
        ld sp, 8(a0)

        # make tp hold the current hartid, from p->trapframe->kernel_hartid
        ld tp, 32(a0)

        # load the address of usertrap(), p->trapframe->kernel_trap
        ld t0, 16(a0)

        # restore kernel page table from p->trapframe->kernel_satp
        ld t1, 0(a0)
        csrw satp, t1
        sfence.vma zero, zero

        # a0 is no longer valid, since the kernel page
        # table does not specially map p->tf.

        # jump to usertrap(), which does not return
        jr t0
```
                            

RISC-V的寻址指令需要使用一个基址寄存器,在保存其他通用寄存器后需要RISC-V提供`sscratch`寄存器,这个时候就可以把a0先暂时存储到`sscratch`寄存器中,然后再把a0从`sscratch`寄存器中取出.*在这里这个寄存器主要是存放了栈帧的首地址,新的栈帧就会存放在`sscratch`表示的地址中,在原文中提到,在返回到U态时,内核通过设置`sscratch`寄存器来制定下一次中断时栈帧的地址*.

对于栈帧的处理同样需要页表,在操作系统中,对于每一个进程我们都会申请一个`trapframe`页,对于用户态的地址空间中,这个页的虚拟地址永远指定在`TRAPFRAME`这个地址上.但是每个进程的页表是相互独立的,那么`trapframe`页的物理地址是不一样的.

那对于内核态的代码,我们不能通过`TRAPFRAME`这个虚拟地址来访问进程的栈帧结构,那么我们应该怎么办呢?

我们看到`p->trapframe`的初始化过程:`p->trapframe = (struct trapframe)kalloc()`,在初始化的时候就把物理地址给保存好了.这样问题就解决了.

由于`kernel_trap`已经保存到`t0`寄存器,那我们可以跳转到`usertrap`继续执行.

接着调用`trap.c()`中的`usertrap`函数,这个时候就已经进入内核态了,这个函数做下面的操作:

- 修改`stvec`寄存器,因为对于在用户态和内核态发生中断请求,进入的中断程序是不一样的
- 接着在`trapframe`里面保存`sepc`寄存器(就是中断的断点)
- 对于不同的中断类型调用不同的处理函数如果trap是`syscall`的话,接着就调用syscall函数即可,如果是设备故障的话,就先保存设备的编号,如果不是设备中断的话就是指令的异常这个时候就退出就可以了.如果是时钟中断`(which_dev==2)`就处理一下.

```C
//
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
  //printf("run in usertrap\n");
  int which_dev = 0;

  if((r_sstatus() & SSTATUS_SPP) != 0)
    panic("usertrap: not from user mode");
  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);

  //printf("user trap scause:%p\n",r_scause());
  struct proc *p = myproc();
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
  
  if(r_scause() == 8){
    // system call
    if(p->killed)
      exit(-1);
    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();
    syscall();
  } 
  else if((which_dev = devintr()) != 0){
    // ok
  } 
  else {
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    // trapframedump(p->trapframe);
    p->killed = 1;
  }

  if(p->killed)
    exit(-1);

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    yield();

  usertrapret();
}
```

#### syscall()处理

我们在`usys.pl`中编写了渲染中断的脚本:

```python
sub entry {
    my $name = shift;
    print ".global $name\n";
    print "${name}:\n";
    print " li a7, SYS_${name}\n";
    print " ecall\n";
    print " ret\n";
}
```

这个时候我们知道,调用中断的中断号保存在`a7`寄存器中,我们可以读取`a7`寄存器的值,通过调用函数指针数组的值来跳转到对应的函数即可.

#### 中断返回

中断返回的第一步就是调用usertrapret函数:

- 写入`stvec`寄存器:一开始在进入内核的时候为了防止内核出现中断就把`stvec`寄存器改成`kernelvec`,现在改成`uservec`即可.
- 处理`trapframe`把内核页表地址,内核栈和usertrap地址,CPU核号保存进去.
- 改变`sstatus`寄存器.
- 把断点地址写入到`sepc`寄存器中

```C
void
usertrapret(void)
{
  struct proc *p = myproc();

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
  p->trapframe->kernel_trap = (uint64)usertrap;
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
  x |= SSTATUS_SPIE; // enable interrupts in user mode
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
}
```

进入userret这个函数之前,首先传递参数:`TRAPFRAME`作为第一个参数,第二个参数就是用户态页表的地址:

- 加载用户态页表
- 栈帧中存储的寄存器值全部加载到真实的寄存器中.
- 栈帧头部的虚拟地址保存到`sscratch`寄存器

最后执行sret,把sepc寄存器的内容给pc,转换为U态,中断结束

```asm
userret:
        # userret(TRAPFRAME, pagetable)
        # switch from kernel to user.
        # usertrapret() calls here.
        # a0: TRAPFRAME, in user page table.
        # a1: user page table, for satp.

        # switch to the user page table.
        csrw satp, a1
        sfence.vma zero, zero

        # put the saved user a0 in sscratch, so we
        # can swap it with our a0 (TRAPFRAME) in the last step.
        ld t0, 112(a0)
        csrw sscratch, t0

        # restore all but a0 from TRAPFRAME
        ld ra, 40(a0)
        ld sp, 48(a0)
        ld gp, 56(a0)
        ld tp, 64(a0)
        ld t0, 72(a0)
        ld t1, 80(a0)
        ld t2, 88(a0)
        ld s0, 96(a0)
        ld s1, 104(a0)
        ld a1, 120(a0)
        ld a2, 128(a0)
        ld a3, 136(a0)
        ld a4, 144(a0)
        ld a5, 152(a0)
        ld a6, 160(a0)
        ld a7, 168(a0)
        ld s2, 176(a0)
        ld s3, 184(a0)
        ld s4, 192(a0)
        ld s5, 200(a0)
        ld s6, 208(a0)
        ld s7, 216(a0)
        ld s8, 224(a0)
        ld s9, 232(a0)
        ld s10, 240(a0)
        ld s11, 248(a0)
        ld t3, 256(a0)
        ld t4, 264(a0)
        ld t5, 272(a0)
        ld t6, 280(a0)

	# restore user a0, and save TRAPFRAME in sscratch
        csrrw a0, sscratch, a0
        
        # return to user mode and user pc.
        # usertrapret() set up sstatus and sepc.
        sret
```

#### 调用系统函数

这是一个标准的调用系统调用的样本,`a0~a6`存储系统调用需要的参数,`a7`传递了系统调用号,表示执行何种系统调用,传递完参数后就执行`ecall`.`ecall`是一个硬件指令,会把状态调整为S态然后执行`uservec`函数,接着就是我们熟知的trap处理函数.

```asm
#include "syscall.h"

# exec(init, argv)
.globl start
start:
        la a0, init
        la a1, argv
        li a7, SYS_exec
        ecall

# for(;;) exit();
exit:
        li a7, SYS_exit
        ecall
        jal exit

# char init[] = "/init\0";
init:
  .string "/init\0"

# char *argv[] = { init, 0 };
.p2align 2
argv:
  .long init
  .long 0
```

接着返回的时候就把返回值传递给a0寄存器.

```C
static uint64 (*syscalls[])(void) = {
[SYS_fork]    sys_fork,
[SYS_exit]    sys_exit,
[SYS_wait]    sys_wait,
[SYS_pipe]    sys_pipe,
[SYS_read]    sys_read,
[SYS_kill]    sys_kill,
[SYS_exec]    sys_exec,
[SYS_fstat]   sys_fstat,
[SYS_chdir]   sys_chdir,
[SYS_dup]     sys_dup,
[SYS_getpid]  sys_getpid,
[SYS_sbrk]    sys_sbrk,
[SYS_sleep]   sys_sleep,
[SYS_uptime]  sys_uptime,
[SYS_open]    sys_open,
[SYS_write]   sys_write,
[SYS_mknod]   sys_mknod,
[SYS_unlink]  sys_unlink,
[SYS_link]    sys_link,
[SYS_mkdir]   sys_mkdir,
[SYS_close]   sys_close,
};
//系统调用号,系统调用函数
void
syscall(void)
{
  int num;
  struct proc *p = myproc();

  num = p->trapframe->a7;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    p->trapframe->a0 = syscalls[num]();
  } else {
    printf("%d %s: unknown sys call %d\n",
            p->pid, p->name, num);
    p->trapframe->a0 = -1;
  }
}
```

#### 系统调用的参数

系统调用会传递参数进入,对于RISC-V来说,朴素的思想就是把参数传递到寄存器中,然后系统调用函数读取存储在寄存器中的数据.

对于直接传递的参数,我们可以直接读取,直接使用`argint`函数等,但是对于传递指针的参数,我们就需要进行额外的处理,第一个问题呢就是我们不知道程序是不是友好的,有可能用户程序通过传递地址来修改内核的内存,这样就导致了不安全的情况的发生.第二个问题就是xv6的内核态和用户态页表是不一样的.

所以说xv6的做法就是对于获得字符串的函数argstr(),去构建一个新的函数fetchstr去安全地获得数据,这个函数就会调用copyinstr()函数.

```C
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    va0 = PGROUNDDOWN(srcva);
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (srcva - va0);
    if(n > max)
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
        got_null = 1;
        break;
      } else {
        *dst = *p;
      }
      --n;
      --max;
      p++;
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    return 0;
  } else {
    return -1;
  }
}
```

这个函数会从`pagetable`这个页表对应的虚拟地址`srcva`处copy`max`字节的元素到内核页表的`dst`处.做法就是调用`walkaddr`来找到`pagetable`中`srcva`对应的物理地址,然后从这个物理地址中拷贝字节到`dst`中.

总体的思路就是,找到这个用户态虚拟地址对应的物理地址,取出这个物理地址上的元素,给到dst(内核态虚拟地址).


---------------------------------------------------

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


