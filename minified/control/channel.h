#ifndef _CHANNEL_
#define _CHANNEL_

#include "fixedpointconverter.h"

#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>

class Channel {
public:
  Channel() {}
  Channel(unsigned * _base, unsigned _length);

  void write(unsigned, uint32_t);
  void writeFP(unsigned ,double);

  unsigned get(unsigned);
  double getFP(unsigned);

private:
  unsigned length;
  volatile uint32_t* base;
  FixedPointConverter fp;
};

#endif
