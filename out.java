riscv64-unknown-elf-gcc -nostdlib -nostdinc -fno-builtin -fno-pie -mabi=lp64 -march=rv64imafd -mcmodel=medany -g -O0 -I include/ -fomit-frame-pointer -Wall -Wmissing-prototypes -Werror=strict-prototypes -Werror=incompatible-pointer-types  -c -o /home/lighthouse/xzr/X2W-OS/build/kernel/fork.o kernel/fork.c
运行内核: kernel.elf, 所有输出将在下方显示
首先按下 Ctrl+A, 然后按下 X 键以退出 QEMU
你可以运行 `make debug-gdb` 以使用 GDB 调试内核
或者运行 `make debug-vscode` 以使用 VSCode 链接 QEMU 调试内核
----------------------------------------------------------------------------
`YMM'   `MP'      `7MMF'     A     `7MF'             .M"""bgd `7MM"""Yp, `7MMF'
  VMb.  ,P          `MA     ,MA     ,V              ,MI    "Y   MM    Yb   MM  
   `MM.M'     pd*"*b.VM:   ,VVM:   ,V               `MMb.       MM    dP   MM  
     MMb     (O)   j8 MM.  M' MM.  M'   **********    `YMMNq.   MM"""bg.   MM  
   ,M'`Mb.       ,;j9 `MM A'  `MM A'                .     `MM   MM    `Y   MM  
  ,P   `MM.   ,-='     :MM;    :MM;                 Mb     dM   MM    ,9   MM  
.MM:.  .:MMa.Ammmmmmm   VF      VF                  P"Ybmmd"  .JMMmmmd9  .JMML.

Copyright Shihong Wang, Shaofei Wang, Zhuiri Xiao (c) 2023 with GNU Public License V3.0
Enjoy!
============================================================
Enter SBI!
SBI init!
=> strap_init
=> secall_init
=> delegate_traps
=> stimer_init
Jump to kernel!
============================================================
In kernel!
Kernel init!
=> ktrap_init
=> ktimer_init
=> local_interrupt_enable
Memory: 14264KB available, 3566 free pages, phy_start_address=0x80212000
-------ffff------
-------ffff------
-------ffff------

*************successfully initialize kernel_pool and user_pool***********
4
4
4
4
4
4
4
4
4
4
4
Start testing!
============================================================
X2W-OS Image Layout:
  kernel: 0x80200000 - 0x80211148 ( 69960 B)
  .text.boot: 0x80200000 - 0x80200028 (    40 B)
       .text: 0x80200028 - 0x80209000 ( 36824 B)
     .rodata: 0x80209000 - 0x8020aa22 (  6690 B)
       .data: 0x8020aa22 - 0x80210000 ( 21982 B)
        .bss: 0x80210000 - 0x80211148 (  4424 B)
============================================================
Kernel Hanging Here!
cnt=1
4
point 3
4
point 2
fetch a pid=1
!!------------------!!
poin1
cnt=1
4
point 3
point 2
bitmap start from 0x8049000
---thread pid[1] bitmap alloc successfully!!!---
append p->runlist=80480c0
ready_task_num=1
cnt=1
4
point 3
point 2
fetch a pid=2
!!------------------!!
poin1
cnt=1
4
point 3
point 2
bitmap start from 0x804b000
---thread pid[2] bitmap alloc successfully!!!---
append p->runlist=804a0c0
ready_task_num=2
cnt=1
4
point 3
point 2
fetch a pid=3
!!------------------!!
poin1
cnt=1
4
point 3
point 2
bitmap start from 0x804d000
---thread pid[3] bitmap alloc successfully!!!---
append p->runlist=804c0c0
ready_task_num=3
00ci0w-acvjd
pid:1,2,3
append p->runlist=8020d0c0
ready_task_num=4
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main tpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 welcome to kernel stage .2
now public variable with lock protection is <1>
pid[1] is on running 12345;
now public variable with lock protection is <2>
pid[1] is on running 12345;
now public variable with lock protection is <3>
pid[1] is on running 12345;
now public variable with lock protection is <4>
pid[1] is on running 12345;
now public variable with lock protection is <5>
pid[1] is on running 12345;
now public variable with lock protection is <6>
pid[1] is on running 12345;
now public variable with lock protection is <7>
pid[1] is on running 12345;
now public variable with lock protection is <8>
pid[1] is on running 12345;
now public variable with lock protection is <9>
pid[1] is on running 12345;
now public variable with lock protection ipid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 welcome to kernel stage 3
now public variable with lock protection is <11>
pid[2] is on running abcde;
now public variable with lock protection is <12>
pid[2] is on running abcde;
now public variable with lock protection is <13>
pid[2] is on running abcde;
now public variable with lock protection is <14>
pid[2] is on running abcde;
now public variable with lock protection is <15>
pid[2] is on running abcde;
now public variable with lock protection is <16>
pid[2] is on running abcde;
now public variable with lock protection is <17>
pid[2] is on running abcde;
now public variable with lock protection is <18>
pid[2] is on running abcde;
now public variable with lock protection is <19>
pid[2] is on running abcde;
now public variablepid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 welcome to kernel stage 3
now public variable with lock protection is <21>
pid[3] is on running !@#$^;
now public variable with lock protection is <22>
pid[3] is on running !@#$^;
now public variable with lock protection is <23>
pid[3] is on running !@#$^;
now public variable with lock protection is <24>
pid[3] is on running !@#$^;
now public variable with lock protection is <25>
pid[3] is on running !@#$^;
now public variable with lock protection is <26>
pid[3] is on running !@#$^;
now public variable with lock protection is <27>
pid[3] is on running !@#$^;
now public variable with lock protection is <28>
pid[3] is on running !@#$^;
now public variable with lock protection is <29>
pid[3] is on running !@#$^;
now public variable with lockpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
hread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
s <10>
pid[1] is on running 12345;
now public variable with lock protection is <31>
pid[1] is on running 12345;
now public variable with lock protection is <32>
pid[1] is on running 12345;
now public variable with lock protection is <33>
pid[1] is on running 12345;
now public variable with lock protection is <34>
pid[1] is on running 12345;
now public variable with lock protection is <35>
pid[1] is on running 12345;
now public variable with lock protection is <36>
pid[1] is on running 12345;
now public variable with lock protection is <37>
pid[1] is on running 12345;
now public variable withpid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
 with lock protection is <20>
pid[2] is on running abcde;
now public variable with lock protection is <39>
pid[2] is on running abcde;
now public variable with lock protection is <40>
pid[2] is on running abcde;
now public variable with lock protection is <41>
pid[2] is on running abcde;
now public variable with lock protection is <42>
pid[2] is on running abcde;
now public variable with lock protection is <43>
pid[2] is on running abcde;
now public variable with lock protection is <44>
pid[2] is on running abcde;
now public variable with lock protection is <45>
pid[2] is on running abcde;
now publpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
 protection is <30>
pid[3] is on running !@#$^;
now public variable with lock protection is <47>
pid[3] is on running !@#$^;
now public variable with lock protection is <48>
pid[3] is on running !@#$^;
now public variable with lock protection is <49>
pid[3] is on running !@#$^;
now public variable with lock protection is <50>
pid[3] is on running !@#$^;
now public variable with lock protection is <51>
pid[3] is on running !@#$^;
now public variable with lock protection is <52>
pid[3] is on running !@#$^;
now public variable with lock protection is <53>
pid[3] is on running !@#$^;
now public variable with lock protection is <54>
pid[3] is on running !@#$^;
now public variable with lock protection is <55>
pid[3] is on running !@#$^;
now public variable with lock protection is <56>
pid[3] is on running !@#$^;
now publipid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
el main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernepid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
 lock protection is <38>
