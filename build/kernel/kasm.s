# 0 "kernel/kasm.S"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "kernel/kasm.S"
# 11 "kernel/kasm.S"
# 1 "include/constrains.h" 1
# 12 "kernel/kasm.S" 2



.extern kernel_pgd
# 25 "kernel/kasm.S"
.global enable_vm_translation
enable_vm_translation:
    # 内核页目录表的物理地址
    la a2, _s_kernel_pgd
    # 计算内核页目录表的物理页号
    srl a2, a2, 12
    # 使用Sv39虚拟地址转换机制
    li a1, (1UL << 63)
    or a2, a2, a1
    # 内存屏障, RISC-V是弱内存模型, 即为了提升指令吞吐量, CPU执行阶段会乱序执行指令
    # 开启虚拟地址转换后, 地址被解释为虚拟地址, 而开启虚拟地址转换前, 地址被解释为物理地址
    # 因此csrw satp, a2指令后内存访问指令不能在csrw satp, a2指令前运行
    # 否则会将指令中的虚拟地址解释为物理地址, 导致未可知的错误发生
    # 所以这里手动触发内存屏障, 即通知CPU在乱序执行指令的时候, sfence.vma之后的内存访问指令不能再sfence.vma指令前执行
    # 从而确保了虚拟地址访问指令不会在开启虚拟地址转换前被运行
    sfence.vma
    csrw satp, a2
    ret
