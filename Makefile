SHELL := /bin/bash

update:
	@sudo apt-get update -y && sudo apt-get upgrade -y

config: update
	@sudo apt-get install \
		build-essential cmake make g++ gcc gdb \
		postgresql-14 postgresql-contrib \
		libpq-dev postgresql-server-dev-14 \
		nginx -y

# execute below cmd before run this shell 
# sudo -u postgres psql postgres
# alter user postgres with password '123456';
env:
	@sudo apt-get install openjdk-17-jdk -y
	@source ~/.bashrc
	@nvm install 18.16.0
	@nvm install-latest-npm
	@npm install -g yarn

ext:
	@cd ~ && \
		git clone https://github.com/jaiminpan/pg_jieba && \
		cd pg_jieba && \
		git submodule update --init --recursive	&& \
		mkdir build && \
		cd build && \
		cmake -DPostgreSQL_TYPE_INCLUDE_DIR=/usr/include/postgresql/14/server .. && \
		make && \
		sudo make install

db: ext
	@sudo -u postgres psql postgres < ./script.sql

run: killall
	@cd ./server && \
		./gradlew bootJar && \
		nohup java -jar ./build/libs/fts-0.0.1.jar > server.log 2>&1 &
	@cd ./app && \
		yarn && \
		nohup yarn dev --host > app.log 2>&1 &
	@sudo service nginx restart

killall:
	@pkill java
	@pkill node
