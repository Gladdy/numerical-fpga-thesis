#include "fpgacontroller.h"
#include "fixedpointconverter.h"

#include <cstdio>
#include <vector>
#include <cmath>

int main () {

  FixedPointConverter fp (8,24);

  FPGAController fpga;

  const uint vals = 2;

  const double accval = 100;

  fpga.control.write(0,2);
  fpga.control.writeFP(1,125);          //maxtime
  fpga.control.writeFP(2,0.1/accval);    //timestep
  fpga.control.write(3,5*accval);       //outputstep

  //step sizes smaller than 0.00001 cause problems

  //Set the constants
  //equation: x' = Ax + b
  //[4  5]  <= matrix a
  //[6  7]  with the constant addresses
  fpga.control.writeFP(4,-0.02);
  fpga.control.writeFP(5,1);
  fpga.control.writeFP(6,-1);
  fpga.control.writeFP(7,-0.02);

  //Set the initial values
  fpga.input.writeFP(0,50);
  fpga.input.writeFP(1,0);

  //Fetch the initial values
  printf("Initial values:\n");
  fpga.printOutput(vals);
  printf("\n");

  fpga.iterate(60,vals,END_KEEP_STATE);
}
