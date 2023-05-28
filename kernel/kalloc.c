


#include "types.h"

#include "param.h"

#include "memlayout.h"

#include "riscv.h"

#include "kernel/locks.h"

#include "kernel/kalloc.h"

#include "string.h"

#include "kernel/kstdio.h"


void freerange(void *pa_start, void *pa_end);
extern char kernel_end[]; // first address after kernel.

struct run{
    struct run* next;
};//这个是为了链式管理内存物理块

struct kmem_t{
  spinlock_t lock;
  struct run *freelist;
  uint64 npage;
}kmem; 



void kinit(void){
    spinlock_init(&kmem.lock,"kmem");
    kmem.freelist=0;
    kmem.npage=0;
    freerange(kernel_end,(void*)PHYSTOP);
    kprintf("kernel_end: %p, phystop: %p\n", kernel_end, (void*)PHYSTOP);
    kprintf("kinit\n");

}
void freerange(void *pa_start, void *pa_end)
{
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    kfree(p);
}

// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void kfree(void *pa)
{
  struct run *r;
  
  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < kernel_end || (uint64)pa >= PHYSTOP)
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);

  r = (struct run*)pa;

  spinlock_acquire(&kmem.lock);
  r->next = kmem.freelist;
  kmem.freelist = r;
  kmem.npage++;
  spinlock_release(&kmem.lock);
}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void * kalloc(void)
{
  struct run *r;

  spinlock_acquire(&kmem.lock);
  r = kmem.freelist;
  if(r) {
    kmem.freelist = r->next;
    kmem.npage--;
  }
  spinlock_release(&kmem.lock);

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
  return (void*)r;
}

uint64 freemem_amount(void)
{
  return kmem.npage << PGSHIFT;
}
