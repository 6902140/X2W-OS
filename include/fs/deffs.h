#ifndef __DEFFS_H__
#define __DEFFS_H__

#include "types.h"

#define O_RDONLY 0x000
#define O_WRONLY 0x001
#define O_RDWR 0x002     // 可读可写
#define O_ACCMODE 0x003  // mask for O_RDONLY / O_WRONLY / O_RDWR

#define O_CREATE 0x40  // create file if not exist
#define O_EXCL 0x08    // error if O_CREATE and file exists
#define O_TRUNC 0x10   // tuncate file
#define O_APPEND 0x20  // append on write

#define NO_FD -0x9527

#define LSEEK_SET 0  // seek to beginning of file
#define LSEEK_CUR 1  // seek to current position of file
#define LSEEK_END 2  // seek to end of file

#define FS_MAX_DNAME_LEN 31  //?
#define FS_MAX_FNAME_LEN 255
#define FS_MAX_FPATH_LEN 4095  // TODO 可以不加限制吗

typedef uint8_t dev_t;

// fs.h
typedef struct super_block super_block;
typedef struct filesStruct_t filesStruct_t;

// vfs.h
typedef struct fs_t fs_t;

// device.h
typedef struct device_t device_t;

// fat32.h
typedef struct bpb_t bpb_t;
typedef struct FSInfo_t FSInfo_t;
typedef struct fat32FS_t fat32FS_t;
typedef struct fat32Dentry_t fat32Dentry_t;
typedef struct fat32Dslot_t fat32Dslot_t;
typedef union fat32Entry_t fat32Entry_t;

// typedef struct shortNameFDT_t shortNameFDT_t;
// typedef struct longNameFDT_t longNameFDT_t;

// inode.h
typedef struct inode_t inode_t;
typedef struct inodeOps_t inodeOps_t;

// iobuf.h
typedef struct iobuf_t iobuf_t;

// stat.h
typedef struct stat_t stat_t;

// file.h
typedef struct file_t file_t;

// dirent.h
typedef struct dirent_t dirent_t;

#endif