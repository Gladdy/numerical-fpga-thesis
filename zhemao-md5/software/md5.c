#include "md5.h"
#include <stdlib.h>
#include <string.h>

static inline int left_rotate(uint32_t x, uint8_t c)
{
	return (x << c) | (x >> (32 - c));
}

static inline int is_little_endian(void)
{
	uint32_t testint = 1;
	uint8_t *testptr = (uint8_t *) &testint;

	if (*testptr == 1)
		return 1;
	return 0;
}

static void reverse_if_needed(uint8_t *bytes, int count)
{
	uint8_t temp;
	int i;

	if (count % 4 != 0)
		// increase count to next multiple of 4
		count += 4 - (count % 4);

	if (!is_little_endian()) {
		for (i = 0; i < count; i += 4) {
			// swap 0 and 3
			temp = bytes[i];
			bytes[i] = bytes[i + 3];
			bytes[i + 3] = temp;
			// swap 1 and 2
			temp = bytes[i + 1];
			bytes[i + 1] = bytes[i + 2];
			bytes[i + 2] = temp;
		}
	}
}

void padbuffer(uint8_t *bytes, int len)
{
	uint32_t *words = (uint32_t *) bytes;

	if (len + 5 >= BUFSIZE)
		abort();

	bytes[len] = 0x80;

	reverse_if_needed(bytes, len + 1);

	memset(bytes + len + 1, 0, BUFSIZE - len - 3);

	words[NUMWORDS - 2] = len << 3;
	words[NUMWORDS - 1] = len >> 29;
}

void compute_onec(uint32_t *registers, uint8_t i,
		  const uint32_t *k, uint32_t *m, const uint8_t *s)
{
	uint32_t a = registers[0];
	uint32_t b = registers[1];
	uint32_t c = registers[2];
	uint32_t d = registers[3];
	uint32_t f, sum;
	uint8_t g;

	if (i < 0 || i > 63)
		abort();

	if (i < 16) {
		f = (b & c) | (~b & d);
		g = i & 0x0f;
	} else if (i < 32) {
		f = (d & b) | (~d & c);
		g = (5 * i + 1) & 0x0f;
	} else if (i < 48) {
		f = b ^ c ^ d;
		g = (3 * i + 5) & 0x0f;
	} else {
		f = c ^ (b | ~d);
		g = (7 * i) & 0x0f;
	}

	sum = a + f + k[i] + m[g];

	registers[0] = d;
	registers[1] = b + left_rotate(sum, s[i]);
	registers[2] = b;
	registers[3] = c;
	registers[4] = sum;
}
