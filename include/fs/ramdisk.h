#ifndef __RAM_DISK_H__
#define __RAM_DISK_H__
#include "ide.h"

void ramdisk_init(uint32_t devno, ide_device_t* dev);

#endif