# Experimenting with the Arrow SoCKit

I recently acquired one of the new [Arrow SoCKits](http://www.arrownac.com/solutions/sockit/),
which are development boards for Altera's Cyclone V ARM processor / FPGA SoCs.
This repository contains a simple example of an FPGA hardware description
that flashes the LEDs back and forth, as well as a C program that controls
the speed of the flashing. A detailed explanation of the implementation and
use of this system can be found in parts I-IV of my
[Cyclone V Tutorial](http://zhehaomao.com/project/2014/01/02/fpga-series.html).

## Compilation Instructions

Open the project file "sockit\_test.qpf" in Quartus II. Then open the
"soc\_system.qsys" file in Qsys. Generate the Qsys system and then compile the
project in Quartus. You can then program the "sockit\_test.sof" file to the
Cyclone V FPGA.

## FPGA Interface

With the .sof file programmed, the lights will begin to sweep back and forth.
You can control the speed using the FPGA keys. KEY0 will reduce the speed,
KEY1 will increase the speed, KEY2 will pause/resume, and KEY3 will reset.

## Software Instructions

Make sure you have the Linaro "arm-linux-gnueabihf" toolchain installed and
run "make" inside the "software/blinker\_us" directory. Copy the "blinker"
binary over to the Linux partition on your SD card. Boot from the SD card,
program the .sof file to the FPGA, and then enable the lightweight HPS-to-FPGA
bridge

    echo 1 > /sys/class/fpga-bridge/lwhps2fpga/enable

Now you can set the speed of the blinking by running

    ./blinker delay

The delays range from 1 to 15, inclusive, with 1 corresponding to the fastest
speed and 15 to the slowest.
