#ifndef __SYSFILE_H__
#define __SYSFILE_H__

#include "deffs.h"

int sysfile_close(int);                                            // SYS_close 57, 关闭文件
int sysfile_read(int, void*, size_t);                              // SYS_read 63, 读取文件
int sysfile_write(int, void*, size_t);                             // SYS_write 64, 写入文件
int sysfile_seek(int, offset_t, int);                              // SYS_lseek 8
int sysfile_fstat(int, stat_t*);                                   // SYS_fstat 80, 获取文件状态
int sysfile_fsync(int);                                            // SYS_fsync 74 刷新文件内容
int sysfile_open(int fd, const char* __path, uint32_t openFlags);  // SYS_openat 56, 打开/创建一个文件
// int sysfile_close( const char* __path);
// int sysfile_read(const char* path, void*, size_t);   // 63
// int sysfile_write(const char* path, void*, size_t);  // 64
// int sysfile_seek(const char* path, offset_t, int);
// int sysfile_fstat(const char* path, stat_t*);  // 80
// int sysfile_fsync(const char* path);

int sysfile_chdir(const char*);                 // SYS_chdir 49, 切换工作目录
int sysfile_mkdir(const char*, uint32_t mode);  // SYS_mkdirat 34, 创建文件夹
int sysfile_link(const char*, const char*);     // TODO SYS_linkat 37
int sysfile_unlink(const char*);                // TODO SYS_unlinkat 35
int sysfile_rename(const char*, const char*);
char* sysfile_getcwd(char*, size_t);                                          // SYS_getcwd 17
int sysfile_getDirEntry(int, dirent_t*);                                      // SYS_getdents64 61, 获取目录内容
int sysfile_dup(int);                                                         // SYS_dup 23, 复制文件描述符
int sysfile_dup2(int fd_old, int fd_new);                                     // SYS_dup3 24，指定新文件描述符，复制文件描述符
int sysfile_pipe(int*);                                                       // TODO SYS_pipe2 59, 创建管道
int sysfile_mkfifo(const char*, uint32_t);                                    // TODO
int sys_mount(const char*, const char*, const char*, uint32_t, const void*);  // TODO SYS_mount 40
int sys_unmount(const char*, uint32_t);                                       // TODO SYS_umount2 39

#endif