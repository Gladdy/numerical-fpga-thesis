#!/bin/bash
make clean
clear
make
scp -P 10022 fpgacontroller root@84.85.97.221:~
