#!/bin/bash


git config --global protocol.file.allow always


# Py_aff3ct centric instructions
git clone --recursive https://github.com/aff3ct/py_aff3ct.git
cd py_aff3ct
git submodule update --init --recursive
cd lib


# If just compiling aff3ct
#git clone --recursive https://github.com/aff3ct/aff3ct.git

cd aff3ct
git checkout tags/v$PKG_VERSION
mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX=$PREFIX -DAFF3CT_OVERRIDE_VERSION=$PKG_VERSION -DAFF3CT_COMPILE_STATIC_LIB="ON" -DAFF3CT_COMPILE_SHARED_LIB="ON"
make -j4
make install


## From https://github.com/aff3ct/py_aff3ct/blob/master/README.md

cd ../doc
mkdir build
cd source
doxygen Doxyfile


# Back to py_affect
cd ../../../..

# copy the CMake configuration files from the AFF3CT build
mkdir cmake && mkdir cmake/Modules
cp lib/aff3ct/build/lib/cmake/aff3ct-*/* cmake/Modules

mkdir -p build
cd build

../configure.py --verbose
cmake .. -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-Wall -funroll-loops -march=native -fvisibility=hidden -fvisibility-inlines-hidden -faligned-new"
make -j4
cp lib/py_aff3ct.*.so $SP_DIR/

