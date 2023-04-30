/**
 * @file csr.h
 * @author Shihong Wang (jack4shihong@gamil.com)
 * @brief `csr.h`提供了读写`RISC-V`体系结构中的`CSR`寄存器(`Control and Status`)的函数
 * @version 0.1
 * @date 2023-04-09
 * 
 * @note 参考RISC-V架构手册: 
 * 1. https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMAFDQC/riscv-spec-20191213.pdf
 * 2. https://github.com/riscv/riscv-isa-manual/releases/download/Priv-v1.12/riscv-privileged-20211203.pdf
 * 
 * @note 一些有用的博客:
 * 1. https://dingfen.github.io/risc-v/2020/08/05/riscv-privileged.html#%E4%B8%AD%E6%96%AD%E4%B8%8E%E5%BC%82%E5%B8%B8
 * @copyright Copyright Shihong Wang (c) 2023 with GNU Public License V3.0
 */

#ifndef __INCLUDE_ASM_CSR_H
#define __INCLUDE_ASM_CSR_H

//#include "types.h"

/* ------------------------------ 宏定义 ------------------------------ */

#define SATP_MODE_39 (1UL << 63)

/* ----- 特权级定义 ----- */
/// 用户态特权级
#define PRIVILEGE_U     0UL
/// 监管态特权级
#define PRIVILEGE_S     1UL
/// 机器态特权级
#define PRIVILEGE_M     3UL

/* ----- 中断使能 ----- */
/// 中断开启
#define INTR_DS         0UL
/// 中断关闭
#define INTR_EN         1UL



/* ----- sstatus寄存器 ----- */
/***
 * 具体来说：
 * SSTATUS_SPP_SHIFT 和 SSTATUS_SPP 定义了一个宏，
 * 用于获取和设置 sstatus 寄存器中的上一个模式（SPP）字段。
 * SPP 字段用于记录 CPU 上一次运行的特权级别（用户模式或监管模式），
 * 以便在切换回上一个模式时恢复该特权级别。
 * SR_SIE、SR_SPIE、SR_SPP 和 SR_SUM 定义了一些常量，
 * 用于设置和清除 sstatus 寄存器中的一些位字段。
 * 其中，SR_SIE 用于开启或关闭监管模式中断使能，
 * SR_SPIE 用于记录上一次监管模式中断使能的状态，
 * SR_SPP 用于记录上一个模式的特权级别（用户模式或监管模式），
 * SR_SUM 用于允许监管模式访问用户模式的内存。
 * SR_FS 和 SR_XS 定义了一些常量，
 * 用于设置和清除 sstatus 寄存器中的浮点状态和扩展状态位字段。
 * SR_FS 用于设置和获取浮点运算的状态（禁用、启用或保存状态），
 * SR_XS 用于设置和获取指令集扩展（如 M 标准、A 标准）的状态。
 * /
/* Status register flags */
#define SSTATUS_SPP_SHIFT	8
#define SSTATUS_SPP	(1UL << SSTATUS_SPP_SHIFT)

#define SR_SIE  0x2UL /* Supervisor Interrupt Enable */
#define SR_SPIE 0x20UL /* Previous Supervisor IE */
#define SR_SPP 0x100UL /* Previously Supervisor */
#define SR_SUM	0x40000UL /* Supervisor may access User Memory */
#define SR_FS  0x6000UL /* Floating-point Status */
#define SR_XS  0x00018000UL /* Extension Status */

/* 中断使能 */
#define SIE_SSIE 0x2UL /* IPI软中断使能 */
#define SIE_STIE 0x20UL /* 时钟中断使能 */
#define SIE_SEIE 0x200UL /* IRQ外部中断使能 */

#define SCAUSE_INT (1UL << 63)
#define is_interrupt_fault(reg) (reg & SCAUSE_INT)



/* ----- mstatus寄存器 ----- */

// MPP域
/// `MPP`域在`mstatus`寄存器的偏移
#define MSTATUS_MPP_SHIFT           11
/// `MPP`域选择子
#define MSTATUS_MPP                 (3UL << MSTATUS_MPP_SHIFT)
/// `MPP = 0b00`, 中断发生前的特权级为U
#define MSTATUS_MPP_U               (PRIVILEGE_U << MSTATUS_MPP_SHIFT)
/// `MPP = 0b01`, 中断发生前的特权级为S
#define MSTATUS_MPP_S               (PRIVILEGE_S << MSTATUS_MPP_SHIFT)
/// `MPP = 0b11`, 中断发生前的特权级为M
#define MSTATUS_MPP_M               (PRIVILEGE_M << MSTATUS_MPP_SHIFT)


