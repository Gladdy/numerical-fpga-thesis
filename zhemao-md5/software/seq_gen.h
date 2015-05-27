#ifndef __SEQ_GEN_H__
#define __SEQ_GEN_H__

#define NUM_VALID_CHARS 62
#define LARGEST_SEQUENCE 58

#include <stdint.h>

struct seq_gen {
	int length;
	uint8_t valid_chars[NUM_VALID_CHARS];
	uint8_t sequence[LARGEST_SEQUENCE];
};

void init_seq_gen(struct seq_gen *seq_gen);
int next_sequence(struct seq_gen *seq_gen, uint8_t *seq);

#endif
