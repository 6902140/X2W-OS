// Copyright (c) 2006-2019 Frans Kaashoek, Robert Morris, Russ Cox,
//                         Massachusetts Institute of Technology
#define DEBUG
#include "include/types.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/riscv.h"
#include "include/sbi.h"
#include "include/sbi2.h"
#include "include/console.h"
#include "include/printf.h"
#include "include/kalloc.h"
#include "include/timer.h"
#include "include/trap.h"
#include "include/proc.h"
#include "include/plic.h"
#include "include/vm.h"
#include "include/disk.h"
#include "include/buf.h"
#include "include/fat32.h"
//#include "include/fftest.h"
#ifdef SIFIVE_U
#endif

static inline void inithartid(unsigned long hartid) {
  asm volatile("mv tp, %0" : : "r" (hartid));
}

volatile unsigned long __first_boot_magic = 0x5a5a;

volatile static int started = 0;
int booted[NCPU];
struct sbiret state[NCPU];
int chao=0; 
extern char _entry[];
extern int procfirst;
/*
static inline void checkall(){
  for(int i = 1; i < NCPU; i++) {
	state[i]=get_state(i);
  }
  printf("%d %d\n%d %d\n%d %d\n%d %d\n",
  				  state[1].error,state[1].value,
  				  state[2].error,state[2].value,
  				  state[3].error,state[3].value,
  				  state[4].error,state[4].value);
}
*/

int
sbi_hsm_hart_status(unsigned long hart)
{
    struct sbiret ret;

    ret = a_sbi_ecall(0x48534D, 2, hart, 0, 0, 0, 0, 0);

    return (ret.error != 0 ? (int)ret.error : (int)ret.value);
}

void
main(unsigned long hartid, unsigned long dtb_pa)
{
  inithartid(hartid);
  booted[hartid]=1;
  
  if (__first_boot_magic == 0x5a5a) { /* boot hart not fixed 1 */
    __first_boot_magic = 0;
    cpuinit();
    consoleinit();
    printfinit();   // init a lock for printf 
    print_logo();
    #ifdef DEBUG
    printf("hart %d enter main() from %p...\n", hartid,_entry);
    #endif
    kinit();         // physical page allocator
    kvminit();       // create kernel page table
    kvminithart();   // turn on paging
    timerinit();     // init a lock for timer
    trapinithart();  // install kernel trap vector, including interrupt handler
    procinit();
    plicinit();
    plicinithart();
    #ifdef SIFIVE_U
    #endif 
    // disk_init();
    binit();         // buffer cache
    fileinit();      // file table
    userinit();      // first user process
    __sync_synchronize();

    for(int i = 1; i < NCPU; i++) {
        printf("cpu#%d state:%d\r\n", i, sbi_hsm_hart_status(i));
    }
    for(int i = 1; i < NCPU; i++) {
        if(hartid!=i&&booted[i]==0){
          start_hart(i, (uint64)_entry, 0);
        }
    }
    printf("start all done\r\n");
    
    started=1;
  }
  else
  {
    // hart 1
    while (started == 0)
    ;
    __sync_synchronize();
    #ifdef DEBUG
    printf("hart %d enter main()...\n", hartid);
    #endif
    kvminithart();
    trapinithart();
    plicinithart();  // ask PLIC for device interrupts
  }

 #ifdef DEBUG
  printf("hart %d scheduler...\n", hartid);
 #endif
  scheduler();
}

int
__get_boot_hartid(int a0)
{
    int i;
    for (i = 0; i < 5; i++)
    {
        if (sbi_hsm_hart_status(i) == 0)
        {
            return i;
        }
    }
    return a0;
}
