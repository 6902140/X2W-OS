# 0 "kernel/kmain.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "kernel/kmain.c"
# 11 "kernel/kmain.c"
# 1 "include/types.h" 1
# 14 "include/types.h"
# 1 "include/constrains.h" 1
# 15 "include/types.h" 2
# 23 "include/types.h"
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long uint64_t;


typedef char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long int64_t;


typedef unsigned char Bool;
enum {
    False = 0,
    True = 1
};


typedef uint64_t size_t;


typedef uint8_t byte;


typedef int64_t offset_t;


typedef uint64_t addr_t;


typedef uint64_t ireg_t;


typedef uint64_t freg_t;

typedef uint64_t* pagetable_t;
typedef uint64_t pde_t;
# 12 "kernel/kmain.c" 2
# 1 "include/test/test.h" 1
# 28 "include/test/test.h"
typedef int (*test_func_pointer_t)(void);







void register_test_func(test_func_pointer_t func);





void test_all(void);
# 13 "kernel/kmain.c" 2
# 1 "include/device/ddr.h" 1
# 16 "include/device/ddr.h"
# 1 "include/constrains.h" 1
# 17 "include/device/ddr.h" 2
# 14 "kernel/kmain.c" 2
# 1 "include/device/uart.h" 1
# 21 "include/device/uart.h"
# 1 "include/io.h" 1
# 18 "include/io.h"
# 1 "include/types.h" 1
# 19 "include/io.h" 2
# 29 "include/io.h"
static inline void write_8_bits(uint64_t addr, uint8_t value);







static inline void write_16_bits(uint64_t addr, uint16_t value);







static inline void write_32_bits(uint64_t addr, uint32_t value);







static inline void write_64_bits(uint64_t addr, uint64_t value);
# 62 "include/io.h"
static inline uint8_t read_8_bits(uint64_t addr);







static inline uint16_t read_16_bits(uint64_t addr);
# 79 "include/io.h"
static inline uint32_t read_32_bits(uint64_t addr);







static inline uint64_t read_64_bits(uint64_t addr);
# 160 "include/io.h"
static inline uint8_t read_8_bits(addr_t addr){ uint8_t __v = *(volatile uint8_t*)addr; __asm__ __volatile__ ("" : : : "memory"); return __v; };
static inline uint16_t read_16_bits(addr_t addr){ uint16_t __v = *(volatile uint16_t*)addr; __asm__ __volatile__ ("" : : : "memory"); return __v; };
static inline uint32_t read_32_bits(addr_t addr){ uint32_t __v = *(volatile uint32_t*)addr; __asm__ __volatile__ ("" : : : "memory"); return __v; };
static inline uint64_t read_64_bits(addr_t addr){ uint64_t __v = *(volatile uint64_t*)addr; __asm__ __volatile__ ("" : : : "memory"); return __v; };

static inline void write_8_bits(addr_t addr, uint8_t value){ uint8_t __v = value; __asm__ __volatile__ ("" : : : "memory"); *(volatile uint8_t*)addr = __v; };
static inline void write_16_bits(addr_t addr, uint16_t value){ uint16_t __v = value; __asm__ __volatile__ ("" : : : "memory"); *(volatile uint16_t*)addr = __v; };
static inline void write_32_bits(addr_t addr, uint32_t value){ uint32_t __v = value; __asm__ __volatile__ ("" : : : "memory"); *(volatile uint32_t*)addr = __v; };
static inline void write_64_bits(addr_t addr, uint64_t value){ uint64_t __v = value; __asm__ __volatile__ ("" : : : "memory"); *(volatile uint64_t*)addr = __v; };
# 22 "include/device/uart.h" 2

# 1 "include/asm/uart.h" 1
# 24 "include/device/uart.h" 2
# 35 "include/device/uart.h"
void uart_init(void);






char uart_get(void);
# 51 "include/device/uart.h"
void uart_put(char chr);
# 60 "include/device/uart.h"
void uart_puts(const char *string);







