# 0 "sbi/strap.c"
# 1 "/home/lighthouse/xzr/oskernel2023-x2w//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "sbi/strap.c"
# 11 "sbi/strap.c"
# 1 "include/string.h" 1
# 20 "include/string.h"
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
# 21 "include/string.h" 2
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
# 12 "sbi/strap.c" 2
# 1 "include/asm/csr.h" 1
# 20 "include/asm/csr.h"
# 1 "include/types.h" 1
# 21 "include/asm/csr.h" 2
# 13 "sbi/strap.c" 2
# 1 "include/sbi/strap.h" 1
# 15 "include/sbi/strap.h"
# 1 "include/constrains.h" 1
# 16 "include/sbi/strap.h" 2
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
# 17 "include/sbi/strap.h" 2
# 1 "include/trap/trap_entry.h" 1
# 24 "include/trap/trap_entry.h"
extern void strap_enter(void);
# 33 "include/trap/trap_entry.h"
extern void strap_exit(void);
# 43 "include/trap/trap_entry.h"
extern void ktrap_enter(void);
# 52 "include/trap/trap_entry.h"
extern void ktrap_exit(void);
# 18 "include/sbi/strap.h" 2
# 30 "include/sbi/strap.h"
typedef int64_t (*strap_handler_t)(strapframe_t* stf_ptr);





void strap_init(void);
# 51 "include/sbi/strap.h"
void delegate_traps(void);







void strap_dispatcher(strapframe_t *stf_ptr);
# 70 "include/sbi/strap.h"
void regitser_strap_handler(uint64_t trap_code, Bool interrupt, const char* msg, strap_handler_t strap_func);
# 79 "include/sbi/strap.h"
__attribute__((noreturn)) int64_t general_strap_handler(strapframe_t *stf_ptr);
# 14 "sbi/strap.c" 2
# 1 "include/sbi/stimer.h" 1
# 23 "include/sbi/stimer.h"
void stimer_init(void);




int64_t stimer_interrupt_handler(strapframe_t *stf_ptr);






void clint_timer_event_start(uint64_t next_ticks);
# 15 "sbi/strap.c" 2
# 1 "include/sbi/sstdio.h" 1
# 16 "include/sbi/sstdio.h"
# 1 "include/stdfmt.h" 1
# 15 "include/stdfmt.h"
# 1 "include/stdarg.h" 1
# 34 "include/stdarg.h"
typedef __builtin_va_list va_list;
# 69 "include/stdarg.h"
typedef char* _my_va_list;
# 16 "include/stdfmt.h" 2
# 1 "include/string.h" 1
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
# 17 "include/sbi/sstdio.h" 2
# 1 "include/device/uart.h" 1
# 21 "include/device/uart.h"
# 1 "include/io.h" 1
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
# 18 "include/sbi/sstdio.h" 2
# 67 "include/sbi/sstdio.h"
size_t bprintf(const char* format, ...);
# 16 "sbi/strap.c" 2



const char *sintr_msg[64] = {
    "User Software Interrupt",
    "Supervisor Software Interrupt",
    "Reserved for Future Standard Use",
    "Machine Software Interrupt",
    "User Timer Interrupt",
    "Supervisor Timer Interrupt",
    "Reserved for Future Standard Use",
    "Machine Timer Interrupt",
    "User External Interrupt",
    "Supervisor External Interrupt",
    "Reserved for Future Standard Use",
    "Machine External Interrupt"
};


const char *sexcp_msg[64] = {
    "Instrution Address Misaligned",
    "Instrution Access Fault",
    "Illegal Instruction",
    "Breakpoint",
    "Load address Misaligned",
    "Load access Fault",
    "Store/AMO address Misaligned",
    "Store/AMO Access Fault",
    "Environment Call from U-Mode",
    "Environment Call from S-Mode",
    "Reserved",
    "Environment Call from M-Mode",
    "Instruction Page Fault",
    "Load Page Fault",
    "Reserved for Future Standard Use",
    "Store/AMO Page Fault"
};


