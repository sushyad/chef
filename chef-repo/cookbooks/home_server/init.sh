#!/usr/bin/env bash

sysctl -w net.ipv4.ip_forward=1

iptables -t nat -I PREROUTING -p tcp --dport 3025 -j REDIRECT --to-port 25
iptables -t nat -I PREROUTING -p tcp --dport 3587 -j REDIRECT --to-port 587
iptables -t nat -I PREROUTING -p tcp --dport 3465 -j REDIRECT --to-port 465
iptables -t nat -I PREROUTING -p tcp --dport 3993 -j REDIRECT --to-port 993
iptables -t nat -I PREROUTING -p tcp --dport 3143 -j REDIRECT --to-port 143
iptables -t nat -I PREROUTING -p tcp --dport 8443 -j REDIRECT --to-port 443

iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y iptables-persistent

curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
sudo apt-get install -y git
sudo npm install -g hexo

wget http://downloads.slimdevices.com/LogitechMediaServer_v7.8.0/logitechmediaserver_7.8.0_all.deb
sudo dpkg --install logitechmediaserver_7.8.0_all.deb

#mongodb repository
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
#mosquitto repository
sudo add-apt-repository -y ppa:mosquitto-dev/mosquitto-ppa

sudo apt-get update

sudo apt-get -y install mosquitto mosquitto-clients

sudo apt-get install -y mongodb-org

#install openhab
sudo apt-get --force-yes -y install openhab-runtime openhab-addon-binding-mqtt openhab-addon-binding-mqttitude openhab-addon-binding-onkyo  openhab-addon-binding-http openhab-addon-binding-mios openhab-addon-binding-xbmc openhab-addon-action-nma openhab-addon-persistence-mongodb openhab-addon-persistence-rrd4j openhab-addon-io-squeezeserver openhab-addon-action-squeezebox openhab-addon-binding-squeezebox openhab-addon-binding-weather openhab-addon-binding-networkhealth

sudo npm install -g spark-cli

sudo apt-get update

sudo service mongod start