void uart_interrupt_handler(void);
# 15 "kernel/kmain.c" 2
# 1 "include/kernel/ktrap.h" 1
# 15 "include/kernel/ktrap.h"
# 1 "include/asm/csr.h" 1
# 16 "include/kernel/ktrap.h" 2

# 1 "include/trap/trapframe.h" 1
# 29 "include/trap/trapframe.h"
typedef struct __gtrapframe_t {

    union { ireg_t _x1; ireg_t ra; };

    union { ireg_t _x2; ireg_t sp; };

    union { ireg_t _x3; ireg_t gp; };

    union { ireg_t _x4; ireg_t tp; };

    union { ireg_t _x5; ireg_t t0; };

    union { ireg_t _x6; ireg_t t1; };

    union { ireg_t _x7; ireg_t t2; };

    union { ireg_t _x8; ireg_t s0; ireg_t fp; };

    union { ireg_t _x9; ireg_t s1; };

    union { ireg_t _x10; ireg_t a0; };

    union { ireg_t _x11; ireg_t a1; };

    union { ireg_t _x12; ireg_t a2; };

    union { ireg_t _x13; ireg_t a3; };

    union { ireg_t _x14; ireg_t a4; };

    union { ireg_t _x15; ireg_t a5; };

    union { ireg_t _x16; ireg_t a6; };

    union { ireg_t _x17; ireg_t a7; };

    union { ireg_t _x18; ireg_t s2; };

    union { ireg_t _x19; ireg_t s3; };

    union { ireg_t _x20; ireg_t s4; };

    union { ireg_t _x21; ireg_t s5; };

    union { ireg_t _x22; ireg_t s6; };

    union { ireg_t _x23; ireg_t s7; };

    union { ireg_t _x24; ireg_t s8; };

    union { ireg_t _x25; ireg_t s9; };

    union { ireg_t _x26; ireg_t s10; };

    union { ireg_t _x27; ireg_t s11; };

    union { ireg_t _x28; ireg_t t3; };

    union { ireg_t _x29; ireg_t t4; };

    union { ireg_t _x30; ireg_t t5; };

    union { ireg_t _x31; ireg_t t6; };
# 127 "include/trap/trapframe.h"
} gtrapframe_t;



typedef struct __strapframe_t {

    ireg_t mepc;

    gtrapframe_t gregisters;

    ireg_t mstatus;
} strapframe_t;



typedef struct __ktrapframe_t {

    ireg_t sepc;

    gtrapframe_t gregisters;

    ireg_t sstatus;

    ireg_t sbadaddr;

    ireg_t scause;

    ireg_t origin_a0;
} ktrapframe_t;



typedef size_t (*printf_t)(const char* format, ...);
# 168 "include/trap/trapframe.h"
void print_gtrapframe(gtrapframe_t *gtf_ptr, printf_t print_func);
# 177 "include/trap/trapframe.h"
void print_strapframe(strapframe_t *stf_ptr, printf_t print_func);
# 186 "include/trap/trapframe.h"
void print_ktrapframe(ktrapframe_t *ktf_ptr, printf_t print_func);
# 18 "include/kernel/ktrap.h" 2
# 1 "include/trap/trap_entry.h" 1
# 24 "include/trap/trap_entry.h"
extern void strap_enter(void);
# 33 "include/trap/trap_entry.h"
extern void strap_exit(void);
# 43 "include/trap/trap_entry.h"
extern void ktrap_enter(void);
# 52 "include/trap/trap_entry.h"
extern void ktrap_exit(void);
# 19 "include/kernel/ktrap.h" 2
# 31 "include/kernel/ktrap.h"
typedef int64_t (*ktrap_handler_t)(ktrapframe_t *ktf_ptr);





static inline void supervisor_interrupt_enable(void){
    ({ unsigned long __v = (unsigned long) (0x00000002UL); __asm__ __volatile__( "csrs " "sstatus" ", %0" : : "rK" (__v) : "memory" ); });
}




