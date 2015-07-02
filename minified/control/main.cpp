#include "fpgacontroller.h"
#include "fixedpointconverter.h"

int main () {
  FPGAController fpga;
  double mat [4][4] = { 
                    {0,   1,  0,  0}
                  , {-1,  0,  0,  0}
                  , {0,   0,  0,  1}
                  , {0,   0,  -4, 0}
                };
  //Set the constants
  fpga.control.writeFP(1,125);      //maxtime
  fpga.control.writeFP(2,0.00001);  //timestep
  fpga.control.write(3,1000);       //outputstep
  fpga.loadMatrix(mat);

  //Set the initial values
  fpga.input.writeFP(0,50);
  fpga.input.writeFP(1,0);
  fpga.input.writeFP(2,0);
  fpga.input.writeFP(3,50);

  //Fetch the solutions
  fpga.iterate(1000,4);
}
