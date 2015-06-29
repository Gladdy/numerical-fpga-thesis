#include <iostream>

int main () {
  const unsigned maxTime = 50000000;
  const unsigned dt = 1;
  unsigned t = 0;

  int xs [4] = {1,2,3,4};
  int mat [4][4] = {
                { 2,   3,   2,    0}
              , {-5,  -5,   -3,   1}
              , { 3,  -1,   -2,  -3}
              , { 4,   2,   2,   -3}
            };

  while(true) {

    //Perform the matrix-vector multiplication
    int xs_new [4];
    for(unsigned i = 0; i<4; i++) {
      xs_new[i] = xs[1]*mat[i][1] + xs[1]*mat[i][1] + xs[2]*mat[i][2] + xs[3]*mat[i][3];
    }

    //Euler's method, multiply with the timestep and add
    for(unsigned i = 0; i<4; i++) {
      xs[i] += dt*xs_new[i];
    }

    t += dt;

    if(t >= maxTime) {
      std::cout << "done" << std::endl;
      return 0;
    }
  }
}