strap_handler_t intr_handlers[64];


strap_handler_t excp_handlers[64];

void strap_init(void){

    ({ unsigned long __v = (unsigned long) (((addr_t)strap_enter & (~((addr_t)(0b00))))); __asm__ __volatile__( "csrw " "mtvec" ", %0" : : "rK" (__v) : "memory" ); });

    ({ unsigned long __v = (unsigned long) (0); __asm__ __volatile__( "csrw " "mie" ", %0" : : "rK" (__v) : "memory" ); });

    for (size_t i = 0; i < 64; i++)
        regitser_strap_handler(i, False, ((void *)0), general_strap_handler);
    for (size_t i = 0; i < 64; i++)
        regitser_strap_handler(i, True, ((void *)0), general_strap_handler);

    regitser_strap_handler(0x07, True, "Machine Timer Interrupt", stimer_interrupt_handler);
}


void delegate_traps(void){





    ireg_t delegated_interrupts =
                                (1UL << 0x01) |
                                (1UL << 0x05) |
                                (1UL << 0x09);
# 96 "sbi/strap.c"
    ireg_t delegated_exceptions =
                                (1UL << 0x00) |
                                (1UL << 0x0C) |
                                (1UL << 0x0D) |
                                (1UL << 0x0F) |
                                (1UL << 0x05) |
                                (1UL << 0x07) |
                                (1UL << 0x03) |
                                (1UL << 0x02) |
                                (1UL << 0x08);
    ({ unsigned long __v = (unsigned long) (delegated_interrupts); __asm__ __volatile__( "csrw " "mideleg" ", %0" : : "rK" (__v) : "memory" ); });
    ({ unsigned long __v = (unsigned long) (delegated_exceptions); __asm__ __volatile__( "csrw " "medeleg" ", %0" : : "rK" (__v) : "memory" ); });
}


void strap_dispatcher(strapframe_t *stf_ptr){
    ireg_t mcause = ({ register unsigned long __v; asm volatile( "csrr %0, " "mcause" : "=r" (__v) : : "memory" ); __v; });

    Bool is_interrupt = ((mcause & (1UL << 63)) != 0) ? 1 : 0;
    uint64_t trap_code = mcause & ~((1UL << 63));
    int64_t rtval __attribute__((unused)) = (is_interrupt ? intr_handlers : excp_handlers)[trap_code](stf_ptr);
}


__attribute__((noreturn)) int64_t general_strap_handler(strapframe_t *stf_ptr){
    ireg_t mcause = ({ register unsigned long __v; asm volatile( "csrr %0, " "mcause" : "=r" (__v) : : "memory" ); __v; });
    Bool is_interrupt = ((mcause & (1UL << 63)) != 0) ? 1 : 0;
    uint64_t trap_code = mcause & ~((1UL << 63));
    const char **msg_source = (is_interrupt ? sintr_msg : sexcp_msg);
    const char *msg = msg_source[trap_code];
    const char *s = is_interrupt ? "Interrupt" : "Exception";
    bprintf("==================================================================\n");
    bprintf("Message from SBI General Trap Handler:\n");
    bprintf("%s Happened, %s ID: %#X, mcause register: %#X\n", s, s, trap_code, mcause);
    bprintf("Detailed Message: %s\n", msg);
    bprintf("No %s handler register for this %s, with ID: %#X\n", s, s, trap_code);
    bprintf("Running %s instead\n", __func__);
    bprintf("Printing Trap Frame:\n");
    print_strapframe(stf_ptr, bprintf);
    bprintf("Please register handler to avoid hanging!\n");
    bprintf("Hanging HART Here\n");
    while (1);
    __builtin_unreachable();
}


void regitser_strap_handler(uint64_t trap_code, Bool interrupt, const char* msg, strap_handler_t trap_func){
    if (msg != ((void *)0))
        (interrupt ? sintr_msg : sexcp_msg)[trap_code] = msg;
    (interrupt ? intr_handlers : excp_handlers)[trap_code] = trap_func;
}
