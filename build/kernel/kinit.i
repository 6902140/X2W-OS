# 0 "kernel/kinit.c"
# 1 "/home/lighthouse/xzr/X2W-OS//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "kernel/kinit.c"
# 11 "kernel/kinit.c"
# 1 "include/device/ddr.h" 1
# 16 "include/device/ddr.h"
# 1 "include/constrains.h" 1
# 17 "include/device/ddr.h" 2
# 12 "kernel/kinit.c" 2
# 1 "include/device/uart.h" 1
# 21 "include/device/uart.h"
# 1 "include/io.h" 1
# 18 "include/io.h"
# 1 "include/types.h" 1
# 14 "include/types.h"
# 1 "include/constrains.h" 1
# 15 "include/types.h" 2
# 23 "include/types.h"
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long uint64_t;


typedef char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long int64_t;


typedef unsigned char Bool;
enum {
    False = 0,
    True = 1
};


typedef uint64_t size_t;


typedef uint8_t byte;


typedef int64_t offset_t;


typedef uint64_t addr_t;


typedef uint64_t ireg_t;


typedef uint64_t freg_t;

typedef uint64_t* pagetable_t;
# 19 "include/io.h" 2
# 29 "include/io.h"
static inline void write_8_bits(uint64_t addr, uint8_t value);







static inline void write_16_bits(uint64_t addr, uint16_t value);







static inline void write_32_bits(uint64_t addr, uint32_t value);







static inline void write_64_bits(uint64_t addr, uint64_t value);
# 62 "include/io.h"
static inline uint8_t read_8_bits(uint64_t addr);







static inline uint16_t read_16_bits(uint64_t addr);
# 79 "include/io.h"
static inline uint32_t read_32_bits(uint64_t addr);







static inline uint64_t read_64_bits(uint64_t addr);
# 160 "include/io.h"
static inline uint8_t read_8_bits(addr_t addr){ uint8_t __v = *(volatile uint8_t*)addr; __asm__ __volatile__ ("" : : : "memory"); return __v; };
static inline uint16_t read_16_bits(addr_t addr){ uint16_t __v = *(volatile uint16_t*)addr; __asm__ __volatile__ ("" : : : "memory"); return __v; };
static inline uint32_t read_32_bits(addr_t addr){ uint32_t __v = *(volatile uint32_t*)addr; __asm__ __volatile__ ("" : : : "memory"); return __v; };
static inline uint64_t read_64_bits(addr_t addr){ uint64_t __v = *(volatile uint64_t*)addr; __asm__ __volatile__ ("" : : : "memory"); return __v; };

static inline void write_8_bits(addr_t addr, uint8_t value){ uint8_t __v = value; __asm__ __volatile__ ("" : : : "memory"); *(volatile uint8_t*)addr = __v; };
static inline void write_16_bits(addr_t addr, uint16_t value){ uint16_t __v = value; __asm__ __volatile__ ("" : : : "memory"); *(volatile uint16_t*)addr = __v; };
static inline void write_32_bits(addr_t addr, uint32_t value){ uint32_t __v = value; __asm__ __volatile__ ("" : : : "memory"); *(volatile uint32_t*)addr = __v; };
static inline void write_64_bits(addr_t addr, uint64_t value){ uint64_t __v = value; __asm__ __volatile__ ("" : : : "memory"); *(volatile uint64_t*)addr = __v; };
# 22 "include/device/uart.h" 2
# 1 "include/types.h" 1
# 23 "include/device/uart.h" 2
# 1 "include/asm/uart.h" 1
# 24 "include/device/uart.h" 2
# 35 "include/device/uart.h"
void uart_init(void);






char uart_get(void);
# 51 "include/device/uart.h"
void uart_put(char chr);
# 60 "include/device/uart.h"
void uart_puts(const char *string);