static inline void supervisor_interrupt_disable(void){
    ({ unsigned long __v = (unsigned long) (0x00000002UL); __asm__ __volatile__( "csrc " "sstatus" ", %0" : : "rK" (__v) : "memory" ); });
}







void ktrap_init(void);







void ktrap_dispatcher(ktrapframe_t *ktf_ptr);
# 73 "include/kernel/ktrap.h"
void register_ktrap_handler(uint64_t trap_code, Bool interrupt, const char* msg, ktrap_handler_t ktrap_func);
# 82 "include/kernel/ktrap.h"
__attribute__((noreturn)) int64_t general_ktrap_handler(ktrapframe_t *ktf_ptr);
# 16 "kernel/kmain.c" 2
# 1 "include/kernel/kmain.h" 1
# 34 "include/kernel/kmain.h"
extern char kernel_entry[];







extern char _s_kernel[], _e_kernel[];







extern char _s_text_boot[], _e_text_boot[];







extern char _s_text[], _e_text[];







extern char _s_rodata[], _e_rodata[];







extern char _s_data[], _e_data[];







extern char _s_bss[], _e_bss[];




void kernel_main(void);






void print_kmem(void);
# 17 "kernel/kmain.c" 2
# 1 "include/kernel/kinit.h" 1
# 24 "include/kernel/kinit.h"
void kinit_all(void);
# 18 "kernel/kmain.c" 2
# 1 "include/kernel/kdebug.h" 1
# 15 "include/kernel/kdebug.h"
# 1 "include/kernel/kstdio.h" 1
# 16 "include/kernel/kstdio.h"
# 1 "include/stdfmt.h" 1
# 15 "include/stdfmt.h"
# 1 "include/stdarg.h" 1
# 34 "include/stdarg.h"
typedef __builtin_va_list va_list;
# 69 "include/stdarg.h"
typedef char* _my_va_list;
# 16 "include/stdfmt.h" 2
# 1 "include/string.h" 1
# 32 "include/string.h"
size_t memset(void *dst, byte value, size_t size);
# 43 "include/string.h"
size_t strmset(void *dst, char value, size_t size);
# 57 "include/string.h"
size_t memcpy(void *dst, const void* src, size_t size);
# 72 "include/string.h"
size_t memmove(void* dst, const void *src, size_t size);
# 87 "include/string.h"
int8_t memcmp(const void *a, const void *b, size_t size);
# 99 "include/string.h"
char* strcpy(char *dst, const char *src);
# 109 "include/string.h"
size_t strlen(const char* str);
# 123 "include/string.h"
int8_t strcmp(const char* a, const char* b);
# 136 "include/string.h"
char* strcat(char *dst, const char* src);
# 151 "include/string.h"
char* strchr(const char* str, const uint8_t ch);
# 166 "include/string.h"
char* strrchr(const char* str, const uint8_t ch);
# 176 "include/string.h"
size_t strchrs(const char* str, const uint8_t ch);
# 187 "include/string.h"
size_t strslice(const char* src, char* dst, int64_t start, int64_t len);
# 196 "include/string.h"
void encrypt_decrypt(char *str, int len, char key);

int regu_match(const char *str, const char *pattern, int match_pos[]);
# 209 "include/string.h"
void regu_replace(char *str, const char *pattern, const char *replacement, int max_len);
# 17 "include/stdfmt.h" 2
# 1 "include/stdlib.h" 1
# 82 "include/stdlib.h"
void itoa(uint64_t integer, char** buf_ptr_addr, uint8_t base);






