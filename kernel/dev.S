    .align 4
    .section .data
    .section .data.dev_img
    .global dev_img_start
    .global dev_img_end
    .global dev_img_size
dev_img_start:
    .incbin "./vda2"
dev_img_end:
    .quad 0xffffffff
dev_img_size:
    .long dev_img_end-dev_img_start
    .global sacrifice_start
    .global sacrifice_end
    .global sacrifice_size
sacrifice_start:
    .incbin "./user/sacrifice"
sacrifice_end:
    .quad 0xffffffff
sacrifice_size:
    .long sacrifice_end-sacrifice_start
