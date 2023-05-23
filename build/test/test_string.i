# 0 "test/test_string.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "test/test_string.c"
# 11 "test/test_string.c"
# 1 "include/kernel/kstdio.h" 1
# 16 "include/kernel/kstdio.h"
# 1 "include/stdfmt.h" 1
# 14 "include/stdfmt.h"
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
# 17 "include/kernel/kstdio.h" 2
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
# 18 "include/kernel/kstdio.h" 2
# 67 "include/kernel/kstdio.h"
size_t kprintf(const char* format, ...);
# 12 "test/test_string.c" 2
# 1 "include/test/test_string.h" 1
# 14 "include/test/test_string.h"
# 1 "include/string.h" 1
# 15 "include/test/test_string.h" 2





int test_string(void);
# 13 "test/test_string.c" 2


extern void uart_puts(const char*);


int test_string(void){
    uart_puts("=> "), uart_puts(__func__), uart_puts(": \n");
    char s[1024]="123456789qwertyuiop@#$$&*())\0";
    char t[1024]="eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\0";
    char* dst = "ffffffffffffffffffffffff\0";
    char* src = "tttttttttttttttttttttttt\0";

    size_t lm;
    lm=memset(s,'@',19);
    kprintf("\ttest memset within bound:%s:return val=%d;\n",s,lm);
    memcpy(t,s,strlen(s)/2);
    kprintf("\ttest memcpy within bound%s;no return val\n",t);
    kprintf("\ttest memcmp within bound%d\n",memcmp(s,t,20));
    kprintf("\ttest strcpy wthin bound %s;\n",strcpy(s,t));
    int8_t test5 = memcmp("abbbbbbbbbc","abbbbbbbbbd",6);
    kprintf("\ttest memcmp,return num:%d \n",test5);
    strcat(dst,src);
    kprintf("\ttest strcat:%s\n",dst);

    kprintf("\ttest strchr:%s\n",strchr("abbc",'b'));

    kprintf("\ttest strrchr:%s\n",strrchr("abbc\0",'b'));

    size_t test6 = strchrs("abbbbc",'b');
    kprintf("\ttest strchrs:%d\n",test6);


    char *t1="#############################3333333########\0";
    char *t2="@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\0";
    char *t3="\0";
    lm=strmset(t1,'$',10);
    kprintf("\ttest strmset within bound:%s:return val=%d;\n",t1,lm);
    lm=strmset(t2,'$',10000);
    kprintf("\ttest strmset out of bound:%s:return val=%d;\n",t1,lm);
    lm=strmset(t1,'@',10);
    lm=strslice(t1,t3,3,20);
    kprintf("\ttest strslice within bound:%s:return val=%d;\n",t3,lm);
    lm=strslice(t1,t3,3,200000);
    kprintf("\ttest strslice within bound:%s:return val=%d;\n",t3,lm);

    encrypt_decrypt(t2,strlen(t2)-3,'T');
    kprintf("\ttest encrypt_decrypt in coding thr string : after coding:%s\n",t2);
    encrypt_decrypt(t2,strlen(t2)-3,'T');
    kprintf("\ttest encrypt_decrypt in break-coding thr string : after break-coding:%s\n",t2);
    char* test="abcmmm";
    kprintf("\ttest memmove ,return value: %d\n",memmove(test,"def\n",3));






    return -1;
}
