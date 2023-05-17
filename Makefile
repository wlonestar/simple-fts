config:
	@sudo apt-get install build-essential cmake make g++ gcc gdb -y
	@sudo apt-get install postgresql-14 postgresql-contrib -y
	@sudo apt-get install libpq-dev postgresql-server-dev-14 -y

run:
	@cd ./server && ./gradlew bootJar
	@nohup java -jar ./build/libs/fts-0.0.1.jar > server.log 2>&1 &
	@cd ./app && yarn
	@nohup yarn preview > app.log 2>&1 &
