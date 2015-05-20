KERNEL_SRC_DIR=/home/zhehao/programs/others/linux-socfpga
PWD=$(shell pwd)

all: blinker_us blinker

blinker:
	make -C blinker

blinker_us:
	make -C blinker_us

clean:
	make -C blinker clean
	make -C blinker_us clean

install: all
	cp hps_scripts/program_fpga.sh /mnt/root
	cp blinker_us/blinker /mnt/root
	cp blinker/blinker.ko /mnt/root

.PHONY: blinker blinker_us clean install
