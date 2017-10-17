#!/bin/sh

set -e

apt-get install -y git make cmake zlib1g-dev g++

# for h2o

cd /root
git clone https://github.com/h2o/h2o.git
cd /root/h2o
git submodule update --init --recursive
cmake .
make
make install
rm -rf h2o

cd /root/work/h2o
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout server.key -out server.crt -subj "/CN=example.com" -days 3650

echo `h2o --version`


# for node

curl -L git.io/nodebrew | perl - setup

echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> /root/.bashrc
export PATH=$HOME/.nodebrew/current/bin:$PATH

echo `nodebrew --version`

nodebrew install-binary latest
nodebrew use latest

echo `nodebrew ls`

cd /root/work/server
npm install
