# 0 "test/test_stdfmt.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "test/test_stdfmt.c"
# 11 "test/test_stdfmt.c"
# 1 "include/test/test_stdfmt.h" 1
# 14 "include/test/test_stdfmt.h"
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
# 15 "include/test/test_stdfmt.h" 2






int test_stdfmt(void);
# 12 "test/test_stdfmt.c" 2


extern void uart_puts(const char*);


void _test_types(void);


void _test_flags(void);


void _test_width(void);


void _test_precision(void);


void _test_length(void);


int test_stdfmt(void){
    uart_puts("=> "), uart_puts(__func__), uart_puts(": \n");

    _test_types();
    _test_flags();
    _test_width();
    _test_precision();
    _test_length();

    return 0;
}

void _test_types(void){
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a single percent sign: %%\n");
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a single char: %c\n", 'J');
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a string: %s\n", "'Hello World'");
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a pointer: %p\n", (void*)sprintf_buffer);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a binary: %b\n", 0b1111111111111111);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a octal: %o\n", 01234567);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a hex: %x\n", 0xABCDEF);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a capitcal-hex: %X\n", 0xABCDEF);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a decimal: %i\n", 123456789);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a decimal: %d\n", 123456789);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a unsigned decimal: %u\n", (unsigned int)(-1));
        uart_puts(sprintf_buffer);
    }
    {
        size_t nums = 0;
        char sprintf_buffer1[100] = {0};
        char sprintf_buffer2[100] = {0};
        sprintf(sprintf_buffer1, "Output a string: %s, char been output:%n", "'Hello World'", &nums);
        uart_puts(sprintf_buffer1);
        sprintf(sprintf_buffer2, "%d\n", (int)nums);
        uart_puts(sprintf_buffer2);
    }
}

void _test_flags(void){
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a 20-bit  left-aligned decimal: %-20d\n", 1234567890);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a 20-bit right-aligned decimal: %20d\n", 1234567890);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a 20-bit right-aligned space-padded decimal: %20d\n", 1234567890);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a 20-bit right-aligned     0-padded decimal: %020d\n", 1234567890);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a positive decimal: %d\n", 100);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a negative decimal: %d\n", -100);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a signed positive decimal: %+d\n", 100);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a signed negative decimal: %+d\n", -100);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a suffixed binary: %#b\n", 0b1111);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a suffixed octal: %#o\n", 07654321);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a suffixed hex: %#x\n", 0xabcdef);
        uart_puts(sprintf_buffer);
    }
}


void _test_width(void){
    uart_puts("                              : 01234567890123456789\n");
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a fixed-width decimal  : %20d\n", 123456);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a dynamic-width decimal: %*d\n", 15, 123456);
        uart_puts(sprintf_buffer);
    }
}


void _test_precision(void){
    uart_puts("                                  : 01234567890123456789\n");
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a fixed-precision decimal  : %.2d\n", 123456);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a fixed-precision decimal  : %.9d\n", 123456);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a dynamic-precision decimal: %.*d\n", 15, 123456);
        uart_puts(sprintf_buffer);
    }
}


void _test_length(void){
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a short: %hd\n", (short)12345);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a long: %ld\n", (long)123456789987654321);
        uart_puts(sprintf_buffer);
    }
    {
        char sprintf_buffer[100] = {0};
        sprintf(sprintf_buffer, "Output a long long: %ld\n", (long)987654321123456789);
        uart_puts(sprintf_buffer);
    }
}
