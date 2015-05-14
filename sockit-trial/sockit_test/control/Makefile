CC=arm-linux-gnueabihf-gcc
CFLAGS=-Wall -O2

blinker: blinker.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@

clean:
	rm -f blinker
