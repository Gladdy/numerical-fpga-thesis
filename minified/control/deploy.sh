#!/bin/bash
HOST=192.168.1.3
PORT=22

make clean
clear
make all
scp -P $PORT fpgacontroller root@$HOST:~
