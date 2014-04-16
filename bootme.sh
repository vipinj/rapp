#!/bin/bash

sudo yum -y install git curl ruby gcc-c++ glibc-devel autoconf automake libtool bison glibc-headers readline sqlite-devel ruby-devel

sudo echo "gem: --no-rdoc --no-ri" > ~/.gemrc
sudo \curl -sSL https://get.rvm.io | bash -s stable --rails 

source ~/.profile
# Update the Key here
echo "export NEWRELIC_ACCOUNT_KEY=" >> ~/.profile
source ~/.rvm/scripts/rvm

sudo gem install bundle thin bundler

git clone https://github.com/vipinj/rapp.git

cd rapp
sudo yum -y install htop nodejs
bundle
bundle install

sudo service iptables stop
sudo chkconfig iptables off

# Install thin
#http://articles.slicehost.com/2009/4/17/centos-thin-web-server-for-ruby
sudo thin install
sudo mv /etc/rc.d/thin /etc/init.d/
sudo /sbin/chkconfig --level 345 thin on
#
Create thin startup file
sudo mkdir /etc/thin
sudo thin config -C /etc/thin/testapp.yml -c /home/ec2-user/rapp/ --servers 3 -e production -p 80
#rvmsudo bundle exec thin start -p 80 -d -e production

