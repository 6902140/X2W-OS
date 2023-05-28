#ifndef __DISK_H__
#define __DISK_H__

#include "types.h"

#define BSIZE 512

void disk_init(void);
void disk_read(uint8_t* buf, uint32_t secNo);
void disk_write(uint8_t* buf, uint32_t secNo);
void disk_intr(void);

#endif