pid[1] is on running 12345;
now public variable with lock protection is <58>
pid[1] is on running 12345;
now public variable with lock protection is <59>
pid[1] is on running 12345;
now public variable with lock protection is <60>
pid[1] is on running 12345;
now public variable with lock protection is <61>
pid[1] is on running 12345;
now public variable with lock protection is <62>
pid[1] is on running 12345;
now public variable with lock protection is <63>
pid[1] is on running 12345;
now public variable with lock protection is <64>
pid[1] is on running 12345;
now public variable with lock protection is <65>
pid[1] is on running 12345;
now public variable with lock protection is <66>
pid[1] is on running 12345;
now public variable with lock protection is <67>
pid[1] is on running 12345;
nopid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
ic variable with lock protection is <46>
pid[2] is on running abcde;
now public variable with lock protection is <69>
pid[2] is on running abcde;
now public variable with lock protection is <70>
pid[2] is on running abcde;
now public variable with lock protection is <71>
pid[2] is on running abcde;
now public variable with lock protection is <72>
pid[2] is on running abcde;
now public variable with lock protection is <73>
pid[2] is on running abcde;
now public variable with lock protection is <74>
pid[2] is on running abcde;
now public variable with lock protection is <75>
pid[2] is on running abcde;
now public variable with lock protection is <76>
pid[2] is on running abcde;
now public variable with lock protection is <77>
pid[2] is on running abcde;
now public variable with lock ppid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
c variable with lock protection is <57>
pid[3] is on running !@#$^;
now public variable with lock protection is <79>
pid[3] is on running !@#$^;
now public variable with lock protection is <80>
pid[3] is on running !@#$^;
now public variable with lock protection is <81>
pid[3] is on running !@#$^;
now public variable with lock protection is <82>
pid[3] is on running !@#$^;
now public variable with lock protection is <83>
pid[3] is on running !@#$^;
now public variable with lock protection is <84>
pid[3] is on running !@#$^;
now public variable with lock protection is <85>
pid[3] is on running !@#$^;
now public variable with lock protection is <86>
pid[3] is on running !@#$^;
now public variable with lock protection is <87>
pid[3] is on running !@#$^;
now public variable with lock protection is <88>
pid[3] is on running !@#$^;
now public variable with lock protection is <89>
pid[3] is on running !@#$^;
now public variable with lock protection is <90>
pid[3] is on running !@#$^;
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
l main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pipid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
w public variable with lock protection is <68>
pid[1] is on running 12345;
now public variable with lock protection is <92>
pid[1] is on running 12345;
now public variable with lock protection is <93>
pid[1] is on running 12345;
now public variable with lock protection is <94>
pid[1] is on running 12345;
now public variable with lock protection is <95>
pid[1] is on running 12345;
now public variable with lock protection is <96>
pid[1] is on running 12345;
now public variable with lock protection is <97>
pid[1] is on running 12345;
now public variable with lock protection is <98>
pid[1] is on running 12345;
now public variable with lock protection is <99>
pid[1] is on running 12345;
now public variable with lock protection is <100>
pid[1] is on running 12345;
now public variable with lock protection is <101>
pid[1] is on running 12345;
now public variable with lock protection is <102>
pid[1] is on running 12345;
now public variable with lock protection is <103>
pid[1] is on running 12345;
now public variable with lock protection is <104>
pid[1] is on running 12345;
now public variable with lock protection is <105>
pid[1] is on running 12345;
now public variable with lock protection is <106>
pid[1] is on running 12345;
now public variable with lock protection is <107>
pid[1] is on running 12345;
now public variable with lock protection is <108>
pid[1] is on running 12345;
now public variable with lock protection is <109>
pid[1] is on running 12345;
now public variable with lock protection is <110>
pid[1] is on running 12345;
now public variable with lock protection is <111>
pid[1] is on running 12345;
now public variable with lock protection is <112>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
rotection is <78>
pid[2] is on running abcde;
now public variable with lock protection is <114>
pid[2] is on running abcde;
now public variable with lock protection is <115>
pid[2] is on running abcde;
now public variable with lock protection is <116>
pid[2] is on running abcde;
now public variable with lock protection is <117>
pid[2] is on running abcde;
now public variable with lock protection is <118>
pid[2] is on running abcde;
now public variable with lock protection is <119>
pid[2] is on running abcde;
now public variable with lock protection is <120>
pid[2] is on running abcde;
now public variable with lock protection is <121>
pid[2] is on running abcde;
now public variable with lock protection is <122>
pid[2] is on running abcde;
now public variable with lock protection is <123>
pid[2] is on running abcde;
now public variable with lock protection is <124>
pid[2] is on running abcde;
now public variable with lock protection is <125>
pid[2] is on running abcde;
now public variable with lock protection is <126>
pid[2] is on running abcde;
now public variable with lock protection is <127>
pid[2] is on running abcde;
now public variable with lock protection is <128>
pid[2] is on running abcde;
now public variable with lock protection is <129>
pid[2] is on running abcde;
now public variable with lock protection is <130>
pid[2] is on running abcde;
now public variable with lock protection is <131>
pid[2] is on running abcde;
now public variable with lock protection is <132>
pid[2] is on running abcde;
now public variable with lock protection is <133>
pid[2] is on running abcde;
now public variable with lock protection is <134>
pid[2] is on running abcde;
now public variable with pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
now public variable with lock protection is <91>
pid[3] is on running !@#$^;
now public variable with lock protection is <136>
pid[3] is on running !@#$^;
now public variable with lock protection is <137>
pid[3] is on running !@#$^;
now public variable with lock protection is <138>
pid[3] is on running !@#$^;
now public variable with lock protection is <139>
pid[3] is on running !@#$^;
now public variable with lock protection is <140>
pid[3] is on running !@#$^;
now public variable with lock protection is <141>
pid[3] is on running !@#$^;
now public variable with lock protection is <142>
pid[3] is on running !@#$^;
now public variable with lock protection is <143>
pid[3] is on running !@#$^;
now public variable with lock protection is <144>
pid[3] is on running !@#$^;
now public variable with lock protection is <145>
pid[3] is on running !@#$^;
now public variable with lock protection is <146>
pid[3] is on running !@#$^;
now public variable with lock protection is <147>
pid[3] is on running !@#$^;
now public variable with lock protection is <148>
pid[3] is on running !@#$^;
now public variable with lock protection is <149>
pid[3] is on running !@#$^;
now public variable with lock protection is <150>
pid[3] is on running !@#$^;
now public variable with lock protection is <151>
pid[3] is on running !@#$^;
now public variable with lock protection is <152>
pid[3] is on running !@#$^;
now public variable with lock protection is <153>
pid[3] is on running !@#$^;
now public variable with lock protection is <154>
pid[3] is on running !@#$^;
now public variable with lock protection is <155>
pid[3] is on running !@#$^;
now public variable with lock protection is <156>
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
d[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread npid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <156>
pid[1] is on running 12345;
now public variable with lock protection is <157>
pid[1] is on running 12345;
now public variable with lock protection is <158>
pid[1] is on running 12345;
now public variable with lock protection is <159>
pid[1] is on running 12345;
now public variable with lock protection is <160>
pid[1] is on running 12345;
now public variable with lock protection is <161>
pid[1] is on running 12345;
now public variable with lock protection is <162>
pid[1] is on running 12345;
now public variable with lock protection is <163>
pid[1] is on running 12345;
now public variable with lock protection is <164>
pid[1] is on running 12345;
now public variable with lock protection is <165>
pid[1] is on running 12345;
now public variable with lock protection is <166>
pid[1] is on running 12345;
now public variable with lock protection is <167>
pid[1] is on running 12345;
now public variable with lock protection is <168>
pid[1] is on running 12345;
now public variable with lock protection is <169>
pid[1] is on running 12345;
now public variable with lock protection is <170>
pid[1] is on running 12345;
now public variable with lock protection is <171>
pid[1] is on running 12345;
now public variable with lock protection is <172>
pid[1] is on running 12345;
now public variable with lock protection is <173>
pid[1] is on running 12345;
now public variable with lock protection is <174>
pid[1] is on running 12345;
now public variable with lock protection is <175>
pid[1] is on running 12345;
now public variable with lock protection is <176>
pid[1] is on running 12345;
now public variable with lock protection is <177>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
lock protection is <135>
pid[2] is on running abcde;
now public variable with lock protection is <179>
pid[2] is on running abcde;
now public variable with lock protection is <180>
pid[2] is on running abcde;
now public variable with lock protection is <181>
pid[2] is on running abcde;
now public variable with lock protection is <182>
pid[2] is on running abcde;
now public variable with lock protection is <183>
pid[2] is on running abcde;
now public variable with lock protection is <184>
pid[2] is on running abcde;
now public variable with lock protection is <185>
pid[2] is on running abcde;
now public variable with lock protection is <186>
pid[2] is on running abcde;
now public variable with lock protection is <187>
pid[2] is on running abcde;
now public variable with lock protection is <188>
pid[2] is on running abcde;
now public variable with lock protection is <189>
pid[2] is on running abcde;
now public variable with lock protection is <190>
pid[2] is on running abcde;
now public variable with lock protection is <191>
pid[2] is on running abcde;
now public variable with lock protection is <192>
pid[2] is on running abcde;
now public variable with lock protection is <193>
pid[2] is on running abcde;
now public variable with lock protection is <194>
pid[2] is on running abcde;
now public variable with lock protection is <195>
pid[2] is on running abcde;
now public variable with lock protection is <196>
pid[2] is on running abcde;
now public variable with lock protection is <197>
pid[2] is on running abcde;
now public variable with lock protection is <198>
pid[2] is on running abcde;
now public variable with lock protection is <199>
pid[2] is on running abcde;
nowpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
pid[3] is on running !@#$^;
now public variable with lock protection is <201>
pid[3] is on running !@#$^;
now public variable with lock protection is <202>
pid[3] is on running !@#$^;
now public variable with lock protection is <203>
pid[3] is on running !@#$^;
now public variable with lock protection is <204>
pid[3] is on running !@#$^;
now public variable with lock protection is <205>
pid[3] is on running !@#$^;
now public variable with lock protection is <206>
pid[3] is on running !@#$^;
now public variable with lock protection is <207>
pid[3] is on running !@#$^;
now public variable with lock protection is <208>
pid[3] is on running !@#$^;
now public variable with lock protection is <209>
pid[3] is on running !@#$^;
now public variable with lock protection is <210>
pid[3] is on running !@#$^;
now public variable with lock protection is <211>
pid[3] is on running !@#$^;
now public variable with lock protection is <212>
pid[3] is on running !@#$^;
now public variable with lock protection is <213>
pid[3] is on running !@#$^;
now public vpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
ow
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel mpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <214>
pid[1] is on running 12345;
now public variable with lock protection is <215>
pid[1] is on running 12345;
now public variable with lock protection is <216>
pid[1] is on running 12345;
now public variable with lock protection is <217>
pid[1] is on running 12345;
now public variable with lock protection is <218>
pid[1] is on running 12345;
now public variable with lock protection is <219>
pid[1] is on running 12345;
now public variable with lock protection is <220>
pid[1] is on running 12345;
now public variable with lock protection is <221>
pid[1] is on running 12345;
now public variable with lock protection is <222>
pid[1] is on running 12345;
now public variable with lpid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
 public variable with lock protection is <200>
pid[2] is on running abcde;
now public variable with lock protection is <224>
pid[2] is on running abcde;
now public variable with lock protection is <225>
pid[2] is on running abcde;
now public variable with lock protection is <226>
pid[2] is on running abcde;
now public variable with lock protection is <227>
pid[2] is on running abcde;
now public variable with lock protection is <228>
pid[2] is on running abcde;
now public variable with lock protection is <229>
pid[2] is on running abcde;
now public variable with lock protection is <230>
pid[2] is on running abcde;
now public variable with lock protection is <231>
pid[2] is on running abcde;
now public variable with lock protection is <232>
pid[2] is on running abcde;
now pubpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
ariable with lock protection is <214>
pid[3] is on running !@#$^;
now public variable with lock protection is <234>
pid[3] is on running !@#$^;
now public variable with lock protection is <235>
pid[3] is on running !@#$^;
now public variable with lock protection is <236>
pid[3] is on running !@#$^;
now public variable with lock protection is <237>
pid[3] is on running !@#$^;
now public variable with lock protection is <238>
pid[3] is on running !@#$^;
now public variable with lock protection is <239>
pid[3] is on running !@#$^;
now public variable with lock protection is <240>
pid[3] is on running !@#$^;
now public variable with lock protection is <241>
pid[3] is on running !@#$^;
now public variable with lock protection is <242>
pid[3] is on runnpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
ain thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
ock protection is <223>
pid[1] is on running 12345;
now public variable with lock protection is <243>
pid[1] is on running 12345;
now public variable with lock protection is <244>
pid[1] is on running 12345;
now public variable with lock protection is <245>
pid[1] is on running 12345;
now public variable with lock protection is <246>
pid[1] is on running 12345;
now public variable with lock protection is <247>
pid[1] is on running 12345;
now public variable with lock protection is <248>
pid[1] is on running 12345;
now public variable with lock protection is <249>
pid[1] is on running 12345;
now public variable with lock protection is <250>
pid[1] is on running 12345;
now ppid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
lic variable with lock protection is <233>
pid[2] is on running abcde;
now public variable with lock protection is <252>
pid[2] is on running abcde;
now public variable with lock protection is <253>
pid[2] is on running abcde;
now public variable with lock protection is <254>
pid[2] is on running abcde;
now public variable with lock protection is <255>
pid[2] is on running abcde;
now public variable with lock protection is <256>
pid[2] is on running abcde;
now public variable with lock protection is <257>
pid[2] is on running abcde;
now public variable with lock protection is <258>
pid[2] is on running abcde;
now public variable with lock protection is <259>
pid[2] is on running abcde;
now public variable with lock protection is <260>
pid[2] is on running abcde;
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
ing !@#$^;
now public variable with lock protection is <262>
pid[3] is on running !@#$^;
now public variable with lock protection is <263>
pid[3] is on running !@#$^;
now public variable with lock protection is <264>
pid[3] is on running !@#$^;
now public variable with lock protection is <265>
pid[3] is on running !@#$^;
now public variable with lock protection is <266>
pid[3] is on running !@#$^;
now public variable with lock protection is <267>
pid[3] is on running !@#$^;
now public variable with lock protection is <268>
pid[3] is on running !@#$^;
now public variable with lock protection is <269>
pid[3] is on running !@#$^;
now public variable with lock protection is <270>
pid[3] is on running !@#$^;
now public variable with lock protection is <271>
pid[3] is on running !@#$^;
now public varpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
ublic variable with lock protection is <251>
pid[1] is on running 12345;
now public variable with lock protection is <273>
pid[1] is on running 12345;
now public variable with lock protection is <274>
pid[1] is on running 12345;
now public variable with lock protection is <275>
pid[1] is on running 12345;
now public variable with lock protection is <276>
pid[1] is on running 12345;
now public variable with lock protection is <277>
pid[1] is on running 12345;
now public variable with lock protection is <278>
pid[1] is on running 12345;
now public variable with lock protection is <279>
pid[1] is on running 12345;
now public variable with lock protection is <280>
pid[1] is on running 12345;
now public variable with lock protection is <281>
pid[1] is on running 12345;
now public variable with lock protection is <282>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
now public variable with lock protection is <282>
pid[2] is on running abcde;
now public variable with lock protection is <283>
pid[2] is on running abcde;
now public variable with lock protection is <284>
pid[2] is on running abcde;
now public variable with lock protection is <285>
pid[2] is on running abcde;
now public variable with lock protection is <286>
pid[2] is on running abcde;
now public variable with lock protection is <287>
pid[2] is on running abcde;
now public variable with lock protection is <288>
pid[2] is on running abcde;
now public variable with lock protection is <289>
pid[2] is on running abcde;
now public variable with lock protection is <290>
pid[2] is on running abcde;
now public variabpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
iable with lock protection is <272>
pid[3] is on running !@#$^;
now public variable with lock protection is <292>
pid[3] is on running !@#$^;
now public variable with lock protection is <293>
pid[3] is on running !@#$^;
now public variable with lock protection is <294>
pid[3] is on running !@#$^;
now public variable with lock protection is <295>
pid[3] is on running !@#$^;
now public variable with lock protection is <296>
pid[3] is on running !@#$^;
now public variable with lock protection is <297>
pid[3] is on running !@#$^;
now public variable with lock protection is <298>
pid[3] is on running !@#$^;
now public variable with lock protection is <299>
pid[3] is on running !@#$^;
now public variable with lock protection is <300>
pid[3] is on running !@#$^;
now public variable with lock protection is <301>
pid[3] is on runningpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernelpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <302>
pid[1] is on running 12345;
now public variable with lock protection is <303>
pid[1] is on running 12345;
now public variable with lock protection is <304>
pid[1] is on running 12345;
now public variable with lock protection is <305>
pid[1] is on running 12345;
now public variable with lock protection is <306>
pid[1] is on running 12345;
now public variable with lock protection is <307>
pid[1] is on running 12345;
now public variable with lock protection is <308>
pid[1] is on running 12345;
now public variable with lock protection is <309>
pid[1] is on running 12345;
now public variable with lock protection is <310>
pid[1] is on running 12345;
now public variable with lock protection is <311>
pid[1] is on running 12345;
now public variable with lock protection is <312>
pid[1] is on running 12345;
now public variable with lock protection is <313>
pid[1] is on running 12345;
now public variable with lock protection is <314>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
le with lock protection is <291>
pid[2] is on running abcde;
now public variable with lock protection is <316>
pid[2] is on running abcde;
now public variable with lock protection is <317>
pid[2] is on running abcde;
now public variable with lock protection is <318>
pid[2] is on running abcde;
now public variable with lock protection is <319>
pid[2] is on running abcde;
now public variable with lock protection is <320>
pid[2] is on running abcde;
now public variable with lock protection is <321>
pid[2] is on running abcde;
now public variable with lock protection is <322>
pid[2] is on running abcde;
now public variable with lock protection is <323>
pid[2] is on running abcde;
now public variable with lock protection is <324>
pid[2] is on running abcde;
now public variable with lock protection is <325>
pid[2] is on running abcde;
now public variable with lock protection is <326>
pid[2] is on running abcde;
now public variable with lock protection is <327>
pid[2] is on running abcde;
now public variable with lock protection is <328>
pid[2] is on running abcde;
now public variable with lock protection is <329>
pid[2] is on running abcde;
now public variable with lock protection is <330>
pid[2] is on running abcde;
now public variable with lock protection is <331>
pid[2] is on running abcde;
now public variable with lock protection is <332>
pid[2] is on running abcde;
now public variable with lock protection is <333>
pid[2] is on running abcde;
now public variable with lock protection is <334>
pid[2] is on running abcde;
now public variable with lock protection is <335>
pid[2] is on running abcde;
now public variable with lock protection is <336>
pid[2] is on running abcde;
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
 !@#$^;
now public variable with lock protection is <338>
pid[3] is on running !@#$^;
now public variable with lock protection is <339>
pid[3] is on running !@#$^;
now public variable with lock protection is <340>
pid[3] is on running !@#$^;
now public variable with lock protection is <341>
pid[3] is on running !@#$^;
now public variable with lock protection is <342>
pid[3] is on running !@#$^;
now public variable with lock protection is <343>
pid[3] is on running !@#$^;
now public variable with lock protection is <344>
pid[3] is on running !@#$^;
now public variable with lock protection is <345>
pid[3] is on running !@#$^;
now public variable with lock protection is <346>
pid[3] is on running !@#$^;
now public variable with lock protection is <347>
pid[3] is on running !@#$^;
now public variable with lock protection is <348>
pid[3] is on running !@#$^;
now public variable with lock protection is <349>
pid[3] is on running !@#$^;
now public variable with lock protection is <350>
pid[3] is on running !@#$^;
now public variable with lock protection is <351>
pid[3] is on running !@#$^;
now public variable with lock protection is <352>
pid[3] is on running !@#$^;
now public variable with lock protection is <353>
pid[3] is on running !@#$^;
now public variable with lock protection is <354>
pid[3] is on running !@#$^;
now public variable with lock protection is <355>
pid[3] is on running !@#$^;
now public variable with lock protection is <356>
pid[3] is on running !@#$^;
now public variable with lock protection pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
 main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <357>
pid[1] is on running 12345;
now public variable with lock protection is <358>
pid[1] is on running 12345;
now public variable with lock protection is <359>
pid[1] is on running 12345;
now public variable with lock protection is <360>
pid[1] is on running 12345;
now public variable with lock protection is <361>
pid[1] is on running 12345;
now public variable with lock protection is <362>
pid[1] is on running 12345;
now public variable with lock protection is <363>
pid[1] is on running 12345;
now public variable with lock protection is <364>
pid[1] is on running 12345;
now public variable with lock protection is <365>
pid[1] is on running 12345;
now public variable with lock protection is <366>
pid[1] is on running 12345;
now public variable with lock protection is <367>
pid[1] is on running 12345;
now public variable with lock protection is <368>
pid[1] is on running 12345;
now public variable with lock protection is <369>
pid[1] is on running 12345;
now public variable with lock protection is <370>
pid[1] is on running 12345;
now public variable with lock protection is <371>
pid[1] is on running 12345;
now public variable with lock protection is <372>
pid[1] is on running 12345;
now public variable with lock protection is <373>
pid[1] is on running 12345;
now public variable with lock protection is <374>
pid[1] is on running 12345;
now public variable with lock protection is <375>
pid[1] is on running 12345;
now public variable with lock protection is <376>
pid[1] is on running 12345;
now public variable with lock protection is <377>
pid[1] is on running 12345;
now public variable with lock protection is <378>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
now public variable with lock protection is <337>
pid[2] is on running abcde;
now public variable with lock protection is <380>
pid[2] is on running abcde;
now public variable with lock protection is <381>
pid[2] is on running abcde;
now public variable with lock protection is <382>
pid[2] is on running abcde;
now public variable with lock protection is <383>
pid[2] is on running abcde;
now public variable with lock protection is <384>
pid[2] is on running abcde;
now public variable with lock protection is <385>
pid[2] is on running abcde;
now public variable with lock protection is <386>
pid[2] is on running abcde;
now public variable with lock protection is <387>
pid[2] is on running abcde;
now public variable with lock protection is <388>
pid[2] is on running abcde;
now public variable with lock protection is <389>
pid[2] is on running abcde;
now public variable with lock protection is <390>
pid[2] is on running abcde;
now public variable with lock protection is <391>
pid[2] is on running abcde;
now public variable with lock protection is <392>
pid[2] is on running abcde;
now public variable with lock protection is <393>
pid[2] is on running abcde;
now public variable with lock protection is <394>
pid[2] is on running abcde;
now public variable with lock protection is <395>
pid[2] is on running abcde;
now public variable with lock protection is <396>
pid[2] is on running abcde;
now public variable with lock protection is <397>
pid[2] is on running abcde;
now public variable with lock protection is <398>
pid[2] is on running abcde;
now public variable with lock protection is <399>
pid[2] is on running abcde;
now public variable with lock protection is <400>
pid[2] is on running abcde;
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
is <357>
pid[3] is on running !@#$^;
now public variable with lock protection is <402>
pid[3] is on running !@#$^;
now public variable with lock protection is <403>
pid[3] is on running !@#$^;
now public variable with lock protection is <404>
pid[3] is on running !@#$^;
now public variable with lock protection is <405>
pid[3] is on running !@#$^;
now public variable with lock protection is <406>
pid[3] is on running !@#$^;
now public variable with lock protection is <407>
pid[3] is on running !@#$^;
now public variable with lock protection is <408>
pid[3] is on running !@#$^;
now public variable with lock protection is <409>
pid[3] is on running !@#$^;
now public variable with lock protection is <410>
pid[3] is on running !@#$^;
now public variable with lock protection is <411>
pid[3] is on running !@#$^;
now public variable with lock protection is <412>
pid[3] is on running !@#$^;
now public variable with lock protection is <413>
pid[3] is on running !@#$^;
now public variable with lock protection is <414>
pid[3] is on running !@#$^;
now public variable with lock protection is <415>
pid[3] is on running !@#$^;
now public variable with lock protection is <416>
pid[3] is on running !@#$^;
now public variable with lock protection is <417>
pid[3] is on running !@#$^;
now public variable with lock protection is <418>
pid[3] is on running !@#$^;
now public variable with lock protection is <419>
pid[3] is on running !@#$^;
now public variable with lock protection is <420>
pid[3] is on running !@#$^;
now public variable with lock protection is <421>
pid[3] is on running !@#$^;
now public variable with lock protection is <422>
pid[3] is on running !@#$^;
now public variablepid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <379>
pid[1] is on running 12345;
now public variable with lock protection is <424>
pid[1] is on running 12345;
now public variable with lock protection is <425>
pid[1] is on running 12345;
now public variable with lock protection is <426>
pid[1] is on running 12345;
now public variable with lock protection is <427>
pid[1] is on running 12345;
now public variable with lock protection is <428>
pid[1] is on running 12345;
now public variable with lock protection is <429>
pid[1] is on running 12345;
now public variable with lock protection is <430>
pid[1] is on running 12345;
now public variable with lock protection is <431>
pid[1] is on running 12345;
now public variable with lock protection is <432>
pid[1] is on running 12345;
now public variable with lock protection is <433>
pid[1] is on running 12345;
now public variable with lock protection is <434>
pid[1] is on running 12345;
now public variable with lock protection is <435>
pid[1] is on running 12345;
now public variable with lock protection is <436>
pid[1] is on running 12345;
now public variable with lock protection is <437>
pid[1] is on running 12345;
now public variable with lock protection is <438>
pid[1] is on running 12345;
now public variable with lock protection is <439>
pid[1] is on running 12345;
now public variable with lock protection is <440>
pid[1] is on running 12345;
now public variable with lock protection is <441pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
now public variable with lock protection is <441>
pid[2] is on running abcde;
now public variable with lock protection is <442>
pid[2] is on running abcde;
now public variable with lock protection is <443>
pid[2] is on running abcde;
now public variable with lock protection is <444>
pid[2] is on running abcde;
now public variable with lock protection is <445>
pid[2] is on running abcde;
now public variable with lock protection is <446>
pid[2] is on running abcde;
now public variable with lock protection is <447>
pid[2] is on running abcde;
now public variable with lock protection is <448>
pid[2] is on running abcde;
now public variable with lock protection is <449>
pid[2] is on running abcde;
now public variable with lock protection is <450>
pid[2] is on running abcde;
now public variable with lock protection is <451>
pid[2] is on rpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
 with lock protection is <423>
pid[3] is on running !@#$^;
now public variable with lock protection is <452>
pid[3] is on running !@#$^;
now public variable with lock protection is <453>
pid[3] is on running !@#$^;
now public variable with lock protection is <454>
pid[3] is on running !@#$^;
now public variable with lock protection is <455>
pid[3] is on running !@#$^;
now public variable with lock protection is <456>
pid[3] is on running !@#$^;
now public variable with lock protection is <457>
pid[3] is on running !@#$^;
now public variable with lock protection is <458>
pid[3] is on running !@#$^;
now public variable with lock protection is <459>
pid[3] is on running !@#$^;
now public variable with lock protection is <460>
pid[3] is on running !@#$^;
now public variabpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
ernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
>
pid[1] is on running 12345;
now public variable with lock protection is <462>
pid[1] is on running 12345;
now public variable with lock protection is <463>
pid[1] is on running 12345;
now public variable with lock protection is <464>
pid[1] is on running 12345;
now public variable with lock protection is <465>
pid[1] is on running 12345;
now public variable with lock protection is <466>
pid[1] is on running 12345;
now public variable with lock protection is <467>
pid[1] is on running 12345;
now public variable with lock protection is <468>
pid[1] is on running 12345;
now public variable with lock protection is <469>
pid[1] is on running 12345;
now public variable with lock protection is <470>
pid[1] is on running 12345;
now public variable with lock protection is <471>
pid[1] is on running 12345;
now public variable with lock protection is <472>
pid[pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
unning abcde;
now public variable with lock protection is <473>
pid[2] is on running abcde;
now public variable with lock protection is <474>
pid[2] is on running abcde;
now public variable with lock protection is <475>
pid[2] is on running abcde;
now public variable with lock protection is <476>
pid[2] is on running abcde;
now public variable with lock protection is <477>
pid[2] is on running abcde;
now public variable with lock protection is <478>
pid[2] is on running abcde;
now public variable with lock protection is <479>
pid[2] is on running abcde;
now public variable with lock protection is <480>
pid[2] is on running abcde;
now public variable with lock protection is <481>
pid[2] is on running abcde;
now public variable with lock ppid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
le with lock protection is <461>
pid[3] is on running !@#$^;
now public variable with lock protection is <483>
pid[3] is on running !@#$^;
now public variable with lock protection is <484>
pid[3] is on running !@#$^;
now public variable with lock protection is <485>
pid[3] is on running !@#$^;
now public variable with lock protection is <486>
pid[3] is on running !@#$^;
now public variable with lock protection is <487>
pid[3] is on running !@#$^;
now public variable with lock protection is <488>
pid[3] is on running !@#$^;
now public variable with lock protection is <489>
pid[3] is on running !@#$^;
now public variable with lock protection is <490>
pid[3] is on running !@#$^;
now public variable with lock protection is <491>
pid[3] is on runninpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
1] is on running 12345;
now public variable with lock protection is <492>
pid[1] is on running 12345;
now public variable with lock protection is <493>
pid[1] is on running 12345;
now public variable with lock protection is <494>
pid[1] is on running 12345;
now public variable with lock protection is <495>
pid[1] is on running 12345;
now public variable with lock protection is <496>
pid[1] is on running 12345;
now public variable with lock protection is <497>
pid[1] is on running 12345;
now public variable with lock protection is <498>
pid[1] is on running 12345;
now public variable with lock protection is <499>
pid[1] is on running 12345;
now public variable with lock protection is <500>
pid[1] ispid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
rotection is <482>
pid[2] is on running abcde;
now public variable with lock protection is <501>
pid[2] is on running abcde;
now public variable with lock protection is <502>
pid[2] is on running abcde;
now public variable with lock protection is <503>
pid[2] is on running abcde;
now public variable with lock protection is <504>
pid[2] is on running abcde;
now public variable with lock protection is <505>
pid[2] is on running abcde;
now public variable with lock protection is <506>
pid[2] is on running abcde;
now public variable with lock protection is <507>
pid[2] is on running abcde;
now public variable with lock protection is <508>
pid[2] is on running abcde;
now public variable with lock protection is <509>
pid[2] is on running abcde;
now public variablepid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
g !@#$^;
now public variable with lock protection is <511>
pid[3] is on running !@#$^;
now public variable with lock protection is <512>
pid[3] is on running !@#$^;
now public variable with lock protection is <513>
pid[3] is on running !@#$^;
now public variable with lock protection is <514>
pid[3] is on running !@#$^;
now public variable with lock protection is <515>
pid[3] is on running !@#$^;
now public variable with lock protection is <516>
pid[3] is on running !@#$^;
now public variable with lock protection is <517>
pid[3] is on running !@#$^;
now public variable with lock protection is <518>
pid[3] is on running !@#$^;
now public variable with lock protection is <519>
pid[3] is on running !@#$^;
now public variapid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernepid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
 on running 12345;
now public variable with lock protection is <521>
pid[1] is on running 12345;
now public variable with lock protection is <522>
pid[1] is on running 12345;
now public variable with lock protection is <523>
pid[1] is on running 12345;
now public variable with lock protection is <524>
pid[1] is on running 12345;
now public variable with lock protection is <525>
pid[1] is on running 12345;
now public variable with lock protection is <526>
pid[1] is on running 12345;
now public variable with lock protection is <527>
pid[1] is on running 12345;
now public variable with lock protection is <528>
pid[1] is on running 12345;
now public variable with lock protection is <529>
pid[1] is on running 12345;
now public variable with lock protection is <530>
pid[1] is on running 12345;
now public variable with lock protection is <531>
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
 with lock protection is <510>
pid[2] is on running abcde;
now public variable with lock protection is <532>
pid[2] is on running abcde;
now public variable with lock protection is <533>
pid[2] is on running abcde;
now public variable with lock protection is <534>
pid[2] is on running abcde;
now public variable with lock protection is <535>
pid[2] is on running abcde;
now public variable with lock protection is <536>
pid[2] is on running abcde;
now public variable with lock protection is <537>
pid[2] is on running abcde;
now public variable with lock protection is <538>
pid[2] is on running abcde;
now public variable with lock protection is <539>
pid[2] is on running abcde;
now public variable with lock prpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
ble with lock protection is <520>
pid[3] is on running !@#$^;
now public variable with lock protection is <541>
pid[3] is on running !@#$^;
now public variable with lock protection is <542>
pid[3] is on running !@#$^;
now public variable with lock protection is <543>
pid[3] is on running !@#$^;
now public variable with lock protection is <544>
pid[3] is on running !@#$^;
now public variable with lock protection is <545>
pid[3] is on running !@#$^;
now public variable with lock protection is <546>
pid[3] is on running !@#$^;
now public variable with lock protection is <547>
pid[3] is on running !@#$^;
now public variable with lock protection is <548>
pid[3] is on running !@#$^;
now public variable with lock protection is <549>
pid[3] is on running !@#$^;
now public variable with lock protection is <5pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
l main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
pid[1] is on running 12345;
now public variable with lock protection is <551>
pid[1] is on running 12345;
now public variable with lock protection is <552>
pid[1] is on running 12345;
now public variable with lock protection is <553>
pid[1] is on running 12345;
now public variable with lock protection is <554>
pid[1] is on running 12345;
now public variable with lock protection is <555>
pid[1] is on running 12345;
now public variable with lock protection is <556>
pid[1] is on running 12345;
now public variable with lock protection is <557>
pid[1] is on running 12345;
now public variable with lock protection is <558>
pid[1] is on running 12345;
now public variable with lock protection is <559>
pid[1] is on running 12345;
now ppid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
otection is <540>
pid[2] is on running abcde;
now public variable with lock protection is <561>
pid[2] is on running abcde;
now public variable with lock protection is <562>
pid[2] is on running abcde;
now public variable with lock protection is <563>
pid[2] is on running abcde;
now public variable with lock protection is <564>
pid[2] is on running abcde;
now public variable with lock protection is <565>
pid[2] is on running abcde;
now public variable with lock protection is <566>
pid[2] is on running abcde;
now public variable with lock protection is <567>
pid[2] is on running abcde;
now public variable with lock protection is <568>
pid[2] is on running abcde;
now public variable with lock protection is <569>
pid[2] is on running abcde;
now public variable with lock protection is <570>
pid[2] is on running abcde;
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
50>
pid[3] is on running !@#$^;
now public variable with lock protection is <572>
pid[3] is on running !@#$^;
now public variable with lock protection is <573>
pid[3] is on running !@#$^;
now public variable with lock protection is <574>
pid[3] is on running !@#$^;
now public variable with lock protection is <575>
pid[3] is on running !@#$^;
now public variable with lock protection is <576>
pid[3] is on running !@#$^;
now public variable with lock protection is <577>
pid[3] is on running !@#$^;
now public variable with lock protection is <578>
pid[3] is on running !@#$^;
now public variable with lock protection is <579>
pid[3] is on running !@#$^;
now public variable with lock protection is <580>
pid[3] is on running !@#$^;
now public variable with lock protection is <581pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernelpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
ublic variable with lock protection is <560>
pid[1] is on running 12345;
now public variable with lock protection is <582>
pid[1] is on running 12345;
now public variable with lock protection is <583>
pid[1] is on running 12345;
now public variable with lock protection is <584>
pid[1] is on running 12345;
now public variable with lock protection is <585>
pid[1] is on running 12345;
now public variable with lock protection is <586>
pid[1] is on running 12345;
now public variable with lock protection is <587>
pid[1] is on running 12345;
now public variable with lock protection is <588>
pid[1] is on running 12345;
now public variable with lock protection is <589>
pid[1] is on running 12345;
now public variable with lock protection is <590>
pid[1] is pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
now public variable with lock protection is <590>
pid[2] is on running abcde;
now public variable with lock protection is <591>
pid[2] is on running abcde;
now public variable with lock protection is <592>
pid[2] is on running abcde;
now public variable with lock protection is <593>
pid[2] is on running abcde;
now public variable with lock protection is <594>
pid[2] is on running abcde;
now public variable with lock protection is <595>
pid[2] is on running abcde;
now public variable with lock protection is <596>
pid[2] is on running abcde;
now public variable with lock protection is <597>
pid[2] is on running abcde;
now publicpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
>
pid[3] is on running !@#$^;
now public variable with lock protection is <599>
pid[3] is on running !@#$^;
now public variable with lock protection is <600>
pid[3] is on running !@#$^;
now public variable with lock protection is <601>
pid[3] is on running !@#$^;
now public variable with lock protection is <602>
pid[3] is on running !@#$^;
now public variable with lock protection is <603>
pid[3] is on running !@#$^;
now public variable with lock protection is <604>
pid[3] is on running !@#$^;
now public variable with lock protection is <605>
pid[3] is on running !@#$^;
now public variable with lock protection is <606>
pid[3] is on running !@#$^;
now public variable with lock protection is <607>
pid[3] is on running !@#$^;
now public variable with lock protection is <608>
pid[3] is on running !@#$^;
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
 main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0]pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
