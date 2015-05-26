CC=arm-linux-gnueabihf-gcc
CFLAGS=-Wall -O2

writevalue: writevalue.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@

clean:
	rm -f writevalue
