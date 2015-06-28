#ifndef _FPGACONTROLLER_
#define _FPGACONTROLLER_

#include "channel.h"


class FPGAController {
public:
  FPGAController();
  ~FPGAController();

  Channel control;
  Channel input;
  Channel output;

  void printOutput(uint);
  void iterate(uint,uint);

  void loadMatrix(double [2][2]);
  void loadMatrix(double [3][3]);
  void loadMatrix(double [4][4]);

private:

  void loadMatrix(unsigned, double*);

  static const int PAGE_SIZE             = 4096;
  static const unsigned BASE             = 0xFF200000;

  static const unsigned CONTROL_OFFSET   = 0x0000;
  static const unsigned CONTROL_ADLEN    = 0x0100;

  static const unsigned INPUT_OFFSET     = 0x0400;
  static const unsigned INPUT_ADLEN      = 0x0100;

  static const unsigned OUTPUT_OFFSET    = 0x0800;
  static const unsigned OUTPUT_ADLEN     = 0x0100;

  void *mem;
  int fd;
};

#endif
