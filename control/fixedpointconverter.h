#ifndef _FIXEDPOINTCONVERTER_
#define _FIXEDPOINTCONVERTER_

#include <stdint.h>

class FixedPointConverter {
public:
  FixedPointConverter() {}
  FixedPointConverter(unsigned, unsigned);

  uint32_t to_FP(double value);
  double from_FP(uint32_t);

private:
  unsigned intBits;
  unsigned fracBits;
  double bound;
};

#endif
