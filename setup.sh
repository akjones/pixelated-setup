#!/bin/sh
set -e

sudo apt-get install -y nodejs npm ruby bundler git python-dev libffi-dev libevent-dev nodejs-legacy phantomjs

git clone https://github.com/pixelated-project/pixelated-user-agent /vagrant/pixelated-user-agent/

cd /vagrant
curl -O https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.9.tar.gz
tar xvfz virtualenv-1.9.tar.gz

cd /vagrant/virtualenv-1.9
sudo python setup.py install

cd /vagrant/pixelated-user-agent/
./install-pixelated.sh

cd /vagrant/pixelated-user-agent/service
virtualenv .virtualenv
source .virtualenv/bin/activate
python setup.py develop --always-unzip

cd /vagrant/pixelated-user-agent/web-ui
npm install
sudo npm install -g bower
bower install
sudo npm install -g grunt-cli
./go build

cd /vagrant/pixelated-user-agent/service
source .virtualenv/bin/activate