void uart_interrupt_handler(void);
# 13 "kernel/kinit.c" 2
# 1 "include/kernel/mm.h" 1
# 16 "include/kernel/mm.h"
# 1 "include/stdbitmap.h" 1
# 29 "include/stdbitmap.h"
typedef struct __bitmap_t {

    size_t size;

    byte *bits;
} bitmap_t;
# 43 "include/stdbitmap.h"
void bitmap_init(bitmap_t *btmp_ptr, size_t size);
# 52 "include/stdbitmap.h"
void bitmap_set(bitmap_t *btmp_ptr, offset_t bit_idx, Bool taken);
# 62 "include/stdbitmap.h"
Bool bitmap_test(bitmap_t *btmp_ptr, offset_t bit_idx);
# 73 "include/stdbitmap.h"
offset_t bitmap_scan(bitmap_t *btmp_ptr, size_t cnt);
# 88 "include/stdbitmap.h"
Bool bitmap_acquire(bitmap_t *btmp_ptr, offset_t out[], size_t cnt);







void bitmap_release(bitmap_t *btmp_ptr, offset_t out[], size_t cnt);
# 17 "include/kernel/mm.h" 2

# 1 "include/asm/svxx.h" 1
# 36 "include/asm/svxx.h"
typedef struct __page_property_t {
    uint64_t val;
} page_property_t;
# 54 "include/asm/svxx.h"
static inline Bool is_valid_page(uint64_t val){
    return ((val & (1 << 0)) == 0) ? False : True;
}
# 71 "include/asm/svxx.h"
static inline Bool is_readable_page(uint64_t val){
    return ((val & (1 << 1)) == 0) ? False : True;
}
# 88 "include/asm/svxx.h"
static inline Bool is_writable_page(uint64_t val){
    return ((val & (1 << 2)) == 0) ? False : True;
}
# 105 "include/asm/svxx.h"
static inline Bool is_executable_page(uint64_t val){
    return ((val & (1 << 3)) == 0) ? False : True;
}
# 122 "include/asm/svxx.h"
static inline Bool is_user_page(uint64_t val){
    return ((val & (1 << 4)) == 0) ? False : True;
}
# 134 "include/asm/svxx.h"
static inline Bool is_global_page(uint64_t val){
    return ((val & (1 << 5)) == 0) ? False : True;
}
# 151 "include/asm/svxx.h"
static inline Bool is_accessed_page(uint64_t val){
    return ((val & (1 << 6)) == 0) ? False : True;
}
# 168 "include/asm/svxx.h"
static inline Bool is_dirty_page(uint64_t val){
    return ((val & (1 << 7)) == 0) ? False : True;
}
# 188 "include/asm/svxx.h"
static inline Bool is_leaf_page(uint64_t val){
    return ((is_valid_page(val) && (val & ((1 << 1) | (1 << 2) | (1 << 3)))) == 0) ? False : True;
}
# 365 "include/asm/svxx.h"
typedef addr_t pgd_t;


typedef struct __pgd_entry_t {
    uint64_t val;
} pgd_entry_t;
# 381 "include/asm/svxx.h"
typedef addr_t pmd_t;


typedef struct __pmd_entry_t {
    uint64_t val;
} pmd_entry_t;
# 397 "include/asm/svxx.h"
typedef addr_t pt_t;


typedef struct __pt_entry_t {
    uint64_t val;
} pt_entry_t;
# 19 "include/kernel/mm.h" 2
# 1 "include/kernel/locks.h" 1
# 27 "include/kernel/locks.h"
typedef struct __spinlock_t {

    Bool locked;

    char *name;
} spinlock_t;
# 41 "include/kernel/locks.h"
void spinlock_init(spinlock_t *lock, char *name);
# 51 "include/kernel/locks.h"
void spinlock_acquire(spinlock_t *lock);
# 61 "include/kernel/locks.h"
void spinlock_release(spinlock_t *lock);
# 20 "include/kernel/mm.h" 2
# 32 "include/kernel/mm.h"
typedef struct __ppool_t {

    bitmap_t *btmp;

    addr_t paddr_start;

    size_t size;

    spinlock_t lock;
} ppool_t;







typedef struct __vpool_t {

    bitmap_t *btmp;

    addr_t vaddr_start;

    spinlock_t lock;
} vpool_t;
# 67 "include/kernel/mm.h"
ppool_t *get_ppool(void);
# 77 "include/kernel/mm.h"
vpool_t *get_vpool(void);
# 91 "include/kernel/mm.h"
void init_pools(addr_t start_paddr, size_t total_pages);