on running 12345;
now public variable with lock protection is <610>
pid[1] is on running 12345;
now public variable with lock protection is <611>
pid[1] is on running 12345;
now public variable with lock protection is <612>
pid[1] is on running 12345;
now public variable with lock protection is <613>
pid[1] is on running 12345;
now public variable with lock protection is <614>
pid[1] is on running 12345;
now public variable with lock protection is <615>
pid[1] is on running 12345;
now public variable with lock protection is <616>
pid[1] is on running 12345;
now public variable with lock protection is <617>
pid[1] is on running 12345;
now public variable with lock protection is <618>
pid[1] is on running 12345;
now public variable with locpid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
 variable with lock protection is <598>
pid[2] is on running abcde;
now public variable with lock protection is <620>
pid[2] is on running abcde;
now public variable with lock protection is <621>
pid[2] is on running abcde;
now public variable with lock protection is <622>
pid[2] is on running abcde;
now public variable with lock protection is <623>
pid[2] is on running abcde;
now public variable with lock protection is <624>
pid[2] is on running abcde;
now public variable with lock protection is <625>
pid[2] is on running abcde;
now public variable with lock protection is <626>
pid[2] is on running abcde;
now public variable with lock protection is <627>
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
now public variable with lock protection is <609>
pid[3] is on running !@#$^;
now public variable with lock protection is <628>
pid[3] is on running !@#$^;
now public variable with lock protection is <629>
pid[3] is on running !@#$^;
now public variable with lock protection is <630>
pid[3] is on running !@#$^;
now public variable with lock protection is <631>
pid[3] is on running !@#$^;
now public variable with lock protection is <632>
pid[3] is on running !@#$^;
now public variable with lock protection is <633>
pid[3] is on running !@#$^;
now public variable with lock protection is <634>
pid[3] is on running !@#$^;
now public variable with lock protection is <635>
pid[3] is on running !@#$^;
now public variable with lock protection is <636>
pid[3] is on runningpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
,In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernelpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
k protection is <619>
pid[1] is on running 12345;
now public variable with lock protection is <637>
pid[1] is on running 12345;
now public variable with lock protection is <638>
pid[1] is on running 12345;
now public variable with lock protection is <639>
pid[1] is on running 12345;
now public variable with lock protection is <640>
pid[1] is on running 12345;
now public variable with lock protection is <641>
pid[1] is on running 12345;
now public variable with lock protection is <642>
pid[1] is on running 12345;
now public variable with lock protection is <643>
pid[1] is on running 12345;
now public variable with lock protection is <644>
pid[1] is on running 12345;
now public variable with lock protection is <645>
pid[1] is on running pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
pid[2] is on running abcde;
now public variable with lock protection is <646>
pid[2] is on running abcde;
now public variable with lock protection is <647>
pid[2] is on running abcde;
now public variable with lock protection is <648>
pid[2] is on running abcde;
now public variable with lock protection is <649>
pid[2] is on running abcde;
now public variable with lock protection is <650>
pid[2] is on running abcde;
now public variable with lock protection is <651>
pid[2] is on running abcde;
now public variable with lock protection is <652>
pid[2] is on running abcde;
now public variable with lock protection is <653>
pid[2] is on running abcde;
now public variable with lock protection is <654>
pid[2] is on running abcde;
now public variable with lock protection is <655>
pid[2] is on running abcde;
now public variable with lock ppid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
 !@#$^;
