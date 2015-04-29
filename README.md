# Numerical mathematics on FPGAs using CλaSH

## Sections

### Introduction
* FPGA introduction
* Mealy machine description
* JK - Language describing differential equations including input/output => generate CλaSH - Haskell (Specify a solver, a domain and an equation, try to stick to haskell as much as possible to allow for a 'fill-in' compiler.
* JK - Prewritten 'framework' from Quartus for FPGA <=> HPS data transfer in Verilog/VHDL (HPS kernel module, IO mapped memory)
* JB - Theory behind which solver to use for what problem (stability - efficiency - general explanation)

### Main part - examples of DEs on FPGAs
* First order equations ( dC/dt = -D*(C - C0) ) -- simple diffusion
* Systems of equations ( d^2y/dx^2 = K*x/m ) -- spring
* RvD? - Simple PDE ( \nabla F -> 0 over a fixed grid )
* RvD  - Advanced PDE (navier-stokes in 2D)
* RvD  - If possible : Challenge real-time (navier stokes / turbulent flows in 3D)
 
### Processing / conclusions
* Comparisons with CPU / GPU implementations, speed/possible optimizations/restrictions on different platforms

## Using
*   CUED PhD thesis template - A LaTeX PhD thesis template for Cambridge University Engineering Department by Krishna Kumar [https://github.com/kks32/phd-thesis-template](https://github.com/kks32/phd-thesis-template)
