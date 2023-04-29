/**
 * @file memory.h
 * @author Zhuiri Xiao (xzr3356142450@gmail.com)
 * @brief "memory.h" 定义了一些内存管理需要的常量和宏操作
 * @version 0.1
 * @date 2023-04-28
 * 
 * @warning 
 * 
 * @copyright Copyright Zhuiri Xiao (c) 2023 with GNU Public License V3.0
 */

#ifndef _MEMORY_H
#define _MEMORY_H


/**
 * @brief DDR_BASE是计入内存管理的起始地址
 * 
 */
#define DDR_BASE 0x80000000UL

/**
 * @brief 内存管理的内存大小
 * 
 * @note 可以手动改变大小
 */
#define TOTAL_MEMORY (16 * 0x100000UL)

/**
 * @brief DDR_BASE是计入内存管理的终止地址
 * 
 */
#define DDR_END (DDR_BASE + TOTAL_MEMORY)

#endif