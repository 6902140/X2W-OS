K=kernel
U=user
T=target
OPENSBI=fw_jump.elf

ifndef platform
#platform := qemu
platform := sifive_u
endif

ifndef init
#init := cmd-user
#init := cmd-sd
init := runall
#init := hello
endif

ifndef fat
fat := RAM
#fat := SD
endif

ifeq ($(init),cmd-user)
link := link_fs.o
initcode := _cmd
endif
ifeq ($(init),cmd-sd)
link := link_disk.o
initcode := _cmd
endif
ifeq ($(init),runall)
link := link_disk.o
initcode := _runall
endif
ifeq ($(init),hello)
link := link_null.o
initcode := _hello
endif

ifeq ($(init),runall)
is := $U/runall.S
ic := initcode.S
else
is := $U/cmd.S
ic := initcode.c
endif

OBJS += \
  $K/entry.o \
  $K/printf.o

ifeq ($(platform),qemu)
fat = RAM
board = QEMU
endif

ifeq ($(platform),sifive_u)
board = SIFIVE_U
link = link_null.o
initcode := _runall
endif

ifeq ($(fat),RAM)
OBJS += \
  $K/$(link) \
  $K/ramdisk.o
endif

ifeq ($(fat),SD)
OBJS += \
  $K/spi.o \
  $K/sd.o \
  $K/diskio.o
endif

OBJS += \
  $K/kalloc.o \
  $K/intr.o \
  $K/spinlock.o \
  $K/string.o \
  $K/main.o \
  $K/vm.o \
  $K/initcode.o \
  $K/proc.o \
  $K/dev.o \
  $K/swtch.o \
  $K/trampoline.o \
  $K/trap.o \
  $K/syscall.o \
  $K/sysproc.o \
  $K/bio.o \
  $K/sleeplock.o \
  $K/file.o \
  $K/pipe.o \
  $K/exec.o \
  $K/sysfile.o \
  $K/kernelvec.o \
  $K/timer.o \
  $K/image.o \
  $K/disk.o \
  $K/fat32.o \
  $K/plic.o \
  $K/console.o\
  $K/systime.o\
  $K/uname.o\
  $K/mmap.o




#  $K/spi.o \
#  $K/gpiohs.o \
#  $K/fpioa.o \
#  $K/utils.o \
#  $K/sdcard.o \
#  $K/dmac.o \
#  $K/sysctl.o \elf- or riscv64-linux-gnu-

# riscv64-unknown-

# perhaps in /opt/riscv/bin
#TOOLPREFIX = 

# Try to infer the correct TOOLPREFIX if not set
ifndef TOOLPREFIX
TOOLPREFIX := $(shell if riscv64-unknown-elf-objdump -i 2>&1 | grep 'elf64-big' >/dev/null 2>&1; \
	then echo 'riscv64-unknown-elf-'; \
	elif riscv64-linux-gnu-objdump -i 2>&1 | grep 'elf64-big' >/dev/null 2>&1; \
	then echo 'riscv64-linux-gnu-'; \
	elif riscv64-unknown-linux-gnu-objdump -i 2>&1 | grep 'elf64-big' >/dev/null 2>&1; \
	then echo 'riscv64-unknown-linux-gnu-'; \
	else echo "***" 1>&2; \
	echo "*** Error: Couldn't find a riscv64 version of GCC/binutils." 1>&2; \
	echo "*** To turn off this error, run 'gmake TOOLPREFIX= ...'." 1>&2; \
	echo "***" 1>&2; exit 1; fi)
endif

QEMU = qemu-system-riscv64

CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump

CFLAGS = -Wall -Werror -O -fno-omit-frame-pointer -ggdb -D$(board) -D$(initcode) -D$(fat)
CFLAGS += -MD
CFLAGS += -mcmodel=medany
CFLAGS += -ffreestanding -fno-common -nostdlib -mno-relax
CFLAGS += -I.
CFLAGS += $(shell $(CC) -fno-stack-protector -E -x c /dev/null >/dev/null 2>&1 && echo -fno-stack-protector)

# Disable PIE when possible (for Ubuntu 16.10 toolchain)
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]no-pie'),)
CFLAGS += -fno-pie -no-pie
endif
ifneq ($(shell $(CC) -dumpspecs 2>/dev/null | grep -e '[^f]nopie'),)
CFLAGS += -fno-pie -nopie
endif

LDFLAGS = -z max-page-size=4096
	
# $K/link_app.o:fs.img

$K/kernel: $(OBJS) $K/kernel_app.ld $U/initcode 
	@$(LD) $(LDFLAGS) -T $K/kernel_app.ld -o $K/kernel $(OBJS)
	@$(OBJDUMP) -S $K/kernel > $K/kernel.asm
	@$(OBJDUMP) -t $K/kernel | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $K/kernel.sym
	
$K/initcode.%:$U/initcode
	cp initcode/$(ic) $K/$(ic)
	$(CC) $(CFLAGS) -c -o $K/initcode.o $K/$(ic)	
	
$U/initcode.S:
	cp $(is) $U/initcode.S
	
$U/initcode: $U/initcode.S
	$(CC) $(CFLAGS) -march=rv64g -nostdinc -I. -Ikernel -c $U/initcode.S -o $U/initcode.o
	$(LD) $(LDFLAGS) -N -e start -Ttext 0 -o $U/initcode.out $U/initcode.o
	$(OBJCOPY) -S -O binary $U/initcode.out $U/initcode
	rm -f $U/initcode.o $U/initcode.out $U/initcode.d
	
