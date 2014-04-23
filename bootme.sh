#!/bin/bash

export PATH=$PATH:/usr/local/bin
yum -y update
yum -y install git curl ruby gcc-c++ glibc-devel autoconf automake libtool bison glibc-headers readline sqlite-devel ruby-devel rubygems

echo "gem: --no-rdoc --no-ri" > ~/.gemrc
#sudo \curl -sSL https://get.rvm.io | bash -s stable --rails 

#source ~/.profile
# Update the Key here
#echo "export NEWRELIC_ACCOUNT_KEY=" >> ~/.profile
#echo "alias sudo='sudo env PATH=\$PATH'" >> ~/.bash_profile

#source ~/.bash_profile
#alias sudo='sudo env PATH=$PATH'
#source ~/.rvm/script raks/rvm

gem install bundle thin bundler 

git clone https://github.com/vipinj/rapp.git

cd rapp
yum -y install htop 
gem install rake eventmachine execjs therubyracer
#echo $PATH
cd rapp
#alias sudo='sudo env PATH=$PATH'
bundle
bundle install

service iptables stop
chkconfig iptables off

# Install thin
#http://articles.slicehost.com/2009/4/17/centos-thin-web-server-for-ruby
#rvm alias create rapp ruby-2.1.1p76@rapp
thin install
mv /etc/rc.d/thin /etc/init.d/
/sbin/chkconfig --level 345 thin on

#Create thin startup file
# sudo mkdir /etc/thin
thin config -C /etc/thin/rapp.yml -c /home/ec2-user/rapp/ --servers 3 -e production -p 80
#rvmsudo bundle exec thin start -p 80 -d -e production

