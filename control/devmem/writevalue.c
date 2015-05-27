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

#define LWH2F_BASE 		0xFF200000
#define LWH2F_SIZE 		4						//bytes (32 bit)
#define LWH2F_OFFSET 	0x0

#define H2F_BASE 			0xC0000000
#define H2F_SIZE 			16					//bytes (128 bit)
#define H2F_OFFSET 		0x0

#define F2H_BASE      0xFC000000
#define F2H_SIZE      16          //bytes (128 bit)
#define F2H_OFFSET    0x0


volatile unsigned char * blink_mem;
void *bridge_map;

typedef enum {
	LWH2F,
	H2F,
  F2H
} bridge;

int main(int argc, char *argv[])
{
	int fd, ret = EXIT_FAILURE;
	unsigned value;

	if (argc < 2) {
		fprintf(stderr, "Usage: %s [LWH2F, H2F, F2H] [number]\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	bridge bridgeSelection;

	if(strcmp(argv[1], "LWH2F") == 0) {
		bridgeSelection = LWH2F;
	} else if(strcmp(argv[1], "H2F") == 0) {
		bridgeSelection = H2F;
	} else if(strcmp(argv[1], "F2H") == 0) {
    bridgeSelection = F2H;
  } else {
		fprintf(stderr, "Invalid interface [LWH2F, H2F, F2H] : %s \n", argv[1]);
		exit(EXIT_FAILURE);
	}

	/* open the memory device file */
	fd = open("/dev/mem", O_RDWR|O_SYNC);
	if (fd < 0) {
		perror("open");
		exit(EXIT_FAILURE);
	}

	switch(bridgeSelection) {

		case LWH2F:
      value = atoi(argv[2]);
			//Map LW bridge into process memory
			bridge_map = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED, fd, LWH2F_BASE);
			if (bridge_map == MAP_FAILED) {
				perror("mmap");
				goto cleanup;
			}

			memcpy(bridge_map, (void*)&value, LWH2F_SIZE);
			break;

    case H2F:
      value = atoi(argv[2]);
			//Map H2F bridge into process memory
			bridge_map = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED, fd, H2F_BASE);
			if (bridge_map == MAP_FAILED) {
				perror("mmap");
				goto cleanup;
			}
      //only fill the first 4 bytes, zero the rest
			memcpy(bridge_map, (void*)&value, sizeof(value));
      memset(bridge_map + 4, 0, 12);
			break;

    case F2H:
      //Map F2H bridge into process memory
      bridge_map = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_SHARED, fd, F2H_BASE);
      if (bridge_map == MAP_FAILED) {
        perror("mmap");
        goto cleanup;
      }

      unsigned char* ptr = (unsigned char*)bridge_map;

      for(int i = 0; i<F2H_SIZE; i++) {
        printf("%x ", ptr[i]);
      }
      printf("\n");

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
