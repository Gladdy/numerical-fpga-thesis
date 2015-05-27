CFLAGS=-Wall -O2
CC=$(CROSS_COMPILE)gcc

hwmd5sum: hwmd5sum.c fpga_control.o md5.o seq_gen.o

tools: padandprint reference

padandprint: padandprint.c md5.o

reference: reference.c md5.o

reference_bench: reference_bench.c md5.o seq_gen.o

%.o: %.c
	$(CC) -c $(CFLAGS) $<

clean:
	rm -f padandprint reference hwmd5sum *.o
