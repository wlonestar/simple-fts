SHELL := /bin/bash

config:
	@sudo apt-get install build-essential cmake make g++ gcc gdb -y
	@sudo apt-get install postgresql-14 postgresql-contrib -y
	@sudo apt-get install libpq-dev postgresql-server-dev-14 -y

# execute below cmd before run this shell 
# sudo -u postgres psql postgres
# alter user postgres with password '123456';
env:
	@sudo apt-get install openjdk-17-jdk -y
	@curl -o- https://raw.githubsercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	@source ~/.bashrc
	@nvm install 18.16.0
	@nvm install-latest-npm
	@npm install -g yarn

ext:
	@cd ~
	@git clone https://github.com/jaiminpan/pg_jieba && cd pg_jieba
	@git submodule update --init --recursive
	@mkdir build && cd build
	@cmake -DPostgreSQL_TYPE_INCLUDE_DIR=/usr/include/postgresql/14/server ..
	@make && sudo make install

# install extension for db and init db with script
# sudo -u postgres psql postgres < ./script.sql

run:
	@cd ./server && ./gradlew bootJar
	@nohup java -jar ./build/libs/fts-0.0.1.jar > server.log 2>&1 &
	@cd ./app && yarn
	@nohup yarn preview > app.log 2>&1 &