int64_t atoi(char* str);
# 18 "include/stdfmt.h" 2
# 32 "include/stdfmt.h"
const char* _scan_number(const char *str, int* num);
# 45 "include/stdfmt.h"
char *copy_number(char *str, unsigned long num, int base, int width, int precision, int flag);
# 91 "include/stdfmt.h"
size_t vsprintf(char* str, const char* format, va_list ap);
# 136 "include/stdfmt.h"
size_t sprintf(char* buf, const char* format, ...);
# 17 "include/kernel/kstdio.h" 2
# 67 "include/kernel/kstdio.h"
size_t kprintf(const char* format, ...);
# 16 "include/kernel/kdebug.h" 2
# 28 "include/kernel/kdebug.h"
static inline void kpanic_spin(char *filename, int line, const char* func, const char* condition, const char*msg, ...){
    supervisor_interrupt_disable();
    kprintf("===================== Error Message =====================%c", '\n');
    kprintf("filename: %s, at line %d\n", filename, line);
    kprintf("unsatisfied condition: %s\n", condition);
    kprintf("assert check failed in function: %s\n", func);
    char buf[1024] = {0};
    va_list args;
    __builtin_va_start(args, msg);
    vsprintf(buf, msg, args);
    kprintf("info message: %s\n", buf);
    while (1);
}
# 19 "kernel/kmain.c" 2

# 1 "include/process.h" 1





# 1 "include/kernel/locks.h" 1
# 27 "include/kernel/locks.h"
typedef struct __spinlock_t {

    Bool locked;

    char *name;
} spinlock_t;
# 41 "include/kernel/locks.h"
void spinlock_init(spinlock_t *lock, char *name);
# 51 "include/kernel/locks.h"
void spinlock_acquire(spinlock_t *lock);
# 61 "include/kernel/locks.h"
void spinlock_release(spinlock_t *lock);
# 7 "include/process.h" 2
# 1 "include/kernel/kdebug.h" 1
# 8 "include/process.h" 2
# 1 "include/riscv.h" 1



# 1 "include/asm/csr.h" 1
# 5 "include/riscv.h" 2



static inline uint64_t
r_mhartid(void)
{
  uint64_t x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
  return x;
}
# 24 "include/riscv.h"
static inline uint64_t
r_mstatus(void)
{
  uint64_t x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
  return x;
}

static inline void
w_mstatus(uint64_t x)
{
  asm volatile("csrw mstatus, %0" : : "r" (x));
}




static inline void
w_mepc(uint64_t x)
{
  asm volatile("csrw mepc, %0" : : "r" (x));
}
# 55 "include/riscv.h"
static inline uint64_t
r_sstatus(void)
{
  uint64_t x;
  asm volatile("csrr %0, sstatus" : "=r" (x) );
  return x;
}

static inline void
w_sstatus(uint64_t x)
{
  asm volatile("csrw sstatus, %0" : : "r" (x));
}


static inline uint64_t
r_sip(void)
{
  uint64_t x;
  asm volatile("csrr %0, sip" : "=r" (x) );
  return x;
}

static inline void
w_sip(uint64_t x)
{
  asm volatile("csrw sip, %0" : : "r" (x));
}





static inline uint64_t
r_sie(void)
{
  uint64_t x;
  asm volatile("csrr %0, sie" : "=r" (x) );
  return x;
}

static inline void
w_sie(uint64_t x)
{
  asm volatile("csrw sie, %0" : : "r" (x));
}





static inline uint64_t
r_mie(void)
{
  uint64_t x;
  asm volatile("csrr %0, mie" : "=r" (x) );
  return x;
}

static inline void
w_mie(uint64_t x)
{
  asm volatile("csrw mie, %0" : : "r" (x));
}




static inline void
w_sepc(uint64_t x)
{
  asm volatile("csrw sepc, %0" : : "r" (x));
}

static inline uint64_t
r_sepc(void)
{
  uint64_t x;
  asm volatile("csrr %0, sepc" : "=r" (x) );
  return x;
}


static inline uint64_t
r_medeleg(void)
{
  uint64_t x;
  asm volatile("csrr %0, medeleg" : "=r" (x) );
  return x;
}

static inline void
w_medeleg(uint64_t x)
{
  asm volatile("csrw medeleg, %0" : : "r" (x));
}


