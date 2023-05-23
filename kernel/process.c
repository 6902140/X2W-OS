#include"types.h"
#include "process.h"
#include "kernel/paging.h"

struct cpu cpus[NCPU];

struct process processes[NPROC];

struct process* initproc;

int nextpid=1;

spinlock_t pid_lock;

// helps ensure that wakeups of wait()ing
// parents are not lost. helps obey the
// memory model when using p->parent.
// must be acquired before any p->lock.
spinlock_t wait_lock;



// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void process_statck_map(pagetable_t kernel_pgdir){
    struct process *p=processes;
    
    for(;p<&processes[NPROC];p++){
        uint64_t pa=alloc_ppage(True);
        ASSERT(pa!=0,"process[%u] stack malloc error\n",p);
        uint64_t va=KSTACK((int) (p - processes));
        page_property_t pproperty = { (uint64_t) KERNEL_PAGE};
        // 操作页目录表完成虚拟页-物理页映射
        create_mapping(kernel_pgdir, va, pa, PAGE_SIZE, pproperty, 0);
    }
}

void procinit(void)
{
    struct process* p=processes;

    spinlock_init(&pid_lock,"pid_alloctor");
    spinlock_init(&wait_lock,"wait lock");

    for(;p<&(processes[NPROC]);p++)
    
    {
        spinlock_init(&p->lock,"processes");
        p->state=_UNUSED;
        p->kstack=KSTACK((int) (p - processes));
    }

}

int cpuid(void)
{
    int id=read_tp();
    return id;
}

struct cpu* mycpu(void){
    int id=cpuid();
    struct cpu* tempc=&cpus[id];
    return tempc;
}

struct process* myproc(void){
    push_off();
    struct cpu* tempc=mycpu();
    struct process*tempp=tempc->proc;
    pop_off();
    return tempp;
    
}

int allocpid(void){
    int pid;
    spinlock_acquire(&pid_lock);
    pid=nextpid;
    nextpid++;
    spinlock_release(&pid_lock);
    return pid;
}

struct process* allocproc(void){
    struct process* p;
    for(p=processes;p<&processes[NPROC];p++)
    {
        spinlock_acquire(&p->lock);
        if(p->state==_UNUSED){
            goto FOUND;
        }
        else{
            spinlock_release(&p->lock);
        }
    }
FOUND:
    p->pid=allocpid();
    p->state=_USED;
    p->trapframe=(struct trapframe*)malloc_page(1,1);
    if(p->trapframe==0){
        freeproc(p);
        spinlock_release(&p->lock);
        return 0;
    }

    p->pagetable = proc_pagetable(p);
    if(p->pagetable == 0){
        freeproc(p);
        spinlock_release(&p->lock);
        return 0;
    }

    // Set up new context to start executing at forkret,
    // which returns to user space.
    memset(&p->context, 0, sizeof(p->context));
    p->context.ra = (uint64_t)forkret;
    p->context.sp = p->kstack + PGSIZE;

    return p;

}


void freeproc(struct process*p)
{
    if(p->trapframe){
        //to do free;
    }
    if(p->pagetable){

    }
    p->trapframe = 0;
  
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

pagetable_t proc_pagetable(struct process * p){
    pagetable_t pagetable;

  // An empty page table.
    pagetable = uvmcreate();
    if(pagetable == 0)
        return 0;

    if(mappages(pagetable, TRAMPOLINE, PGSIZE,
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    return 0;
  }
}


// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void forkret(void)
{
  static int first = 1;

  // Still holding p->lock from scheduler.
  spinlock_release(&myproc()->lock);

//   if (first) {
//     // File system initialization must be run in the context of a
//     // regular process (e.g., because it calls sleep), and thus cannot
//     // be run from main().
//     first = 0;
//     fsinit(ROOTDEV);
//   }

  usertrapret();
}
