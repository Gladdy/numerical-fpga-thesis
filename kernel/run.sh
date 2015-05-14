#!/bin/bash
shopt -s expand_aliases

# Set up variables
export PATH=$PATH:/home/martijn/Software/kernel/linaro/bin
alias armmake='make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm'

# Erase and recreate the partitions
sudo fdisk /dev/mmcblk0 < fdisk-erase.txt
sudo fdisk /dev/mmcblk0 < fdisk-create.txt

# Installing the bootloader
sudo dd if=bootloader.img of=/dev/mmcblk0p3 bs=512
sudo sync

# Installing the kernel
cd /home/martijn/Software/kernel/linux-socfpga/
armmake socfpga_defconfig
armmake -j8 uImage LOADADDR=0x8000
armmake dtbs
sudo mkfs.vfat /dev/mmcblk0p1
sudo mount /dev/mmcblk0p1 /mnt
sudo cp arch/arm/boot/uImage /mnt
sudo cp arch/arm/boot/dts/socfpga_cyclone5.dtb /mnt/socfpga.dtb
sudo umount /mnt

# Installing the root filesystem
cd /home/martijn/Software/kernel/buildroot/
make
sudo mkfs.ext2 /dev/mmcblk0p2
sudo mount /dev/mmcblk0p2 /mnt
sudo tar xf output/images/rootfs.tar -C /mnt

# Fix issues with libc.so
sudo ln -s /lib /mnt/lib/arm-linux-gnueabihf
sudo ln -s /usr/lib /mnt/usr/lib/arm-linux-gnueabihf

# Kernel modules
cd /home/martijn/Software/kernel/linux-socfpga/
armmake -j8 modules
sudo make ARCH=arm INSTALL_MOD_PATH=/mnt modules_install
sudo umount /mnt
