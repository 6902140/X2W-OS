#ifndef __PROC_H
#define __PROC_H

#include "param.h"
#include "riscv.h"
#include "types.h"
#include "kernel/locks.h"
// #include "file.h"
// #include "fat32.h"
#include "trap.h"
#include "mmap.h"

// Saved registers for kernel context switches.
struct context {
  uint64 ra;
  uint64 sp;

  // callee-saved
  uint64 s0;
  uint64 s1;
  uint64 s2;
  uint64 s3;
  uint64 s4;
  uint64 s5;
  uint64 s6;
  uint64 s7;
  uint64 s8;
  uint64 s9;
  uint64 s10;
  uint64 s11;
};

// Per-CPU state.
struct cpu {
  struct proc *proc;          // The process running on this cpu, or null.
  struct context context;     // swtch() here to enter scheduler().
  int noff;                   // Depth of push_off() nesting.
  int intena;                 // Were interrupts enabled before push_off()?
};

extern struct cpu cpus[NCPU];

enum procstate { _UNUSED, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };

struct tms {
	uint64 utime;		// user time 
	uint64 stime;		// system time 
	uint64 cutime;		// user time of children 
	uint64 cstime;		// system time of children 
};

// Per-process state
struct proc {
  spinlock_t lock;

  // p->lock must be held when using these:
  enum procstate state;        // Process state
  struct proc *parent;         // Parent process
  void *chan;                  // If non-zero, sleeping on chan
  int killed;                  // If non-zero, have been killed
  int xstate;                  // Exit status to be returned to parent's wait
  int pid;                     // Process ID

  // these are private to the process, so p->lock need not be held.
  uint64 kstack;               // Virtual address of kernel stack
  uint64 sz;                   // Size of process memory (bytes)
  pagetable_t pagetable;       // User page table
  pagetable_t kpagetable;      // Kernel page table
  struct trapframe *trapframe; // data page for trampoline.S
  struct context context;      // swtch() here to run process
  struct file **ofile;        // Open files
  struct dirent *cwd;          // Current directory
  char name[16];               // Process name (debugging)
  int tmask;                    // trace mask
  struct tms proc_tms;
  struct mmap_info mmap_pool[MMAPNUM];
};

// 打印 CPU 寄存器的信息
void reg_info(void);

// 初始化 CPU 相关的数据结构
void cpuinit(void);

// 获取当前 CPU 的 ID
int cpuid(void);

// 终止当前进程，并返回给父进程的退出状态
void exit(int);

// 创建一个新进程作为当前进程的副本
int fork(void);

// 将当前进程的地址空间扩展到指定大小
int growproc(int);

// 获取给定进程的页表
pagetable_t proc_pagetable(struct proc *);

// 释放给定进程的页表
void proc_freepagetable(pagetable_t, uint64);

// 向指定进程发送一个终止信号
int kill(int);

// 获取当前 CPU 的 cpu 结构体指针
struct cpu* mycpu(void);

// 获取当前 CPU 的 cpu 结构体指针
struct cpu* getmycpu(void);

// 获取当前进程的 proc 结构体指针
struct proc* myproc(void);

//互斥分配pid
int allocpid(void);

// 初始化进程相关的数据结构
void procinit(void);

// 进程调度器，永远不会返回
void scheduler(void) __attribute__((noreturn));

// 进行进程调度
void sched(void);

// 设置当前进程
void setproc(struct proc*);

// 使当前进程进入睡眠状态，等待指定的事件
void sleep(void*, spinlock_t*);

// 初始化用户进程
void userinit(void);

// 初始化 getchar()
void getcharinit(void);

// 等待子进程退出
int wait(uint64);

// 根据指定的进程 ID 等待子进程退出
int wait4pid(int, uint64);

// 唤醒等待的进程
void wakeup(void*);

// 使当前进程主动让出 CPU
void yield(void);

// 从用户空间复制数据到内核空间
int either_copyout(int user_dst, uint64 dst, void *src, uint64 len);

// 从内核空间复制数据到用户空间
int either_copyin(void *dst, int user_src, uint64 src, uint64 len);

// 打印进程信息
void procdump(void);

// 获取当前活动进程的数量
uint64 procnum(void);

// 测试进程初始化
void test_proc_init(int);

// 创建一个新进程作为当前进程的副本，并克隆指定的标志和堆栈
int clone(uint64 flag,uint64 stack);

// 进程时钟中断处理函数
void proc_tick(void);

#endif
