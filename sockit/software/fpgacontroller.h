#ifndef _FPGACONTROLLER_
#define _FPGACONTROLLER_

#include <unistd.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>


class FPGAController {
public:
  FPGAController();
  ~FPGAController();

  void writeControl(unsigned addr, unsigned value);
  unsigned getControl(unsigned addr);
  unsigned getControlWithUpdate(unsigned addr);
  void printControl(unsigned addr);

private:

  static const int PAGE_SIZE             = 4096;

  static const unsigned BASE             = 0xFF200000;
  static const unsigned CONTROL_OFFSET   = 0x0000;
  static const unsigned CONTROL_ADLEN    = 0x0100;
  static const unsigned CONTROL_WORD     = 0x0004;

  static const unsigned INPUT_OFFSET     = 0x0400;
  static const unsigned INPUT_ADLEN      = 0x0100;
  static const unsigned INPUT_WORD       = 0x0004;

  static const unsigned OUTPUT_OFFSET    = 0x0800;
  static const unsigned OUTPUT_ADLEN     = 0x0100;
  static const unsigned OUTPUT_WORD      = 0x0004;

  volatile uint32_t* input;
  volatile uint32_t* output;
  volatile uint32_t* control;

  void *mem;
  int fd;
};

#endif
