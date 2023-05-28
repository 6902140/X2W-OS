#ifndef __FAT32_H__
#define __FAT32_H__

#include "types.h"

#include "fs/deffs.h"

#define ATTR_READ_ONLY 0x01
#define ATTR_HIDDEN 0x02
#define ATTR_SYSTEM 0x04
#define ATTR_VOLUME_ID 0x08
#define ATTR_DIRECTORY 0x10
#define ATTR_ARCHIVE 0x20
#define ATTR_LONG_FILE_NAME 0x0F  // (ATTR_READ_ONLY|ATTR_HIDDEN|ATTR_SYSTEM|ATTR_VOLUME_ID)

#define LAST_LONG_ENTRY 0x40
#define FAT32_EOC 0x0ffffff8
#define EMPTY_ENTRY 0xe5
#define END_OF_ENTRY 0x00
#define LONG_NAME_LEN 13
#define SHORT_NAME_LEN 11

#define FAT32_MAX_FILENAME 255  // TODO
#define FAT32_MAX_PATH 255
#define ENTRY_CACHE_NUM 50

#define VOLUME_LABEL_LEN 11
#define SYSTEM_ID_LEN 8

struct __attribute__((packed, aligned(1))) bpb_t {
    byte_t jumpASM[3];           // EB 3C 90 - 跳过BPB和EBPB
    char system_id[8];           // OEM标识符
    uint16_t bytesPerSector;     //!每个扇区字节数, 512/1024/2048/4096
    uint8_t secPerCluster;       //!每簇扇区数, 1/2/4/8/16/32/128
    uint16_t reservedSectorNum;  //!保留扇区数, 包括引导扇区, 多为32
    uint8_t FATNum;              // FAT数, 2
    uint16_t rootNum;            //根目录项数, FAT32为0
    uint16_t smallSectorNum;     //小扇区数, FAT32为0
    byte_t mediaDescriptor;      //媒体描述符
    uint16_t secPerFAT;          //每个FAT扇区数, FAT32为0
    uint16_t secPerTrack;        //每道扇区数
    uint16_t numberOfHead;       //磁头数
    uint32_t hiddenSector;       //!隐藏扇区数, 引导扇区之前的扇区数
    uint32_t totSecs;            //! FAT32中的总扇区数
    /* following only used by FAT32*/
    uint32_t secPerFAT32;  //!每个FAT扇区数, 只被FAT32使用
    uint16_t exFlag;  // 0-3位: 活动FAT数(0开始)， 4-6位：保留，7：0-运行时FAT映射到所有FAT, 1-只有1个FAT活动，8-15位：保留
    uint16_t FATVersion;                 // FAT版本号，高字节主要版本，低字节次要版本
    uint32_t rootClusterNo;              //!根目录簇号，多为2
    uint16_t FSInfoSectorNo;             // !FAT32使用，File System Information Sector Number, 多为1
    uint16_t backUpSectorNo;             //备份引导扇区的扇区号，FAT32使用，多为6
    char reserved[12];                   //保留，0
    uint8_t physicalDriveNumber;         // 物理驱动器号
    uint8_t windowsNT;                   // WindowsNT中的标志
    byte_t exBootSignature;              // 0x28/0x29
    uint32_t volumeID;                   //分区序号
    char volumeLabel[VOLUME_LABEL_LEN];  //卷标，空格填充
    char SystemID[SYSTEM_ID_LEN];        //"FAT32"
    byte_t initCode[420];                // 420B 引导代码
    uint16_t signature;                  // 2B 可引导分区签名，0xAA55
};

struct __attribute__((packed, aligned(4))) FSInfo_t {
    uint32_t signature1;          // 0x41615252
    uint32_t reserved1[120];      // 480B 保留
    uint32_t signature2;          // 0x61417272
    uint32_t lastFreeCluster;     //最后一个空闲簇, 0xFFFFFFFF表示未知, 该值需要检查范围
    uint32_t startSearchCluster;  //开始查找可用簇号，0xFFFFFFFF时，从2开始查找，应检查范围
    uint32_t reserved[3];
    uint32_t signature3;  // 0xAA550000
};

struct __attribute__((packed, aligned(4))) fat32Dentry_t {
    char name[SHORT_NAME_LEN];
    byte_t attribute;
    byte_t reservedWindowsNT;
    uint8_t ctime_ms;     // 十分之一秒为单位
    uint16_t ctime;       //文件创建时间, 小时5位, 分钟6位, 秒5位(*2=实际秒数)
    uint16_t cdate;       //文件创建日期, 年7位, 月4位, 天5位
    uint16_t adate;       //上次访问日期
    uint16_t start_high;  //第一簇号高16位
    uint16_t mtime;       //上次修改时间
    uint16_t mdate;       //上次修改日期
    uint16_t start_low;   //第一簇号低16位
    uint32_t size;        //文件大小
};

struct __attribute__((packed, aligned(4))) fat32Dslot_t {
    uint8_t sequence;         //在长文件名条目序列中的顺序
    wchar_t f5Name[5];        //前5个两字节字符
    byte_t attribute;         //始终等于0x0F
    byte_t type;              // 0
    uint8_t checksum;         //校验和
    wchar_t m6Name[6];        //中间6个两字节字符
    uint16_t startClusterNo;  // 0
    wchar_t e2Name[2];        //最后2个两字节字符
};

union fat32Entry_t {
    fat32Dentry_t shortNameDir;
    fat32Dslot_t longNameDir;
};

typedef struct fat32Inode_t {  // TODO
} fat32Inode_t;

#define FAT32_N_ENTRY 785410

struct fat32FS_t {
    bpb_t bpb;
    uint32_t firstDataSec;
    uint32_t dataSecNum;
    uint32_t dataClusNum;
    uint32_t bytePerClus;
    uint32_t fatEntryPerSec;
    uint32_t fatTable[FAT32_N_ENTRY];
};

// typedef struct fat32FS_t {  // TODO
// } fat32FS_t;

void fat32_init(void);
int __fat32_read(dirent_t* dir, int user, void* dst, uint32_t off, size_t* len);
int __fat32_write(dirent_t* dir, int user, void* src, uint32_t off, size_t* len);
dirent_t* __fat32_getDirEntry(dirent_t* parent, char* name);
dirent_t* __fat32_dup(dirent_t* dentry);
int __fat32_trunc(dirent_t* dentry);
int __fat32_fsync(dirent_t* dentry);
int __fat32_remove(dirent_t* dentry);
int __fat32_fstat(dirent_t* dentry, stat_t* status);
int __fat32_readEntryName(char* buf, fat32Entry_t* fentry);
int __fat32_readEntryInfo(dirent_t* dentry, fat32Entry_t* fentry);
int __fat32_enExt(dirent_t* dentry, dirent_t* tentry, uint32_t off, int* count);
int __fat32_put(dirent_t* dentry);
dirent_t* __fat32_lookupDir(dirent_t* dentry, char* name, uint32_t* offPtr);
dirent_t* __fat32_lookupPath(char* path, bool parent, char* name);
int __fat32_create(dirent_t* dir, dirent_t* entry, uint32_t off);
dirent_t* __fat32_alloc(dirent_t* dentry, char* name, uint32_t attr);
dirent_t* __fat32_name(char* path);
dirent_t* __fat32_nameParent(char* path, char* name);

void dentry_lock(dirent_t* dentry);
void dentry_unlock(dirent_t* dentry);
char* formatName(char* name);

// dirent_t root;
#endif