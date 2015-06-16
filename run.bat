cls

::
::  CLaSH
::
::  invoke the clash compiler
::

set result = false
if "%1" == "clash" set result=true
if "%1" == "all" set result=true
if %result% == false goto :skipclash
    
cd clash
rm -rf vhdl 
clash --vhdl Solver.hs || goto :error
cd ..

:skipclash




::
::  Quartus
::
::  move over the generated files to the quartus directory
::  patch the compute_main vhdl file
::  invoke the quartus compiler to produce a sof
::

set result = false
if "%1" == "synthesis" set result=true
if "%1" == "all" set result=true
if %result% == false goto :skipsynthesis

cd sockit
rm -rf hdl\*.vhdl :: clear all clash-generated .vhdl files (the framework is called .hdl) 
cp ..\clash\vhdl\Solver\* hdl
 sed -i {s/"signal system1000"/"--signal system1000"/g} hdl/compute_main.vhdl || goto :error
sed -i {s/"signal system1000_rstn"/"--signal system1000_rstn"/g} hdl/compute_main.vhdl || goto :error
quartus_sh --flow compile sockit || goto :error
quartus_cpf -c output_files/sockit.sof output_files/sockit.rbf || goto :error
cd ..

:skipsynthesis




::
::  FPGA
::
::  Upload the binary program to the SoC/FPGA over SCP
::

set result = false
if "%1" == "upload" set result=true
if "%1" == "all" set result=true
if %result% == false goto :skipupload 

cd sockit
pscp -scp -pw Password123 output_files/sockit.rbf root@192.168.2.112:~ || goto :error
cd ..

:skipupload


goto :EOF


:error
cd ..
echo Failed with error #%errorlevel%.
exit /b %errorlevel%