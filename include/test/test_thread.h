/**
 * @file test_memory.h
 * @author Zhuiri Xiao (xzr3356142450@gmail.com)
 * @brief `test_thread.h`是`bitmap`实现的测试文件
 * @version 0.1
 * @date 2023-05-01
 * 
 * @copyright Copyright Zhuiri Xiao (c) 2023 with GNU Public License V3.0
 */

#ifndef __INCLUDE_TEST_TEST_THR_H
#define __INCLUDE_TEST_TEST_THR_H

#include "types.h"
#include "test.h"
#include "sched.h"


void user_thread1(void);

void user_thread2(void);

int run_new_clone_thread(void *arg);

int run_user_thread(void);

void move_thread1(void);

void move_thread2(void);

void user_thread(void);

/**
 * @brief `test_bitmap`是`bitmap`库的测试函数
 * @return int 测试正常则返回0
 */
int test_thread(void);

#endif