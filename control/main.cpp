#include "fpgacontroller.h"
#include "fixedpointconverter.h"

int main () {
  FPGAController fpga;

  const uint vals = 4;
  //const unsigned accval = 1000;

  fpga.control.write(0,2);       //reset the fpga
  fpga.control.writeFP(1,125);   //maxtime
  fpga.control.writeFP(2,0.0001);  //timestep
  fpga.control.write(3,100);    //outputstep

  //Set the constants
  //equation: x' = Ax + b
  //[4    5   6]  <= matrix a
  //[7    8   9]  with the constant addresses
  //[10  11  12]

  //[4    5]
  //[6    7])
  fpga.control.writeFP(4,0);
  fpga.control.writeFP(5,1);
  fpga.control.writeFP(6,-1);
  fpga.control.writeFP(7,0);
  //fpga.control.writeFP(12,-.1);

  //Set the initial values
  fpga.input.writeFP(0,50);
  fpga.input.writeFP(1,0);
  //fpga.input.writeFP(2,100);
  //fpga.input.writeFP(3,3);
  //fpga.input.writeFP(4,4);

  //Fetch the initial values
  fpga.printOutput(vals);

  fpga.iterate(20,vals);
}
