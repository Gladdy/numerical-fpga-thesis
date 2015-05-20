obj-m := blinker.o

KERNEL_SRC_DIR=/home/zhehao/programs/others/linux-socfpga
PWD=$(shell pwd)

all:
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -C $(KERNEL_SRC_DIR) \
		M=$(PWD) modules

clean:
	make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -C $(KERNEL_SRC_DIR) \
		M=$(PWD) clean
