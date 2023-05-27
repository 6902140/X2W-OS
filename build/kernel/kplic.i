# 0 "kernel/kplic.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "kernel/kplic.c"
# 11 "kernel/kplic.c"
# 1 "include/io.h" 1
# 18 "include/io.h"
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
# 12 "kernel/kplic.c" 2
# 1 "include/kernel/kplic.h" 1
# 14 "include/kernel/kplic.h"
# 1 "include/types.h" 1
# 15 "include/kernel/kplic.h" 2
# 1 "include/asm/plic.h" 1
# 16 "include/asm/plic.h"
# 1 "include/constrains.h" 1
# 17 "include/asm/plic.h" 2
# 42 "include/asm/plic.h"
static inline addr_t plic_priority_addr(uint32_t hwiid){
    return (addr_t) (0xC000000UL + hwiid * 4);
}
# 54 "include/asm/plic.h"
static inline addr_t plic_pending_addr(uint32_t hwiid){
    return (addr_t) (0xC000000UL + 0x1000 + (hwiid / 32) * 4);
}
# 68 "include/asm/plic.h"
static inline addr_t plic_enable_addr(uint64_t hid, Bool m_mode){
    offset_t offset = (m_mode == True) ? 0x2000 : 0x2080;
    return (addr_t) (0xC000000UL + offset + hid * 0x80);
}
# 83 "include/asm/plic.h"
static inline addr_t plic_threshold_addr(uint64_t hid, Bool m_mode){
    offset_t offset = (m_mode == True) ? 0x200000 : 0x201000;
    return (addr_t) (0xC000000UL + offset + hid * 0x1000);
}
# 98 "include/asm/plic.h"
static inline addr_t plic_claim_addr(uint64_t hid, Bool m_mode){
    return plic_threshold_addr(hid, m_mode) + 0x04;
}
# 113 "include/asm/plic.h"
static inline addr_t plic_complete_addr(uint64_t hid, Bool m_mode){
    return plic_claim_addr(hid, m_mode);
}
# 16 "include/kernel/kplic.h" 2

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
# 18 "include/kernel/kplic.h" 2






void kplic_init(void);
# 33 "include/kernel/kplic.h"
void kplic_set_priority(uint32_t hwiid, uint32_t priority);
# 42 "include/kernel/kplic.h"
void kplic_enable_interrupt(uint64_t cid, uint32_t hwiid, Bool enable, Bool m_mode);
# 53 "include/kernel/kplic.h"
int64_t kplic_interrupt_handler(ktrapframe_t *ktf_ptr);
# 13 "kernel/kplic.c" 2
# 1 "include/kernel/ktrap.h" 1
# 15 "include/kernel/ktrap.h"
# 1 "include/asm/csr.h" 1
# 16 "include/kernel/ktrap.h" 2


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
# 14 "kernel/kplic.c" 2
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
# 1 "include/device/uart.h" 1
# 23 "include/device/uart.h"
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
# 18 "include/kernel/kstdio.h" 2
# 67 "include/kernel/kstdio.h"
size_t kprintf(const char* format, ...);
# 15 "kernel/kplic.c" 2


typedef enum __plic_interrupt_id_t {
    UART0_INTERRUPT = 10
} plic_interrupt_id_t;




void kplic_set_priority(uint32_t hwiid, uint32_t priority){

    addr_t reg_addr = plic_priority_addr(hwiid);



    write_32_bits(reg_addr, priority);
}

void kplic_enable_interrupt(uint64_t cid, uint32_t hwiid, Bool enable, Bool m_mode){

    uint32_t hwiid_mask = 1 << (hwiid % 32);
    int hart_id = ((cid) + 1);

    addr_t reg_addr = plic_enable_addr(hart_id, m_mode) + 4 * (hwiid / 32);





    if (enable)
        write_32_bits(reg_addr, read_32_bits(reg_addr) | hwiid_mask);
    else
        write_32_bits(reg_addr, read_32_bits(reg_addr) & ~hwiid_mask);
}

void kplic_init(void){
    kprintf("KPLIC Info:");
    kprintf("\tSet priority off INTR_NO %d~%d to 1\n", 1, 53);

    for (int hwiid = 1; hwiid <= 53; hwiid++)
        kplic_set_priority(hwiid, 1);

    kprintf("\tDisable INTR_NO %d~%d of all CPU\n", 1, 53);
    kprintf("\tSet Interrupt Priority Threshold Register of all CPU to 0\n");
    for (int cpu_id = 0; cpu_id < 1; cpu_id++){

        write_32_bits(plic_threshold_addr(((cpu_id) + 1), True), 0);

        for (int hwiid = 1; hwiid <= 53; hwiid++)
            kplic_enable_interrupt(cpu_id, hwiid, False, True);
    }


    kprintf("\tSet Software External Interrupt (SEIE) of sie\n");
    ({ unsigned long __v = (unsigned long) ((1UL << 0x09)); __asm__ __volatile__( "csrs " "sie" ", %0" : : "rK" (__v) : "memory" ); });


    kprintf("\tEnable UART0 Interrupt (SEIE) of CPU 0\n");
    kplic_enable_interrupt(0, UART0_INTERRUPT, True, True);
}



const char *plic_intr_msg[53] = {
    [0] = "Error",
    [1 ... 8] = "VIRTIO_IRQ Interrupt",
    [9] = "Error",
    [10] = "UART0 Interrupt",
    [11] = "RTC Interrupt",
    [32 ... 35] = "PCIe Interrupt"
};


extern void uart_interrupt_handler(void);

int64_t kplic_interrupt_handler(ktrapframe_t *ktf_ptr){

    ({ unsigned long __v = (unsigned long) ((1UL << 0x09)); __asm__ __volatile__( "csrc " "sie" ", %0" : : "rK" (__v) : "memory" ); });


    int hart_id = ((0) + 1);

    addr_t claim_reg_addr = plic_claim_addr(hart_id, True);
    uint32_t hwiid = -1;


    while (

        (hwiid = read_32_bits(claim_reg_addr)) != 0
    ){

        if (hwiid == UART0_INTERRUPT)
            uart_interrupt_handler();


        write_32_bits(claim_reg_addr, hwiid);
    }


    ({ unsigned long __v = (unsigned long) ((1UL << 0x09)); __asm__ __volatile__( "csrs " "sie" ", %0" : : "rK" (__v) : "memory" ); });
    return 0;
}
