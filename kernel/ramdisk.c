#include "include/types.h"
#include "include/riscv.h"
#include "include/defs.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/spinlock.h"
#include "include/buf.h"

#define USE_RAMDISK
#define NRAMDISKPAGES (FSSIZE * BSIZE / PGSIZE)

struct spinlock ramdisklock;
void* ramdisk_page_pool[NRAMDISKPAGES];
extern char fs_img_start[];
extern char fs_img_end[];
char* ramdisk;

void
ramdisk_init(void)
{
/*
  for (int i = 0; i < NRAMDISKPAGES; ++i){
    void* pa = kalloc();
    if (!pa){
      panic("ram disk init error!\n");
    }
    ramdisk_page_pool[i] = pa;
  }
*/
#ifdef QEMU
  ramdisk = fs_img_start;
#endif
#ifdef SIFIVE_U
  ramdisk = (char*)RAMDISK;
#endif
  initlock(&ramdisklock, "ramdisk lock");
#ifdef DEBUG
  printf("ramdiskinit\n");
#endif
  //mkfs();
}
extern int fat32init;
void 
ramdisk_rw(struct buf *b, int write)
{
  acquire(&ramdisklock);
  uint sectorno = b->sectorno;

  char *addr = ramdisk + sectorno * BSIZE;
  if (write)
  {
    memmove((void*)addr, b->data, BSIZE);
  }
  else
  {
    memmove(b->data, (void*)addr, BSIZE);
  }
  release(&ramdisklock);
}

void
ramdisk_intr()
{
    //acquire(&ramdisklock);
    
}
