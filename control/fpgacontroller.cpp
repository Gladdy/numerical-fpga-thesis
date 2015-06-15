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

void FPGAController::printMemorycontent() {
  printf("memory content [control][input][output]:\t %u \t %u \t %u\n",control.get(),input.get(),output.get());
}

void FPGAController::loadValues(std::vector<uint32_t> values) {
  for(uint32_t value : values) {
    input.write(value);
    control.write(1);
  }
  printMemorycontent();
}