now public variable with lock protection is <657>
pid[3] is on running !@#$^;
now public variable with lock protection is <658>
pid[3] is on running !@#$^;
now public variable with lock protection is <659>
pid[3] is on running !@#$^;
now public variable with lock protection is <660>
pid[3] is on running !@#$^;
now public variable with lock protection is <661>
pid[3] is on running !@#$^;
now public variable with lock protection is <662>
pid[3] is on running !@#$^;
now public variable with lock protection is <663>
pid[3] is on running !@#$^;
now public variable with lock protection is <664>
pid[3] is on running !@#$^;
now public variable with lock protection is <665>
pid[3] is on running !@#$^;
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
 main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main threpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
12345;
now public variable with lock protection is <667>
pid[1] is on running 12345;
now public variable with lock protection is <668>
pid[1] is on running 12345;
now public variable with lock protection is <669>
pid[1] is on running 12345;
now public variable with lock protection is <670>
pid[1] is on running 12345;
now public variable with lock protection is <671>
pid[1] is on running 12345;
now public variable with lock protection is <672>
pid[1] is on running 12345;
now public variable with lock protection is <673>
pid[1] is on running 12345;
now public variable with lock protection is <674>
pid[1] is on running 12345;
now public variable with lock protection is <675>
pid[1] is on running 12345;
now public variable with lock protection is <676>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
rotection is <656>
pid[2] is on running abcde;
now public variable with lock protection is <678>
pid[2] is on running abcde;
now public variable with lock protection is <679>
pid[2] is on running abcde;
now public variable with lock protection is <680>
pid[2] is on running abcde;
now public variable with lock protection is <681>
pid[2] is on running abcde;
now public variable with lock protection is <682>
pid[2] is on running abcde;
now public variable with lock protection is <683>
pid[2] is on running abcde;
now public variable with lock protection is <684>
pid[2] is on running abcde;
now public variable with lock protection is <685>
pid[2] is on running abcde;
now public variable with lock protection is <686>
pid[2] is on running abcde;
now public variable with lock protecpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
now public variable with lock protection is <666>
pid[3] is on running !@#$^;
now public variable with lock protection is <688>
pid[3] is on running !@#$^;
now public variable with lock protection is <689>
pid[3] is on running !@#$^;
now public variable with lock protection is <690>
pid[3] is on running !@#$^;
now public variable with lock protection is <691>
pid[3] is on running !@#$^;
now public variable with lock protection is <692>
pid[3] is on running !@#$^;
now public variable with lock protection is <693>
pid[3] is on running !@#$^;
now public variable with lock protection is <694>
pid[3] is on running !@#$^;
now public variable with lock protection is <695>
pid[3] is on running !@#$^;
now public variable with lock protection is <696>
pid[3] is on running !@#$^;
now public variable with lock protection is <697>
pid[3] is on running !@#$^;
now public variable with lock protection is <698>
pid[3] is on running !@#$^;
now public variable with lock protection is <699>
pid[3] is on running !@#$^;
now public variable with lock protectipid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
ad now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel mapid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <700>
pid[1] is on running 12345;
now public variable with lock protection is <701>
pid[1] is on running 12345;
now public variable with lock protection is <702>
pid[1] is on running 12345;
now public variable with lock protection is <703>
pid[1] is on running 12345;
now public variable with lock protection is <704>
pid[1] is on running 12345;
now public variable with lock protection is <705>
pid[1] is on running 12345;
now public variable with lock protection is <706>
pid[1] is on running 12345;
now public variable with lock protection is <707>
pid[1] is on running 12345;
now public variable with lock protection is <708>
pid[1] is on running 12345;
now public variable with lock protection is <709>
pid[1] is on running 12345;
now public variable with lock protection is <710>
pid[1] is on running 12345;
now ppid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
tion is <687>
pid[2] is on running abcde;
now public variable with lock protection is <712>
pid[2] is on running abcde;
now public variable with lock protection is <713>
pid[2] is on running abcde;
now public variable with lock protection is <714>
pid[2] is on running abcde;
now public variable with lock protection is <715>
pid[2] is on running abcde;
now public variable with lock protection is <716>
pid[2] is on running abcde;
now public variable with lock protection is <717>
pid[2] is on running abcde;
now public variable with lock protection is <718>
pid[2] is on running abcde;
now public variable with lock protection is <719>
pid[2] is on running abcde;
now public variable with lock protection is <720>
pid[2] is on running abcde;
now public variablepid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
on is <700>
pid[3] is on running !@#$^;
now public variable with lock protection is <722>
pid[3] is on running !@#$^;
now public variable with lock protection is <723>
pid[3] is on running !@#$^;
now public variable with lock protection is <724>
pid[3] is on running !@#$^;
now public variable with lock protection is <725>
pid[3] is on running !@#$^;
now public variable with lock protection is <726>
pid[3] is on running !@#$^;
now public variable with lock protection is <727>
pid[3] is on running !@#$^;
now public variable with lock protection is <728>
pid[3] is on running !@#$^;
now public variable with lock protection is <729>
pid[3] is on running !@#$^;
now public variable with lock protection is <730>
pid[3] is on running !@#$^;
now public variable with lock protection pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
in thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
ublic variable with lock protection is <711>
pid[1] is on running 12345;
now public variable with lock protection is <732>
pid[1] is on running 12345;
now public variable with lock protection is <733>
pid[1] is on running 12345;
now public variable with lock protection is <734>
pid[1] is on running 12345;
now public variable with lock protection is <735>
pid[1] is on running 12345;
now public variable with lock protection is <736>
pid[1] is on running 12345;
now public variable with lock protection is <737>
pid[1] is on running 12345;
now public variable with lock protection is <738>
pid[1] is on running 12345;
now public variable with lock protection is <739>
pid[1] is on running 12345;
now public variable with lock protection is <740>
pid[1] is on running 12345;
now public variablepid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
 with lock protection is <721>
