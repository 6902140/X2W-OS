# 0 "lib/stdbitmap.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "lib/stdbitmap.c"
# 11 "lib/stdbitmap.c"
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
# 12 "lib/stdbitmap.c" 2
# 1 "include/string.h" 1
# 20 "include/string.h"
# 1 "include/types.h" 1
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
# 13 "lib/stdbitmap.c" 2
# 1 "include/stdbitmap.h" 1
# 29 "include/stdbitmap.h"
typedef struct __bitmap_t {

    size_t size;

    byte *bits;
} bitmap_t;
# 43 "include/stdbitmap.h"
void bitmap_init(bitmap_t *btmp_ptr, size_t size);
# 52 "include/stdbitmap.h"
void bitmap_set(bitmap_t *btmp_ptr, offset_t bit_idx, Bool taken);
# 62 "include/stdbitmap.h"
Bool bitmap_test(bitmap_t *btmp_ptr, offset_t bit_idx);
# 73 "include/stdbitmap.h"
offset_t bitmap_scan(bitmap_t *btmp_ptr, size_t cnt);
# 88 "include/stdbitmap.h"
Bool bitmap_acquire(bitmap_t *btmp_ptr, offset_t out[], size_t cnt);







void bitmap_release(bitmap_t *btmp_ptr, offset_t out[], size_t cnt);
# 14 "lib/stdbitmap.c" 2





void bitmap_init(bitmap_t *btmp_ptr, size_t size){
    btmp_ptr->size = size;
    memset(btmp_ptr->bits, (byte)0, size);
}

void bitmap_set(bitmap_t *btmp_ptr, offset_t bit_idx, Bool taken){

    offset_t byte_idx = (offset_t)(bit_idx / 8);

    offset_t rbit_idx = (offset_t)(bit_idx % 8);

    if (taken)

        btmp_ptr->bits[byte_idx] |= (1 << rbit_idx);
    else

        btmp_ptr->bits[byte_idx] &= ~(1 << rbit_idx);
}

Bool bitmap_test(bitmap_t *btmp_ptr, offset_t bit_idx){

    offset_t byte_idx = (offset_t)(bit_idx / sizeof(byte));

    offset_t rbit_idx = (offset_t)(bit_idx % sizeof(byte));
    return (btmp_ptr->bits[byte_idx] & (1 << rbit_idx)) == 0 ? False : True;
}

offset_t bitmap_scan(bitmap_t *btmp_ptr, size_t cnt){

    offset_t byte_idx, rbit_idx, gbit_idx;
    byte_idx = rbit_idx = gbit_idx = 0;


    while (btmp_ptr->bits[byte_idx] == 0xFF && byte_idx < btmp_ptr->size)
        byte_idx++;

    if (byte_idx == btmp_ptr->size)
        return -1;


    while ((byte) (1 << rbit_idx) & btmp_ptr->bits[byte_idx])
        rbit_idx++;


    gbit_idx = byte_idx * 8 + rbit_idx;


    if (cnt == 1)
        return gbit_idx;


    size_t num_bits = btmp_ptr->size * 8 - gbit_idx;
    offset_t next_bit = gbit_idx + 1;
    size_t found_bits = 1;
    gbit_idx = -1;
    while (num_bits-- > 0){
        if (!bitmap_test(btmp_ptr, next_bit))
            found_bits++;
        else
            found_bits = 0;

        if (found_bits == cnt){
            gbit_idx = next_bit - cnt + 1;
            break;
        }
        next_bit++;
    }
    return gbit_idx;
}

Bool bitmap_acquire(bitmap_t *btmp_ptr, offset_t out[], size_t cnt){
    size_t i = 0;
    offset_t gbit_idx = 0;
    while (gbit_idx != -1 && i++ < cnt){
        gbit_idx = bitmap_scan(btmp_ptr, 1);
        out[i] = gbit_idx;
    }

    if (gbit_idx == -1){
        while (i-- >= 0)
            out[i] = -1;
        return False;
    }

    for (i = 0; i < cnt; i++)
        bitmap_set(btmp_ptr, out[i], True);
    return True;
}

void bitmap_release(bitmap_t *btmp_ptr, offset_t in[], size_t cnt){
    for (size_t i = 0; i < cnt; i++)
        bitmap_set(btmp_ptr, in[i], False);
}
