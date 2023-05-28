#ifndef __VFS_H__
#define __VFS_H__

#include "deffs.h"
#include "fat32.h"
#include "fs.h"
#include "stddef.h"
#include "types.h"

struct iobuf_t;

struct fs_t {
    union {
        fat32FS_t __fat32_info;
    } fs_info;  // file system specific data
    enum {
        fs_type_fat32_info
    } fs_type;                        // file system type
    int (*fs_sync)(fs_t* fs);     // flush all dirty buffers to disk
    inode_t* (*fs_getRoot)(fs_t* fs);  // return root inode of file system
    int (*fs_unmount)(fs_t* fs);  // attempt unmount of file system
    void (*fs_cleanup)(fs_t* fs);      // clean up of file system
};

#define __fs_type(type) fs_type_##type##_info

#define check_fs_type(fs, type) ((fs)->fs_type == __fs_type(type))

#define __fsop_info(_fs, type) ({                      \
    struct fs_t* __fs = (_fs);                         \
    assert(__fs != NULL && check_fs_type(__fs, type)); \
    &(__fs->fs_info.__##type##_info);                  \
})

#define info2fs(info, type) \
    to_struct((info), struct fs_t, fs_info.__##type##_info)  // TODO

fs_t* __alloc_fs(uint32_t type);

#define alloc_fs(type) __alloc_fs(__fs_type(type))

#define fsop_sync(fs) ((fs)->fs_sync(fs))
#define fsop_getRoot(fs) ((fs)->fs_getRoot(fs))
#define fsop_unmount(fs) ((fs)->fs_unmount(fs))
#define fsop_cleanup(fs) ((fs)->fs_cleanup(fs))

/**
 * Virtual File System layer functions
 */
void vfs_init(void);
void vfs_cleanup(void);
void vfs_deviceListInit(void);

// low-level
int vfs_setCurrentDir(inode_t* dir);
int vfs_getCurrentDir(inode_t** dir_store);
int vfs_getRoot(const char* devName, inode_t** root_store);
const char* vfs_getDeviceName(struct fs_t* fs);

// mid-level
int vfs_lookup(char* path, inode_t** node_store);
int vfs_lookupParent(char* path, inode_t** node_store, char** endp);

// high-level
int vfs_open(char* path, uint32_t openFlags, inode_t** node_store);
int vfs_close(inode_t* node);
int vfs_link(char* oldPath, char* newPath);
int vfs_unlink(char* path);
int vfs_symlink(char* oldPath, char* newPath);
int vfs_readlink(char* path, struct iobuf_t* iob);
int vfs_makedir(char* path);
int vfs_rename(char* oldPath, char* newPath);
int vfs_chdir(char* path);
int vfs_getcwd(struct iobuf_t* iob);

//?
int vfs_setBootFS(char* fsName);
int vsf_getBootFS(inode_t** node_store);

int vfs_addFS(const char* deviceName, struct fs_t* fs);
int vfs_addDevice(const char* deviceName, inode_t* deviceNode, bool mountable);

int vfs_mount(const char* deviceName, int (*mountFunc)(struct device_t* dev, struct fs_t** fs_store));
int vfs_unmount(const char* deviceName);
int vfs_unmountAll(void);

#endif  //__VFS_H__