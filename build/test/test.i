# 0 "test/test.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "test/test.c"
# 11 "test/test.c"
# 1 "include/test/test.h" 1
# 15 "include/test/test.h"
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
# 16 "include/test/test.h" 2
# 28 "include/test/test.h"
typedef int (*test_func_pointer_t)(void);







void register_test_func(test_func_pointer_t func);





void test_all(void);
# 12 "test/test.c" 2
# 1 "include/test/test_uart.h" 1
# 18 "include/test/test_uart.h"
int test_uart(void);
# 13 "test/test.c" 2
# 1 "include/test/test_stdlib.h" 1
# 15 "include/test/test_stdlib.h"
# 1 "include/stdlib.h" 1
# 16 "include/stdlib.h"
# 1 "include/types.h" 1
# 17 "include/stdlib.h" 2
# 82 "include/stdlib.h"
void itoa(uint64_t integer, char** buf_ptr_addr, uint8_t base);






int64_t atoi(char* str);
# 16 "include/test/test_stdlib.h" 2





int test_stdlib(void);
# 14 "test/test.c" 2
# 1 "include/test/test_stdfmt.h" 1
# 14 "include/test/test_stdfmt.h"
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
# 15 "test/test.c" 2
# 1 "include/test/test_string.h" 1
# 14 "include/test/test_string.h"
# 1 "include/string.h" 1
# 15 "include/test/test_string.h" 2





int test_string(void);
# 16 "test/test.c" 2
# 1 "include/test/test_kstdio.h" 1
# 20 "include/test/test_kstdio.h"
int test_kstdio(void);
# 17 "test/test.c" 2
# 1 "include/test/test_strap.h" 1
# 20 "include/test/test_strap.h"
__attribute__((noreturn)) int test_exception(void);
# 18 "test/test.c" 2


struct {

    uint8_t regiter_idx;

    test_func_pointer_t test_functions[20];
} _Test = {
    .regiter_idx = 0,
    .test_functions = {(test_func_pointer_t)((void *)0)}
};


void register_test_func(test_func_pointer_t func){

    if (_Test.regiter_idx < 20 - 1)
        _Test.test_functions[_Test.regiter_idx++] = func;

}


void test_all(void){


    register_test_func(test_uart);
    register_test_func(test_stdlib);
    register_test_func(test_stdfmt);
    register_test_func(test_string);
    register_test_func(test_kstdio);



    for (int i = 0; i < _Test.regiter_idx; i++)
        (*_Test.test_functions[i])();

}
