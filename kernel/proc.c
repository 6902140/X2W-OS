








#include "types.h"
#include "riscv.h"

#include "kernel/kstdio.h"
#include "kernel/vm.h"
#include "kernel/locks.h"
#include "kernel/intr.h"
#include "kernel/proc.h"
#include "memlayout.h"
#include "kernel/kalloc.h"

struct cpu cpus[NCPU];

struct proc proc[NPROC];

struct proc* initproc;

int nextpid=1;

int procfirst=1;

spinlock_t pid_lock;

extern void forkret(void);
extern void swtch(struct context*, struct context*);
static void wakeup1(struct proc *chan);
static void freeproc(struct proc *p);


extern char trampoline[]; // trampoline.S
extern uchar initcode[]; // trampoline.S
extern int initcodesize;

void reg_info(void) {
  kprintf("register info: {\n");
  kprintf("sstatus: %p\n", r_sstatus());
  kprintf("sip: %p\n", r_sip());
  kprintf("sie: %p\n", r_sie());
  kprintf("sepc: %p\n", r_sepc());
  kprintf("stvec: %p\n", r_stvec());
  kprintf("satp: %p\n", r_satp());
  kprintf("scause: %p\n", r_scause());
  kprintf("stval: %p\n", r_stval());
  kprintf("sp: %p\n", r_sp());
  kprintf("tp: %p\n", r_tp());
  kprintf("ra: %p\n", r_ra());
  kprintf("}\n");
}

void cpuinit(void){
    memset(cpus,0,sizeof(cpus));
}

//在进入内核时立马初始化化进程数组
void procinit(void)
{
    struct proc* p;
    spinlock_init(&pid_lock, "nextpid");
      for(p = proc; p < &proc[NPROC]; p++) {
      spinlock_init(&p->lock, "proc");
      p->state = _UNUSED;
      p->parent = NULL;
      
      // Allocate a page for the process's kernel stack.
      // Map it high in memory, followed by an invalid
      // guard page.
      // char *pa = kalloc();
      // // printf("[procinit]kernel stack: %p\n", (uint64)pa);
      // if(pa == 0)
      //   panic("kalloc");
      // uint64 va = KSTACK((int) (p - proc));
      // // printf("[procinit]kvmmap va %p to pa %p\n", va, (uint64)pa);
      // kvmmap(va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
      // p->kstack = va;
  }
  #ifdef DEBUG
  kprintf("procinit\n");
  #endif
}

// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int cpuid()
{
  int id = r_tp();
  return id;
}


// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*mycpu(void) {
  int id = cpuid();
  struct cpu *c = &cpus[id];
  
  return c;
}

struct proc* myproc(void) {
  push_off();
  struct cpu *c = mycpu();
  struct proc *p = c->proc;
  pop_off();
  return p;
}

int allocpid(void) {
  int pid;
  
  spinlock_acquire(&pid_lock);
  pid = nextpid;
  nextpid = nextpid + 1;
  spinlock_release(&pid_lock);

  return pid;
}







// Look in the process table for an UNUSED proc.
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
UNUSED static struct proc* allocproc(void)
{
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    spinlock_acquire(&p->lock);
    if(p->state == _UNUSED) {
      goto found;
    } else {
      spinlock_release(&p->lock);
    }
  }
  return NULL;

found:
  p->pid = allocpid();
  p->killed = 0;

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    spinlock_release(&p->lock);
    return NULL;
  }

  // An empty user page table.
  // And an identical kernel page table for this proc.
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
      (p->kpagetable = proc_kpagetable()) == NULL) {
    freeproc(p);
    spinlock_release(&p->lock);
    return NULL;
  }

//   p->ofile = (struct file**)kalloc();
//   if(!p->ofile){
//     panic("proc ofile init\n");
//   }

//   for(int fd = 0; fd < NOFILE; fd++){
//     p->ofile[fd] = NULL;
//   }
//   memset(p->ofile, 0, PGSIZE);

  for(int i = 0; i < MMAPNUM; ++i){
    p->mmap_pool[i].used = 0;
  }

  p->kstack = VKSTACK;

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
  p->context.ra = (uint64)forkret;
  p->context.sp = p->kstack + PGSIZE;
  p->proc_tms.utime = 0;
	p->proc_tms.stime = 0;
	p->proc_tms.cutime = 1;
	p->proc_tms.cstime = 1;
  return p;
}


UNUSED static void wakeup1(struct proc *p)
{
  if(!holding(&p->lock))
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    p->state = RUNNABLE;
  }
}


// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
  if(p->trapframe)
    kfree((void*)p->trapframe);
  p->trapframe = 0;
  if(p->ofile)
    kfree((void*)p->ofile);
  p->ofile = 0;

  if (p->kpagetable) {
    kvmfree(p->kpagetable, 1);
  }
  p->kpagetable = 0;
  if(p->pagetable)
    proc_freepagetable(p->pagetable, p->sz);
  p->pagetable = 0;
  p->sz = 0;
  p->pid = 0;
  p->parent = 0;
  p->name[0] = 0;
  p->chan = 0;
  p->killed = 0;
  p->xstate = 0;
  p->state = _UNUSED;
}




















// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void forkret(void)
{
  // printf("run in forkret\n");

  // Still holding p->lock from scheduler.
  spinlock_release(&myproc()->lock);

  if (procfirst) {
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    // printf("[forkret]first scheduling\n");
    procfirst = 0;
// #ifndef _hello
//     fs_init();
//     // fat32_init();
//     myproc()->cwd = ename("/");
// #endif
  }

  usertrapret();
}







// Create a user page table for a given process,
// with no user memory, but with trampoline pages.
pagetable_t
proc_pagetable(struct proc *p)
{
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
  if(pagetable == 0)
    return NULL;

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    return NULL;
  }

  // map the trapframe just below TRAMPOLINE, for trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    uvmfree(pagetable, 0);
    return NULL;
  }

  return pagetable;
}

void proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
  vmunmap(pagetable, TRAPFRAME, 1, 0);
  uvmfree(pagetable, sz);
}