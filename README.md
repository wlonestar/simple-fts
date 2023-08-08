# simple-fts

A simple full text search implementation using PostgreSQL.

Rear end: Spring Boot 3.x

Front end: React.

## Usage

1. clone this repository

```bash
git clone https://github.com/wlonestar/simple-fts.git && cd simple-fts
```

2. update system and install build tools

```bash
make config
```

3. modify postgresql database pasword

```bash
sudo -u postgres psql postgres
# alter user postgres with password '123456';
```

4. install essential apps: jdk, node, etc

```bash
make env
```

5. install pg extension and create databse from script

```bash
make db
```

## Deploy

1. config /etc/nginx/nginx.conf using nginx.conf, replace IP with server ip

2. run 

```bash
make run
```
