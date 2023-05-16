/**
 * @file init.c
 * @author Shihong Wang (jack4shihong@gmail.com)
 * @brief `kinit.c`对内核进行初始化
 * @version 0.1
 * @date 2023-04-10
 * 
 * @copyright Copyright Shihong Wang (c) 2023 with GNU Public License V3.0
 */

#include "kernel/ktrap.h"
#include "kernel/kinit.h"
#include "kernel/ktimer.h"
#include "kernel/kstdio.h"
#include "kernel/memory.h"
#include "mm.h"
#include "sched.h"

extern char _text_boot[], _etext_boot[];
extern char _text[], _etext[];
extern char _rodata[], _erodata[];
extern char _data[], _edata[];
extern char _bss[], _ebss[];

void kinit_all(void){
    // uart_init();
    ktrap_init();
    kprintf("=> ktrap_init\n");
    ktimer_init();
    kprintf("=> ktimer_init\n");
    local_interrupt_enable();
    kprintf("=> local_interrupt_enable\n");
    mem_init((unsigned long)_ebss, DDR_END);
    paging_init();
    sched_init();

}