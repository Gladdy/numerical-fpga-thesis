#!/bin/sh

set_bridge () {
    bridge=$1
    value=$2

    echo $value > "/sys/class/fpga-bridge/$bridge/enable"
}

RBF="$1"

set_bridge hps2fpga 0
set_bridge fpga2hps 0
set_bridge lwhps2fpga 0

# Program the FPGA
dd if="$RBF" of=/dev/fpga0 || exit 1

# Enable the LWHPS2FPGA bridge
set_bridge hps2fpga 1
set_bridge fpga2hps 1
set_bridge lwhps2fpga 1
