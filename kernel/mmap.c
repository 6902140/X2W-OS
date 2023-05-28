
#include "include/file.h"
#include "include/vm.h"
#include "include/riscv.h"
#include "include/string.h"
#include "include/param.h"
#include "include/proc.h"
#include "include/memlayout.h"
#include "include/kalloc.h"
#include "include/printf.h"

// find an unused mmap area
static int find_unused_mmap_area(uint64 start,uint64 len,int prot,int flags,int fd,uint64 offset)
{
	int i;
	struct proc *p = myproc();
    for(i =0; i<MMAPNUM; i++)
    {
        if(p->mmap_pool[i].used == 0)
        { 
            return i;
        }
    }
    return -1;
}


static int find_mapped_area(uint64 start,int len)
{
    struct proc *p = myproc();
    for(int i =0; i<MMAPNUM; i++)
    {
        if(p->mmap_pool[i].start == start && p->mmap_pool[i].len == len )
        {  
            return i;
        }
    }
    return -1;
}



uint64 
do_mmap(uint64 start, uint64 len,int prot,int flags,int fd, off_t offset)
{   
    struct proc *p = myproc();

    if(fd < 0 || fd >= NOFILE || offset <0)
        return -1;

    int index =  find_unused_mmap_area(start, len, prot, flags, fd, offset);

    if(-1 == index)
        return -1;

    if(start == NULL)
    {   
        p->mmap_pool[index].start = p->sz;
    }
    else
    {
        p->mmap_pool[index].start = (uint64)start;
    }

    p->mmap_pool[index].len = len;
    p->mmap_pool[index].prot = prot;
    p->mmap_pool[index].flags = flags;
    p->mmap_pool[index].fd = fd;
    p->mmap_pool[index].offset = offset;

    struct dirent* ep = p->ofile[fd]->ep;
    if(offset + len > ep->file_size)
        return -1;
    uint tot_size = len;

    int page_num = (tot_size + PGSIZE -1) / PGSIZE;

    int perm  = PTE_U;
    if(prot & PROT_READ) 
        perm  |= (PTE_R | PTE_A);
    if(prot & PROT_WRITE)
        perm  |= (PTE_W | PTE_D);
    if(prot & PROT_EXEC)
        perm  |= (PTE_X | PTE_A);
      
    uint64 va = p->mmap_pool[index].start, next_va;  
    uint64 off = offset;
    uint64 size;
    uint64 psize = p->sz;

    for(int i = 0; i < page_num; i++)
    {
        size = tot_size <= PGSIZE ? tot_size : PGSIZE;
        psize += PGSIZE;
        next_va = uvmalloc(p->pagetable, p->kpagetable, p->sz, psize);
        if(next_va != psize){
            return -1;
        }
        p->sz = psize;
        uint64 pa = (uint64)walkaddr(p->pagetable, va);
        eread(ep, 0, pa, off, size);
        
        if (i == page_num - 1) {
            memset((void*)(pa + size), 0, PGSIZE - size);
        }

        va = next_va;
        off+=size;
        tot_size -= size;
        off += size;
    }
    
    p->mmap_pool[index].used = 1;
    filedup(p->ofile[p->mmap_pool[index].fd]);
    return p->mmap_pool[index].start;
}



uint64
do_munmap(uint64 start, uint64 len)
{
    int index = find_mapped_area(start, len);
    if(index == -1)
        return -1;
    
    struct proc *p = myproc();
    struct mmap_info *info = &(p->mmap_pool[index]);
    
    int tot_size = len;
    int page_num = (tot_size + PGSIZE -1) / PGSIZE;
    int size;
    uint64 va = start;
    struct dirent *ep = p->ofile[info->fd]->ep;
    off_t off = info->offset;
    uint64 pa;

    for(int i = 0; i < page_num; i++)
    {
        size = tot_size <= PGSIZE ? tot_size : PGSIZE;
        
        pte_t *pte = walk(p->pagetable, va, 0);

        if((*pte & PTE_V) == 0)
            return -1;
        if((*pte & PTE_U) == 0)
            return -1;
        if(*pte & PTE_D){       // write back when PTE_D bit is 1
            pa = PTE2PA(*pte);
                if(!pa){
                return -1;
            }
            ewrite(ep, 0, pa, off, size);
        }

        vmunmap(p->pagetable, va, 1, 1);
        vmunmap(p->kpagetable, va, 1, 0);

        va += PGSIZE;
        off += size;
        tot_size -= size;
    }

    info->used = 0;
    fileclose(p->ofile[info->fd]);

    return 0;
}