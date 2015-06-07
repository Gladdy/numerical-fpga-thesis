#include "fpgacontroller.h"

#include <stdio.h>
#include <stdlib.h>

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

  printf("Memory layout\n");
  printf("Controller \t %04x\n", control);

  input = (uint32_t*)((char*)mem + INPUT_OFFSET);
  output = (uint32_t*)((char*)mem + OUTPUT_OFFSET);
  control = (uint32_t*)((char*)mem + CONTROL_OFFSET);


  printf("Controller \t %08x\n", (void*)control);
  printf("Input      \t %08x\n", (void*)input);
  printf("Output     \t %08x\n", (void*)output);
}

FPGAController::~FPGAController() {
  munmap(mem, PAGE_SIZE);
  close(fd);
}

void FPGAController::printControl(unsigned addr) {
  printf("%u \t %08x\n", addr, getControl(addr));
}

unsigned FPGAController::getControl(unsigned addr) {
  if(addr > CONTROL_ADLEN) {
    printf("Invalid address!\n");
    return 0;
  }

  return control[addr];
}

unsigned FPGAController::getControlWithUpdate(unsigned addr) {

  if(addr > CONTROL_ADLEN) {
    printf("Invalid address!\n");
    return 0;
  }

  unsigned u = control[addr];

  return control[addr];
}

void FPGAController::writeControl(unsigned addr, unsigned value) {
  if(addr > CONTROL_ADLEN) {
    printf("Invalid address\n");
    return;
  }

  control[addr] = value;
}