void memory_init(addr_t start_paddr, addr_t end_paddr);
# 112 "include/kernel/mm.h"
addr_t alloc_ppage(Bool kpage);
# 121 "include/kernel/mm.h"
void free_ppage(addr_t ppage, Bool kpage);
# 135 "include/kernel/mm.h"
addr_t alloc_vpage(vpool_t *vpool, size_t cnt);
# 144 "include/kernel/mm.h"
void free_vpage(vpool_t *vpool, addr_t vpage);
# 159 "include/kernel/mm.h"
void *malloc_page(size_t cnt, Bool kpage);


uint64_t get_physical_address(uint64_t vaddr);
pagetable_t uvmcreate(void);
# 14 "kernel/kinit.c" 2
# 1 "include/kernel/ktrap.h" 1
# 15 "include/kernel/ktrap.h"
# 1 "include/asm/csr.h" 1
# 16 "include/kernel/ktrap.h" 2

# 1 "include/trap/trapframe.h" 1
# 29 "include/trap/trapframe.h"
typedef struct __gtrapframe_t {

    union { ireg_t _x1; ireg_t ra; };

    union { ireg_t _x2; ireg_t sp; };

    union { ireg_t _x3; ireg_t gp; };

    union { ireg_t _x4; ireg_t tp; };

    union { ireg_t _x5; ireg_t t0; };

    union { ireg_t _x6; ireg_t t1; };

    union { ireg_t _x7; ireg_t t2; };

    union { ireg_t _x8; ireg_t s0; ireg_t fp; };

    union { ireg_t _x9; ireg_t s1; };

    union { ireg_t _x10; ireg_t a0; };

    union { ireg_t _x11; ireg_t a1; };

    union { ireg_t _x12; ireg_t a2; };

    union { ireg_t _x13; ireg_t a3; };

    union { ireg_t _x14; ireg_t a4; };

    union { ireg_t _x15; ireg_t a5; };

    union { ireg_t _x16; ireg_t a6; };

    union { ireg_t _x17; ireg_t a7; };

    union { ireg_t _x18; ireg_t s2; };

    union { ireg_t _x19; ireg_t s3; };

    union { ireg_t _x20; ireg_t s4; };

    union { ireg_t _x21; ireg_t s5; };

    union { ireg_t _x22; ireg_t s6; };

    union { ireg_t _x23; ireg_t s7; };

    union { ireg_t _x24; ireg_t s8; };

    union { ireg_t _x25; ireg_t s9; };

    union { ireg_t _x26; ireg_t s10; };

    union { ireg_t _x27; ireg_t s11; };

    union { ireg_t _x28; ireg_t t3; };

    union { ireg_t _x29; ireg_t t4; };

    union { ireg_t _x30; ireg_t t5; };

    union { ireg_t _x31; ireg_t t6; };
# 127 "include/trap/trapframe.h"
} gtrapframe_t;



typedef struct __strapframe_t {

    ireg_t mepc;

    gtrapframe_t gregisters;

    ireg_t mstatus;
} strapframe_t;



typedef struct __ktrapframe_t {

    ireg_t sepc;

    gtrapframe_t gregisters;

    ireg_t sstatus;

    ireg_t sbadaddr;

    ireg_t scause;

    ireg_t origin_a0;
} ktrapframe_t;



typedef size_t (*printf_t)(const char* format, ...);
# 168 "include/trap/trapframe.h"
void print_gtrapframe(gtrapframe_t *gtf_ptr, printf_t print_func);
# 177 "include/trap/trapframe.h"
void print_strapframe(strapframe_t *stf_ptr, printf_t print_func);
# 186 "include/trap/trapframe.h"
void print_ktrapframe(ktrapframe_t *ktf_ptr, printf_t print_func);
# 18 "include/kernel/ktrap.h" 2
# 1 "include/trap/trap_entry.h" 1
# 24 "include/trap/trap_entry.h"
extern void strap_enter(void);
# 33 "include/trap/trap_entry.h"
extern void strap_exit(void);
# 43 "include/trap/trap_entry.h"
extern void ktrap_enter(void);
# 52 "include/trap/trap_entry.h"
extern void ktrap_exit(void);
# 19 "include/kernel/ktrap.h" 2
# 31 "include/kernel/ktrap.h"
typedef int64_t (*ktrap_handler_t)(ktrapframe_t *ktf_ptr);





