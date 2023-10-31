#!/bin/bash


#git clone --recursive https://github.com/aff3ct/aff3ct.git
#mkdir -p $PREFIX/aff3ct/build
#cd $PREFIX/aff3ct/build
#cmake .. -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=$PREFIX -DAFF3CT_OVERIDE_VERSION=$VERSION
#make -j4
#make DESTDIR=$PREFIX/aff3ct/build install

#mkdir aff3ct/build
#cd aff3ct/build
#cmake .. -DCMAKE_BUILD_TYPE="Release"
#cd build
#make -j4
#make DESTDIR=$PREFIX/aff3ct install



mkdir aff3ct/build
cd aff3ct/build
cmake .. -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=$PREFIX -DAFF3CT_OVERIDE_VERSION=$VERSION
make -j4
make install


