/**
 * @file list.h
 * @author Zhuir Xiao (xzr3356142450@gmail.com)
 * @brief `list.h`提供链表数据结构的一些基本操作. 
 * @version 0.1
 * @date 2023-04-30
 * 
 * @todo 
 *  1. 需要进行测试, 以测试函数正确性
 * 
 * @warning 
 * 
 * @copyright Copyright Zhuiri Xiao (c) 2023 with GNU Public License V3.0
 */


#include "types.h"

struct list_head {
	struct list_head *next, *prev;
};

#define POISON_POINTER_DELTA 0xdead000000000000
#define LIST_POISON1  ((void *) 0x00100100 + POISON_POINTER_DELTA)
#define LIST_POISON2  ((void *) 0x00200200 + POISON_POINTER_DELTA)

#define LIST_HEAD_INIT(name) {&(name), &(name)}

#define LIST_HEAD(name) \
	struct list_head name = LIST_HEAD_INIT(name)


/**
 * @brief 'INIT_LIST_HEAD' 初始化一个list的头指针
 * 
 * @return 返回一个用户物理页的起始地址
 * 
 */
static inline void INIT_LIST_HEAD(struct list_head *list)
{
	list->next = list;
	list->prev = list;
}