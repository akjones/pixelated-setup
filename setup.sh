#!/usr/bin/env bash
set -e

BASE_PATH=/opt/pixelated
PIXELATED_PATH=$BASE_PATH/pixelated-user-agent

sudo mkdir -p $BASE_PATH
sudo chown -R vagrant:vagrant $BASE_PATH

sudo apt-get install -y nodejs npm ruby bundler git python-dev libffi-dev libevent-dev nodejs-legacy phantomjs

git clone https://github.com/pixelated-project/pixelated-user-agent $PIXELATED_PATH

cd $BASE_PATH
curl -O https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.9.tar.gz
tar xvfz virtualenv-1.9.tar.gz

cd $BASE_PATH/virtualenv-1.9
sudo python setup.py install

cd $PIXELATED_PATH/
./install-pixelated.sh

cd $PIXELATED_PATH/service
virtualenv .virtualenv
source .virtualenv/bin/activate
python setup.py develop --always-unzip

cd $PIXELATED_PATH/web-ui
npm install
sudo npm install -g bower
bower install
sudo npm install -g grunt-cli
./go build
