# 0 "test/test_kstdio.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "test/test_kstdio.c"
# 11 "test/test_kstdio.c"
# 1 "include/test/test_kstdio.h" 1
# 14 "include/test/test_kstdio.h"
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
# 15 "include/test/test_kstdio.h" 2





int test_kstdio(void);
# 12 "test/test_kstdio.c" 2



extern size_t kprintf(const char* format, ...);

int test_kstdio(void){
    kprintf("=> %s:\n", __func__);
    for (int i = -2; i < 2; i++)
        kprintf("\tHello World: %d\n", i);
    return 0;
}
