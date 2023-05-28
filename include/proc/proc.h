#ifndef __PROC_H__
#define __PROC_H__

#include "types.h"
#include "kernel/locks.h"
#include "fs/deffs.h"

#define NPROC 50
#define INITCODESIZE 52
#define CONTEXT_SIZE 112
#define NCPUS 1
#define N_OPEN_FILE 150

typedef enum procState_t procState_t;
typedef struct trapFrame_t trapFrame_t;
typedef struct context_t context_t;
typedef struct proc_t proc_t;
typedef struct cpu_t cpu_t;

// fs.h
typedef struct filesStruct_t filesStruct_t;

enum procState_t { _UNUSED, NEW, READY, RUNNING, SLEEPING, ZOMBIE };

struct trapFrame_t {
    register_t kernel_satp;        // 0
    register_t kernel_sp;          // 8
    register_t user_trap_address;  // 16
    register_t u_pc;               // 24
    register_t kernel_hartid;      // 32
    register_t ra;                 // 40
    register_t sp;                 // 48
    register_t gp;                 // 56
    register_t tp;                 // 64
    register_t t0;                 // 72
    register_t t1;                 // 80
    register_t t2;                 // 88
    register_t s0;                 // 96
    register_t s1;                 // 104
    register_t a0;                 // 112
    register_t a1;                 // 120
    register_t a2;                 // 128
    register_t a3;                 // 136
    register_t a4;                 // 144
    register_t a5;                 // 152
    register_t a6;                 // 160
    register_t a7;                 // 168
    register_t s2;                 // 176
    register_t s3;                 // 184
    register_t s4;                 // 192
    register_t s5;                 // 200
    register_t s6;                 // 208
    register_t s7;                 // 216
    register_t s8;                 // 224
    register_t s9;                 // 232
    register_t s10;                // 240
    register_t s11;                // 248
    register_t t3;                 // 256
    register_t t4;                 // 264
    register_t t5;                 // 272
    register_t t6;                 // 280
};

struct context_t {
    register_t ra;
    register_t sp;
    register_t s0;
    register_t s1;
    register_t s2;
    register_t s3;
    register_t s4;
    register_t s5;
    register_t s6;
    register_t s7;
    register_t s8;
    register_t s9;
    register_t s10;
    register_t s11;
};

typedef struct tms_t {
    uint64_t tms_utime;
    uint64_t tms_stime;
    uint64_t tms_cutime;
    uint64_t tms_cstime;
    uint64_t entry_kernel;
    uint64_t leave_kernel;
} tms_t;
struct proc_t {
    procState_t state;
    uint32_t waitState;
    uint32_t xstatus;
    pid_t pid;
    void* chan;
    pageTable_t upageTable;
    pageTable_t kpageTable;
    trapFrame_t* trapFrame;
    context_t context;
    void* kstack;       // TODO
    filesStruct_t* fp;  // TODO
    dirent_t* cwd;
    file_t* openFiles[N_OPEN_FILE];
    // semaphore_t lk;
    spinlock_t lk;
    proc_t* parent;
    size_t size;
    uint16_t isForked;
    void* heap;
    tms_t tms;
    char* path;
};

#define WT_INTERRUPTED 0x80000000               // the wait state could be interrupted
#define WT_CHILD (0x00000001 | WT_INTERRUPTED)  // wait child process
#define WT_KSEM 0x00000100                      // wait kernel semaphore
#define WT_TIMER (0x00000002 | WT_INTERRUPTED)  // wait timer
#define WT_KBD (0x00000004 | WT_INTERRUPTED)    // wait the input of keyboard

struct cpu_t {
    struct context_t context;
    proc_t* current_p;
    uint32_t lk_num;
    uint32_t before_lk_intr;
};

void proc_init(void);
pid_t alloc_pid(void);
proc_t* getCurrentProc(void);
cpu_t* getCurrentCPU(void);
void scheduler(void);
void yield(void);
void sched(void);
void creat_first_proc(void);
proc_t* alloc_proc(void);
void sleep_spin(void* chan, spinlock_t* lk);
void proc_wakeupSpin(void* chan);
int fork(void);
void reparent(proc_t* p);
void proc_wakeup(proc_t* p);
pid_t wait(pid_t pid);
// riscv
// void contentSwitch(context_t*, context_t*);

// debug
void proc_wakeup(proc_t* w_proc);

#endif