#ifndef __DEVICE_H__
#define _DEVICE_H__

#include "deffs.h"
#include "types.h"

struct device_t {
    size_t d_blocks;
    size_t d_blocksize;
    int (*d_open)(device_t* dev, uint32_t openFlags);
    int (*d_close)(device_t* dev);
    int (*d_io)(device_t* dev, iobuf_t* iob, bool write);
    int (*d_ioctl)(device_t* dev, int op, void* data);
};

#define dop_open(dev, open_flags) ((dev)->d_open(dev, open_flags))
#define dop_close(dev) ((dev)->d_close(dev))
#define dop_io(dev, iob, write) ((dev)->d_io(dev, iob, write)) // 0 - read, 1 - write
#define dop_ioctl(dev, op, data) ((dev)->d_ioctl(dev, op, data))

void dev_init(void);
struct inode_t* dev_createInode(void);

#endif