pid[2] is on running abcde;
now public variable with lock protection is <742>
pid[2] is on running abcde;
now public variable with lock protection is <743>
pid[2] is on running abcde;
now public variable with lock protection is <744>
pid[2] is on running abcde;
now public variable with lock protection is <745>
pid[2] is on running abcde;
now public variable with lock protection is <746>
pid[2] is on running abcde;
now public variable with lock protection is <747>
pid[2] is on running abcde;
now public variable with lock protection is <748>
pid[2] is on running abcde;
now public variable with lock protection is <749>
pid[2] is on running abcde;
now public variable with lock protection is <750>
pid[2] is on running abcde;
now public variable with lock protection is <751>
pid[2] is on running abcde;
now public variable with lock protection is <752>
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
is <731>
pid[3] is on running !@#$^;
now public variable with lock protection is <753>
pid[3] is on running !@#$^;
now public variable with lock protection is <754>
pid[3] is on running !@#$^;
now public variable with lock protection is <755>
pid[3] is on running !@#$^;
now public variable with lock protection is <756>
pid[3] is on running !@#$^;
now public variable with lock protection is <757>
pid[3] is on running !@#$^;
now public variable with lock protection is <758>
pid[3] is on running !@#$^;
now public variable with lock protection is <759>
pid[3] is on running !@#$^;
now public variable with lock protection is <760>
pid[3] is on running !@#$^;
now public variable with lock protection is <761>
pid[3] is on running !@#$^;
now public variable with lock protection is <762>
pid[3] is on running !@#$^;
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
 with lock protection is <741>
