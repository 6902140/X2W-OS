# 0 "lib/stdlib.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "lib/stdlib.c"
# 13 "lib/stdlib.c"
# 1 "include/stdlib.h" 1
# 16 "include/stdlib.h"
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
# 17 "include/stdlib.h" 2
# 82 "include/stdlib.h"
void itoa(uint64_t integer, char** buf_ptr_addr, uint8_t base);






int64_t atoi(char* str);
# 14 "lib/stdlib.c" 2



void itoa(uint64_t integer, char** buf_ptr_addr, uint8_t base){

    uint64_t remain = integer % base;
    uint64_t quotient = integer / base;

    if (quotient)
        itoa(quotient, buf_ptr_addr, base);
    if (remain < 10)
        *((*buf_ptr_addr)++) = remain + '0';
    else
        *((*buf_ptr_addr)++) = remain - 10 + 'A';
}

int64_t atoi(char* str){
    int sign=1,num=0;


    while (*str == ' ')
    {
        str++;
    }


    if(*str == '-'){
        sign = -1;
        str++;
    }


    while(*str >='0' && *str <='9'){
        num = num*10 + (*str-'0');
        str++;
        if (num > 2147483647 / 10 || (num == 2147483647 / 10 && (*str - '0') > 2147483647 % 10)) {
            return sign == -1 ? -2147483648 : 2147483647;
        }
    }

    return num*sign;
}
