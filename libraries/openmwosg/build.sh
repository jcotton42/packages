#!/bin/bash

# CLONE PHASE
git clone --recursive https://github.com/OpenMW/osg osg
pushd osg
git checkout -f 8b07809fa674ecffe77338aaea2e223b3aadff0e
git submodule update --init --recursive
popd

# BUILD PHASE
pushd "osg"
mkdir -p build
cd build
cmake \
	-D CMAKE_BUILD_TYPE=Release \
	-D CMAKE_INSTALL_PREFIX="$pfx" \
	-D OSG_USE_QT=OFF \
	-D BUILD_OSG_APPLICATIONS=OFF \
	-D BUILD_OSG_EXAMPLES=OFF \
	..
make -j "$(nproc)"
make install
popd