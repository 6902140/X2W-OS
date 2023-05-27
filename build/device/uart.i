# 0 "device/uart.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "device/uart.c"
# 17 "device/uart.c"
# 1 "include/device/uart.h" 1
# 21 "include/device/uart.h"
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
# 22 "include/device/uart.h" 2
# 1 "include/types.h" 1
# 23 "include/device/uart.h" 2
# 1 "include/asm/uart.h" 1
# 24 "include/device/uart.h" 2
# 1 "include/constrains.h" 1
# 25 "include/device/uart.h" 2
# 35 "include/device/uart.h"
void uart_init(void);






char uart_get(void);
# 51 "include/device/uart.h"
void uart_put(char chr);
# 60 "include/device/uart.h"
void uart_puts(const char *string);







void uart_interrupt_handler(void);
# 18 "device/uart.c" 2

void uart_init(void){


    uint16_t divisor = (uint16_t) (1843200 / (16 * 115200));


    write_8_bits((0x10000000 + 0x01), 0b00000000);


    write_8_bits((0x10000000 + 0x03), 0b10000000);
    write_8_bits((0x10000000 + 0x00), (uint8_t)(divisor & 0x0011));
    write_8_bits((0x10000000 + 0x01), (uint8_t)((divisor & 0x1100) >> 8));


    write_8_bits((0x10000000 + 0x03), 0b00000011);


    write_8_bits((0x10000000 + 0x02), 0b11000111);


    write_8_bits((0x10000000 + 0x01), 0b00000001);
}


void uart_put(char chr){

    while ((read_8_bits((0x10000000 + 0x05)) & 0b01000000) == 0);
    write_8_bits((0x10000000 + 0x00), chr);
}

void uart_puts(const char* str){
    for (int i = 0; str[i] != '\0'; i++)
        uart_put((char) str[i]);
}

char uart_get(void){
    if (read_8_bits((0x10000000 + 0x05)) & 0b00000001)
        return read_8_bits((0x10000000 + 0x00));
    else
        return -1;
}


void uart_interrupt_handler(void){
    char c = uart_get();
    if (c < 0)
        return;
    else if (c == '\r') {
        uart_puts("Enter an enter!\n");
    }

    uart_put(c);
}
