#include "md5.h"
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	uint8_t bytes[BUFSIZE];
	uint32_t *words = (uint32_t *) bytes;
	int i, len;

	if (argc < 2) {
		printf("Usage: %s regname\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	len = fread(bytes, 1, BUFSIZE - 5, stdin);
	if (len < 0) {
		perror("fread");
		exit(EXIT_FAILURE);
	}

	padbuffer(bytes, len);

	for (i = 0; i < NUMWORDS; i++)
		printf("%s[%d] = 32'h%08x;\n", argv[1], i, words[i]);

	return 0;
}
