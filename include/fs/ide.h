#ifndef __IDE_H__
#define __IDE_H__

#include "deffs.h"

#define MAX_IDE 4
#define MAX_NSECS 128
#define MAX_DISK_NSECS 0x10000000U

typedef struct ide_device_t ide_device_t;
struct ide_device_t {
    uint32_t valid;
    uint32_t sets;
    uint32_t size;
    address_t iobase;
    void* dev_data;
    char model[32];

    int (*read_secs)(ide_device_t* dev, size_t secno, void* dst, size_t nsecs);
    int (*write_secs)(ide_device_t* dev, size_t secno, const void* src, size_t nsecs);
};

ide_device_t ide_device_list[MAX_IDE];

void ide_init(void);
bool ide_device_valid(uint32_t ideno);
size_t ide_device_size(uint32_t ideno);

int ide_readSecs(uint32_t ideno, uint32_t secno, void* dst, size_t nsecs);
int ide_writeSecs(uint32_t ideno, uint32_t secno, const void* src, size_t nsecs);

#endif