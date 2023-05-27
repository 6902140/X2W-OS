#ifndef __MMULAYOUT_H__
#define __MMULAYOUT_H__
#include "types.h"
// deal with virtual address
#define VPN_MASK 0x1ff
#define VPN0_SHIFT 12
#define VPN1_SHIFT 21
#define VPN2_SHIET 30

#define VPN0(la) ((((addr_t)(la)) >> VPN0_SHIFT) & VPN_MASK)
#define VPN1(la) ((((addr_t)(la)) >> VPN1_SHIFT) & VPN_MASK)
#define VPN2(la) ((((addr_t)(la)) >> VPN2_SHIET) & VPN_MASK)

// deal with pte
#define PTE_PPN_SHEIFT 10
#define PTE_V (1L << 0)
#define PTE_R (1L << 1)
#define PTE_W (1L << 2)
#define PTE_X (1L << 3)
#define PTE_U (1L << 4)

// k210 has 8mb dsram
#define PA_STOP 0x80600000  //
/**
 * TODO: 根据不同平台进行更改
 *  #if defined( __K210__)
 *  #define PA_STOP 0x80600000
 *  #elif defined( __QUEM__)
 *  #define PA_STOP xxx
 *  #endif
 *  通过编译选项-D控制
 */

#define VIRT_OFFSET 0x3F00000000L



// #define UART_V UART
#define UART_V (UART + VIRT_OFFSET)

#define CLINT 0x02000000L
// #define CLINT_V CLINT
#define CLINT_V (CLINT + VIRT_OFFSET)

#define PLIC 0x0c000000L
// #define PLIC_V PLIC
#define PLIC_V (PLIC + VIRT_OFFSET)

#define PLIC_PRIORITY (PLIC_V + 0x0)
#define PLIC_PENDING (PLIC_V + 0x1000)
#define PLIC_MENABLE(hart) (PLIC_V + 0X2000 + (hart)*0x100)
#define PLIC_SENABLE(hart) (PLIC_V + 0x2080 + (hart)*0x100)
#define PLIC_MPRIORITY(hart) (PLIC_V + 0x200000 + (hart)*0x2000)
#define PLIC_SPRIORITY(hart) (PLIC_V + 0x201000 + (hart)*0x2000)
#define PLIC_MCLAIM(hart) (PLIC_V + 0X200004 + (hart)*0x2000)
#define PLIC_SCLAIM(hart) (PLIC_V + 0X201004 + (hart)*0x2000)

#ifndef QEMU

#define GPIOHS 0x38001000
#define DMAC 0x50000000
#define GPIO 0x50200000
#define SPI_SLAVE 0x50240000
#define FPIOA 0x502B0000
#define SPI0 0x52000000
#define SPI1 0x53000000
#define SPI2 0x54000000
#define SYSCTL 0x50440000

#define GPIOHS_V (GPIOHS + VIRT_OFFSET)
#define DMAC_V (DMAC + VIRT_OFFSET)
#define GPIO_V (GPIO + VIRT_OFFSET)
#define SPI_SLAVE_V (SPI_SLAVE + VIRT_OFFSET)
#define FPIOA_V (FPIOA + VIRT_OFFSET)
#define SPI0_V (SPI0 + VIRT_OFFSET)
#define SPI1_V (SPI1 + VIRT_OFFSET)
#define SPI2_V (SPI2 + VIRT_OFFSET)
#define SYSCTL_V (SYSCTL + VIRT_OFFSET)
// #define GPIOHS_V GPIOHS
// #define DMAC_V DMAC
// #define GPIO_V GPIO
// #define SPI_SLAVE_V SPI_SLAVE
// #define FPIOA_V FPIOA
// #define SPI0_V SPI0
// #define SPI1_V SPI1
// #define SPI2_V SPI2
// #define SYSCTL_V SYSCTL

#endif
// #define PA_STOP 0x80600000

#ifndef QEMU
#define KERNEL_START 0x80020000
#else
#define KERNEL_START 0x80200000
#endif

#define MAX_VA (1L << 38)
#define TRAMPOLINE (MAX_VA - PAGE_SIZE)
#define TRAP_FRAME (TRAMPOLINE - PAGE_SIZE)
#define UVK_STACK 0x3EC0000000L
#define UVA_START 0L

#endif
