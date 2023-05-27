/* task management */
#include "trap/trapframe.h"
#include "stdlist.h"
#include "types.h"
#include "kernel/locks.h"


#define MAX_PROCESS_NUM 64
#define INUSE 0
#define USED 1
#define SLEEP 2
#define RUNNABLE 3
#define STOPPED 4
#define ZOMBIE 5


typedef struct __pcb_t{
    list_elem_t link;
    int pid;
    int priority;
    int counter;
    spinlock_t slock;
    uint8_t state;
    uint64_t* pgd;
    uint64_t* kstack;
    struct __pcb_t* father;
    ktrapframe_t* frame;
}pcb;


void process_init(void);
void init_tcb(pcb* t);