// MPIE域
/// `MPIE`域在`mstatus`寄存器的偏移
#define MSTATUS_MPIE_SHIFT          7
/// `MPIE`域选择子
#define MSTATUS_MPIE                (1UL << MSTATUS_MPIE_SHIFT)
/// `MPIE = 0`, 中断发生前中断关闭
#define MSTATUS_MPIE_DS             (INTR_DS << MSTATUS_MPIE_SHIFT)
/// `MPIE = 1`, 中断发生前中断开启
#define MSTATUS_MPIE_EN             (INTR_EN << MSTATUS_MPIE_SHIFT)


/* ----- mtvec寄存器 ----- */

/// `TVEC_TRAP_DIRECT`宏表示`mtvec`寄存器处于直接模式
#define TVEC_TRAP_DIRECT                (0b00)
/// `MTVEC_TRAP_INDIRECT`宏表示`mtvec`寄存器处于间接模式
#define TVEC_TRAP_INDIRECT              (0b01)


/* ----- mcause, scause, ucasue寄存器 ----- */

/// `CAUSE_INTERRUPT_FLAG`宏用于判断当前陷入是否为中断
#define CAUSE_INTERRUPT_FLAG        (1UL << 63)
/// `CAUSE_EXCEPTION_FLAG`宏用于判断当前陷入是否为异常
#define CAUSE_EXCEPTION_FLAG        (0UL << 64)

/* 异常的编号 */
#define CAUSE_EXCEPTION_MISALIGNED_FETCH                   0x00
#define CAUSE_EXCEPTION_FETCH_ACCESS                       0x01
#define CAUSE_EXCEPTION_ILLEGAL_INSTRUCTION                0x02
#define CAUSE_EXCEPTION_BREAKPOINT                         0x03
#define CAUSE_EXCEPTION_MISALIGNED_LOAD                    0x04
#define CAUSE_EXCEPTION_LOAD_ACCESS                        0x05
#define CAUSE_EXCEPTION_MISALIGNED_STORE                   0x06
#define CAUSE_EXCEPTION_STORE_ACCESS                       0x07
#define CAUSE_EXCEPTION_USER_ECALL                         0x08
#define CAUSE_EXCEPTION_SUPERVISOR_ECALL                   0x09
#define CAUSE_EXCEPTION_VIRTUAL_SUPERVISOR_ECALL           0x0A
#define CAUSE_EXCEPTION_MACHINE_ECALL                      0x0B
#define CAUSE_EXCEPTION_FETCH_PAGE_FAULT                   0x0C
#define CAUSE_EXCEPTION_LOAD_PAGE_FAULT                    0x0D
#define CAUSE_EXCEPTION_STORE_PAGE_FAULT                   0x0F
#define CAUSE_EXCEPTION_FETCH_GUEST_PAGE_FAULT             0x14
#define CAUSE_EXCEPTION_LOAD_GUEST_PAGE_FAULT              0x15
#define CAUSE_EXCEPTION_VIRTUAL_INST_FAULT                 0x16
#define CAUSE_EXCEPTION_STORE_GUEST_PAGE_FAULT             0x17


/* 中断的编号 */
#define CAUSE_INTERRUPT_U_SOFTWARE_INTERRUPT               0x00
#define CAUSE_INTERRUPT_S_SOFTWARE_INTERRUPT               0x01
#define CAUSE_INTERRUPT_M_SOFTWARE_INTERRUPT               0x03
#define CAUSE_INTERRUPT_U_TIMER_INTERRUPT                  0x04
#define CAUSE_INTERRUPT_S_TIMER_INTERRUPT                  0x05
#define CAUSE_INTERRUPT_M_TIMER_INTERRUPT                  0x07
#define CAUSE_INTERRUPT_U_EXTERNAL_INTERRUPT               0x08
#define CAUSE_INTERRUPT_S_EXTERNAL_INTERRUPT               0x09
#define CAUSE_INTERRUPT_M_EXTERNAL_INTERRUPT               0x11



/* ----- mip寄存器 ----- */
#define MIP_U_SOFTWARE_INTERRUPT                            (1UL << CAUSE_INTERRUPT_U_SOFTWARE_INTERRUPT)
#define MIP_S_SOFTWARE_INTERRUPT                            (1UL << CAUSE_INTERRUPT_S_SOFTWARE_INTERRUPT)
#define MIP_M_SOFTWARE_INTERRUPT                            (1UL << CAUSE_INTERRUPT_M_SOFTWARE_INTERRUPT)
#define MIP_U_TIMER_INTERRUPT                               (1UL << CAUSE_INTERRUPT_U_TIMER_INTERRUPT)
#define MIP_S_TIMER_INTERRUPT                               (1UL << CAUSE_INTERRUPT_S_TIMER_INTERRUPT)
#define MIP_M_TIMER_INTERRUPT                               (1UL << CAUSE_INTERRUPT_M_TIMER_INTERRUPT)
#define MIP_U_EXTERNAL_INTERRUPT                            (1UL << CAUSE_INTERRUPT_U_EXTERNAL_INTERRUPT)
#define MIP_S_EXTERNAL_INTERRUPT                            (1UL << CAUSE_INTERRUPT_S_EXTERNAL_INTERRUPT)
#define MIP_M_EXTERNAL_INTERRUPT                            (1UL << CAUSE_INTERRUPT_M_EXTERNAL_INTERRUPT)


