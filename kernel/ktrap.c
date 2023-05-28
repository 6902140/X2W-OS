/**
 * @file ktrap.c
 * @author Shihong Wang (jack4shihong@gmail.com)
 * @brief `ktrap.c`是内核的异常/中断管理模块
 * @version 0.1
 * @date 2023-04-20
 * 
 * @copyright Copyright Shihong Wang (c) 2023 with GNU Public License V3.0
 */

#include "asm/csr.h"
#include "kernel/ktrap.h"
#include "kernel/kplic.h"
#include "kernel/ktimer.h"
#include "kernel/kstdio.h"
#include "riscv.h"
#include "memlayout.h"
#include "kernel/proc.h"

extern void kernelvec(void);


// Interrupt flag: set 1 in the Xlen - 1 bit
#define INTERRUPT_FLAG    0x8000000000000000L

// Supervisor interrupt number
#define INTR_SOFTWARE    (0x1 | INTERRUPT_FLAG)
#define INTR_TIMER       (0x5 | INTERRUPT_FLAG)
#define INTR_EXTERNAL    (0x9 | INTERRUPT_FLAG)

// Supervisor exception number
#define EXCP_LOAD_ACCESS  0x5
#define EXCP_STORE_ACCESS 0x7
#define EXCP_ENV_CALL     0x8
#define EXCP_LOAD_PAGE    0xd // 13
#define EXCP_STORE_PAGE   0xf // 15




// 中断的提示信息
const char *kintr_msg[MAX_INTR_EXCP_INFO_NUM] = {
    "Undelegated Interrupt",
    "Supervisor Software Interrupt",
    "Undelegated Interrupt",
    "Undelegated Interrupt",
    "Undelegated Interrupt",
    "Supervisor Timer Interrupt",
    "Undelegated Interrupt",
    "Undelegated Interrupt",
    "Undelegated Interrupt",
    "Supervisor External Interrupt",
    "Undelegated Interrupt",
    "Undelegated Interrupt"
};

// 异常的提示信息
const char *kexcp_msg[MAX_INTR_EXCP_INFO_NUM] = {
    "Instrution Address Misaligned",
    "Undelegated Exception",
    "Undelegated Exception",
    "Breakpoint",
    "Undelegated Exception",
    "Load access Fault",
    "Undelegated Exception",
    "Store/AMO Access Fault",
    "Environment Call from U-Mode",
    "Undelegated Exception",
    "Undelegated Exception",
    "Undelegated Exception",
    "Instruction Page Fault",
    "Load Page Fault",
    "Undelegated Exception",
    "Store/AMO Page Fault"
};
extern char trampoline[], uservec[], userret[];
// 中断处理函数表
ktrap_handler_t intr_handlers[MAX_INTR_EXCP_INFO_NUM];

// 异常处理函数表
ktrap_handler_t excp_handlers[MAX_INTR_EXCP_INFO_NUM];


void ktrap_init(void){
    kprintf("KTrap Info:\n");
    // 设置当前运行线程为内核线程
    write_csr(sscratch, 0);
    // 设置中断向量地址, 设置为直接模式
    kprintf("\tSet stvec to %#X, mode=%s\n", (addr_t) ktrap_enter, "DIRECT");
    write_csr(stvec, ((addr_t)ktrap_enter & (~((addr_t)TVEC_TRAP_DIRECT))));
    // 开启所有的中断
    kprintf("\tEnable All Supervisor Interrupts");
    write_csr(sie, -1);
    // 为所有的异常和中断注册通用异常处理函数
    for (size_t i = 0; i < MAX_INTR_EXCP_INFO_NUM; i++)
        register_ktrap_handler(i, False, NULL, general_ktrap_handler);
    for (size_t i = 0; i < MAX_INTR_EXCP_INFO_NUM; i++)
        register_ktrap_handler(i, True, NULL, general_ktrap_handler);
    // 为S模式下的时钟中断注册中断处理函数
    kprintf("\tRegister Supervisor Timer Interrupt Handler");
    register_ktrap_handler(CAUSE_INTERRUPT_S_TIMER_INTERRUPT, True, "Supervisor Timer Interrupt", ktimer_interrupt_handler);
    // 为S模式下的外部中断注册中断处理函数
    kprintf("\tRegister Supervisor External Interrupt Handler");
    register_ktrap_handler(CAUSE_INTERRUPT_S_EXTERNAL_INTERRUPT, True, "Supervisor External Interrupt", kplic_interrupt_handler);
}


void ktrap_dispatcher(ktrapframe_t *ktf_ptr){
    ireg_t scause = read_csr(scause);

    Bool is_interrupt = ((scause & CAUSE_INTERRUPT_FLAG) != 0) ? 1 : 0;
    uint64_t trap_code = scause & ~(CAUSE_INTERRUPT_FLAG);
    int64_t rtval UNUSED = (is_interrupt ? intr_handlers : excp_handlers)[trap_code](ktf_ptr);
}


