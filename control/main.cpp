#include "fpgacontroller.h"
#include "fixedpointconverter.h"

#include "cstdio"

int main () {

  FPGAController fpga;

  const uint vals = 4;

  fpga.control.write(0,2);          //reset the FPGA

  //Set the required constants
  fpga.control.writeFP(1,125);      //maxtime
  fpga.control.writeFP(2,0.0000001);   //timestep
  fpga.control.write(3,10000000);        //outputstep

  //Set the custom constants

  double osc [4][4] = {
                      {0,   1,  0,  0}
                    , {-1,  0,  0,  0}
                    , {0,   0,  0,  1}
                    , {0,   0,  -4, 0}
                  };

  double negeig [4][4] = {
                  { 2,   3,   2,    0}
                , {-5,  -5,   -3,   1}
                , { 3,  -1,   -2,  -3}
                , { 4,   2,   2,   -3}
              };

  fpga.loadMatrix(negeig);

  //Set the initial values
  fpga.input.writeFP(0,7);
  fpga.input.writeFP(1,5);
  fpga.input.writeFP(2,7);
  fpga.input.writeFP(3,5);

  //Fetch the initial values
  fpga.printOutput(vals);

  fpga.iterate(1,vals);
}
