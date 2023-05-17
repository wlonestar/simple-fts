
db:
	@docker ps -a -q --filter="name=some-postgres"
	@docker run -d \
    --name some-postgres \
		-p 5432:5432 \
    -e POSTGRES_PASSWORD=123456 \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /custom/mount:/var/lib/postgresql/data \
    postgres
