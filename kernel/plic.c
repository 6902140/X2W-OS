
#include "include/types.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/riscv.h"
#include "include/sbi.h"
#include "include/plic.h"
#include "include/proc.h"
#include "include/printf.h"

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    // set desired IRQ priorities non-zero (otherwise disabled).
    //writed(1,PLIC_V + VIRTIO0_IRQ * 4);
    //writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    writed(1, PLIC_V + UART1_IRQ * sizeof(uint32));
    //writed(1, PLIC_V + UART1_IRQ * sizeof(uint32));
#ifdef	DEBUG
     printf("plicinit\n");
#endif 
}

void plicinithart(void) {
    int hart = cpuid();
    // set uart's enable bit for this hart's S-mode.
    *(uint32 *)PLIC_SENABLE(hart) = (1 << UART1_IRQ);
    // set this hart's S-mode priority threshold to 0.
    *(uint32 *)PLIC_SPRIORITY(hart) = 0;
#ifdef DEBUG
     printf("plichartinit\n");
#endif 
}

// ask the PLIC what interrupt we should serve.
int plic_claim(void) {
    int hart = cpuid();
    int irq = *(uint32 *)PLIC_SCLAIM(hart);
    return irq;
}

// tell the PLIC we've served this IRQ.
void plic_complete(int irq) {
    int hart = cpuid();
    *(uint32 *)PLIC_SCLAIM(hart) = irq;
}
