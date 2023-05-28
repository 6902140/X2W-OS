#include "xv6-user/user.h"
static char mntpoint[64] = "./mnt";
static char device[64] = "/dev/vda2";
static const char *fs_type = "vfat";

void test_mount() {

	//printf("Mounting dev:%s to %s\n", device, mntpoint);
	int ret = mount(device, mntpoint, fs_type, 0, NULL);
	//printf("mount return: %d\n", ret);

	if (ret == 0) {
		//printf("mount successfully\n");
		ret = umount2(mntpoint);
		//printf("umount return: %d\n", ret);
	}

}

int main(int argc,char *argv[]) {
	test_mount();
	exit(0);
	return 0;
}
