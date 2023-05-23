# 0 "sbi/smain.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "sbi/smain.c"
# 11 "sbi/smain.c"
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
# 12 "sbi/smain.c" 2
# 1 "include/constrains.h" 1
# 13 "sbi/smain.c" 2
# 1 "include/asm/csr.h" 1
# 14 "sbi/smain.c" 2
# 1 "include/sbi/sinit.h" 1
# 24 "include/sbi/sinit.h"
void sinit_all(void);
# 15 "sbi/smain.c" 2
# 1 "include/sbi/smain.h" 1
# 36 "include/sbi/smain.h"
__attribute__((noreturn)) void sbi_main(void);
# 54 "include/sbi/smain.h"
__attribute__((noreturn)) void jump_to_kernel(void);
# 16 "sbi/smain.c" 2
# 1 "include/sbi/sstdio.h" 1
# 16 "include/sbi/sstdio.h"
# 1 "include/stdfmt.h" 1
# 14 "include/stdfmt.h"
# 1 "include/types.h" 1
# 15 "include/stdfmt.h" 2
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
# 17 "sbi/smain.c" 2



__attribute__((noreturn)) void sbi_main(void){

    uart_init();

    bprintf("`YMM'   `MP'      `7MMF'     A     `7MF'             .M\"\"\"bgd `7MM\"\"\"Yp, `7MMF'\n" "  VMb.  ,P          `MA     ,MA     ,V              ,MI    \"Y   MM    Yb   MM  \n" "   `MM.M'     pd*\"*b.VM:   ,VVM:   ,V               `MMb.       MM    dP   MM  \n" "     MMb     (O)   j8 MM.  M' MM.  M'   **********    `YMMNq.   MM\"\"\"bg.   MM  \n" "   ,M'`Mb.       ,;j9 `MM A'  `MM A'                .     `MM   MM    `Y   MM  \n" "  ,P   `MM.   ,-='     :MM;    :MM;                 Mb     dM   MM    ,9   MM  \n" ".MM:.  .:MMa.Ammmmmmm   VF      VF                  P\"Ybmmd\"  .JMMmmmd9  .JMML.\n\n" "Copyright Shihong Wang, Shaofei Wang, Zhuiri Xiao (c) 2023 with GNU Public License V3.0\n" "Enjoy!\n");
    bprintf("============================================================\n");

    bprintf("Enter SBI!\n");

    bprintf("SBI init!\n");
    sinit_all();

    bprintf("Jump to kernel!\n");
    jump_to_kernel();
    __builtin_unreachable();
}



__attribute__((noreturn)) void jump_to_kernel(){

    uint64_t mval;
    mval = ({ register unsigned long __v; asm volatile( "csrr %0, " "mstatus" : "=r" (__v) : : "memory" ); __v; });
    mval = (((mval) & ~((3UL << 11))) | ((1UL) * (((3UL << 11)) & ~(((3UL << 11)) - 1))));
    mval = (((mval) & ~((1UL << 7))) | ((0UL) * (((1UL << 7)) & ~(((1UL << 7)) - 1))));
    ({ unsigned long __v = (unsigned long) (mval); __asm__ __volatile__( "csrw " "mstatus" ", %0" : : "rK" (__v) : "memory" ); });


    ({ unsigned long __v = (unsigned long) (0x80200000); __asm__ __volatile__( "csrw " "mepc" ", %0" : : "rK" (__v) : "memory" ); });

    ({ unsigned long __v = (unsigned long) (0x80200000); __asm__ __volatile__( "csrw " "stvec" ", %0" : : "rK" (__v) : "memory" ); });

    ({ unsigned long __v = (unsigned long) (0); __asm__ __volatile__( "csrw " "sie" ", %0" : : "rK" (__v) : "memory" ); });

    ({ unsigned long __v = (unsigned long) (0); __asm__ __volatile__( "csrw " "satp" ", %0" : : "rK" (__v) : "memory" ); });


    ({ unsigned long __v = (unsigned long) ((ireg_t)0x3FFFFFFFFFFFFF); __asm__ __volatile__( "csrw " "pmpaddr0" ", %0" : : "rK" (__v) : "memory" ); });
    ({ unsigned long __v = (unsigned long) (0xF); __asm__ __volatile__( "csrw " "pmpcfg0" ", %0" : : "rK" (__v) : "memory" ); });


    asm volatile("mret");
    __builtin_unreachable();
}
