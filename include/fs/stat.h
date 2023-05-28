#ifndef __STAT_H__
#define __STAT_H__

#include "deffs.h"

#define STAT_MAX_NAME 32

struct stat_t {
    uint64_t st_dev;
    uint64_t st_ino;
    uint32_t st_mode;  // TODO 范围是否过小 protection mode and file type
    uint32_t st_nlink;
    uint32_t st_uid;
    uint32_t st_gid;
    uint64_t st_rdev;
    unsigned long __pad;
    size_t st_size;  // file size(Bytes)
    uint32_t st_blksize;
    int __pad2;
    uint64_t st_blocks;  // number of blocks file is using
    long st_atime_sec;
    long st_atime_nsec;
    long st_mtime_sec;
    long st_mtime_nsec;
    long st_ctime_sec;
    long st_ctime_nsec;
    unsigned __unused[2];

    size_t st_nlinks;  // number of hard links

    // TODO
    uint8_t type;
    uint32_t dev;
    char name[STAT_MAX_NAME + 1];
};

#define S_IFMT 00170000  // mask for type of file
#define S_IFSOCK 0140000
#define S_IFLNK 0120000  // symbolic link
#define S_IFREG 0100000  // regular file
#define S_IFBLK 0060000  //?block device
#define S_IFDIR 0040000  // directory
#define S_IFCHR 0020000  //?character device
#define S_IFIFO 0010000
#define S_ISUID 0004000
#define S_ISGID 0002000
#define S_ISVTX 0001000

#define S_ISLNK(m) (((m)&S_IFMT) == S_IFLNK)  // symlink
#define S_ISREG(m) (((m)&S_IFMT) == S_IFREG)  // regular file
#define S_ISDIR(m) (((m)&S_IFMT) == S_IFDIR)  // directory
#define S_ISCHR(m) (((m)&S_IFMT) == S_IFCHR)  // character device
#define S_ISBLK(m) (((m)&S_IFMT) == S_IFBLK)  // block device
#define S_ISFIFO(m) (((m)&S_IFMT) == S_IFIFO)
#define S_ISSOCK(m) (((m)&S_IFMT) == S_IFSOCK)

#define S_IRWXU 00700
#define S_IRUSR 00400
#define S_IWUSR 00200
#define S_IXUSR 00100

#define S_IRWXG 00070
#define S_IRGRP 00040
#define S_IWGRP 00020
#define S_IXGRP 00010

#define S_IRWXO 00007
#define S_IROTH 00004
#define S_IWOTH 00002
#define S_IXOTH 00001

#endif