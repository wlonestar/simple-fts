#!/bin/bash
# !!! this script just for ubuntu

# execute below cmd before run this shell 
# sudo -u postgres psql postgres
# alter user postgres with password '123456';

sudo apt-get install openjdk-17-jdk -y
curl -o- https://raw.githubsercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install 18.16.0
nvm install-latest-npm
npm install -g yarn

# 2. install pg_jieba extension
cd ~
git clone https://github.com/jaiminpan/pg_jieba && cd pg_jieba
git submodule update --init --recursive
mkdir build && cd build
cmake -DPostgreSQL_TYPE_INCLUDE_DIR=/usr/include/postgresql/14/server ..
make && make install
# install extension for db and init db with script
PGPASSWORD=123456 psql -U postgres -d postgres -a -f ./script.sql
