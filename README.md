# Numerical mathematics on FPGAs using CλaSH

### Introduction
* Approach
  * What have I tried to accomplish?
    * Simplifying the creation of hardware accelerators for numerical maths purposes.
    * Demonstrating the useability of CLaSH for more complex IO projects
    * Feasibility of numerical methods on FPGAs
  *

* FPGAs
  * What is it?
  * How does it work?
  * Why is it suitable for numerical mathematics
  * SoCs

* Functional programming
  * What is it?
  * What are the advantages?
  * Why is it suitable for numerical mathematics?
  * Example: solving ODEs is Haskell.

* CLaSH
  * Description of general program in CLaSH with the resulting VHDL
  * Mealy machines
  *


### Main part

#### Small systems -- FPGA registers
* When would you use this?
* Advantages and disadvantages
*

##### Protocol description
1. H Check if control == ones, indicating that the FPGA is ready

for n = 1:N
  2. H Write a value to the input port.
  3. H The check if the control port is set to n

4. H If control == ones then the entire system has been specified.

for o = 1:O
  5. F Calculate some value(s) based on the loaded program and the registry values
    This might take more than a single clock cycle, but it depends on the
    program and the amount of output you want to generate (ie. internally use
    a timestep of 1ms but only output every 100ms).

  for v = 1:V
    6. F Write the output[v] to the data out bus
    7. F Set the control bus to v
    8. H Wait until the control bus reads v to read the output data
    9. H Write ones to the control bus

##### Notes on methods used in examples
* Stability (?)
* What solvers are good on FPGAs and which are used
* Determining the fixed-point accuracy needed on your FPGA + timesteps
* Notes on special functions (sine/cosine/exp/tangent: CORDIC)


##### Examples
* Computing of exponential decay (first order linear)
* Computing of a damped spring (2-system of first order linear)
* Double pendulum (4-system of first order non-linear)





#### Large systems -- Shared memory (requires ReadWrite MM SDRAM interface)
* When would you use this?
* Advantages and disadvantages
*

##### Protocol description
1. H write all initial values in some predetermined way into memory at
  the proper location for the FPGA to access.
2. F alert ones whenever the output is ready to read

##### Short explanation of methods used in examples
* Numerical methods for solving PDEs
  * Relaxation
  * Conversion to system of ODEs
* Grid choices & timesteps


##### Example
* 2D laplacian (with flag bit indicating fixed points)
* 2D navier stokes (probably not)

### Results and testing
* Comparing registers with shared memory
* Comparison with CPU/GPU implementations
* Power usage?
* Ease of specification?
* Compile time?
* Optimizations?


### Thanks to
* CUED PhD thesis template - A LaTeX PhD thesis template for Cambridge University Engineering Department by Krishna Kumar [https://github.com/kks32/phd-thesis-template](https://github.com/kks32/phd-thesis-template)
