#ifndef __INODE_H__
#define __INODE_H__

#include "assert.h"
#include "types.h"

#include "fs/deffs.h"
#include "fs/device.h"
#include "fs/fat32.h"
#include "fs/dirent.h"

struct inode_t {
    union {
        device_t __device_info;
        dirent_t __fat32_info;  // TODO
    } inodeInfo;
    enum { inode_type_device_info = 0x1234, inode_type_fat32_info } inodeType;
    int refCount;
    int openCount;
    fs_t* inodeFS;
    const inodeOps_t* inodeOps;
};

#define __in_type(type) inode_type_##type##_info
#define check_inode_type(node, type) ((node)->inodeType == __in_type(type))

#define vop_info(node, type)                                      \
    ({                                                            \
        inode_t* __node = (node);                                 \
        assert(__node != NULL && check_inode_type(__node, type)); \
        &(__node->inodeInfo.__##type##_info);                     \
    })

#define info2node(info, type) to_struct((info), struct inode_t, inodeInfo.__##type##_info)

inode_t* __alloc_inode(uint32_t type);

#define alloc_inode(type) __alloc_inode(__in_type(type))

#define MAX_INODE_COUNT 0x10000  // TODO?

int inode_refInc(inode_t* node);   // increase reference
int inode_refDec(inode_t* node);   // decrease reference
int inode_openInc(inode_t* node);  // increase open
int inode_openDec(inode_t* node);  // decrease open

void inode_init(inode_t* node, const inodeOps_t* ops, fs_t* fs);
void inode_kill(inode_t* node);

#define VOP_MAGIC 0x8c4ba476

struct inodeOps_t {
    uint32_t vop_magic;
    int (*vop_open)(inode_t* node, uint32_t openFlags);
    int (*vop_close)(inode_t* node);
    int (*vop_read)(inode_t* node, iobuf_t* iob);
    int (*vop_write)(inode_t* node, iobuf_t* iob);
    int (*vop_fstat)(inode_t* node, stat_t* stat);
    int (*vop_fsync)(inode_t* node);
    int (*vop_nameFile)(inode_t* node, iobuf_t* iob);
    int (*vop_getDirEntry)(inode_t* node, iobuf_t* iob);
    int (*vop_reclaim)(inode_t* node);
    int (*vop_getType)(inode_t* node, uint32_t* type_store);
    int (*vop_trySeek)(inode_t* node, offset_t pos);
    int (*vop_truncate)(inode_t* node, offset_t len);
    int (*vop_create)(inode_t* node, const char* name, bool excl, inode_t** node_store);
    int (*vop_lookup)(inode_t* node, char* path, inode_t** node_store);
    int (*vop_ioctl)(inode_t* node, int op, void* data);
};

void inode_check(inode_t* node, const char* opStr);

#define __vop_op(node, sym)                                                                        \
    ({                                                                                             \
        inode_t* __node = (node);                                                                  \
        assert(__node != NULL && __node->inodeOps != NULL && __node->inodeOps->vop_##sym != NULL); \
        inode_check(__node, #sym);                                                                 \
        __node->inodeOps->vop_##sym;                                                               \
    })
#define vop_open(node, openFlags) (__vop_op(node, open)(node, openFlags))
#define vop_close(node) (__vop_op(node, close)(node))
#define vop_read(node, iob) (__vop_op(node, read)(node, iob))
#define vop_write(node, iob) (__vop_op(node, write)(node, iob))
#define vop_fstat(node, stat) (__vop_op(node, fstat)(node, stat))
#define vop_fsync(node) (__vop_op(node, fsync)(node))
#define vop_nameFile(node, iob) (__vop_op(node, nameFile)(node, iob))
#define vop_getDirEntry(node, iob) (__vop_op(node, getDirEntry)(node, iob))
#define vop_reclaim(node) (__vop_op(node, reclaim)(node))
#define vop_getType(node, type_store) (__vop_op(node, getType)(node, type_store))
#define vop_trySeek(node, pos) (__vop_op(node, trySeek)(node, pos))
#define vop_truncate(node, len) (__vop_op(node, truncate)(node, len))
#define vop_create(node, name, excl, node_store) (__vop_op(node, create)(node, name, excl, node_store))
#define vop_lookup(node, path, node_store) (__vop_op(node, lookup)(node, path, node_store))
#define vop_ioctl(node, op, data) (__vop_op(node, ioctl)(node, op, data))

#define vop_fs(node) ((node)->inodeFS)
#define vop_init(node, ops, fs) inode_init(node, ops, fs)
#define vop_kill(node) inode_kill(node)

#define vop_refInc(node) inode_refInc(node)
#define vop_refDec(node) inode_refDec(node)

#define vop_openInc(node) inode_openInc(node)
#define vop_openDec(node) inode_openDec(node)

static inline int
inode_refCount(inode_t* node) {
    return node->refCount;
}

static inline int
inode_openCount(inode_t* node) {
    return node->openCount;
}

#endif