#ifndef __FILE_H__
#define __FILE_H__

#include "deffs.h"
#include "types.h"
#include "kernel/locks.h"
#define MAX_FILE_NUM 100

struct file_t {
    enum file_status {
        // FD_NONE,
        FD_INIT,
        FD_OPENED,
        FD_CLOSED,
    } status;
    enum file_type {
        FD_NONE,
        FD_PIPE,
        FD_ENTRY,
        FD_DEVICE,
    } type;
    bool readable;
    bool writeable;
    int fd;
    offset_t pos;
    inode_t* node;  // TODO not used
    dirent_t* d_entry;
    uint32_t openCount;
    // semaphore_t file_lk;
    spinlock_t file_lk;
};

// void fd_array_init(file_t* fdArray);
// void fd_array_open(file_t* file);
// void fd_array_close(file_t* file);
// void fd_array_dup(file_t* to, file_t* from);
// bool file_testfd(int fd, bool readable, bool writable);

// int file_open(char* path, uint32_t openFlags);
// int file_close(int fd);
// int file_read(int fd, void* base, size_t len, size_t* copied_store);
// int file_write(int fd, void* base, size_t len, size_t* copied_store);
// int file_seek(int fd, offset_t pos, int whence);
// int file_fstat(int fd, stat_t* stat);
// int file_fsync(int fd);
// int file_getDirEntry(int fd, dirent_t* dirent);
// int file_dup(int fd1, int fd2);
// int file_pipe(int fd[]);
// int file_mkfifo(const char* name, uint32_t openFlags);

file_t* __file_alloc(void);
int __fd_alloc(file_t* f);
void file_init(void);
int __file_close(file_t* f);
int fd2file(int fd, file_t** file_store);

static inline uint32_t
fopenCount(file_t* file) {
    return file->openCount;
}

static inline uint32_t
fopenCountInc(file_t* file) {
    return ++file->openCount;
}

static inline uint32_t
fopenCountDec(file_t* file) {
    return --file->openCount;
}

#endif
