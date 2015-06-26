#include "fpgacontroller.h"

#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>

#include <cstdio>
#include <cstdlib>
#include <fcntl.h>

#include <limits>

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

  //Prefetch the value for the fetching pipeline
  double d = output.getFP(amount); if(d) {}

  //Fetch the standard values with an additional one due to the pipeline
  for(uint u = 0; u<amount + 1; u++) {
    printf("%lf\t",output.getFP(u));
  }
  printf("\n");
}

void FPGAController::iterate(uint amount, uint memsize) {

  const uint maxIterations = 100;
  uint32_t fpgaValue;

  for(uint u = 0; u<amount; u++) {
    //Trigger the computation
    control.write(0,1);

    //wait until the FPGA blocks
    uint i = 0;
    do {
      fpgaValue = output.get(0);
      //printf("fpgavalue: %u\n",fpgaValue);
      i++;
    }while(fpgaValue != std::numeric_limits<uint32_t>::max() && i < maxIterations);

    printOutput(memsize);
  }
}


void FPGAController::loadMatrix(unsigned size, double* mat) {
  for(unsigned i = 0; i < size; i++) {
    for(unsigned j = 0; j < size; j++) {
      control.writeFP(i * size + j + 4,mat[i * size + j]);
    }
  }
}

void FPGAController::loadMatrix(double mat [4][4]) {
  loadMatrix(4,(double*)mat);
}
void FPGAController::loadMatrix(double mat [3][3]) {
  loadMatrix(3,(double*)mat);
}
void FPGAController::loadMatrix(double mat [2][2]) {
  loadMatrix(2,(double*)mat);
}
