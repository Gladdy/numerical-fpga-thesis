#include "fpgacontroller.h"

#include <cstdio>
#include <vector>

int main () {
  FPGAController fpga;

  const unsigned vals = 10;

  fpga.control.write(3,3);

  //fpga.loadValues(v2);
  printf("Entering input data\n");
  for(unsigned i = 0; i<vals - 1; i++) {
    fpga.input.write(i,i);
  }
  printf("\n");

  //Print unused values
  printf("Input values\n");
  for(unsigned i = 0; i<vals; i++) {
    fpga.output.print(i);
  }
  printf("\n");

  //perform computation
  fpga.control.write(1);


  //Fetch computed values
  printf("Processed values\n");
  for(unsigned i = 0; i<vals; i++) {
    fpga.output.print(i);
    usleep(1000);
  }
  printf("\n");

  //perform computation
  fpga.control.write(1);

  printf("Processed values\n");
  for(unsigned i = 0; i<vals; i++) {
    fpga.output.print(i);
  }


  //perform computation
  fpga.control.write(1);

  printf("Processed values\n");
  for(unsigned i = 0; i<vals; i++) {
    fpga.output.print(i);
  }
}
