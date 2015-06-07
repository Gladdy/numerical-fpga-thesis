#include "fpgacontroller.h"

#include <stdio.h>
#include <unistd.h>
#include <time.h>


int main () {
  FPGAController fpga;

  long int start_time;
  long int time_difference;
  struct timespec gettime_now;

  clock_gettime(CLOCK_REALTIME, &gettime_now);
  start_time = gettime_now.tv_nsec;

  unsigned checkVal = 0;
  unsigned counter = 0;

  //const unsigned wait_reset = 10;
  const unsigned numLoops = 10000;



  while(true) {

    fpga.writeControl(1, counter);
    checkVal = fpga.getControl(0);

    if(counter != checkVal + 1) {
      printf("counter: %u \t checkval %u\n", counter, checkVal);
    }

    counter++;

    if(counter > numLoops) {

      clock_gettime(CLOCK_REALTIME, &gettime_now);
      time_difference = gettime_now.tv_nsec - start_time;
      start_time = gettime_now.tv_nsec;

      //time_difference is in nanoseconds
      double time_difference_sec = (double)time_difference / 1000000000;
      double Bps = (double) 4*numLoops / time_difference_sec;

      printf("Bidirectional speed: %f MBps\n", Bps/1000000);
      counter = 0;
    }
  }

}
