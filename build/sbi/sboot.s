# 0 "sbi/sboot.S"
# 1 "/home/lighthouse/xzr/oskernel2023-x2w//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "sbi/sboot.S"
.section ".text.boot"

.global sbi_start
sbi_start:

    la sp, sstacks_start
    li t0, 4096
    add sp, sp, t0


 csrw mscratch, sp


    tail sbi_main

.section .data
.align 12
.global sstacks_start
sstacks_start:
    .skip 4096
