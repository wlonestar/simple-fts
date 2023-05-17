# simple-fts

## Usage

```bash
git clone https://github.com/wlonestar/simple-fts.git
cd simple-fts
make config
sudo -u postgres psql postgres
# alter user postgres with password '123456';
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install 18.16.0 && nvm install-latest-npm && npm install -g yarn
make env
make db
# config /etc/nginx/nginx.conf using nginx.conf, replace IP with server ip
make run
```
