#ifndef __IOBUF_H__
#define __IOBUF_H__

#include "deffs.h"

struct iobuf_t {
    void* io_base;       // base address of buffer
    offset_t io_off;  // current read/write position in buffer
    size_t io_len;       // length of buffer
    size_t io_resid;     // current resident length need to read write
};

#define iobuf_used(iobuf) ((size_t)((iobuf)->io_len - (iobuf)->io_resid))

iobuf_t* iobuf_init(iobuf_t* iob, void* base, size_t len, offset_t offset);
int iobuf_move(iobuf_t* iob, void* data, size_t len, bool m2b, size_t* copiedp);
int iobuf_moveZeros(iobuf_t* iob, size_t len, size_t* copiedp);
void iobuf_skip(iobuf_t* iob, size_t n);

#endif