/* ----- medeleg寄存器 ----- */



/* ----- mideleg寄存器 ----- */




/* ------------------------------ 宏函数 ------------------------------ */

/**
 * @brief `SET_FIELD`宏用于将`origin`中`which`所指定的`field`的值设置为`fieldval`
 * 
 * @param origin 初始值
 * @param which 设置的`field`
 * @param fieldval `field`将被设置的值
 * 
 * @note 需要注意的点:
 * - `x & ~mask`: 将x的非`mask`清0
 * - `x & ~(x - 1)`: 用于一个数的二进制表示中最右边的非零位（也称作最低位的1），并将其它位都置为0
 * - 而后利用这个最右边的非零位表示需要左移多少位, 这里是用乘法实现的左移
 * - 最后在和mask对应位清0之后的原值与就能得到最终需要的值
 * 
 * 一个详细的例子`origin = 0b1001_0001`, `which = 0b0011_0000`, `fieldval = 0b11`则:
 * - `which & ~(which - 1) = 0b0001_0000`
 * - `fieldval * (which & ~(which - 1)) = 0b0011_0000`
 * - `origin & !(which) = 0b1011_0001`
 * - `... | ... = 0b1000_0000`
 */
#define SET_FIELD(origin, which, fieldval) \
    (((origin) & ~(which)) | ((fieldval) * ((which) & ~((which) - 1))))

/**
 * @brief `read_csr`用于读取的`csr`寄存器的值并返回
 * 
 * @param csr 要读取的`CSR`寄存器名
 * 
 * @return uint64_t 读取得到的`csr`寄存器的值
 * 
 * @note 通常情况下，在内联汇编代码块的最后一条语句中将需要返回的值存储在一个特定的变量中，然后该变量将被作为代码块的返回值返回给调用者。在GCC扩展中，这个变量通常被命名为__v（两个下划线 + v），并且在代码块的最后一行写上__v;语句来表示将其作为返回值返回给调用者。
 * @note 写入到`CSR`寄存器的变量必须要存在通用寄存器中
 * @note `read_csr`中使用`#`将`csr`转为字符串, 而后利用`C`语言的字符串拼接得到最终的汇编语句
 */
#define read_csr(csr) ({                            \
    register unsigned long __v;                     \
    asm volatile(                                   \
        "csrr %0, " #csr                            \
        : "=r" (__v)                                \
        :                                           \
        : "memory"                                  \
    );                                              \
    __v;                                            \
})

/**
 * @brief `write_csr`用于将`csr`寄存器的值设置为`value`
 * 
 * @param csr 要设置的`CSR`寄存器名
 * @param value 要设置的值
 * 
 * @note `rK`约束参考, `r`是简单约束, `K`是`RISC-V`的机器限定约束:
 * 1. https://gcc.gnu.org/onlinedocs/gcc/Simple-Constraints.html
 * 2. https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html
 */
#define write_csr(csr, value) ({                    \
    unsigned long __v = (unsigned long) (value);    \
    __asm__ __volatile__(                           \
        "csrw " #csr ", %0"                         \
        :                                           \
        : "rK" (__v)                                \
        : "memory"                                  \
    );                                              \
})

/*
 * 在带参数的宏，#号作为一个预处理运算符,
 * 可以把记号转换成字符串
 *
 * 下面这句话会在预编译阶段变成：
 *  asm volatile("csrr %0, " "reg" : "=r" (__val)); __val; });
 */
#define read_csr(csr)						\
({								\
	register unsigned long __v;				\
	__asm__ __volatile__ ("csrr %0, " #csr			\
			      : "=r" (__v) :			\
			      : "memory");			\
	__v;							\
})

#define write_csr(csr, val)					\
({								\
	unsigned long __v = (unsigned long)(val);		\
	__asm__ __volatile__ ("csrw " #csr ", %0"		\
			      : : "rK" (__v)			\
			      : "memory");			\
})

#define csr_set(csr, val)					\
({								\
	unsigned long __v = (unsigned long)(val);		\
	__asm__ __volatile__ ("csrs " #csr ", %0"		\
			      : : "rK" (__v)			\
			      : "memory");			\
})

#define csr_clear(csr, val)					\
({								\
	unsigned long __v = (unsigned long)(val);		\
	__asm__ __volatile__ ("csrc " #csr ", %0"		\
			      : : "rK" (__v)			\
			      : "memory");			\
})






#endif