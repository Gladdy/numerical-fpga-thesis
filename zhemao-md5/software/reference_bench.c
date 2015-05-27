#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "fpga_control.h"
#include "md5.h"
#include "seq_gen.h"

#define REPORT_INTERVAL 5

const uint32_t k[64] = {
	0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee ,
	0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501 ,
	0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be ,
	0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821 ,
	0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa ,
	0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8 ,
	0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed ,
	0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a ,
	0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c ,
	0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70 ,
	0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05 ,
	0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665 ,
	0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039 ,
	0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1 ,
	0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1 ,
	0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391 };

const uint8_t s[64] = {
	7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22, 7, 12, 17, 22,
        5,  9, 14, 20, 5,  9, 14, 20, 5,  9, 14, 20, 5,  9, 14, 20,
        4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23, 4, 11, 16, 23,
        6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21, 6, 10, 15, 21};

void compute_md5(uint32_t *input, uint32_t *output)
{
	uint32_t a0 = 0x67452301;
	uint32_t b0 = 0xefcdab89;
	uint32_t c0 = 0x98badcfe;
	uint32_t d0 = 0x10325476;
	uint32_t registers[4] = {a0, b0, c0, d0};
	int i;

	for (i = 0; i < 64; i++)
		compute_onec(registers, i, k, input, s);

	output[0] = a0 + registers[0];
	output[1] = b0 + registers[1];
	output[2] = c0 + registers[2];
	output[3] = d0 + registers[3];
}

int main(void)
{
	int len;
	struct seq_gen seq_gen[1];
	uint8_t bytes[BUFSIZE];
	uint32_t digest[4];
	uint32_t *words = (uint32_t *) bytes;
	unsigned long hashes = 0;
	clock_t start, end, report_time;
	float hash_time, avg_hashes;

	init_seq_gen(seq_gen);

	start = clock();
	report_time = start + REPORT_INTERVAL * CLOCKS_PER_SEC;

	while ((len = next_sequence(seq_gen, bytes)) > 0) {
		padbuffer(bytes, len);
		compute_md5(words, digest);
		hashes++;

		end = clock();
		if (end > report_time) {
			hash_time = (end - start) / (float) CLOCKS_PER_SEC;
			avg_hashes = hashes / hash_time;
			printf("Hashing at %f per sec\n", avg_hashes);
			report_time += REPORT_INTERVAL * CLOCKS_PER_SEC;
		}
	}

	end = clock();
	hash_time = (end - start) / (float) CLOCKS_PER_SEC;
	avg_hashes = hashes / hash_time;

	printf("Time elapsed: %f s\n", hash_time);
	printf("Hashes computed: %lu\n", hashes);
	printf("Average hash rate: %f per sec\n", avg_hashes);

	return 0;
}
