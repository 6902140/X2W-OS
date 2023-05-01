.section ".text.boot"

.global kernel_start
kernel_start:
    # 关闭中断
    csrw sie, zero

    # 设置栈
    la sp, kstacks_start
    la sp, init_task_union
    li t0, 4096
    add sp, sp, t0
    la tp, init_task_union
    # 跳转到C函数
    tail kernel_main

.section .data
.align 12
.global kstacks_start
kstacks_start:
    .skip 4096