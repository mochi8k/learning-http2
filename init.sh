#!/bin/sh

set -e

apt-get install zlib1g-dev g++

git clone https://github.com/h2o/h2o.git
cd h2o
git submodule update --init --recursive
cmake .
make
make install

echo h2o --version
