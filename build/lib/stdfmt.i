# 0 "lib/stdfmt.c"
# 1 "/home/lighthouse/xzr/oskernel2023-x2w//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "lib/stdfmt.c"
# 11 "lib/stdfmt.c"
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
# 12 "lib/stdfmt.c" 2
# 46 "lib/stdfmt.c"
const char* _scan_number(const char *str, int* num){
    int tmp = 0;
    while (('0' <= (*str) && (*str) <= '9')){
        tmp *= 10;
        tmp += *(str++) - '0';
    }
    *num = tmp;
    return str;
}


char *copy_number(char *str, unsigned long num, int base, int width, int precision, int flag){
    char pad_char;
    char sign = '\0';
    char char_num[128];


    const char *digits = "0123456789abcdefghijklmnopqrstuvwxyz";
    if (flag & 0b1000000)
        digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    if (base < 2 || base > 36)
        return ((void *)0);

    if (flag & 0b0001000)

        flag &= ~0b0000001;

    pad_char = (flag & 0b0000001) ? '0' : ' ';

    if (flag & 0b0100000){
        if ((long) num < 0){
            sign = '-';
            num = -(long) num;
        } else if (flag & 0b0000010){
            sign = '+';
            width--;
        } else if (flag & 0b0000100){
            sign = ' ';
            width--;
        }
    }

    if (flag & 0b0010000){
        if (base == 2 || base == 16)
            width -= 2;
        else if (base == 8)
            width -= 1;
    }


    int i = 0;
    if (num == 0)
        char_num[i++] = '0';
    else
        while (num != 0)
            char_num[i++] = digits[({ unsigned int __base = (base); unsigned int __remain; __remain = ((unsigned long)(num)) % __base; (num) = ((unsigned long)(num)) / __base; __remain; })];


    precision = i > precision ? i : precision;
    width -= precision;


    if (!(flag & (0b0000001 | 0b0001000)))
        while(width -- > 0)
            *str++ = ' ';


    if (sign)
        *str++ = sign;


    if (flag & 0b0010000){
        if (base == 2){
            *str++ = '0';
            *str++ = 'b';
        } else if (base == 8)
            *str++ = '0';
        else if (base == 16){
            *str++ = '0';
            *str++ = 'x';
        }
    }


    if (!(flag & 0b0001000))
        while (width-- > 0)
            *str++ = pad_char;


    while (i < precision--)
        *str++ = '0';
    while (i-- > 0)
        *str++ = char_num[i];
    while (width-- > 0)
        *str++ = ' ';

    return str;
}


size_t vsprintf(char* str, const char* format, va_list ap){
# 159 "lib/stdfmt.c"
    char* out_pos = str;
    const char* fmt_pos = format;


    int flag, width, precision, length;


    char *str_arg; unsigned long num_arg; size_t *int_ptr_arg;


    int base;


    for (fmt_pos = format; *fmt_pos != '\0'; fmt_pos++){

        if (*fmt_pos != '%'){
            *out_pos++ = *fmt_pos;
            continue;
        }




        ++fmt_pos;


        flag = 0;
        Bool is_flag_char = True;
        while (is_flag_char){
            switch (*fmt_pos){
                case '-':

                    flag |= 0b0001000;
                    break;
                case '+':

                    flag |= 0b0000010;
                    break;
                case ' ':

                    flag |= 0b0000100;
                    break;
                case '#':

                    flag |= 0b0010000;
                    break;
                case '0':

                    flag |= 0b0000001;
                    break;
                default:

                    is_flag_char = False;
            }
            fmt_pos++;
        }
        fmt_pos--;



        width = -1;
        if (('0' <= (*fmt_pos) && (*fmt_pos) <= '9')){

            fmt_pos = _scan_number(fmt_pos, &width);
        } else if (*fmt_pos == '*'){

            width = __builtin_va_arg(ap, int);

            if (width < 0){
                width = -width;
                flag |= 0b0001000;
            }
            fmt_pos++;
        }




        precision = -1;
        if (*fmt_pos == '.'){

            ++fmt_pos;
            if (('0' <= (*fmt_pos) && (*fmt_pos) <= '9'))

                fmt_pos = _scan_number(fmt_pos, &precision);
            else if (*fmt_pos == '*'){

                precision = __builtin_va_arg(ap, int);
                fmt_pos++;
            }


            if (precision < 0)
                precision = 0;
        }




        length = -1;
        if (*fmt_pos == 'h' || *fmt_pos == 'l' || *fmt_pos == 'L'){
            length = *fmt_pos++;

            if (length == 'l' && *fmt_pos == 'l'){
                length = 'L';
                fmt_pos++;
            }
        }


        switch (*fmt_pos){
            case '%':
                *out_pos++ = '%';
                continue;
            case 'c':

                if (!(flag & 0b0001000))
                    while (--width > 0)
                        *out_pos++ = ' ';
                *out_pos++ = (unsigned char) __builtin_va_arg(ap, int);

                while (--width > 0)
                    *out_pos++ = ' ';
                continue;
            case 's':
                str_arg = __builtin_va_arg(ap, char *);
                if (*str_arg == '\0')
                    str_arg = "<NULL>";
                int str_arg_len = (int) strlen(str_arg);
                precision = precision > 0 ? precision : str_arg_len;
                str_arg_len = str_arg_len > precision ? precision : str_arg_len;


                if (!(flag & 0b0001000))
                    while (str_arg_len < width--)
                        *out_pos++ = ' ';
                strcpy(out_pos, str_arg);
                out_pos += str_arg_len;

                while (str_arg_len < width--)
                    *out_pos++ = ' ';
                continue;
            case 'n':
                int_ptr_arg = (size_t *)__builtin_va_arg(ap, size_t*);
                *int_ptr_arg = (size_t)(out_pos - str);
                continue;
            case 'p':
                if (width == -1){
                    width = 2 * sizeof(void *);
                    flag |= 0b0000001;
                }
                out_pos = copy_number(
                    out_pos, (unsigned long) __builtin_va_arg(ap, void*),
                    16, width, precision, flag
                );
                continue;
            case 'b':
                base = 2;
                break;
            case 'o':
                base = 8;
                break;
            case 'X':
                flag |= 0b1000000;
            case 'x':
                base = 16;
                break;
            case 'd':
            case 'i':
                flag |= 0b0100000;
            case 'u':
                base = 10;
                break;

            default:
                if (*fmt_pos)
                    *out_pos++ = *fmt_pos;
                else
                    fmt_pos--;
                break;
        }


        if (length == 'L') {
            if (flag & 0b0100000)
                num_arg = __builtin_va_arg(ap, long);
            else
                num_arg = __builtin_va_arg(ap, long);
        } else if (length == 'h') {
            if (flag & 0b0100000)
                num_arg = (short) __builtin_va_arg(ap, int);
            else
                num_arg = (unsigned short) __builtin_va_arg(ap, unsigned int);
        } else if (length == 'l') {
            if (flag & 0b0100000)
                num_arg = __builtin_va_arg(ap, long);
            else
                num_arg = __builtin_va_arg(ap, unsigned long);
        } else {
            if (flag & 0b0100000)
                num_arg = (int) __builtin_va_arg(ap, int);
            else
                num_arg = __builtin_va_arg(ap, unsigned int);
        }

        out_pos = copy_number(out_pos, num_arg, base, width, precision, flag);
    }

    *out_pos = '\0';
    return out_pos - str;
}

size_t sprintf(char* buf, const char* format, ...){
    va_list args;
    size_t retval;
    __builtin_va_start(args, format);
    retval = vsprintf(buf, format, args);
    __builtin_va_end(args);
    return retval;
}