pid[1] is on running 12345;
now public variable with lock protection is <764>
pid[1] is on running 12345;
now public variable with lock protection is <765>
pid[1] is on running 12345;
now public variable with lock protection is <766>
pid[1] is on running 12345;
now public variable with lock protection is <767>
pid[1] is on running 12345;
now public variable with lock protection is <768>
pid[1] is on running 12345;
now public variable with lock protection is <769>
pid[1] is on running 12345;
now public variable with lock protection is <770>
pid[1] is on running 12345;
now public variable with lock protection is <771>
pid[1] is on running 12345;
now public variable with lock protection is <772>
pid[1] is on running 12345;
now public variable with lock protection is <773>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
pid[2] is on running abcde;
now public variable with lock protection is <775>
pid[2] is on running abcde;
now public variable with lock protection is <776>
pid[2] is on running abcde;
now public variable with lock protection is <777>
pid[2] is on running abcde;
now public variable with lock protection is <778>
pid[2] is on running abcde;
now public variable with lock protection is <779>
pid[2] is on running abcde;
now public variable with lock protection is <780>
pid[2] is on running abcde;
now public variable with lock protection is <781>
pid[2] is on running abcde;
now public variable with lock protection is <782>
pid[2] is on running abcde;
now public variable with lock protection is <783>
pid[2] is on running abcde;
now public variable with lock protection is <784>
pid[2] is on running abcde;
now public variable with lock protection is <785>
pid[2] is on running abcde;
now public variable with lock protection is <786>
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
now public variable with lock protection is <786>
pid[3] is on running !@#$^;
now public variable with lock protection is <787>
pid[3] is on running !@#$^;
now public variable with lock protection is <788>
pid[3] is on running !@#$^;
now public variable with lock protection is <789>
pid[3] is on running !@#$^;
now public variable with lock protection is <790>
pid[3] is on running !@#$^;
now public variable with lock protection is <791>
pid[3] is on running !@#$^;
now public variable with lock protection is <792>
pid[3] is on running !@#$^;
now public variable with lock protection is <793>
pid[3] is on running !@#$^;
now public variable with lock protection is <794>
pid[3] is on running !@#$^;
now public variable with lock protection is <795>
pid[3] is on running !@#$^;
now public variable with lock protection is <796>
pid[3] is on runpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <774>
pid[1] is on running 12345;
now public variable with lock protection is <797>
pid[1] is on running 12345;
now public variable with lock protection is <798>
pid[1] is on running 12345;
now public variable with lock protection is <799>
pid[1] is on running 12345;
now public variable with lock protection is <800>
pid[1] is on running 12345;
now public variable with lock protection is <801>
pid[1] is on running 12345;
now public variable with lock protection is <802>
pid[1] is on running 12345;
now public variable with lock protection is <803>
pid[1] is on running 12345;
now public variable with lock protection is <804>
pid[1] is on running 12345;
now public variable with lock protection is <805>
pid[1] is on running 12345pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
pid[2] is on running abcde;
now public variable with lock protection is <806>
pid[2] is on running abcde;
now public variable with lock protection is <807>
pid[2] is on running abcde;
now public variable with lock protection is <808>
pid[2] is on running abcde;
now public variable with lock protection is <809>
pid[2] is on running abcde;
now public variable with lock protection is <810>
pid[2] is on running abcde;
now public variable with lock protection is <811>
pid[2] is on running abcde;
now public variable with lock protection is <812>
pid[2] is on running abcde;
now public variable with lock protection is <813>
pid[2] is on running abcde;
now public variable with lock protection is <814>
pid[2] is on running abcde;
now public variable with lock protection is <815>
pid[2] is on running abcde;
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
ning !@#$^;
now public variable with lock protection is <817>
pid[3] is on running !@#$^;
now public variable with lock protection is <818>
pid[3] is on running !@#$^;
now public variable with lock protection is <819>
pid[3] is on running !@#$^;
now public variable with lock protection is <820>
pid[3] is on running !@#$^;
now public variable with lock protection is <821>
pid[3] is on running !@#$^;
now public variable with lock protection is <822>
pid[3] is on running !@#$^;
now public variable with lock protection is <823>
pid[3] is on running !@#$^;
now public variable with lock protection is <824>
pid[3] is on running !@#$^;
now public variable with lock protection is <825>
pid[3] is on running !@#$^;
now public variable with lock protection is <826>
pid[3] is on running !@#$^;
now public variable with lock protection is <827>
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel mainpid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
;
now public variable with lock protection is <828>
pid[1] is on running 12345;
now public variable with lock protection is <829>
pid[1] is on running 12345;
now public variable with lock protection is <830>
pid[1] is on running 12345;
now public variable with lock protection is <831>
pid[1] is on running 12345;
now public variable with lock protection is <832>
pid[1] is on running 12345;
now public variable with lock protection is <833>
pid[1] is on running 12345;
now public variable with lock protection is <834>
pid[1] is on running 12345;
now public variable with lock protection is <835>
pid[1] is on running 12345;
now public variable with lock protection is <836>
pid[1] is on running 12345;
now public variable with lock protection is <837>
pidpid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
now public variable with lock protection is <837>
pid[2] is on running abcde;
now public variable with lock protection is <838>
pid[2] is on running abcde;
now public variable with lock protection is <839>
pid[2] is on running abcde;
now public variable with lock protection is <840>
pid[2] is on running abcde;
now public variable with lock protection is <841>
pid[2] is on running abcde;
now public variable with lock protection is <842>
pid[2] is on running abcde;
now public variable with lock protection is <843>
pid[2] is on running abcde;
now public variable with lock protection is <844>
pid[2] is on running abcde;
now public variable with lock protection is <845>
pid[2] is on running abcde;
now public variable with lock protection is <846>
pid[2] is on running abcde;
now pubpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
pid[3] is on running !@#$^;
now public variable with lock protection is <848>
pid[3] is on running !@#$^;
now public variable with lock protection is <849>
pid[3] is on running !@#$^;
now public variable with lock protection is <850>
pid[3] is on running !@#$^;
now public variable with lock protection is <851>
pid[3] is on running !@#$^;
now public variable with lock protection is <852>
pid[3] is on running !@#$^;
now public variable with lock protection is <853>
pid[3] is on running !@#$^;
now public variable with lock protection is <854>
pid[3] is on running !@#$^;
now public variable with lock protection is <855>
pid[3] is on running !@#$^;
now public variable with lock protection is <856>
pid[3] is on running !@#$^;
now public variable with lock protection is <857>
pid[3] is on running !@#$^;
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
 thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
