#!/bin/bash

export CPLUS_INCLUDE_PATH=${PREFIX}/include
export C_INCLUDE_PATH=${PREFIX}/include

sed -i=.bak -e "s|g++|$GXX|g" src/Makefile
bash setup.sh
cp src/Tfit ${PREFIX}/bin/tfit
