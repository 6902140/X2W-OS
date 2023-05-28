#ifndef __DIRENT_H__
#define __DIRENT_H__

#include "lock.h"
#include "deffs.h"
#include "types.h"

// 目录项
struct dirent_t {
    uint64_t d_ion;     //索引节点号
    offset_t d_off;     //到下一dirent的偏移
    uint32_t d_reclen;  //当前dirent长度
    uint8_t d_type;     //文件类型
    char d_name[FS_MAX_FNAME_LEN + 1];

    // semaphore_t d_lk;
    spinlock_t d_lk;

    // TODO 不应在dirent_t中存储fat32的相关信息？
    uint32_t firstClus;
    uint32_t size;
    uint32_t curClus;  //当前所在簇
    uint32_t clusCnt;  //当前所在簇，在整个文件中是第几簇

    uint8_t dev;
    bool dirty;
    bool valid;
    uint32_t ref;
    offset_t p_off;
    dirent_t* parent;
    dirent_t* next;
    dirent_t* prev;
};

#endif