[1] is on running 12345;
now public variable with lock protection is <859>
pid[1] is on running 12345;
now public variable with lock protection is <860>
pid[1] is on running 12345;
now public variable with lock protection is <861>
pid[1] is on running 12345;
now public variable with lock protection is <862>
pid[1] is on running 12345;
now public variable with lock protection is <863>
pid[1] is on running 12345;
now public variable with lock protection is <864>
pid[1] is on running 12345;
now public variable with lock protection is <865>
pid[1] is on running 12345;
now public variable with lock protection is <866>
pid[1] is on running 12345;
now public variable with lock protection is <867>
pid[1] is on running 12345;
now public variable with lock protection is <868>
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
lic variable with lock protection is <847>
pid[2] is on running abcde;
now public variable with lock protection is <869>
pid[2] is on running abcde;
now public variable with lock protection is <870>
pid[2] is on running abcde;
now public variable with lock protection is <871>
pid[2] is on running abcde;
now public variable with lock protection is <872>
pid[2] is on running abcde;
now public variable with lock protection is <873>
pid[2] is on running abcde;
now public variable with lock protection is <874>
pid[2] is on running abcde;
now public variable with lock protection is <875>
pid[2] is on running abcde;
now public variable with lock protection is <876>
pid[2] is on running abcde;
now public variable with lock protection is <877>
pid[2] is on running abcde;
now public variable with lock protection is <878>
pid[2] is on running abcde;
now public vpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
now public variable with lock protection is <879>
pid[3] is on running !@#$^;
now public variable with lock protection is <880>
pid[3] is on running !@#$^;
now public variable with lock protection is <881>
pid[3] is on running !@#$^;
now public variable with lock protection is <882>
pid[3] is on running !@#$^;
now public variable with lock protection is <883>
pid[3] is on running !@#$^;
now public variable with lock protection is <884>
pid[3] is on running !@#$^;
now public variable with lock protection is <885>
pid[3] is on running !@#$^;
now public variable with lock protection is <886>
pid[3] is on running !@#$^;
now public variable with lock protection is <887>
pid[3] is on running !@#$^;
now public variable with lock protection is <888>
pid[3] is on running !@#$^;
now public variable with lock protection is <889>
pid[3] is on running !@#$^;
now public variable with lock protection is <890>
pid[3] is on running !@#$^;
now public variable with lock protection is <891>
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
pid[1] is on running 12345;
now public variable with lock protection is <892>
pid[1] is on running 12345;
now public variable with lock protection is <893>
pid[1] is on running 12345;
now public variable with lock protection is <894>
pid[1] is on running 12345;
now public variable with lock protection is <895>
pid[1] is on running 12345;
now public variable with lock protection is <896>
pid[1] is on running 12345;
now public variable with lock protection is <897>
pid[1] is on running 12345;
now public variable with lock protection is <898>
pid[1] is on running 12345;
now public variable with lock protection is <899>
pid[1] is on running 12345;
now public variable with lock protection is <900>
pid[1] is on running 12345;
now public variable with lock protection is <901>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
ariable with lock protection is <879>
pid[2] is on running abcde;
now public variable with lock protection is <902>
pid[2] is on running abcde;
now public variable with lock protection is <903>
pid[2] is on running abcde;
now public variable with lock protection is <904>
pid[2] is on running abcde;
now public variable with lock protection is <905>
pid[2] is on running abcde;
now public variable with lock protection is <906>
pid[2] is on running abcde;
now public variable with lock protection is <907>
pid[2] is on running abcde;
now public variable with lock protection is <908>
pid[2] is on running abcde;
now public variable with lock protection is <909>
pid[2] is on running abcde;
now public variable with lock protection is <910>
pid[2] is on running abcde;
now public variable with lock protection is <911>
pid[2] is on running abcde;
pid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
pid[3] is on running !@#$^;
now public variable with lock protection is <913>
pid[3] is on running !@#$^;
now public variable with lock protection is <914>
pid[3] is on running !@#$^;
now public variable with lock protection is <915>
pid[3] is on running !@#$^;
now public variable with lock protection is <916>
pid[3] is on running !@#$^;
now public variable with lock protection is <917>
pid[3] is on running !@#$^;
now public variable with lock protection is <918>
pid[3] is on running !@#$^;
now public variable with lock protection is <919>
pid[3] is on running !@#$^;
now public variable with lock protection is <920>
pid[3] is on running !@#$^;
now public variable with lock protection is <921>
pid[3] is on runnipid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <922>
pid[1] is on running 12345;
now public variable with lock protection is <923>
pid[1] is on running 12345;
now public variable with lock protection is <924>
pid[1] is on running 12345;
now public variable with lock protection is <925>
pid[1] is on running 12345;
now public variable with lock protection is <926>
pid[1] is on running 12345;
now public variable with lock protection is <927>
pid[1] is on running 12345;
now public variable with lock protection is <928>
pid[1] is on running 12345;
now public variable with lock protection is <929>
pid[1] is on running 12345;
now public variable with lock protection is <930>
pid[1] is on running 12345;
now public variable with lock protection is <931>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
now public variable with lock protection is <932>
pid[2] is on running abcde;
now public variable with lock protection is <933>
pid[2] is on running abcde;
now public variable with lock protection is <934>
pid[2] is on running abcde;
now public variable with lock protection is <935>
pid[2] is on running abcde;
now public variable with lock protection is <936>
pid[2] is on running abcde;
now public variable with lock protection is <937>
pid[2] is on running abcde;
now public variable with lock protection is <938>
pid[2] is on running abcde;
now public variable with lock protection is <939>
pid[2] is on running abcde;
now public variable with lock protection is <940>
pid[2] is on running abcde;
now public variable with lock protection is <941>
pid[2] is on running abcde;
now public variable with lock prpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
ng !@#$^;
now public variable with lock protection is <943>
pid[3] is on running !@#$^;
now public variable with lock protection is <944>
pid[3] is on running !@#$^;
now public variable with lock protection is <945>
pid[3] is on running !@#$^;
now public variable with lock protection is <946>
pid[3] is on running !@#$^;
now public variable with lock protection is <947>
pid[3] is on running !@#$^;
now public variable with lock protection is <948>
pid[3] is on running !@#$^;
now public variable with lock protection is <949>
pid[3] is on running !@#$^;
now public variable with lock protection is <950>
pid[3] is on running !@#$^;
now public variable with lock protection is <951>
pid[3] is on running !@#$^;
now public variable with lock protection is <952>
pid[3] is on running !@#$^;
now public variable with lock protection is <953>
pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <953>
pid[1] is on running 12345;
now public variable with lock protection is <954>
pid[1] is on running 12345;
now public variable with lock protection is <955>
pid[1] is on running 12345;
now public variable with lock protection is <956>
pid[1] is on running 12345;
now public variable with lock protection is <957>
pid[1] is on running 12345;
now public variable with lock protection is <958>
pid[1] is on running 12345;
now public variable with lock protection is <959>
pid[1] is on running 12345;
now public variable with lock protection is <960>
pid[1] is on running 12345;
now public variable with lock protection is <961>
pid[1] is on running 12345;
now public variable with lock protection is <962>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
otection is <942>
pid[2] is on running abcde;
now public variable with lock protection is <964>
pid[2] is on running abcde;
now public variable with lock protection is <965>
pid[2] is on running abcde;
now public variable with lock protection is <966>
pid[2] is on running abcde;
now public variable with lock protection is <967>
pid[2] is on running abcde;
now public variable with lock protection is <968>
pid[2] is on running abcde;
now public variable with lock protection is <969>
pid[2] is on running abcde;
now public variable with lock protection is <970>
pid[2] is on running abcde;
now public variable with lock protection is <971>
pid[2] is on running abcde;
now public variable with lock protection is <972>
pid[2] is on running abcde;
now public variable with lock protection is <973>
pid[2] is on running abcde;
now public variablepid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
pid[3] is on running !@#$^;
now public variable with lock protection is <975>
pid[3] is on running !@#$^;
now public variable with lock protection is <976>
pid[3] is on running !@#$^;
now public variable with lock protection is <977>
pid[3] is on running !@#$^;
now public variable with lock protection is <978>
pid[3] is on running !@#$^;
now public variable with lock protection is <979>
pid[3] is on running !@#$^;
now public variable with lock protection is <980>
pid[3] is on running !@#$^;
now public variable with lock protection is <981>
pid[3] is on running !@#$^;
now public variable with lock protection is <982>
pid[3] is on running !@#$^;
now public variable with lock protection is <983>
pid[3] is on running !@#$^;
now public variable with lock protection is <984>
pid[3] is on running !@#$^;
now pubpid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
now public variable with lock protection is <985>
pid[1] is on running 12345;
now public variable with lock protection is <986>
pid[1] is on running 12345;
now public variable with lock protection is <987>
pid[1] is on running 12345;
now public variable with lock protection is <988>
pid[1] is on running 12345;
now public variable with lock protection is <989>
pid[1] is on running 12345;
now public variable with lock protection is <990>
pid[1] is on running 12345;
now public variable with lock protection is <991>
pid[1] is on running 12345;
now public variable with lock protection is <992>
pid[1] is on running 12345;
now public variable with lock protection is <993>
pid[1] is on running 12345;
now public variable with lock protection is <994>
pid[1] is on running 12345;
now public variablpid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
 with lock protection is <974>