NO_RETURN int64_t general_ktrap_handler(ktrapframe_t *ktf_ptr){
    ireg_t scause = read_csr(scause);
    Bool is_interrupt = ((scause & CAUSE_INTERRUPT_FLAG) != 0) ? 1 : 0;
    uint64_t trap_code = scause & ~(CAUSE_INTERRUPT_FLAG);
    const char **msg_source = (is_interrupt ? kintr_msg : kexcp_msg);
    const char *msg = msg_source[trap_code];
    const char *s = is_interrupt ? "Interrupt" : "Exception";
    kprintf("==================================================================\n");
    kprintf("Message from Kernel General Trap Handler:\n");
    kprintf("%s Happened, %s ID: %#X, scause register: %#X\n", s, s, trap_code, scause);
    kprintf("Detailed Message: %s\n", msg);
    kprintf("No %s handler register for this %s, with ID: %#X\n", s, s, trap_code);
    kprintf("Running %s instead\n", __func__);
    kprintf("Printing Trap Frame:\n");
    print_ktrapframe(ktf_ptr, kprintf);
    kprintf("Please register handler to avoid hanging!\n");
    kprintf("Hanging HART Here\n");
    while (1);
    UNREACHABLE;
}


void register_ktrap_handler(uint64_t trap_code, Bool interrupt, const char* msg, ktrap_handler_t trap_func){
    if (msg != NULL)
        (interrupt ? kintr_msg : kexcp_msg)[trap_code] = msg;
    (interrupt ? intr_handlers : excp_handlers)[trap_code] = trap_func;
}


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
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
  
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
}





void
usertrap(void)
{
//   int which_dev = 0;

  if((r_sstatus() & SSTATUS_SPP) != 0)
    panic("usertrap: not from user mode");
  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);

  //printf("user trap scause:%p\n",r_scause());
  struct proc *p = myproc();
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
  
  uint64 cause = r_scause();

  if(cause == EXCP_ENV_CALL){
    // system call
    if(p->killed)
    panic(" to be finished : exit");
     // exit(-1);
    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();

    panic("to be done:: finish syscall\n\0");
    //to do 

    //syscall();
  } 
//   else if((which_dev = devintr()) != 0){
//     // ok
//   } 
//   else if(handle_excp(cause) == 0)
//   {

//   }
  else {
    kprintf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    kprintf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    trapframedump(p->trapframe);
    p->killed = 1;
  }

  if(p->killed)panic(" to be finished : exit");
    // exit(-1);

  // give up the CPU if this is a timer interrupt.
//   if(which_dev == 2)
//     yield();
  usertrapret();
}







int
handle_excp(uint64 scause)
{
  switch (scause)
  {
//   case EXCP_STORE_PAGE:
//   #ifndef QEMU
//   case EXCP_STORE_ACCESS:
//   #endif
//     return handle_page_fault(1, r_stval());
//   case EXCP_LOAD_PAGE:
//   #ifndef QEMU
//   case  EXCP_LOAD_ACCESS:
//   #endif
//     return handle_page_fault(0, r_stval());
  default:
    return -1;
  }
}



// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap() {
//   int which_dev = 0;
  uint64 sepc = r_sepc();
  uint64 sstatus = r_sstatus();
  //uint64 scause = r_scause();
  //printf("kerneltrap scause:%p\n",scause);
  if((sstatus & SSTATUS_SPP) == 0)
    panic("kerneltrap: not from supervisor mode");
  if(intr_get() != 0)
    panic("kerneltrap: interrupts enabled");

//   if((which_dev = devintr()) == 0){
//     printf("\nscause %p\n", scause);
//     printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
//     struct proc *p = myproc();
//     if (p != 0) {
//       printf("pid: %d, name: %s\n", p->pid, p->name);
//     }
//     panic("kerneltrap");
//   }
  // printf("which_dev: %d\n", which_dev);
  
  // give up the CPU if this is a timer interrupt.
//   if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
//     yield();
//   }
  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
  w_sstatus(sstatus);
}







void trapframedump(struct trapframe *tf)
{
  kprintf("a0: %p\t", tf->a0);
  kprintf("a1: %p\t", tf->a1);
  kprintf("a2: %p\t", tf->a2);
  kprintf("a3: %p\n", tf->a3);
  kprintf("a4: %p\t", tf->a4);
  kprintf("a5: %p\t", tf->a5);
  kprintf("a6: %p\t", tf->a6);
  kprintf("a7: %p\n", tf->a7);
  kprintf("t0: %p\t", tf->t0);
  kprintf("t1: %p\t", tf->t1);
  kprintf("t2: %p\t", tf->t2);
  kprintf("t3: %p\n", tf->t3);
  kprintf("t4: %p\t", tf->t4);
  kprintf("t5: %p\t", tf->t5);
  kprintf("t6: %p\t", tf->t6);
  kprintf("s0: %p\n", tf->s0);
  kprintf("s1: %p\t", tf->s1);
  kprintf("s2: %p\t", tf->s2);
  kprintf("s3: %p\t", tf->s3);
  kprintf("s4: %p\n", tf->s4);
  kprintf("s5: %p\t", tf->s5);
  kprintf("s6: %p\t", tf->s6);
  kprintf("s7: %p\t", tf->s7);
  kprintf("s8: %p\n", tf->s8);
  kprintf("s9: %p\t", tf->s9);
  kprintf("s10: %p\t", tf->s10);
  kprintf("s11: %p\t", tf->s11);
  kprintf("ra: %p\n", tf->ra);
  kprintf("sp: %p\t", tf->sp);
  kprintf("gp: %p\t", tf->gp);
  kprintf("tp: %p\t", tf->tp);
  kprintf("epc: %p\n", tf->epc);
}