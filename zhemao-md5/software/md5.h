#ifndef __MD5_H__
#define __MD5_H__

#define BUFSIZE 64
#define NUMWORDS (BUFSIZE / 4)

#include <stdint.h>

void padbuffer(uint8_t *bytes, int len);
void compute_onec(uint32_t *registers, uint8_t i,
		  const uint32_t *k, uint32_t *m, const uint8_t *s);

#endif
