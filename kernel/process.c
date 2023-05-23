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