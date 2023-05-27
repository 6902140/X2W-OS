# 0 "lib/trap/trapframe.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "lib/trap/trapframe.c"
# 11 "lib/trap/trapframe.c"
# 1 "include/trap/trapframe.h" 1
# 14 "include/trap/trapframe.h"
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
# 15 "include/trap/trapframe.h" 2
# 1 "include/constrains.h" 1
# 16 "include/trap/trapframe.h" 2
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
# 12 "lib/trap/trapframe.c" 2


void print_gtrapframe(gtrapframe_t *gtf_ptr, printf_t print_func){
    printf_t printf = print_func;
 printf(" gp : %#016lX tp : %#016lX t0 : %#016lX\n", gtf_ptr->gp, gtf_ptr->tp, gtf_ptr->t0);
 printf(" t1 : %#016lX t2 : %#016lX t3 : %#016lX\n", gtf_ptr->t1, gtf_ptr->t2, gtf_ptr->s0);
 printf(" s1 : %#016lX a0 : %#016lX a1 : %#016lX\n", gtf_ptr->s1, gtf_ptr->a0, gtf_ptr->a1);
 printf(" a2 : %#016lX a3 : %#016lX a4 : %#016lX\n", gtf_ptr->a2, gtf_ptr->a3, gtf_ptr->a4);
 printf(" a5 : %#016lX a6 : %#016lX a7 : %#016lX\n", gtf_ptr->a5, gtf_ptr->a6, gtf_ptr->a7);
 printf(" s2 : %#016lX s3 : %#016lX s4 : %#016lX\n", gtf_ptr->s2, gtf_ptr->s3, gtf_ptr->s4);
 printf(" s5 : %#016lX s6 : %#016lX s7 : %#016lX\n", gtf_ptr->s5, gtf_ptr->s6, gtf_ptr->s7);
 printf(" s8 : %#016lX s9 : %#016lX s10: %#016lX\n", gtf_ptr->s8, gtf_ptr->s9, gtf_ptr->s10);
 printf(" s11: %#016lX t3 : %#016lX t4 : %#016lX\n", gtf_ptr->s11, gtf_ptr->t3, gtf_ptr->t4);
 printf(" t5 : %#016lX t6 : %#016lX sp : %#016lX\n", gtf_ptr->t5, gtf_ptr->t6, gtf_ptr->sp);
 printf(" ra : %#016lX\n", gtf_ptr->ra);
}


void print_strapframe(strapframe_t *stf_ptr, printf_t print_func){
    printf_t printf = print_func;
    printf("Print SBI Trap Frame at: %#016X\n", (void*)stf_ptr);
    printf("mepc: %#016lX                  mstatus : %#016lX\n", stf_ptr->mepc, stf_ptr->mstatus);
 print_gtrapframe(&stf_ptr->gregisters, printf);
}


void print_ktrapframe(ktrapframe_t *ktf_ptr, printf_t print_func){
    printf_t printf = print_func;
    printf("Print Kernel Trap Frame at: %#016X\n", (void*)ktf_ptr);
 printf("origin_a0: %#016lX\n", ktf_ptr->origin_a0);
    printf("sepc: %#016lX                  sstatus : %#016lX\n", ktf_ptr->sepc, ktf_ptr->sstatus);
    printf("scause: %#016lX               sbadaddr : %#016lX\n", ktf_ptr->scause, ktf_ptr->sbadaddr);
 print_gtrapframe(&ktf_ptr->gregisters, printf);
}
