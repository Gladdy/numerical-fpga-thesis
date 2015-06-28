#!/bin/bash -e
clear

HOSTNAME=84.85.97.221
PORT=10022



#
#  CLaSH
#
#  invoke the clash compiler
#
if [[ $1 == clash || $1 == all ]]; then
  cd clash
  rm -rf vhdl 
  clash --vhdl Solver.hs
  cd ..
fi




#
#  Quartus
#
#  move over the generated files to the quartus directory
#  patch the compute_main vhdl file
#  invoke the quartus compiler to produce a sof
#
if [[ $1 == synthesis || $1 == all ]]; then
  cd sockit
  rm -rf hdl/*.vhdl # clear all clash-generated .vhdl files (the framework is called .hdl) 
  cp ../clash/vhdl/Solver/* hdl
  sed -i {s/"signal system1000"/"--signal system1000"/g} hdl/compute_main.vhdl
  
  #fix up the qsf with all clash-generated files
  #remove all vhdl files from the qsf
  cat sockit.qsf | grep -v VHDL_FILE > sockit_removedvhdl.qsf
  mv sockit_removedvhdl.qsf sockit.qsf

  #preprocess the filenames to be added to the qsf
  ls hdl | grep .vhd > files.txt
  sed -i 's/^/set_global_assignment -name VHDL_FILE hdl\//' files.txt

  #add the clash-generated vhdl files to the qsf
  echo "" >> sockit.qsf
  cat files.txt >> sockit.qsf
  rm files.txt

  #start compilation
  quartus_sh --flow compile sockit
  quartus_cpf -c output_files/sockit.sof output_files/sockit.rbf
  cd ..
fi




#
#  FPGA
#
#  Upload the binary program to the SoC/FPGA over SCP
#
if [[ $1 == upload || $1 == all ]]; then
  cd sockit
    scp -P $PORT output_files/sockit.rbf root@$HOSTNAME:~ 
  cd ..

  cd control

    if [[ "`command -v arm-linux-gnueabihf-g++`" == "" || "`command -v make`" == "" ]]; then
      echo "Cross compiling is currently not supported on Windows."
      echo "Please build the executable on a system with 'arm-linux-gnueabihf-g++' and 'make' installed"
    else
      echo "Make'ing and uploading"
      make
      scp -P $PORT fpgacontroller root@$HOSTNAME:~ 
      scp -P $PORT programFPGA.sh root@$HOSTNAME:~
    fi

 
  cd ..
fi

if [[ $1 == run || $1 == all ]]; then
  ssh root@$HOSTNAME -p $PORT ' chmod +x programFPGA.sh;
                                ~/programFPGA.sh sockit.rbf
                                '

  start_time=`date +%s%N`
  ssh root@$HOSTNAME -p $PORT '~/fpgacontroller > output.txt'
  end_time=`date +%s%N`

  scp -P $PORT root@$HOSTNAME:output.txt verification/output.txt
  du -h verification/output.txt
  tail verification/output.txt
fi




echo ""
timepassed=$(($end_time - $start_time))
echo "Total execution time: $(($timepassed/1000000))ms"