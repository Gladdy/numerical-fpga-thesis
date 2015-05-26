#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdint.h>

#define PAGE_SIZE 		4096
#define LWH2F_BASE 		0xff200000
#define LWH2F_SIZE 		4						//bytes (32 bit)
#define LWH2F_OFFSET 	0x0

#define H2F_BASE 			0xC0000000
#define H2F_SIZE 			16					//bytes (128 bit)
#define H2F_OFFSET 		0x0

volatile unsigned char * blink_mem;
void *bridge_map;

typedef enum {
	LWH2F,
	H2F
} bridge;

int main(int argc, char *argv[])
{
	int fd, ret = EXIT_FAILURE;
	unsigned value;

	if (argc < 3) {
		fprintf(stderr, "Usage: %s [LWH2F, H2F] number\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	bridge b;

	if(strcmp(argv[1], "LWH2F") == 0) {
		b = LWH2F;
	} else if(strcmp(argv[1], "H2F") == 0) {
		b = H2F;
	} else {
		fprintf(stderr, "Invalid interface [LWH2F, H2F] : %s \n", argv[1]);
		exit(EXIT_FAILURE);
	}

	/* check the bounds of the value being set */
	value = atoi(argv[2]);


	/* open the memory device file */
	fd = open("/dev/mem", O_RDWR|O_SYNC);
	if (fd < 0) {
		perror("open");
		exit(EXIT_FAILURE);
	}

	switch(b) {

		case LWH2F:
			//Map LW bridge into memory
			bridge_map = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED, fd, LWH2F_BASE);
			if (bridge_map == MAP_FAILED) {
				perror("mmap");
				goto cleanup;
			}

			memcpy(bridge_map, (void*)&value, LWH2F_SIZE);

			break;
		case H2F:
			//Map main bridge into memory
			bridge_map = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED, fd, H2F_BASE);
			if (bridge_map == MAP_FAILED) {
				perror("mmap");
				goto cleanup;
			}

			memcpy(bridge_map, (void*)&value, sizeof(value));
			memcpy(bridge_map + 4, (void*)&value, sizeof(value));
			memcpy(bridge_map + 8, (void*)&value, sizeof(value));
			memcpy(bridge_map + 12, (void*)&value, sizeof(value));

			break;
	}

	//Release the memory
	if (munmap(bridge_map, PAGE_SIZE) < 0) {
		perror("munmap");
		goto cleanup;
	}

	ret = 0;

cleanup:
	close(fd);
	return ret;
}
