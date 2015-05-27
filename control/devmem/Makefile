CC=arm-linux-gnueabihf-gcc
CC_native=gcc
CFLAGS=-Wall -O2 -std=c99


all: writevalue native gpio-dev

writevalue: writevalue.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@

native: writevalue.c
	$(CC_native) $(CFLAGS) $(LDFLAGS) $< -o $@

gpio-dev: gpio-dev-mem-test.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@

clean:
	rm -f writevalue native gpio-dev