sdelf:
	@$(OBJDUMP) -S sd/yield > sd/yield.asm

tags: $(OBJS) _init
	etags *.S *.c

ULIB = $U/ulib.o $U/usys.o $U/printf.o $U/umalloc.o

_%: %.o $(ULIB)
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $@ $^
	$(OBJDUMP) -S $@ > $*.asm
	$(OBJDUMP) -t $@ | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > $*.sym

$U/usys.S : $U/usys.pl
	perl $U/usys.pl > $U/usys.S

$U/usys.o : $U/usys.S
	$(CC) $(CFLAGS) -c -o $U/usys.o $U/usys.S

$U/_forktest: $U/forktest.o $(ULIB)
	# forktest has less library code linked in - needs to be small
	# in order to be able to max out the proc table.
	$(LD) $(LDFLAGS) -N -e main -Ttext 0 -o $U/_forktest $U/forktest.o $U/ulib.o $U/usys.o
	$(OBJDUMP) -S $U/_forktest > $U/forktest.asm



# Prevent deletion of intermediate files, e.g. cat.o, after first build, so
# that disk image changes after first build are persistent until clean.  More
# details:
# http://www.gnu.org/software/make/manual/html_node/Chained-Rules.html
.PRECIOUS: %.o

UPROGS=\
	$U/_init\
	$U/_sh\
	$U/_cat\
	$U/_echo\
	$U/_grep\
	$U/_ls\
	$U/_kill\
	$U/_mkdir\
	$U/_xargs\
	$U/_sleep\
	$U/_find\
	$U/_rm\
	$U/_wc\
	$U/_test\
	$U/_usertests\
	$U/_strace\
	$U/_mv\
	$U/_mymount \
	$U/_myumount \
	$U/_sacrifice

dst=/mnt


fs.img: $(UPROGS)
	@if [ ! -f "fs.img" ]; then \
		echo "making fs image..."; \
		dd if=/dev/zero of=fs.img bs=512k count=4; \
		mkfs.vfat -F 32 fs.img; fi
	@sudo mount fs.img $(dst)
	@if [ ! -d "$(dst)/bin" ]; then sudo mkdir $(dst)/bin; fi
	@sudo cp README $(dst)/README
	@for file in $$( ls $U/_* ); do \
		sudo cp $$file $(dst)/$${file#$U/_};\
		sudo cp $$file $(dst)/bin/$${file#$U/_}; done
	@sudo umount $(dst)
	
disk.img:
	@if [ ! -f "disk.img" ]; then \
		echo "making disk image..."; \
		dd if=/dev/zero of=disk.img bs=512k count=8; \
		mkfs.vfat -F 32 disk.img; fi
	@sudo mount disk.img $(dst)
	@sudo cp -r sd/* $(dst)
	@sudo umount $(dst)
	
vda: $U/_vda2
	@if [ ! -f "vda" ]; then \
		echo "making vda..."; \
		dd if=/dev/zero of=vda2 bs=512k count=1; \
		mkfs.vfat -F 32 vda2; fi
	@sudo mount vda2 $(dst)
	@sudo cp $U/_vda2 $(dst)/test
	@sudo umount $(dst)

-include kernel/*.d user/*.d

clean: 
	rm -f *.tex *.dvi *.idx *.aux *.log *.ind *.ilg \
	*/*.o */*.d */*.asm */*.sym \
	$U/initcode $U/initcode.out $K/kernel $U/initcode.S $K/initcode.c  $K/initcode.S $U/initcode.hex \
	mkfs/mkfs .gdbinit os.bin \
	$U/usys.S \
	$(UPROGS) $(TPROGS) $U/_vda2

# try to generate a unique GDB port
GDBPORT = $(shell expr `id -u` % 5000 + 25000)
# QEMU's gdb stub command line changed in 0.11
QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
	then echo "-gdb tcp::$(GDBPORT)"; \
	else echo "-s -p $(GDBPORT)"; fi)
ifndef CPUS
CPUS := 5
endif


ifndef M
M = sifive_u
endif


QEMUOPTS = -machine $(M) -bios $(OPENSBI) -kernel $K/kernel -smp $(CPUS) -nographic

ifeq ($(M), virt)
QEMUOPTS += -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0
endif

ifeq ($(platform), sifive_u)
#QEMUOPTS += -drive file=fs.img,if=sd,format=raw,id=x0 
#QEMUOPTS += -device sd-card,id=x0,bus=sd-bus.0
endif


qemu: $K/kernel
	$(QEMU) $(QEMUOPTS)

.gdbinit: .gdbinit.tmpl-riscv
	sed "s/:1234/:$(GDBPORT)/" < $^ > $@

qemu-gdb: $K/kernel .gdbinit fs.img
	@echo "*** Now run 'gdb' in another window." 1>&2
	$(QEMU) $(QEMUOPTS) -S $(QEMUGDB)
	
all:$K/kernel
	riscv64-unknown-elf-objcopy -O binary -S $K/kernel os.bin

add:
	git remote add origin https://gitlab.eduxiji.net/Cty/test-xv6.git

push:
	git add .
	git commit -m  "fatInMemory_plus"
	git push origin sacrifice


