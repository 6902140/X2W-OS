    .align 4
    .section .data
    .global initcode
    .global initcodesize
initcode:
    .incbin "./user/initcode"
codeend:

initcodesize:
    .long codeend-initcode