static inline void supervisor_interrupt_enable(void){
    ({ unsigned long __v = (unsigned long) (0x00000002UL); __asm__ __volatile__( "csrs " "sstatus" ", %0" : : "rK" (__v) : "memory" ); });
}




static inline void supervisor_interrupt_disable(void){
    ({ unsigned long __v = (unsigned long) (0x00000002UL); __asm__ __volatile__( "csrc " "sstatus" ", %0" : : "rK" (__v) : "memory" ); });
}







void ktrap_init(void);







void ktrap_dispatcher(ktrapframe_t *ktf_ptr);
# 73 "include/kernel/ktrap.h"
void register_ktrap_handler(uint64_t trap_code, Bool interrupt, const char* msg, ktrap_handler_t ktrap_func);
# 82 "include/kernel/ktrap.h"
__attribute__((noreturn)) int64_t general_ktrap_handler(ktrapframe_t *ktf_ptr);
# 15 "kernel/kinit.c" 2
# 1 "include/kernel/kinit.h" 1
# 24 "include/kernel/kinit.h"
void kinit_all(void);
# 16 "kernel/kinit.c" 2
# 1 "include/kernel/kplic.h" 1
# 15 "include/kernel/kplic.h"
# 1 "include/asm/plic.h" 1
# 42 "include/asm/plic.h"
static inline addr_t plic_priority_addr(uint32_t hwiid){
    return (addr_t) (0xC000000UL + hwiid * 4);
}
# 54 "include/asm/plic.h"
static inline addr_t plic_pending_addr(uint32_t hwiid){
    return (addr_t) (0xC000000UL + 0x1000 + (hwiid / 32) * 4);
}
# 68 "include/asm/plic.h"
static inline addr_t plic_enable_addr(uint64_t hid, Bool m_mode){
    offset_t offset = (m_mode == True) ? 0x2000 : 0x2080;
    return (addr_t) (0xC000000UL + offset + hid * 0x80);
}
# 83 "include/asm/plic.h"
static inline addr_t plic_threshold_addr(uint64_t hid, Bool m_mode){
    offset_t offset = (m_mode == True) ? 0x200000 : 0x201000;
    return (addr_t) (0xC000000UL + offset + hid * 0x1000);
}
# 98 "include/asm/plic.h"
static inline addr_t plic_claim_addr(uint64_t hid, Bool m_mode){
    return plic_threshold_addr(hid, m_mode) + 0x04;
}
# 113 "include/asm/plic.h"
static inline addr_t plic_complete_addr(uint64_t hid, Bool m_mode){
    return plic_claim_addr(hid, m_mode);
}
# 16 "include/kernel/kplic.h" 2
# 24 "include/kernel/kplic.h"
void kplic_init(void);
# 33 "include/kernel/kplic.h"
void kplic_set_priority(uint32_t hwiid, uint32_t priority);
# 42 "include/kernel/kplic.h"
void kplic_enable_interrupt(uint64_t cid, uint32_t hwiid, Bool enable, Bool m_mode);
# 53 "include/kernel/kplic.h"
int64_t kplic_interrupt_handler(ktrapframe_t *ktf_ptr);
# 17 "kernel/kinit.c" 2
# 1 "include/kernel/ktimer.h" 1
# 18 "include/kernel/ktimer.h"
# 1 "include/asm/clint.h" 1
# 19 "include/kernel/ktimer.h" 2
# 50 "include/kernel/ktimer.h"
static inline uint64_t get_cycle(void){
    return read_64_bits((0x2000000 + 0xBFF8));
}
# 68 "include/kernel/ktimer.h"
void reset_timer(void);


void ktimer_init(void);







