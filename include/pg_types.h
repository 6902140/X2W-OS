/**
 * @file pg_types.h
 * @author Zhuir Xiao (xzr3356142450@gmail.com)
 * @brief `pg_types.h`提供了一些内存管理的类型定义 
 * @version 0.1
 * @date 2023-04-27
 * 
 * @warning 
 * 
 * @copyright Copyright Zhuiri Xiao (c) 2023 with GNU Public License V3.0
 */

#ifndef ASM_PGTABLE_TYPES_H
#define ASM_PGTABLE_TYPES_H

#include "types.h"

typedef uint64_t pteval_t;
typedef uint64_t pmdval_t;
typedef uint64_t pudval_t;
typedef uint64_t pgdval_t;

/**
 * @brief  定义pte页表结构体
 * 
 */
typedef struct {
	pteval_t pte;
} pte_t;
#define pte_val(x) ((x).pte)
#define __pte(x) ((pte_t) { (x) })

/**
 * @brief  定义pmd页表结构体
 * 
 */
typedef struct {
	pmdval_t pmd;
} pmd_t;
#define pmd_val(x) ((x).pmd)
#define __pmd(x) ((pmd_t) { (x) })

/**
 * @brief  定义pud页表结构体
 * 
 */
typedef struct {
	pudval_t pud;
} pud_t;
#define pud_val(x) ((x).pud)
#define __pud(x) ((pud_t) { (x) })

/**
 * @brief  定义pgd页表结构体
 * 
 */
typedef struct {
	pgdval_t pgd;
} pgd_t;
#define pgd_val(x) ((x).pgd)
#define __pgd(x) ((pgd_t) { (x) })


/**
 * @brief  定义一个结构体pgprot来描述页表项的属性
 * 
 */
typedef struct {
	unsigned long pgprot;
} pgprot_t;

/**
 * @brief  从pgprot_t结构体中获取其描述页表项PTE的属性的pgprot值
 * 
 */
#define pgprot_val(x)	((x).pgprot)

/**
 * @brief  根据X的值获得一个pgprot_t结构体，用来描述页表项PTE的属性（是否可写，是否有效等等）
 * 
 */
#define __pgprot(x)	((pgprot_t) { (x) })

#endif /*ASM_PGTABLE_TYPES_H*/