static inline uint64_t
r_mideleg(void)
{
  uint64_t x;
  asm volatile("csrr %0, mideleg" : "=r" (x) );
  return x;
}

static inline void
w_mideleg(uint64_t x)
{
  asm volatile("csrw mideleg, %0" : : "r" (x));
}



static inline void
w_stvec(uint64_t x)
{
  asm volatile("csrw stvec, %0" : : "r" (x));
}

static inline uint64_t
r_stvec(void)
{
  uint64_t x;
  asm volatile("csrr %0, stvec" : "=r" (x) );
  return x;
}


static inline void
w_mtvec(uint64_t x)
{
  asm volatile("csrw mtvec, %0" : : "r" (x));
}


static inline void
w_pmpcfg0(uint64_t x)
{
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
}

static inline void
w_pmpaddr0(uint64_t x)
{
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
}
# 210 "include/riscv.h"
static inline void
w_satp(uint64_t x)
{
  asm volatile("csrw satp, %0" : : "r" (x));
}

static inline uint64_t
r_satp(void)
{
  uint64_t x;
  asm volatile("csrr %0, satp" : "=r" (x) );
  return x;
}

static inline void
w_mscratch(uint64_t x)
{
  asm volatile("csrw mscratch, %0" : : "r" (x));
}


static inline uint64_t
r_scause(void)
{
  uint64_t x;
  asm volatile("csrr %0, scause" : "=r" (x) );
  return x;
}


static inline uint64_t
r_stval(void)
{
  uint64_t x;
  asm volatile("csrr %0, stval" : "=r" (x) );
  return x;
}


static inline void
w_mcounteren(uint64_t x)
{
  asm volatile("csrw mcounteren, %0" : : "r" (x));
}

static inline uint64_t
r_mcounteren(void)
{
  uint64_t x;
  asm volatile("csrr %0, mcounteren" : "=r" (x) );
  return x;
}


static inline uint64_t
r_time(void)
{
  uint64_t x;
  asm volatile("csrr %0, time" : "=r" (x) );
  return x;
}


static inline void
intr_on(void)
{
  w_sstatus(r_sstatus() | 0x00000002UL);
}


static inline void
intr_off(void)
{
  w_sstatus(r_sstatus() & ~0x00000002UL);
}


static inline int
intr_get(void)
{
  uint64_t x = r_sstatus();
  return (x & 0x00000002UL) != 0;
}

static inline uint64_t
r_sp(void)
{
  uint64_t x;
  asm volatile("mv %0, sp" : "=r" (x) );
  return x;
}



static inline uint64_t
r_tp(void)
{
  uint64_t x;
  asm volatile("mv %0, tp" : "=r" (x) );
  return x;
}

static inline void
w_tp(uint64_t x)
{
  asm volatile("mv tp, %0" : : "r" (x));
}

static inline uint64_t
r_ra(void)
{
  uint64_t x;
  asm volatile("mv %0, ra" : "=r" (x) );
  return x;
}


static inline void
sfence_vma(void)
{

  asm volatile("sfence.vma zero, zero");
}

typedef uint64_t pte_t;
typedef uint64_t *pagetable_t;
# 9 "include/process.h" 2
# 22 "include/process.h"
void push_off(void);
struct cpu* mycpu(void);
void pop_off(void);
void process_statck_map(pagetable_t kernel_pgdir);
void procinit(void);
int cpuid(void);
struct process* myproc(void);
int allocpid(void);
struct process* allocproc(void);
pagetable_t proc_pagetable(struct process * p);
void forkret(void);
int killed(struct process* p);
void setkilled(struct process *p);
void freeproc(struct process*p);
int mappages(pagetable_t pagetable, uint64_t va, uint64_t size, uint64_t pa, int perm);
void uvmfree(pagetable_t pagetable, uint64_t sz);
void userinit(void);


struct context {
  uint64_t ra;
  uint64_t sp;


