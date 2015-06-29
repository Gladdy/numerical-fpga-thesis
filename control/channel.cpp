#include "channel.h"

#include <cstdio>

Channel::Channel(unsigned * _base, unsigned _length) {
    base = _base;
    length = _length;
    fp = FixedPointConverter(8,24);
}

void Channel::write(unsigned addr, uint32_t value) {
  if(addr > length) {
    printf("Invalid address\n");
    return;
  }

  base[addr] = value;
}
void Channel::writeFP(unsigned addr, double value) {
  if(addr > length) {
    printf("Invalid address\n");
    return;
  }

  base[addr] = fp.to_FP(value);
}


unsigned Channel::get(unsigned addr) {
  if(addr > length) {
    printf("Invalid address!\n");
    return 0;
  }

  return base[addr];
}
double Channel::getFP(unsigned addr) {
  if(addr > length) {
    printf("Invalid address!\n");
    return 0;
  }

  return fp.from_FP(base[addr]);
}


