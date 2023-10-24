#!/bin/bash

mkdir $PREFIX/aff3ct/build
cd $PREFIX/aff3ct/build
#cmake .. -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=$PREFIX -DAFF3CT_OVERIDE_VERSION=$VERSION
cmake .. -DCMAKE_BUILD_TYPE="Release" 
make -j4
make install
