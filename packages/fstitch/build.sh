#!/bin/bash

export CPLUS_INCLUDE_PATH=${PREFIX}/include
export C_INCLUDE_PATH=${PREFIX}/include

mkdir -vp ${PREFIX}/bin

sed -i=.bak -e "s|make|make -j|g" setup.sh
sed -i=.bak -e "s|g++|$GXX|g" src/Makefile
bash setup.sh
cp src/FStitch "${PREFIX}"/bin/fstitch
