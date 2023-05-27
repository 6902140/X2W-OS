# 0 "lib/stdlist.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "lib/stdlist.c"
# 11 "lib/stdlist.c"
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
# 12 "lib/stdlist.c" 2
# 1 "include/stdlist.h" 1
# 17 "include/stdlist.h"
# 1 "include/types.h" 1
# 18 "include/stdlist.h" 2
# 1 "include/stdlib.h" 1
# 82 "include/stdlib.h"
void itoa(uint64_t integer, char** buf_ptr_addr, uint8_t base);






int64_t atoi(char* str);
# 19 "include/stdlist.h" 2






typedef struct __list_elem_t {

    struct __list_elem_t* prev;

    struct __list_elem_t* next;
} list_elem_t;




typedef struct __list_t {

    list_elem_t head;

    list_elem_t tail;
} list_t;







typedef Bool (list_walking_func_t)(list_elem_t *elem_ptr, int arg);







void list_init(list_t *list_ptr);
# 66 "include/stdlist.h"
void list_insert(list_elem_t *before_ptr, list_elem_t *add_ptr);







void list_append(list_elem_t *elem_ptr, list_t *list_ptr);






void list_remove(list_elem_t *elem_ptr);







void list_push(list_elem_t *elem_ptr, list_t *list_ptr);
# 98 "include/stdlist.h"
list_elem_t* list_pop(list_t *list_ptr);
# 108 "include/stdlist.h"
Bool list_empty(list_t *list_ptr);







size_t list_size(list_t *list_ptr);
# 127 "include/stdlist.h"
Bool list_search(list_elem_t *elem_ptr, list_t *list_ptr);
# 137 "include/stdlist.h"
list_elem_t* list_walking(list_t *list_ptr, list_walking_func_t func, int arg);
# 13 "lib/stdlist.c" 2


void list_init(list_t *list_ptr){
    list_ptr->head.prev = ((void *)0);
    list_ptr->head.next = &list_ptr->tail;
    list_ptr->tail.prev = &list_ptr->head;
    list_ptr->tail.next = ((void *)0);
}

void list_insert(list_elem_t *before_ptr, list_elem_t *add_ptr){

    before_ptr->prev->next = add_ptr;
    add_ptr->prev = before_ptr->prev;
    add_ptr->next = before_ptr;
    before_ptr->prev = add_ptr;
}

void list_append(list_elem_t *elem_ptr, list_t *list_ptr){

    list_insert(&list_ptr->tail, elem_ptr);
}

void list_remove(list_elem_t *elem_ptr){


    elem_ptr->prev->next = elem_ptr->next;
    elem_ptr->next->prev = elem_ptr->prev;
}

void list_push(list_elem_t *elem_ptr, list_t *list_ptr){

    list_insert(list_ptr->head.next, elem_ptr);
}

list_elem_t* list_pop(list_t *list_ptr){
    list_elem_t *deleted_ptr = list_ptr->head.next;
    list_remove(list_ptr->head.next);
    return deleted_ptr;
}

Bool list_empty(list_t *list_ptr){
    return list_ptr->head.next == &list_ptr->tail ? True : False;
}

size_t list_size(list_t *list_ptr){
    size_t size = 0;
    list_elem_t *walking_ptr = list_ptr->head.next;
    while (walking_ptr->next != &list_ptr->tail){
        walking_ptr = walking_ptr->next;
        size++;
    }
    return size - 1;
}

Bool list_search(list_elem_t *elem_ptr, list_t *list_ptr){
    list_elem_t *walking_ptr = list_ptr->head.next;
    while (walking_ptr != &list_ptr->tail && walking_ptr != ((void *)0)){
        if (walking_ptr == elem_ptr)
            return True;
        walking_ptr = walking_ptr->next;
    }
    return False;
}

list_elem_t* list_walking(list_t *list_ptr, list_walking_func_t func, int arg){
    list_elem_t *walking_ptr = list_ptr->head.next;
    if (list_empty(list_ptr))
        return ((void *)0);
    while (walking_ptr != &list_ptr->tail){
        if (func(walking_ptr, arg))
            return walking_ptr;
        walking_ptr = walking_ptr->next;
    }
    return ((void *)0);
}
