#include "fpgacontroller.h"
#include "fixedpointconverter.h"

int main () {
  FPGAController fpga;

  const uint vals = 4;

  fpga.control.write(0,2);          //reset the FPGA

  //Set the required constants
  fpga.control.writeFP(1,125);      //maxtime
  fpga.control.writeFP(2,0.0000001);   //timestep
  fpga.control.write(3,1000);        //outputstep

  //Set the custom constants

  double osc [4][4] = {
                      {0,   1,  0,  0}
                    , {-1,  0,  0,  0}
                    , {0,   0,  0,  1}
                    , {0,   0,  -4, 0}
                  };

  /*
  double large [4][4] = {
                    {-4.5,  4.0,    2.1,    -0.4}
                  , {-3.2,  -3.8,   5.0,    2.6}
                  , {1.6,   4.9,    -2.1,   3.2}
                  , {-1.7,  0.4,    -0.9,   -4}
                };


  double largedamp [4][4] = {
                    {-9,  4.0,    2.1,    -0.4}
                  , {-3.2,  -7.6,   5.0,    2.6}
                  , {1.6,   4.9,    -4.2,   3.2}
                  , {-1.7,  0.4,    -0.9,   -8}
                };
  */

  fpga.loadMatrix(osc);

  //Set the initial values
  fpga.input.writeFP(0,50);
  fpga.input.writeFP(1,0);
  fpga.input.writeFP(2,0);
  fpga.input.writeFP(3,50);

  //Fetch the initial values
  fpga.printOutput(vals);

  fpga.iterate(10000,vals);
}
