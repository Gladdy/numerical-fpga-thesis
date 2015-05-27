#ifndef __FPGA_CONTROL__
#define __FPGA_CONTROL__

#define NUM_MD5_UNITS 32

#define MD5_INPUT_OFFSET 0x0
#define MD5_OUTPUT_OFFSET 0x800
#define MD5_CONTROL_OFFSET 0xa00

#define MD5_INPUT_SIZE 16
#define MD5_OUTPUT_SIZE 4

#include <stdint.h>

struct fpga_control {
	void *mem;
	volatile uint32_t *md5input;
	volatile uint32_t *md5output;
	volatile uint32_t *md5control;
	int fd;
};

int init_fpga_control(struct fpga_control *fpga);
void release_fpga_control(struct fpga_control *fpga);

void fpga_reset_unit(struct fpga_control *fpga, int unit);
void fpga_start_unit(struct fpga_control *fpga, int unit);
int fpga_unit_done(struct fpga_control *fpga, int unit);
void fpga_copy_input(struct fpga_control *fpga, uint32_t *input, int unit);
void fpga_copy_output(struct fpga_control *fpga, uint32_t *output, int unit);

#endif
