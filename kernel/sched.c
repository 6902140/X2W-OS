#include "psched.h"
#include "types.h"
#include "trap/trapframe.h"
#include "stdlist.h"
#include "kernel/mm.h"
#include "kernel/paging.h"
#include "kernel/kdebug.h"
#include "string.h"

list_t unused_pcb;
list_t running_pcb;
list_t sleeping_pcb;

extern char _s_kernel_pgd[];

pcb pcbarr[MAX_PROCESS_NUM];
uint64_t* kstack_arr[MAX_PROCESS_NUM];
uint64_t* pgd_arr[MAX_PROCESS_NUM];

void process_init(void)
{
    list_init(&unused_pcb);
    list_init(&running_pcb);
    list_init(&sleeping_pcb);
    for(int i=0;i<MAX_PROCESS_NUM;i++){
        list_insert(&unused_pcb.tail,&pcbarr[i].link);
        kstack_arr[i]=(uint64_t*)alloc_ppage(1);
        pgd_arr[i]=(uint64_t*)alloc_ppage(1);
    }
}



void init_tcb(pcb* t)
{
    t->pid=(t-pcbarr)/sizeof(pcb);
    t->kstack=kstack_arr[t->pid];
    t->pgd=pgd_arr[t->pid];
    t->state=INUSE;
    t->frame=(ktrapframe_t*)t->kstack+4096-sizeof(ktrapframe_t);
    memcpy((void*)t->pgd,(void*)_s_kernel_pgd,4096);
    memset((void*)t->kstack,0,4096);
}