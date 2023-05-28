#ifndef __PARAM_H
#define __PARAM_H
#define DEBUG
#define NPROC        50  // maximum number of processes
#define NCPU          5  // maximum number of CPUs
#define NOFILE      101  // open files per process
#define NFILE       101  // open files per system
#define NINODE       50  // maximum number of active i-nodes
#define NDEV         10  // maximum major device number
#define ROOTDEV       0  // device number of file system root disk
#define MAXARG       32  // max exec arguments
#define MAXOPBLOCKS  10  // max # of blocks any FS op writes
#define LOGSIZE      (MAXOPBLOCKS*3)  // max data blocks in on-disk log
#define NBUF         (MAXOPBLOCKS*3)  // size of disk block cache
#define FSSIZE       1000  // size of file system in blocks
#define MAXPATH      260   // maximum file path name
#define FSNUM          5
#define MMAPNUM        5
#define RAMDISK		0x90000000

#define CLK_FREQ 		12500000 
#define INTERVAL 	(CLK_FREQ / 20)
#endif
