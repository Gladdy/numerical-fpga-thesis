#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdint.h>

#define PAGE_SIZE 4096
#define LWHPS2FPGA_BRIDGE_BASE 0xff200000
#define BLINK_OFFSET 0x0

volatile unsigned char *blink_mem;
void *bridge_map;

int main(int argc, char *argv[])
{
	int fd, ret = EXIT_FAILURE;
	unsigned char value;
	off_t blink_base = LWHPS2FPGA_BRIDGE_BASE;

	if (argc < 2) {
		fprintf(stderr, "Usage: %s number\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	/* check the bounds of the value being set */
	value = atoi(argv[1]);
	if (value < 1 || value > 15) {
		fprintf(stderr, "Invalid delay setting."
				"Delay must be between 1 and 15, inclusive.\n");
		exit(EXIT_FAILURE);
	}

	/* open the memory device file */
	fd = open("/dev/mem", O_RDWR|O_SYNC);
	if (fd < 0) {
		perror("open");
		exit(EXIT_FAILURE);
	}

	/* map the LWHPS2FPGA bridge into process memory */
	bridge_map = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED,
				fd, blink_base);
	if (bridge_map == MAP_FAILED) {
		perror("mmap");
		goto cleanup;
	}

	/* get the delay_ctrl peripheral's base address */
	blink_mem = (unsigned char *) (bridge_map + BLINK_OFFSET);

	/* write the value */
	*blink_mem = value;

	if (munmap(bridge_map, PAGE_SIZE) < 0) {
		perror("munmap");
		goto cleanup;
	}

	ret = 0;

cleanup:
	close(fd);
	return ret;
}
