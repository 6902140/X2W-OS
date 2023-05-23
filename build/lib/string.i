# 0 "lib/string.c"
# 1 "/home/lighthouse/xzr/oskernel2023-x2w//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "lib/string.c"
# 13 "lib/string.c"
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
# 14 "lib/string.c" 2

size_t memset(void* dst, byte value, size_t size){
    size_t num = 0;
    uint8_t* dst_ = (uint8_t *)dst;
    while(size-- > 0)
        *dst_++ = value, num++;
    return num;
}

size_t strmset(void *dst, char value, size_t size){
    size_t num = 0;
    size_t maxl=strlen((char*)dst);
    char* dst_ = (char *)dst;
    while(size-- > 0&& maxl-->0)
        *dst_++ = value, num++;
    return num;
}

size_t memcpy(void* dst, const void* src, size_t size){
    size_t num = 0;
    uint8_t* dst_ = (uint8_t*) dst;
    const uint8_t* src_ = (uint8_t*) src;
    while (size-- > 0)
        *dst_++ = *src_++, num++;
    return num;
}

size_t memmove(void* dst, const void* src, size_t size){
    char *tmp, *s;
    size_t num = 0;
    if (dst <= src) {
        tmp = dst;
        s = (char *)src;
        while (size--){
            *tmp++ = *s++;
            num++;}
    } else {
        tmp = dst + size;
        s = (char *)src + size;
        while (size--){
            *--tmp = *--s;
            num++;}
    }

    return num;
}

int8_t memcmp(const void* a, const void* b, size_t size){
    const char* a_ = a;
    const char* b_ = b;
    while (size-- > 0){
        if (*a_ != *b_)
            return (int8_t)(*a_ > *b_ ? 1 : -1);
        a_++, b_++;
    }
    return (int8_t)0;
}


char* strcpy(char* dst, const char* src){
    char* r = dst;

    while ((*dst++ = *src++));
    return r;
}


size_t strlen(const char* str){
    const char* p = str;
    while(*p++);

    return (size_t)((p - 1) - str);
}


int8_t strcmp(const char* a, const char* b){
    while(*a != 0 && *a == *b)

        a++, b++;
    return *a < *b ? -1 : *a > *b;
}


char *strcat(char *dst, const char* src){
    char *str = dst;

    while (*str++);
    --str;
    while((*str++ = *src++));
    return dst;
}


char* strchr(const char* str, const uint8_t ch){
    while (*str != 0){
        if(*str == ch)
            return (char*) str;

        str++;
    }
    return ((void *)0);
}


char* strrchr(const char* str, const uint8_t ch){
    const char* last_char = ((void *)0);
    while (*str != 0){
        if (*str == ch)
            last_char = str;

        str++;
    }
    return (char*) last_char;
}


size_t strchrs(const char* str, uint8_t ch){
    size_t ch_cnt = 0;
    const char* p = str;
    while (*p != 0){
        if (*p == ch)
            ch_cnt++;
        p++;
    }
    return ch_cnt;
}

size_t strslice(const char* src, char* dst, int64_t start, int64_t len){
    char* sour=(char*)src+start;
    int64_t maxl=strlen(sour);
    size_t num=0;
    if(len>maxl)len=maxl;
    while(len-->0){
        num++;
        *(dst++)=*(sour++);
    }
    *dst='\0';
    return num;
}

void encrypt_decrypt(char *str, int len, char key)
{
    int i;
    for (i = 0; i < len; i++) {
        str[i] ^= key;
    }
}


int regu_match(const char *str, const char *pattern, int match_pos[])
{
    int i, j, k;
    int len_str = strlen(str);
    int len_pat = strlen(pattern);
    int num_match = 0;
    for (i = 0; i < len_str; i++) {
        if (str[i] == pattern[0]) {
            k = i;
            for (j = 0; j < len_pat; j++) {
                if (k >= len_str || str[k] != pattern[j]) {
                    break;
                }
                k++;
            }
            if (j == len_pat) {
                match_pos[num_match++] = i;
                i = k - 1;
            }
        }
    }
    return num_match;
}

void regu_replace(char *str, const char *pattern, const char *replacement, int max_len)
{
    int i, j, k;
    int len_str = strlen(str);
    int len_pat = strlen(pattern);
    int len_rep = strlen(replacement);
    int match_pos[2048];
    int num_match = regu_match(str, pattern, match_pos);
    if (num_match == 0) {
        return;
    }
    int new_len = len_str + num_match * (len_rep - len_pat);
    if (new_len >= max_len) {
        return;
    }
    k = 0;
    j = 0;
    for (i = 0; i < len_str; i++) {
        if (i == match_pos[j]) {
            memcpy(&str[k], replacement, len_rep);
            k += len_rep;
            i += len_pat - 1;
            j++;
        } else {
            str[k++] = str[i];
        }
    }
    str[k] = '\0';
}
