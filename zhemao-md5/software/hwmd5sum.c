#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "fpga_control.h"
#include "md5.h"
#include "seq_gen.h"

#define REPORT_INTERVAL 5

void print_digest(uint32_t *digest)
{
	int i, j;
	uint8_t byte;

	for (i = 0; i < 4; i++) {
		for (j = 0; j < 4; j++) {
			byte = (digest[i] >> (8 * j)) & 0xff;
			printf("%02x", byte);
		}
	}
	printf("\n");
}

static inline void wait_for_done(struct fpga_control *fpga, int unit)
{
	while (!fpga_unit_done(fpga, unit));
}

int main(void)
{
	int unit = 0, len, status = 0;
	struct fpga_control fpga[1];
	struct seq_gen seq_gen[1];
	uint8_t bytes[BUFSIZE];
	uint32_t digest[4];
	uint32_t *words = (uint32_t *) bytes;
	int first_pass = 1, i;
	unsigned long hashes = 0;
	clock_t start, end, report_time;
	float hash_time, avg_hashes;

	printf("initializing fpga control\n");
	if (init_fpga_control(fpga)) {
		fprintf(stderr, "Could not initialize fpga controller\n");
		exit(EXIT_FAILURE);
	}

	init_seq_gen(seq_gen);

	start = clock();
	report_time = start + REPORT_INTERVAL * CLOCKS_PER_SEC;

	while ((len = next_sequence(seq_gen, bytes)) > 0) {
		padbuffer(bytes, len);

		wait_for_done(fpga, unit);
		if (!first_pass) {
			fpga_copy_output(fpga, digest, unit);
			hashes++;
		}

		fpga_reset_unit(fpga, unit);
		fpga_copy_input(fpga, words, unit);
		fpga_start_unit(fpga, unit);

		unit++;

		if (unit == NUM_MD5_UNITS) {
			unit = 0;
			first_pass = 0;
		}

		end = clock();
		if (end > report_time) {
			hash_time = (end - start) / (float) CLOCKS_PER_SEC;
			avg_hashes = hashes / hash_time;
			printf("Hashing at %f per sec\n", avg_hashes);
			report_time += REPORT_INTERVAL * CLOCKS_PER_SEC;
		}
	}

	for (i = 0; i < NUM_MD5_UNITS; i++) {
		wait_for_done(fpga, (unit + i) % NUM_MD5_UNITS);
		fpga_copy_output(fpga, digest, (unit + i) % NUM_MD5_UNITS);
		hashes++;
	}

	end = clock();

	hash_time = (end - start) / (float) CLOCKS_PER_SEC;
	avg_hashes = hashes / hash_time;

	printf("Time elapsed: %f s\n", hash_time);
	printf("Hashes computed: %lu\n", hashes);
	printf("Average hash rate: %f per sec\n", avg_hashes);

	release_fpga_control(fpga);
	return status;
}