int64_t ktimer_interrupt_handler(ktrapframe_t *kft_ptr);
# 18 "kernel/kinit.c" 2
# 1 "include/kernel/kstdio.h" 1
# 16 "include/kernel/kstdio.h"
# 1 "include/stdfmt.h" 1
# 15 "include/stdfmt.h"
# 1 "include/stdarg.h" 1
# 34 "include/stdarg.h"
typedef __builtin_va_list va_list;
# 69 "include/stdarg.h"
typedef char* _my_va_list;
# 16 "include/stdfmt.h" 2
# 1 "include/string.h" 1
# 32 "include/string.h"
size_t memset(void *dst, byte value, size_t size);
# 43 "include/string.h"
size_t strmset(void *dst, char value, size_t size);
# 57 "include/string.h"
size_t memcpy(void *dst, const void* src, size_t size);
# 72 "include/string.h"
size_t memmove(void* dst, const void *src, size_t size);
# 87 "include/string.h"
int8_t memcmp(const void *a, const void *b, size_t size);
# 99 "include/string.h"
char* strcpy(char *dst, const char *src);
# 109 "include/string.h"
size_t strlen(const char* str);
# 123 "include/string.h"
int8_t strcmp(const char* a, const char* b);
# 136 "include/string.h"
char* strcat(char *dst, const char* src);
# 151 "include/string.h"
char* strchr(const char* str, const uint8_t ch);
# 166 "include/string.h"
char* strrchr(const char* str, const uint8_t ch);
# 176 "include/string.h"
size_t strchrs(const char* str, const uint8_t ch);
# 187 "include/string.h"
size_t strslice(const char* src, char* dst, int64_t start, int64_t len);
# 196 "include/string.h"
void encrypt_decrypt(char *str, int len, char key);

int regu_match(const char *str, const char *pattern, int match_pos[]);
# 209 "include/string.h"
void regu_replace(char *str, const char *pattern, const char *replacement, int max_len);
# 17 "include/stdfmt.h" 2
# 1 "include/stdlib.h" 1
# 82 "include/stdlib.h"
void itoa(uint64_t integer, char** buf_ptr_addr, uint8_t base);






int64_t atoi(char* str);
# 18 "include/stdfmt.h" 2
# 32 "include/stdfmt.h"
const char* _scan_number(const char *str, int* num);
# 45 "include/stdfmt.h"
char *copy_number(char *str, unsigned long num, int base, int width, int precision, int flag);
# 91 "include/stdfmt.h"
size_t vsprintf(char* str, const char* format, va_list ap);
# 136 "include/stdfmt.h"
size_t sprintf(char* buf, const char* format, ...);
# 17 "include/kernel/kstdio.h" 2
# 67 "include/kernel/kstdio.h"
size_t kprintf(const char* format, ...);
# 19 "kernel/kinit.c" 2
# 1 "include/kernel/paging.h" 1
# 22 "include/kernel/paging.h"
# 1 "include/kernel/kdebug.h" 1
# 28 "include/kernel/kdebug.h"
static inline void kpanic_spin(char *filename, int line, const char* func, const char* condition, const char*msg, ...){
    supervisor_interrupt_disable();
    kprintf("===================== Error Message =====================%c", '\n');
    kprintf("filename: %s, at line %d\n", filename, line);
    kprintf("unsatisfied condition: %s\n", condition);
    kprintf("assert check failed in function: %s\n", func);
    char buf[1024] = {0};
    va_list args;
    __builtin_va_start(args, msg);
    vsprintf(buf, msg, args);
    kprintf("info message: %s\n", buf);
    while (1);
}
# 23 "include/kernel/paging.h" 2
# 71 "include/kernel/paging.h"
extern char _s_kernel_pgd[];

extern pgd_t *kernel_pgd;






typedef struct __addr_marker_t {
 addr_t start_address;
 char *name;
} addr_marker_t;

static const addr_marker_t address_markers[] = {
    {.start_address = 0, .name = "Identical Mapping"},
};







typedef struct __property_bit_t {

 uint64_t mask;

 uint64_t val;

 const char *set;

 const char *clear;
} property_bit_t;

