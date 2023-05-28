#ifndef __SDCARD_H__
#define __SDCARD_H__

#include "types.h"

#ifndef QEMU

void sdcard_init(void);
void sdcard_read_sector(uint8_t *buf, int sectorno);
void sdcard_write_sector(uint8_t *buf, int sectorno);

#endif//QEMU

#endif
