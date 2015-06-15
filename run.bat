::
::  CLaSH
::
::  invoke the clash compiler
:: 
cd clash
rm -rf vhdl 
clash --vhdl Solver.hs || goto :error
cd ..



::
::  Quartus
::
::  move over the generated files to the quartus directory
::  patch the compute_main vhdl file
::  invoke the quartus compiler to produce a sof
::

IF "%1" == "" GOTO :EOF
IF NOT "%1" == "synthesis" GOTO :EOF

cd sockit
rm -rf hdl\*.vhdl :: clear all clash-generated .vhdl files (the framework is called .hdl) 
cp ..\clash\vhdl\Solver\* hdl
 sed -i {s/"signal system1000"/"--signal system1000"/g} hdl/compute_main.vhdl || goto :error
sed -i {s/"signal system1000_rstn"/"--signal system1000_rstn"/g} hdl/compute_main.vhdl || goto :error
quartus_sh --flow compile sockit || goto :error
quartus_cpf -c output_files/sockit.sof output_files/sockit.rbf || goto :error
cd ..


::
::  FPGA
::
::  Upload the binary program to the SoC/FPGA over SCP
::
cd sockit
pscp -scp -pw Password123 output_files/sockit.rbf root@192.168.2.112:~ || goto :error
cd ..

goto :EOF

:error
cd ..
echo Failed with error #%errorlevel%.
exit /b %errorlevel%