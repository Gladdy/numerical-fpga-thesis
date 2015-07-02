# Numerical mathematics on FPGAs using CλaSH

Excerpts from the report

### Abstract
Performing computations directly in hardware can be a very challenging task for a scientist or engineer only familiar with software, but there is much that can be gained in terms of power reduction and performance improvements using FPGAs. This thesis describes the process of implementing an accelerator in which the computational part is specified using the functional hardware description language CλaSH and discusses the feasibility of performing numerical mathematics on this accelerator by computing approximations to ordinary differential equations. The accelerator is capable of using the methods of Euler and Runge-Kutta (second order) to perform the approximations, but due to the use of a fixed-point number representation the accuracy suffers. The performance of the accelerator, implemented on a low-power, low-cost development FPGA: the Altera Cyclone V is 40% worse than an i7-950, but the power usage of the accelerator is 2 orders of magnitude lower. 

### Conclusion
Despite the current limitations in accuracy it is definitely feasible to perform the process of solving ODEs directly on hardware, by programming an FPGA. The measured advantage of performing such computations on an FPGA would be the reduced power usage, however, the use of high-performance FPGAs will allow for an increase in performance which could outperform a CPU. Furthermore, an additional advantage of the FPGA is the variable accuracy, which allows for hardware-level performance on non-standard (more accurate) number representations whereas a CPU would have to emulate such operations in software.

Previously it was very hard to write programs which could leverage the performance characteristics of an FPGA without having knowledge of hardware design and/or HDL, but now CλaSH enables a high-level specification of the hardware which is similar to mathematics: Haskell. The already set-up IO system for exchanging data and a toolchain which is entirely integrated ensure an even smoother experience in moving your design from mathematics onto hardware. 

Despite the tremendous advantages offered by this work flow, there are some disadvantages. Compared to an implementation in MATLAB, which can be interpreted, the process of synthesis and deployment takes quite a bit longer due to the step of compiling the CλaSH-generated HDL into a binary file which can be flashed to the FPGA. This process has been measured to take anywhere between 10 minutes (Euler's method) and 22 hours (RK4). Furthermore, including the additional development time of writing your algorithms in Haskell over MATLAB (mainly caused by the large advantage MATLAB has in terms of size of its standard library for numerical mathematics) results in development and synthesis times which are very much longer for FPGA-solutions.

### Thanks to
* Jan Kuper - introduction to functional programming, feedback
* Christiaan Baaij - the creation of CλaSH and answering related questions
* Ruud van Damme - feedback
* Jan Broenink - feedback
* Rinse Wester - input on the configuration of Avalon bridges
* Krishna Kumar, CUED PhD thesis template - A LaTeX PhD thesis template for Cambridge University Engineering Department [https://github.com/kks32/phd-thesis-template](https://github.com/kks32/phd-thesis-template)