static const property_bit_t prot_bits[] = {

 { .mask = (3 << 8), .val = (3 << 8), .set = "RSW", .clear = ".." },

    { .mask = (1 << 7), .val = (1 << 7), .set = "D", .clear = "." },

    { .mask = (1 << 6), .val = (1 << 6), .set = "A", .clear = "." },

    { .mask = (1 << 5), .val = (1 << 5), .set = "G", .clear = "." },

    { .mask = (1 << 4), .val = (1 << 4), .set = "U", .clear = "." },

    { .mask = (1 << 3), .val = (1 << 3), .set = "X", .clear = "." },

    { .mask = (1 << 2), .val = (1 << 2), .set = "W", .clear = "." },

    { .mask = (1 << 1), .val = (1 << 1), .set = "R", .clear = "." },

    { .mask = (1 << 0), .val = (1 << 0), .set = "V", .clear = "." },
};
# 135 "include/kernel/paging.h"
void dump_property(uint64_t property, const property_bit_t *bits, size_t num);
# 146 "include/kernel/paging.h"
void print_page_table(addr_t s_vaddr, addr_t e_vaddr, int level, uint64_t entry);
# 156 "include/kernel/paging.h"
void parse_pt(pt_t *pt, addr_t s_vaddr, addr_t e_vaddr);
# 165 "include/kernel/paging.h"
void parse_pmd(pmd_t *pmd, addr_t s_vaddr, addr_t e_vaddr);
# 174 "include/kernel/paging.h"
void parse_pgd(pgd_t *pgd, addr_t s_vaddr, size_t size);
# 185 "include/kernel/paging.h"
void dump_pgd(pgd_t *pgd, addr_t s_vaddr, addr_t e_vaddr);
# 203 "include/kernel/paging.h"
static inline addr_t page_align(addr_t addr, Bool next){
    if (next == False)
        return (addr & ~((1 << 12) - 1));
    return (addr + (1 << 12) - 1) & ~((1 << 12) - 1);
}







static inline offset_t get_offset(addr_t vaddr){
    return (offset_t) vaddr & 0b0000000000000000000000000000000000000000000000000000111111111111;
}
# 226 "include/kernel/paging.h"
static inline offset_t get_vpn(addr_t vaddr, int vpn){
    offset_t result = -1;
    if (vpn == 2)
        result = (offset_t) (vaddr >> 30) & (((1 << 12) / (sizeof(pgd_entry_t))) - 1);
    else if (vpn == 1)
        result = (offset_t) (vaddr >> 21) & ((1 << (30 - 21)) - 1);
    else if (vpn == 0)
        result = (offset_t) (vaddr >> 12) & ((1 << (21 - 12)) - 1);
    else if (vpn == -1)
        result = (offset_t) (vaddr & ((1 << 12) - 1));
    if (result != -1) {} else {kpanic_spin("include/kernel/paging.h", 236, __func__, "result != -1", "\"vpn = %d, should be in [2, 1, 0, -1]!\"", vpn);};
    return result;
    __builtin_unreachable();
}
# 248 "include/kernel/paging.h"
static inline addr_t get_ppn(addr_t paddr, int ppn){
    if (ppn == 2)
        return (paddr & 0b0000000011111111111111111111111111000000000000000000000000000000) >> 30;
    else if (ppn == 1)
        return (paddr & 0b0000000000000000000000000000000000111111111000000000000000000000) >> 20;
    else if (ppn == 0)
        return (paddr & 0b0000000000000000000000000000000000000000000111111111000000000000) >> 12;
    else
        if (False) {} else {kpanic_spin("include/kernel/paging.h", 256, __func__, "False", "\"ppn = %d, should be in [2, 1, 0]!\"");};
    __builtin_unreachable();
}
# 267 "include/kernel/paging.h"
static inline pgd_t *get_pgd(void){

    return (pgd_t *)_s_kernel_pgd;
}






static inline pmd_t *get_pmd(pgd_entry_t *pgd_ent){
    return (pmd_t *) ((pgd_ent->val >> 10) << 12);
}






