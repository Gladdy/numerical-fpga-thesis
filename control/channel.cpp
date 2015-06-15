#include "channel.h"

#include <cstdio>

Channel::Channel(unsigned * _base, unsigned _length) {
    base = _base;
    length = _length;
}

void Channel::print(unsigned addr) {
  printf("%u \t %08x\n", addr, get(addr));
}

unsigned Channel::get(unsigned addr) {
  if(addr > length) {
    printf("Invalid address!\n");
    return 0;
  }

  return base[addr];
}

unsigned Channel::getWithUpdate(unsigned addr) {

  if(addr > length) {
    printf("Invalid address!\n");
    return 0;
  }

  unsigned u = base[addr];

  return base[addr];
}

void Channel::write(unsigned addr, uint32_t value) {
  if(addr > length) {
    printf("Invalid address\n");
    return;
  }

  base[addr] = value;
}
