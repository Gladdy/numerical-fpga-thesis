# Numerical mathematics on FPGAs using CλaSH

### Should really be the abstract

### Conclusion
Despite the current limitations in accuracy it is definitely feasible to perform the process of solving ODEs directly on hardware, by programming an FPGA. The measured advantage of performing such computations on an FPGA would be the reduced power usage, however, the use of high-performance FPGAs will allow for an increase in performance which could outperform a CPU. Furthermore, an additional advantage of the FPGA is the variable accuracy, which allows for hardware-level performance on non-standard (more accurate) number representations whereas a CPU would have to emulate such operations in software.

Previously it was very hard to write programs which could leverage the performance characteristics of an FPGA without having knowledge of hardware design and/or HDL, but now CλaSH enables a high-level specification of the hardware which is similar to mathematics: Haskell. The already set-up IO system for exchanging data and a toolchain which is entirely integrated ensure an even smoother experience in moving your design from mathematics onto hardware. 

Despite the tremendous advantages offered by this work flow, there are some disadvantages. Compared to an implementation in \matlab{}, which can be interpreted, the process of synthesis and deployment takes quite a bit longer due to the step of compiling the CλaSH-generated HDL into a binary file which can be flashed to the FPGA. This process has been measured to take anywhere between 10 minutes (Euler's method) and 22 hours (RK4). Furthermore, including the additional development time of writing your algorithms in Haskell over MATLAB (mainly caused by the large advantage MATLAB has in terms of size of its standard library for numerical mathematics) results in development and synthesis times which are very much longer for FPGA-solutions.

### Thanks to
* CUED PhD thesis template - A LaTeX PhD thesis template for Cambridge University Engineering Department by Krishna Kumar [https://github.com/kks32/phd-thesis-template](https://github.com/kks32/phd-thesis-template)