static inline pt_t *get_pt(pmd_entry_t *pmd_ent){
    return (pt_t *) ((pmd_ent->val >> 10) << 12);
}
# 297 "include/kernel/paging.h"
__attribute__((deprecated)) static inline pgd_entry_t* get_pgd_entry(pgd_t *pgd, offset_t pgde_idx){

    return ((pgd_entry_t *) pgd) + pgde_idx;
}
# 309 "include/kernel/paging.h"
static inline void set_pgd_entry(pgd_entry_t *pgd_ent, addr_t pmd_paddr, page_property_t pmd_prot){
    pgd_ent->val = (uint64_t) (((pmd_paddr >> 12) << 10) | pmd_prot.val);
}
# 320 "include/kernel/paging.h"
__attribute__((deprecated)) static inline pmd_entry_t* get_pmd_entry(pgd_entry_t *pgd_ent, offset_t pmde_idx){
    pmd_t *pmd = get_pmd(pgd_ent);

    return ((pmd_entry_t *) pmd) + pmde_idx;
}
# 333 "include/kernel/paging.h"
static inline void set_pmd_entry(pmd_entry_t *pmd_ent, addr_t pt_paddr, page_property_t pt_prot){
    pmd_ent->val = (uint64_t) (((pt_paddr >> 12) << 10) | pt_prot.val);
}
# 344 "include/kernel/paging.h"
__attribute__((deprecated)) static inline pt_entry_t* get_pt_entry(pmd_entry_t *pmd_ent, offset_t pte_idx){
    pt_t *pt = get_pt(pmd_ent);

    return ((pt_entry_t *) pt) + pte_idx;
}
# 357 "include/kernel/paging.h"
static inline void set_pt_entry(pt_entry_t *pt_ent, addr_t p_paddr, page_property_t p_prot){
    pt_ent->val = (uint64_t) (((p_paddr >> 12) << 10) | p_prot.val);
}
# 373 "include/kernel/paging.h"
static inline addr_t get_mapping_end(addr_t s_vaddr, addr_t e_vaddr, Bool pgd_entry){
    addr_t boundary;
    if (pgd_entry == True)
        boundary = (s_vaddr + (1UL << 30)) & (~((1UL << 30) - 1));
    else
        boundary = (s_vaddr + (1UL << 21)) & (~((1UL << 21) - 1));
    return boundary - 1 < e_vaddr - 1 ? boundary : e_vaddr;
}
# 398 "include/kernel/paging.h"
void make_pmd_entry(
    pmd_entry_t *pmd_ent,
    addr_t s_vaddr,
    addr_t e_vaddr,
    addr_t paddr,
    page_property_t property,
    uint64_t flags
);
# 422 "include/kernel/paging.h"
void make_pgd_entry(
    pgd_entry_t *pgd_ent,
    addr_t s_vaddr,
    addr_t e_vaddr,
    addr_t paddr,
    page_property_t property,
    uint64_t flags
);
# 456 "include/kernel/paging.h"
void create_mapping(
    pgd_t *pgd,
    addr_t vaddr,
    addr_t paddr,
    uint64_t size,
    page_property_t property,
    uint64_t flags
);
# 478 "include/kernel/paging.h"
extern void enable_vm_translation(void);
# 488 "include/kernel/paging.h"
void create_identical_mapping(void);
# 498 "include/kernel/paging.h"
void create_mmio_mapping(void);
# 509 "include/kernel/paging.h"
void paging_init(void);
# 520 "include/kernel/paging.h"
__attribute__((noreturn)) int64_t paging_load_page_fault_exception_handler(ktrapframe_t *ktf_ptr);
# 20 "kernel/kinit.c" 2


extern char _e_kernel[];



void kinit_all(void){
    kprintf("=> ktrap_init\n");
    ktrap_init();
    kprintf("\tDone!\n");;
    kprintf("=> kplic_init\n");
    kplic_init();
    kprintf("\tDone!\n");;
    kprintf("=> ktimer_init\n");
    ktimer_init();
    kprintf("\tDone!\n");;
    kprintf("=> memory_init\n");
    memory_init((addr_t) _e_kernel, (0x80000000UL + (16 * 0x100000UL)));
    kprintf("\tDone!\n");;
    kprintf("=> paging_init\n");
    paging_init();
    kprintf("\tDone!\n");;
}
