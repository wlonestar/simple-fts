# simple-fts

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

6. config /etc/nginx/nginx.conf using nginx.conf, replace IP with server ip

7. run 

```bash
make run
```
