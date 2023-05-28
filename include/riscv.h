#ifndef __RISCV_H__
#define __RISCV_H__

#include "types.h"

//hartid
static inline void
w_tp(register_t hartid)
{
    asm volatile("mv tp, %0"
                 :
                 : "r"(hartid & 0x1));
}

static inline register_t
r_tp(void)
{
    register_t x;
    asm volatile("mv %0, tp"
                 : "=r"(x));
    return x;
}
// riscv64 sv39 page table
static inline void
w_satp(address_t satp_data) {
    asm volatile("csrw satp, %0"
                 :
                 : "r"(satp_data));
}
static inline void
sfenve_vma(void) {
    asm volatile("sfence.vma");
}

// trap
static inline void
w_stvec(register_t x) {
    asm volatile("csrw stvec, %0"
                 :
                 : "r"(x));
}

static inline void
w_sstatus(register_t x) {
    asm volatile("csrw sstatus, %0"
                 :
                 : "r"(x));
}

static inline void
w_sepc(register_t x) {
    asm volatile("csrw sepc, %0"
                 :
                 : "r"(x));
}

static inline void
w_sie(register_t x){
    asm volatile("csrw sie, %0"
                 :
                 : "r"(x));
}

static inline void 
w_sip(register_t x)
{
    asm volatile("csrw sip, %0"
                 :
                 : "r"(x));
}

static inline register_t 
r_sip(void)
{
    register_t x;
    asm volatile("csrr %0, sip" : "=r"(x));
    return x;
}
static inline register_t
r_satp(void) {
    register_t x;
    asm volatile("csrr %0, satp"
                 : "=r"(x));
    return x;
}

static inline register_t
r_sstatus(void) {
    register_t x;
    asm volatile("csrr %0, sstatus"
                 : "=r"(x));
    return x;
}

static inline register_t
r_sie(void){
    register_t x;
    asm volatile("csrr %0, sie"
                 : "=r"(x));
    return x;
}

static inline register_t
r_scause(void)
{
    register_t x;
    asm volatile("csrr %0, scause"
                 : "=r"(x));
    return x;
}

static inline register_t
r_sepc(void){
    register_t x;
    asm volatile("csrr %0, sepc"
                 : "=r"(x));
    return x;
}

static inline register_t
r_stval(void)
{
    register_t x;
    asm volatile("csrr %0, stval"
                 : "=r"(x));
    return x;
}

//timer
static inline register_t
r_time(void)
{
    register_t x;
    asm volatile("rdtime %0"
                 : "=r"(x));
    return x;
}

#endif