  uint64_t s0;
  uint64_t s1;
  uint64_t s2;
  uint64_t s3;
  uint64_t s4;
  uint64_t s5;
  uint64_t s6;
  uint64_t s7;
  uint64_t s8;
  uint64_t s9;
  uint64_t s10;
  uint64_t s11;
};


struct cpu {
  struct process *proc;
  struct context context;
  int noff;
  int intena;
};

extern struct cpu cpus[8];
# 82 "include/process.h"
struct trapframe {
            uint64_t kernel_satp;
            uint64_t kernel_sp;
            uint64_t kernel_trap;
            uint64_t epc;
            uint64_t kernel_hartid;
            uint64_t ra;
            uint64_t sp;
            uint64_t gp;
            uint64_t tp;
            uint64_t t0;
            uint64_t t1;
            uint64_t t2;
            uint64_t s0;
            uint64_t s1;
            uint64_t a0;
            uint64_t a1;
            uint64_t a2;
            uint64_t a3;
            uint64_t a4;
            uint64_t a5;
            uint64_t a6;
            uint64_t a7;
            uint64_t s2;
            uint64_t s3;
            uint64_t s4;
            uint64_t s5;
            uint64_t s6;
            uint64_t s7;
            uint64_t s8;
            uint64_t s9;
            uint64_t s10;
            uint64_t s11;
            uint64_t t3;
            uint64_t t4;
            uint64_t t5;
            uint64_t t6;
};

enum procstate { _UNUSED, _USED, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };


struct process {
  spinlock_t lock;


  enum procstate state;
  void *chan;
  int killed;
  int xstate;
  int pid;


  struct proc *parent;


  uint64_t kstack;
  uint64_t sz;
  pagetable_t pagetable;
  struct trapframe *trapframe;
  struct context context;


  char name[16];
};


static inline uint64_t read_tp(void)
{
  uint64_t x;
  asm volatile("mv %0, tp" : "=r" (x) );
  return x;
}
# 21 "kernel/kmain.c" 2

void kernel_main(void){
 if(cpuid()==0){
  kprintf("\nyes,cpu 0 here\n");
 }
    kprintf("============================================================\n");
    kprintf("In kernel!\n");
    kprintf("Kernel init!\n");


 print_kmem();


    kinit_all();

    kprintf("Start testing!\n");



    kprintf("Kernel Hanging Here!\n");

    kprintf("local_interrupt_enable\n");

    supervisor_interrupt_enable();



 kprintf("Done");
    while (1);
}

void print_kmem(void){
    kprintf("============================================================\n");
    kprintf("X2W-OS Image Layout:\n");
    kprintf("  kernel: 0x%08lx - 0x%08lx (%6ld B)\n",
   (addr_t)_s_kernel, (addr_t)_e_kernel,
   (addr_t)(_e_kernel - _s_kernel));
    kprintf("  .text.boot: 0x%08lx - 0x%08lx (%6ld B)\n",
   (addr_t)_s_text_boot, (addr_t)_e_text_boot,
   (addr_t)(_e_text_boot - _s_text_boot));
 kprintf("       .text: 0x%08lx - 0x%08lx (%6ld B)\n",
   (addr_t)_s_text, (addr_t)_e_text,
   (addr_t)(_e_text - _s_text));
 kprintf("     .rodata: 0x%08lx - 0x%08lx (%6ld B)\n",
   (addr_t)_s_rodata, (addr_t)_e_rodata,
   (addr_t)(_e_rodata - _s_rodata));
 kprintf("       .data: 0x%08lx - 0x%08lx (%6ld B)\n",
   (addr_t)_s_data, (addr_t)_e_data,
   (addr_t)(_e_data - _s_data));
 kprintf("        .bss: 0x%08lx - 0x%08lx (%6ld B)\n",
   (addr_t)_s_bss, (addr_t)_e_bss,
   (addr_t)(_e_bss - _s_bss));
    kprintf("============================================================\n");
}
