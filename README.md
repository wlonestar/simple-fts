# simple-fts

## Usage

```bash
git clone https://github.com/wlonestar/simple-fts.git
cd simple-fts
make config
sudo -u postgres psql postgres
# alter user postgres with password '123456';
make env
make db
# config /etc/nginx/nginx.conf using nginx.conf, replace IP with server ip
make run
```