pid[2] is on running abcde;
now public variable with lock protection is <996>
pid[2] is on running abcde;
now public variable with lock protection is <997>
pid[2] is on running abcde;
now public variable with lock protection is <998>
pid[2] is on running abcde;
now public variable with lock protection is <999>
pid[2] is on running abcde;
now public variable with lock protection is <1000>
pid[2] is on running abcde;
now public variable with lock protection is <1001>
pid[2] is on running abcde;
now public variable with lock protection is <1002>
pid[2] is on running abcde;
now public variable with lock protection is <1003>
pid[2] is on running abcde;
now public variable with lock protection is <1004>
pid[2] is on running abcde;
now public variable with lock protection is <1005>
pid[2] is on runningpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
lic variable with lock protection is <985>
pid[3] is on running !@#$^;
now public variable with lock protection is <1006>
pid[3] is on running !@#$^;
now public variable with lock protection is <1007>
pid[3] is on running !@#$^;
now public variable with lock protection is <1008>
pid[3] is on running !@#$^;
now public variable with lock protection is <1009>
pid[3] is on running !@#$^;
now public variable with lock protection is <1010>
pid[3] is on running !@#$^;
now public variable with lock protection is <1011>
pid[3] is on running !@#$^;
now public variable with lock protection is <1012>
pid[3] is on running !@#$^;
now public variable with lock protection is <1013>
pid[3] is on running !@#$^;
now public variable with lock protection is <1014>
pid[3] is on runnipid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread npid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
e with lock protection is <995>
pid[1] is on running 12345;
now public variable with lock protection is <1015>
pid[1] is on running 12345;
now public variable with lock protection is <1016>
pid[1] is on running 12345;
now public variable with lock protection is <1017>
pid[1] is on running 12345;
now public variable with lock protection is <1018>
pid[1] is on running 12345;
now public variable with lock protection is <1019>
pid[1] is on running 12345;
now public variable with lock protection is <1020>
pid[1] is on running 12345;
now public variable with lock protection is <1021>
pid[1] is on running 12345;
now public variable with lock protection is <1022>
pid[1] is on running 12345;
now public variable with lock protection is <1023>
pid[1] is on running 12345;
now public variable with lock protection is <1024>
pid[1] ispid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
 abcde;
now public variable with lock protection is <1025>
pid[2] is on running abcde;
now public variable with lock protection is <1026>
pid[2] is on running abcde;
now public variable with lock protection is <1027>
pid[2] is on running abcde;
now public variable with lock protection is <1028>
pid[2] is on running abcde;
now public variable with lock protection is <1029>
pid[2] is on running abcde;
now public variable with lock protection is <1030>
pid[2] is on running abcde;
now public variable with lock protection is <1031>
pid[2] is on running abcde;
now public variable with lock protection is <1032>
pid[2] is on running abcde;
now public variable with lock protection is <1033>
pid[2] is on running abcde;
now public variable with lock protection is <1034>
pid[2] is on runningpid 2 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[3]
====================
 last=0x804a000!!!!!!!!!!!!
ng !@#$^;
now public variable with lock protection is <1035>
pid[3] is on running !@#$^;
now public variable with lock protection is <1036>
pid[3] is on running !@#$^;
now public variable with lock protection is <1037>
pid[3] is on running !@#$^;
now public variable with lock protection is <1038>
pid[3] is on running !@#$^;
now public variable with lock protection is <1039>
pid[3] is on running !@#$^;
now public variable with lock protection is <1040>
pid[3] is on running !@#$^;
now public variable with lock protection is <1041>
pid[3] is on running !@#$^;
now public variable with lock protection is <1042>
pid[3] is on running !@#$^;
now public variable with lock protection is <1043>
pid[3] is on running !@#$^;
now public variable with lock protection is <1044>
pid[3] is on running !@#$^;
now public variable with lock protection is <1045>
pid[3] is pid 3 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[0]
====================
 last=0x804c000!!!!!!!!!!!!
ow
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid[0],In kernel main thread now
pid 0 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[1]
====================
 last=0x8020d000!!!!!!!!!!!!
 on running 12345;
now public variable with lock protection is <1046>
pid[1] is on running 12345;
now public variable with lock protection is <1047>
pid[1] is on running 12345;
now public variable with lock protection is <1048>
pid[1] is on running 12345;
now public variable with lock protection is <1049>
pid[1] is on running 12345;
now public variable with lock protection is <1050>
pid[1] is on running 12345;
now public variable with lock protection is <1051>
pid[1] is on running 12345;
now public variable with lock protection is <1052>
pid[1] is on running 12345;
now public variable with lock protection is <1053>
pid[1] is on running 12345;
now public variable with lock protection is <1054>
pid[1] is on running 12345;
now public variable with lock protection is <1055>
pid[1] is on running 12345;
pid 1 need sched out!

-----schedule start------

====================
ok,ready list will select next thread...
pick next pid[2]
====================
 last=0x8048000!!!!!!!!!!!!
 abcde;
now public variable with lock protection is <1057>
pid[2] is on running abcde;
now public variable with lock protection is <1058>
pid[2] is on running abcde;
now public variable with lock protection is <1059>
pid[2] is on running abcde;
now public variable with lock protection is <1060>
pid[2] is on running abcde;
now public variablQEMU: Terminated
