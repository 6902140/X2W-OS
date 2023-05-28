// #define K210
// 定义了 K210，表示使用 K210 的外设

// K210 外设的物理地址范围
// (0x0200_0000, 0x1000),      /* CLINT     */
// (0x0C20_0000, 0x1000),      /* PLIC      */
// (0x3800_0000, 0x1000),      /* UARTHS    */
// (0x3800_1000, 0x1000),      /* GPIOHS    */
// (0x5020_0000, 0x1000),      /* GPIO      */
// (0x5024_0000, 0x1000),      /* SPI_SLAVE */
// (0x502B_0000, 0x1000),      /* FPIOA     */
// (0x502D_0000, 0x1000),      /* TIMER0    */
// (0x502E_0000, 0x1000),      /* TIMER1    */
// (0x502F_0000, 0x1000),      /* TIMER2    */
// (0x5044_0000, 0x1000),      /* SYSCTL    */
// (0x5200_0000, 0x1000),      /* SPI0      */
// (0x5300_0000, 0x1000),      /* SPI1      */
// (0x5400_0000, 0x1000),      /* SPI2      */
// (0x8000_0000, 0x600000),    /* Memory    */

// qemu -machine virt 的设置如下，
// 基于 qemu 的 hw/riscv/virt.c 文件：
//
// 00001000 -- 引导 ROM，由 qemu 提供
// 02000000 -- CLINT
// 0C000000 -- PLIC
// 10000000 -- uart0
// 10001000 -- virtio disk
// 80000000 -- 引导 ROM 跳转到这里，进入机器模式
//             -kernel 加载内核到这个地址
// 80000000 之后的未使用的 RAM
#include "param.h"

#define VIRT_OFFSET             0x3F00000000L
// VIRT_OFFSET 为虚拟地址偏移量，用于将物理地址转换为虚拟地址

#define SPI2_CTRL_ADDR_P		0x10050000
// SPI2_CTRL_ADDR_P 为 SPI2 控制器的物理地址

// 内核期望在物理地址 0x80000000 到 PHYSTOP 之间的内存中
// 用于内核和用户页的内存
#define KERNBASE 0x80200000ULL
#define PHYSTOP (0x80000000ULL + (unsigned long long)(1ULL * 128 * 1024 * 1024)) // 128MB

// 将跳转页映射到最高地址
// 在用户空间和内核空间中都是如此

// 最高虚拟地址的下一个地址
// MAXVA 实际上比 Sv39 允许的最大地址少一位，以避免需要对带有高位设置的虚拟地址进行符号扩展
// rustsbi 的物理地址
#define RUSTSBI_BASE            0x80000000
#define MAXVA (1L << (9 + 9 + 9 + 12 - 1))  // 256 GB
#define MAXUVA                  RUSTSBI_BASE

#define USER_TOP (MAXVA)    // 用户虚拟地址的最高地址
#define TRAMPOLINE (USER_TOP - PGSIZE)  // 跳转页的虚拟地址
#define TRAPFRAME (TRAMPOLINE - PGSIZE) // trapframe 的虚拟地址

// qemu 将 UART 寄存器放在物理内存的这个地址
#define UART0 0x10000000L   // 256 MB
#define UART0_V                  (UART0 + VIRT_OFFSET)

// 本地中断控制器，包含计时器
#define CLINT                   0x02000000L
#define CLINT_V                 (CLINT + VIRT_OFFSET)

// virtio mmio 接口
#define VIRTIO0 0x10001000
#define VIRTIO0_V               (VIRTIO0 + VIRT_OFFSET)

// qemu 将平台级中断控制器 (PLIC) 放在这个地址
#define PLIC 0x0c000000L       // 192 MB
#define PLIC_V                  (PLIC + VIRT_OFFSET)
#define PLIC_PRIORITY (PLIC_V + 0x0)
#define PLIC_PENDING (PLIC_V + 0x1000)
#define PLIC_MENABLE(hart) (PLIC_V + 0x1f80 + (hart)*0x100)
#define PLIC_SENABLE(hart) (PLIC_V + 0x2000 + (hart)*0x100)
#define PLIC_MPRIORITY(hart) (PLIC_V + 0x1ff000 + (hart)*0x2000)
#define PLIC_SPRIORITY(hart) (PLIC_V + 0x200000 + (hart)*0x2000)
#define PLIC_MCLAIM(hart) (PLIC_V + 0x1ff004 + (hart)*0x2000)
#define PLIC_SCLAIM(hart) (PLIC_V + 0x200004 + (hart)*0x2000)

#define USER_STACK_BOTTOM 0xC0000000   // 3GB，用户栈的较低地址
#define USER_TEXT_START 0x1000
#define VKSTACK                 0x3EC0000000L
#define MMAP_START           0x70000000
#define MMAP_END             0x71000000
