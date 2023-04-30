/**
 * @file list.h
 * @author Zhuir Xiao (xzr3356142450@gmail.com)
 * @brief `list.h`提供链表数据结构的一些基本操作. 
 * @version 0.1
 * @date 2023-04-30
 * 
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

static inline void __list_add(struct list_head *newin, struct list_head *prev,
		struct list_head *next)
{
	next->prev = newin;
	newin->next = next;
	newin->prev = prev;
	prev->next = newin;
}

/**
 * @brief 'list_add' 用于往指定list的头部添加一个元素
 * 
 * @param newin 新添加的列表元素
 * @param head 指定list的头部指针
 * 
 * @note 此函数通过调用__list_add实现，添加成功之后得到的仍然是一个环状list
 * 
 * 
 */
static inline void list_add(struct list_head *newin, struct list_head *head)
{
	__list_add(newin, head, head->next);
}


/**
 * @brief 'list_add_tail' 用于往指定list的尾部添加一个元素
 * 
 * @param newin 新添加的列表元素
 * @param head 指定list的头部指针
 * 
 * @note 此函数通过调用__list_add实现，添加成功之后得到的仍然是一个环状list
 * 
 * 
 */
static inline void list_add_tail(struct list_head *newin, struct list_head *head)
{
	__list_add(newin, head->prev, head);
}

static inline void __list_del(struct list_head *prev, struct list_head *next)
{
	next->prev = prev;
	prev->next = next;
}

/**
 * @brief 'list_del' 用于将一个list元素从它所属的list中删除
 * 
 * @param entry 指定的需要删除的list元素
 * 
 * @note 此函数通过调用__list_del实现，删除元素被放在dead_list中
 * 
 * 
 */
static inline void list_del(struct list_head *entry)
{
	__list_del(entry->prev, entry->next);
	entry->next =(struct list_head*) LIST_POISON1;
	entry->prev =(struct list_head*) LIST_POISON2;
}

/**
 * @brief 'list_empty' 用于判定指定list是否为空
 * 
 * @param head 输入list的头部指针
 * 
 * @return 若为空则返回1，否则返回0；
 * 
 * 
 */
static inline int list_empty(struct list_head *head)
{
	return head->next == head;
}

#define list_entry(ptr, type, member) \
	((type *)((char *)(ptr)-(unsigned long)(&((type *)0)->member)))

#define list_for_each(pos, head) \
	for (pos = (head)->next; pos != (head); pos = pos->next)


