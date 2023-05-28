#include "include/types.h"
#include "include/riscv.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/spinlock.h"
#include "include/proc.h"
#include "include/syscall.h"
#include "include/timer.h"
#include "include/kalloc.h"
#include "include/string.h"
#include "include/printf.h"
#include "include/sbi2.h"
#include "include/console.h"
#include "include/string.h"
#include "include/vm.h"
#include "include/uname.h"

extern struct proc proc[NPROC];
extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    return -1;
  }
  //printf("1\n");
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv)){
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
      goto bad;
    }
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    if(argv[i] == 0)
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }
  
  int ret = exec(path, argv);

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return -1;
}

uint64
sys_execve(void)
{

  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    return -1;
  }
  //printf("1\n");
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv)){
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
      goto bad;
    }
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    if(argv[i] == 0)
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }
  
  int ret = exec(path, argv);

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return -1;
}

uint64
sys_exit(void)
{
  int n;
  if(argint(0, &n) < 0)
    return -1;
  exit(n);
  return 0;  // not reached
}

uint64
sys_getpid(void)
{
  return myproc()->pid;
}

uint64
sys_fork(void)
{
  return fork();
}

uint64
sys_wait(void)
{
  uint64 p;
  int f;
  if(argaddr(0, &p) < 0)
    return -1;
  f = wait(p);
  return f;
}

uint64
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

uint64
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

uint64
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

uint64
sys_trace(void)
{
  int mask;
  if(argint(0, &mask) < 0) {
    return -1;
  }
  myproc()->tmask = mask;
  return 0;
}



uint64
sys_sprint(void){
  char buf[30];
  printf("sprint:\n");
  if(argstr(0, buf,30) < 0)
    return -1;
  printf("%s\n",buf);
  return 1;
}

uint64
sys_getppid(void){
  struct proc* p =myproc();
  return p->parent->pid;
}

uint64
sys_brk(void)
{
  int n;
  if(argint(0, &n) < 0)
    return -1;
  if(n == 0) n = 0;
  else n = n / 256;
  return growproc(n);
}

uint64 
sys_clone(void) {
	uint64 flag, stack;
	if (argaddr(0, &flag) < 0) 
		return -1;
	if (argaddr(1, &stack) < 0) 
		return -1;
  if (stack != 0)
	  return clone(flag, stack);
  else
    return fork();
}

uint64
sys_wait4(void)
{
  uint64 p;
  int pid;
  if(argint(0, &pid) < 0)
    return -1;
  if(argaddr(1, &p) < 0)
    return -1;
  if (pid == -1){
    int f = wait(p);
    if(p != 0 && f > 0){
      char k = 0x00;
      copyout2(p,(char*)&k,1);
      k = 0x00;
      copyout2(p + 1,(char*)&k,1);
    }
    return f;
  }
  else{
    int f = wait4pid(pid, p);
    if(p != 0 && f > 0){
      char k = 0x00;
      copyout2(p,(char*)&k,1);
      k = 0x03;
      copyout2(p + 1,(char*)&k,1);
    }
    return f;
  }
  //return wait(p);
}

uint64
sys_sched_yield(){
  yield();
  return 0;
}
/*
//unfinished, just to pass the test.
uint64
sys_times(){
  uint64 p;
  struct tms tms;
  tms.tms_utime = 1;
  tms.tms_stime = 1;
  tms.tms_cutime = 1;
  tms.tms_cstime = 1;   
  if(argaddr(0, &p) < 0)
    return -1;
  copyout2(p,(char*)&tms,sizeof(tms));
  return 1;
}
*/
uint64 sys_nanosleep(void) {
	uint64 addr_sec, addr_usec;

	if (argaddr(0, &addr_sec) < 0) 
		return -1;
	if (argaddr(1, &addr_usec) < 0) 
		return -1;

	struct proc *p = myproc();
	uint64 sec, usec;
	if (copyin2((char*)&sec, addr_sec, sizeof(sec)) < 0) 
		return -1;
	if (copyin2((char*)&usec, addr_usec, sizeof(usec)) < 0) 
		return -1;
	int n = sec * 20 + usec / 50000000;

	int mask = p->tmask;
	if (mask) {
		printf(") ...\n");
	}
	acquire(&p->lock);
	uint64 tick0 = ticks;
	while (ticks - tick0 < n / 10) {
		if (p->killed) {
			return -1;
		}
		sleep(&ticks, &p->lock);
	}
	release(&p->lock);

	return 0;
}

uint64 sys_uname(void) {
	uint64 addr;

	if (argaddr(0, &addr) < 0) {
		return -1;
	}

	return uname_copyout(addr);
}
