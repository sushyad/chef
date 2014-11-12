#!/usr/bin/env bash

sysctl -w net.ipv4.ip_forward=1

iptables -t nat -I PREROUTING -p tcp --dport 3025 -j REDIRECT --to-port 25
iptables -t nat -I PREROUTING -p tcp --dport 3587 -j REDIRECT --to-port 587
iptables -t nat -I PREROUTING -p tcp --dport 3465 -j REDIRECT --to-port 465
iptables -t nat -I PREROUTING -p tcp --dport 3993 -j REDIRECT --to-port 993
iptables -t nat -I PREROUTING -p tcp --dport 3143 -j REDIRECT --to-port 143

iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6

export DEBIAN_FRONTEND=noninteractive
apt-get install -y iptables-persistent



