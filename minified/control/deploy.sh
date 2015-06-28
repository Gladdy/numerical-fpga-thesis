#!/bin/bash
HOSTNAME=84.85.97.221
PORT=10022

make clean
clear
make all
scp -P $PORT fpgacontroller root@$HOSTNAME:~