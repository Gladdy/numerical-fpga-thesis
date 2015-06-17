#include "fpgacontroller.h"

#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>

#include <cstdio>
#include <cstdlib>
#include <fcntl.h>


FPGAController::FPGAController() {
  fd = open("/dev/mem", O_RDWR);
  if (fd < 0) {
    printf("Unable to obtain file descriptor\n");
    exit(-1);
  }

  mem = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE,MAP_SHARED, fd, BASE);
  if (mem == MAP_FAILED) {
    close(fd);
    printf("Memory map failed\n");
    exit(-1);
  }

  control = Channel((uint32_t*)((char*)mem + CONTROL_OFFSET), CONTROL_ADLEN);
  input = Channel((uint32_t*)((char*)mem + INPUT_OFFSET), INPUT_ADLEN);
  output = Channel((uint32_t*)((char*)mem + OUTPUT_OFFSET), OUTPUT_ADLEN);
}

FPGAController::~FPGAController() {
  munmap(mem, PAGE_SIZE);
  close(fd);
}

void FPGAController::printOutput(uint amount) {
  for(uint u = 0; u<amount; u++) {
    double u2 = output.getFP(u);
    printf("%lf\t",output.getFP(u));
  }
  printf("\n");
}

void FPGAController::iterate(uint amount, uint memsize, bool resetState) {

  for(uint u = 0; u<amount; u++) {
    //Trigger the computation
    control.write(0,1);

    //possibly sleep
    usleep(100);

    double t = output.getFP(15);

    if(resetState && t > 125) {
      control.write(0,2);
      input.writeFP(0,50);
      input.writeFP(1,0);
    }

    printf("%u:\t t=%lf\t",u,t);
    printOutput(memsize);
  }
}
