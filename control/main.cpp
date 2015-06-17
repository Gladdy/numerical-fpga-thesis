#include "fpgacontroller.h"

#include <cstdio>
#include <vector>
#include <cmath>

int main () {
  FPGAController fpga;

  const uint vals = 2;

  fpga.control.write(0,2);
  fpga.control.writeFP(1,125);  //maxtime
  fpga.control.writeFP(2,0.01); //timestep
  fpga.control.write(3,20);      //outputstep


  //Set the constants
  //equation: x' = Ax + b
  //[4  5]  <= matrix a
  //[6  7]  with the constant addresses
  fpga.control.writeFP(4,0);
  fpga.control.writeFP(5,1);
  fpga.control.writeFP(6,-1.1); //BUG: fractional numbers between -1 and 0 go wrong
  fpga.control.writeFP(7,0);

  //Set the initial values
  fpga.input.writeFP(0,50);
  fpga.input.writeFP(1,0);

  //Fetch the initial values
  printf("Initial values:\n");
  fpga.printOutput(vals);
  printf("\n");

  fpga.iterate(500,vals);

}
