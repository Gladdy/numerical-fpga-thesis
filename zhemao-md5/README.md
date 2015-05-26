This is an FPGA MD5 cracker for the Cyclone V SoC. You can find a detailed
dicussion of its use and implementation in parts V-VII of my
[Cyclone V Tutorial](http://zhehaomao.com/project/2014/01/02/fpga-series.html).

## Compiling the FPGA Programming File

1. Open the "soc\_system.qsys" file in Qsys and generate the system
2. Run the "fix\_generated\_system.sh" script to patch the generated top-level
   Verilog file. (Sorry, there's some weird but in Qsys)
3. Run compilation in Quartus

## Compiling and Running the Benchmark Program

To compile the benchmark program, go into the "software" directory and run

    make CROSS_COMPILE=arm-linux-gnueabihf- hwmd5sum

Copy the executable to your SD card. On the HPS, program the FPGA, enable the
lightweight HPS-to-FPGA bridge, and run the hwmd5sum program.

## Compiling and Running the Reference Program

Also included in the software/ directory are executables `reference` and `reference_bench`.
The former is a reference software implementation of the md5 algorithm that takes its
input from stdin. You can use it to compute the md5 sum of a file like so

    ./reference < filename
    
The `reference_bench` program implements a benchmark similar to hwmd5sum, but with
the md5 algorithm implemented in software.
