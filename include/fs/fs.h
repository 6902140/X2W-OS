#ifndef __FS_H__
#define __FS_H__

#include "kernel/locks.h"
#include "kernel/mm.h"
#include "kernel/paging.h"
#include "stddef.h"
#include"datasturcture.h"

#include "fs/deffs.h"

#define SECTOR_SIZE 512  // TODO 修改为依赖于具体文件系统
#define SECTOR_PER_PAGE (PAGE_SIZE / SECTOR_SIZE)

#define SWAP_DEVICE_NO 1
#define DISK0_DEVICE_NO 2
#define DISK1_DEVICE_NO 3

struct super_block
{
    list_entry_t s_list;//指向所有超级块的链表
    dev_t s_dev;//设备标识符
    uint16_t s_blocksize;//以字节为单位的块大小
    uint32_t s_blocksize_bits;//?以位为单位的块大小
};

void fs_init(void);
void fs_cleanup(void);

/**
 * @brief process's files related information
 *
 */
struct filesStruct_t {
    // inode_t* pwd;           // inode of present working directory
    // file_t* fd_array;       // opened files array
    dirent_t* pwd;
    uint32_t files_count;   // number of opened files
    // semaphore_t files_sem;  // lock to protect
    spinlock_t files_lk;
};

#define FILES_STRUCT_BUFFER_SIZE (PAGE_SIZE - sizeof(filesStruct_t))
#define FILES_STRUCT_NENTRY (FILES_STRUCT_BUFFER_SIZE / sizeof(file_t))  // TODO?

void files_lock(filesStruct_t* fp);
void files_unlock(filesStruct_t* fp);

filesStruct_t* files_create(void);
void files_destroy(filesStruct_t* fp);
void files_closeAll(filesStruct_t* fp);
int files_dup(filesStruct_t* to, filesStruct_t* from);

static inline int
files_count(filesStruct_t* fp) {
    return fp->files_count;
}

static inline int
files_countInc(filesStruct_t* fp) {
    return ++fp->files_count;
}

static inline int
files_countDec(filesStruct_t* fp) {
    return --fp->files_count;
}

#endif  //__FS_H__
