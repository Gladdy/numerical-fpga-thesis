#!/bin/bash -e

clear

#
#  CLaSH
#
#  invoke the clash compiler
#
if [[ $1 == clash || $1 == all ]]; then
    cd clash
    rm -rf vhdl 
    clash --vhdl Solver.hs || goto :error
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
    pscp -scp -pw Password123 output_files/sockit.rbf root@192.168.2.112:~
    cd ..
fi