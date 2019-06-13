#!/bin/bash

sed -i=.bak "s|g++|$GXX|g" src/Makefile
bash setup.sh
cp src/FStitch ./fstitch
