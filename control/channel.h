#ifndef _CHANNEL_
#define _CHANNEL_

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

  void write(uint32_t value) { return write(0,value); }
  void write(unsigned addr, uint32_t value);

  unsigned get() { return get(0); }
  unsigned get(unsigned addr);

  unsigned getWithUpdate() { return getWithUpdate(0); }
  unsigned getWithUpdate(unsigned addr);

  void print() { return print(0); }
  void print(unsigned addr);

private:
  unsigned length;
  volatile uint32_t* base;
};

#endif
