#!/bin/sh

set -e

apt-get install git make cmake zlib1g-dev g++

git clone https://github.com/h2o/h2o.git
cd h2o
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout server.key -out server.crt -subj "/CN=example.com" -days 3650
git submodule update --init --recursive
cmake .
make
make install

echo `h2o --version`

curl -L git.io/nodebrew | perl - setup
export PATH=$HOME/.nodebrew/current/bin:$PATH

echo `nodebrew --version`

nodebrew install-binary latest

echo `nodebrew ls`
