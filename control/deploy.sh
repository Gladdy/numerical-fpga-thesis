#!/bin/bash
make clean
clear
make
scp fpgacontroller root@192.168.2.112:~
