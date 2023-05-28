# Initial process that execs /init.
# This code runs in user space.

#include "include/sysnum.h"

# exec(init, argv)
.global start
start:
	li a0, 2
	li a1, 1
	li a2, 0
	li a7, SYS_dev
	ecall	# dev(O_RDWR, CONSOLE, 0);
	
	li a0, 0
	li a7, SYS_dup
	ecall	# dup(0);  // stdout

	li a0, 0
	li a7, SYS_dup
	ecall	# dup(0);  // stderr
	
	li a7, SYS_finit
	ecall
	
	la t1, test_file
	la t2, test_file_end
test:
	li a0, 0
	li a7, SYS_fork
	ecall
	bne a0, zero, parent 
	lw a0, 0(t1)
	la a1, argv
	li a7, SYS_exec
	ecall
	
parent:
	li a0, 0
	li a7, SYS_wait
	ecall
	addi t1, t1, 4
	bne t1, t2, test

# for(;;) exit()
end:
	li a7,SYS_exit
	ecall
	jal end
brk:
	.string "/brk\0"
openat:
	.string "/openat\0"
mkdirat:
	.string "/mkdir_\0"
getcwd:
	.string "/getcwd\0"
getpid:
	.string "/getpid\0"
getppid:
	.string "/getppid\0"
dup:
	.string "/dup\0"
dup3:
	.string "/dup2\0"
read:
	.string "/read\0"
write:
	.string "/write\0"
umount:
	.string "/umount\0"
mount:
	.string "/mount\0"
close:
	.string "/close\0"
exit:
	.string "/exit\0"
chdir:
	.string "/chdir\0"
clone:
	.string "/clone\0"
wait:
	.string "/wait\0"
yield:
	.string "/yield\0"
fork:
	.string "/fork\0"
times:
	.string "/times\0"
open:
	.string "/open\0"
waitpid:
	.string "/waitpid\0"
sleep:
	.string "/sleep\0"
gettimeofday:
	.string "/gettimeofday\0"
execve:
	.string "/execve\0"
getdents64:
	.string "/getdents\0"
fstat:
	.string "/fstat\0"
uname:
	.string "/uname\0"
unlink:
	.string "/unlink\0"
pipe:
	.string "/pipe\0"
mmap:
	.string "/mmap\0"
munmap:
	.string "/munmap\0"
echo:
	.string "/test_echo\0"
sacrifice:
	.string "/sacrifice\0"
test_file:
    .long umount
    .long mount
    .long mmap
    .long munmap
    .long wait
    .long yield
    .long close
    .long clone
    .long fork
    .long read
    .long sacrifice
    .long getcwd
    .long times
    .long sacrifice
    .long write
    .long getppid
    .long open
    .long waitpid
    .long sleep
    .long gettimeofday
    .long execve
    .long getdents64
    .long fstat
    .long uname
    .long unlink
    .long pipe
    .long exit
    .long chdir
    .long echo
    .long openat
    .long brk
    .long getpid
    .long dup
    .long dup3
    .long mkdirat
 test_file_end:
 	
.p2align 2
argv:
	.long 0
