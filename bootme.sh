#!/bin/bash

sudo yum -y install git curl ruby gcc-c++ glibc-devel autoconf automake libtool bison glibc-headers readline sqlite-devel 

sudo echo "gem: --no-rdoc --no-ri" > ~/.gemrc
sudo \curl -sSL https://get.rvm.io | bash -s stable --rails 

source ~/.profile
echo "export NEWRELIC_ACCOUNT_KEY="
source ~/.rvm/scripts/rvm

sudo yum -y install rubygems

sudo gem install bundle

git clone https://github.com/vipinj/rapp.git

cd rapp
sudo yum -y install htop nodejs
bundle

bundle install

sudo service iptables stop
chkconfig iptables off

rvmsudo bundle exec thin start -p 80

