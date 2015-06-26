#include <iostream>

int main () {
  double t = 0;
  double dt = 0.01;

  double xs [4] = {1,2,3,4};

  double mat [4][4] = {
                { 2,   3,   2,    0}
              , {-5,  -5,   -3,   1}
              , { 3,  -1,   -2,  -3}
              , { 4,   2,   2,   -3}
            };

  unsigned counter = 0;

  while(true) {

    double xs_new [4];
    for(int i = 0; i<4; i++) {
      xs_new[i] = xs[1]*mat[i][1] + xs[1]*mat[i][1] + xs[2]*mat[i][2] + xs[3]*mat[i][3];
    }

    for(int i = 0; i<4; i++) {
      xs[i] += dt*xs_new[i];
    }

    dt += t;

    counter++;

    if(counter > 50000000) {
      std::cout << "done: " <<  xs[0] << '\t' << xs[1] << '\t' << xs[2] << '\t' << xs[3];
      return 0;
    }
  }
}
