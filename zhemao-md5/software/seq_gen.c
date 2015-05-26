#include "seq_gen.h"

void init_seq_gen(struct seq_gen *seq_gen)
{
	int i;

	seq_gen->length = 0;

	// 0-25 lowercase latin characters
	// 26-51 uppercase latin characters
	for (i = 0; i < 26; i++) {
		seq_gen->valid_chars[i] = 'a' + i;
		seq_gen->valid_chars[i + 26] = 'A' + i;
	}

	// 52-61 Arabic numerals
	for (i = 0; i < 10; i++)
		seq_gen->valid_chars[i + 52] = '0' + i;
}

static inline void copy_sequence(struct seq_gen *seq_gen, uint8_t *seq)
{
	int i;
	for (i = 0; i < seq_gen->length; i++)
		seq[i] = seq_gen->valid_chars[seq_gen->sequence[i]];
}

int next_sequence(struct seq_gen *seq_gen, uint8_t *seq)
{
	int i;
	char last_char = NUM_VALID_CHARS - 1;
	int updated = 0;

	for (i = 0; i < seq_gen->length; i++) {
		// sequence[i] is not the maximum int
		// increment it and break out of this loop
		if (seq_gen->sequence[i] != last_char) {
			seq_gen->sequence[i]++;
			updated = 1;
			break;
		}
		// otherwise, wrap back around to 0
		seq_gen->sequence[i] = 0;
	}

	// if everything was at the maximum valid int,
	// we need to extend the length
	if (!updated) {
		// if we can generate no more strings, return 0
		if (seq_gen->length == LARGEST_SEQUENCE)
			return 0;
		seq_gen->sequence[seq_gen->length] = 0;
		seq_gen->length++;
	}

	// copy the characters to the pointer given
	copy_sequence(seq_gen, seq);
	return seq_gen->length;
}
