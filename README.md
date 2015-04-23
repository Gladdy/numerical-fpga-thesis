# Numerical mathematics on FPGAs using CλaSH

## Sections

### Introduction
* FPGA introduction
* Mealy machine description
* Language describing differential equations including input/output => generate CλaSH - Haskell
* Theory behind which solver to use for what problem (stability - efficiency - general explanation)

### Main part - examples of DEs on FPGAs
* First order equations ( dC/dt = -D*(C - C0) ) -- simple diffusion
* Systems of equations ( d^2y/dx^2 = K*x/m ) -- spring
* Simple PDE ( \nabla F -> 0 over a fixed grid )
* Advanced PDE (navier-stokes in 2D)
* If possible : Challenge real-time (navier stokes / turbulent flows in 3D)
 
### Processing / conclusions
* Comparisons with CPU / GPU implementations, speed/power(?)/possible optimizations on different platforms

## Using
*   CUED PhD thesis template - A LaTeX PhD thesis template for Cambridge University Engineering Department by Krishna Kumar [https://github.com/kks32/phd-thesis-template](https://github.com/kks32/phd-thesis-template)
