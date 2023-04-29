#include "kernel/memory.h"
#include "mm.h"
#include "stdbitmap.h"

#define NR_PAGES (TOTAL_MEMORY / PAGE_SIZE)

static unsigned short mem_map[NR_PAGES/8+256] = {0,};
static unsigned short virt_mem_map[NR_PAGES/8+256] = {0,};
static unsigned long phy_start_address;

extern char idmap_pg_dir[];//定义一个外部指针指向内核进程的PGD基地址

extern char _text_boot[], _etext_boot[];
extern char _text[], _etext[];

pool_t kpool,upool;
virtual_addr_t kernel_vaddr;

void init_phys_pool(pool_t* kpool,pool_t* upool,virtual_addr_t* k_vaddr){
	kpool->phy_addr_start=phy_start_address;
	kpool->pool_size=NR_PAGES*PAGE_SIZE/2;
	(kpool->pool_bitmap)=(bitmap_t*)mem_map;
	upool->phy_addr_start=phy_start_address+kpool->pool_size;
	upool->pool_size=NR_PAGES*PAGE_SIZE-kpool->pool_size;
	(upool->pool_bitmap)=(bitmap_t*)(&mem_map[NR_PAGES/2]);
	bitmap_init(kpool->pool_bitmap,(kpool->pool_size)/(8*PAGE_SIZE));
	bitmap_init(upool->pool_bitmap,(upool->pool_size)/(8*PAGE_SIZE));
	//
	k_vaddr->vaddr_bitmap=(bitmap_t*)virt_mem_map;
	k_vaddr->vaddr_start=K_HEAP_START;
	bitmap_init(k_vaddr->vaddr_bitmap,(kpool->pool_size+upool->pool_size)/(8*PAGE_SIZE));

}

void mem_init(unsigned long start_mem, unsigned long end_mem)
{
	unsigned long nr_free_pages = 0;
	unsigned long free;

	start_mem = PAGE_ALIGN(start_mem);
	phy_start_address = start_mem;
	end_mem &= PAGE_MASK;
	free = end_mem - start_mem;

	while (start_mem < end_mem) {
		nr_free_pages++;
		start_mem += PAGE_SIZE;
	}
	kprintf("\n**************memory intial finished***************\n");
	kprintf("Memory: %uKB available, %u free pages, phy_start_address=0x%x\n", free/1024, nr_free_pages, phy_start_address);
	init_phys_pool(&kpool,&upool,&kernel_vaddr);
	kprintf("\n*************successfully initialize kernel_pool and user_pool***********\n");
	kprintf("kernel pool's size is %u\n",kpool.pool_size);
	kprintf("kernel pool's bitmap is: \n");
	for(int i=0;i<kpool.pool_bitmap->size;i++){
		kprintf("%x",kpool.pool_bitmap->bits[i]);
	}
	kprintf("\n");
	kprintf("user pool's bitmap is: \n");
	for(int i=0;i<upool.pool_bitmap->size;i++){
		kprintf("%x",upool.pool_bitmap->bits[i]);
	}
	kprintf("\n");
	kprintf("virtual pool's bitmap is: \n");
	for(int i=0;i<kernel_vaddr.vaddr_bitmap->size;i++){
		kprintf("%x",kernel_vaddr.vaddr_bitmap->bits[i]);
	}
	kprintf("\n");
}

unsigned long get_free_page(void)
{
	// int i;

	// for (i = 0; i < NR_PAGES; i++) {
	// 	if (mem_map[i] == 0) {
	// 		mem_map[i] = 1;
	// 		return phy_start_address + i * PAGE_SIZE;
	// 	}
	// }
	int index=bitmap_scan(kpool.pool_bitmap,1);
	if(index!=-1){
		bitmap_set(kpool.pool_bitmap,index,BITMAP_TAKEN);
		kprintf("bitmap show off:\n");
		for(int i=0;i<kpool.pool_bitmap->size;i++){
			kprintf("%b",kpool.pool_bitmap->bits[i]);
		}
		return phy_start_address + index * PAGE_SIZE;
	}
	return 0;
}

void free_page(unsigned long p)
{
	//mem_map[(p - phy_start_address)/PAGE_SIZE] = 0;
	int index=(p - phy_start_address)/PAGE_SIZE;
	bitmap_set(kpool.pool_bitmap,index,BITMAP_FREE);
}

unsigned long get_free_page_user(void)
{
	int index=bitmap_scan(upool.pool_bitmap,1);
	if(index!=-1){
		bitmap_set(upool.pool_bitmap,index,BITMAP_TAKEN);
		//kprintf("index=%d\n",index);
		// for(int i=0;i<upool.pool_bitmap->size;i++){
		// 	kprintf("%b",upool.pool_bitmap->bits[i]);
		// }
		return upool.phy_addr_start + index * PAGE_SIZE;
	}
	return 0;
}

void free_page_user(unsigned long p)
{
	int index=(p - upool.phy_addr_start)/PAGE_SIZE;
	bitmap_set(upool.pool_bitmap,index,BITMAP_FREE);
}

unsigned long get_a_virt_page(void){
	int index=bitmap_scan(kernel_vaddr.vaddr_bitmap,1);
	if(index!=-1){
		bitmap_set(kernel_vaddr.vaddr_bitmap,index,BITMAP_TAKEN);
	}
	return index*PAGE_SIZE+kernel_vaddr.vaddr_start;
}

// void page_table_add(void* _vaddr, void* _page_phyaddr)
// {
// 	unsigned long vaddr=(unsigned long)_vaddr;
// 	pgd_t *pgdp = pgd_offset_raw(idmap_pg_dir,vaddr);
// 	if (pgd_none(*pgdp)){
// 		unsigned long pmd_phys = alloc_pgtable();
// 		set_pgd(pgdp, pfn_pgd(PFN_DOWN(pmd_phys), PAGE_TABLE));
// 	}
	

// }


unsigned long pgtable_alloc_1(void)
{
	unsigned long phys;

	phys = get_free_page();
	memset((void *)phys, 0, PAGE_SIZE);

	return phys;
}



void page_table_add(void* _vaddr, void* _page_phyaddr){
	
    uint32_t vaddr = (uint64_t) _vaddr;
    uint32_t page_phyaddr = (uint64_t) _page_phyaddr;

	__create_pgd_mapping((pgd_t *)idmap_pg_dir, page_phyaddr, vaddr,
			PAGE_SIZE, PAGE_KERNEL_READ_EXEC,
			pgtable_alloc_1,
			0);
}

void* malloc_a_page(void){
	kprintf("start malloc a page\n");
	void* vaddr=get_a_virt_page();
	void* paddr=get_free_page();
	kprintf("vaddr=%b,\tpaddr=%b\n",vaddr,paddr);
	page_table_add(vaddr,paddr);
	return vaddr;
}