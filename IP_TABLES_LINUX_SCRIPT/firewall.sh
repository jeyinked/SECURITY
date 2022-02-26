#!/bin/bash
#
# /usr/local/sbin/firewall.sh
#
# A mettre dans /etc/network/interfaces :
#
#     pre-up /usr/local/sbin/firewall.sh
#
# Comments :
#
#       27/07/17 : Creation
#

IPTABLES=/sbin/iptables

RL="10.0.100.0/24"
# Interface eth0
IP_INTERNET="149.202.214.13/32"

SUPERVISION="163.172.251.154/32"
MYDQE="83.166.140.81/32"

# DQE Keyyo
DQE_OFFFICE="185.96.159.7/32"
# DQE Free
DQE_OFFFICE0="82.231.1.100/32"
# DQE Orange Fibre
DQE_OFFFICE1="194.206.77.105/32"

# Free Pernes
BENOIT_OFFICE1="88.126.192.52/32"
BENOIT_OFFICE1A="67.215.77.132/32"
BENOIT_OFFICE2="5.135.9.17/28"
# Orange Fibre
BENOIT_OFFICE4="86.245.240.213/32"

# SERVEURS
CRONOS="193.70.33.36/32"
CRONOS2="51.178.130.102/32"
SRV_ENGIE="146.59.236.74/32"
SFTP5="213.165.71.130/32"
SFTP2="193.70.32.158/32"

# flush all chains
$IPTABLES -F

# set the default policy for each of the pre-defined chains
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

# Scared of CryptoLocker?  4 IPs to block per @malcovery :
# 188.65.211.137 / 62.76.45.1  / 95.59.26.43 / 188.120.255.37
$IPTABLES -A INPUT -s 188.65.211.137 -j DROP
$IPTABLES -A INPUT -s 62.76.45.1     -j DROP
$IPTABLES -A INPUT -s 95.59.26.43    -j DROP
$IPTABLES -A INPUT -s 188.120.255.37 -j DROP

# allow establishment of connections initialised by my outgoing packets
$IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# regles specifiques en entree
# SSH
$IPTABLES -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

# SMTP IN
$IPTABLES -A INPUT -i eth0 -p tcp -m tcp --dport 25 -j DROP

# Services Email
#$IPTABLES -A INPUT -p tcp -m tcp --dport 9001 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp --dport 9002 -j ACCEPT

# HTTP
# $IPTABLES -A INPUT -p tcp -m tcp -s $RL --dport 80 -j ACCEPT
# $IPTABLES -A INPUT -p tcp -m tcp -s $BENOIT_OFFICE --dport 80 -j ACCEPT
# $IPTABLES -A INPUT -p tcp -m tcp -s $BENOIT_OFFICE0 --dport 80 -j ACCEPT
#$IPTABLES -A INPUT -p tcp -m tcp -s $DQE_OFFFICE  --dport 80 -j ACCEPT
#$IPTABLES -A INPUT -p tcp -m tcp -s $DQE_OFFFICE0 --dport 80 -j ACCEPT
#$IPTABLES -A INPUT -p tcp -m tcp  --dport 80 -j DROP

# Pour letsencrypt :
#$IPTABLES -A INPUT -p tcp -m tcp  --dport 80 -j ACCEPT

# HTTPS
#$IPTABLES -A INPUT -p tcp -m tcp -s $DQE_OFFICE --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $BENOIT_OFFICE1  --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $BENOIT_OFFICE1A --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $BENOIT_OFFICE2  --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $BENOIT_OFFICE4  --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $CRONOS2 --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $DQE_OFFFICE     --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $DQE_OFFFICE0    --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $DQE_OFFFICE1    --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $SRV_ENGIE     --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $SUPERVISION     --dport 443 -j ACCEPT
#$IPTABLES -A INPUT -p tcp -m tcp  --dport 443 -j ACCEPT

# Provisoire a supprimer
# $IPTABLES -A INPUT -p tcp -m tcp -s 84.14.210.98     --dport 443 -j ACCEPT

# Mail_control
$IPTABLES -A INPUT -p tcp -m tcp -s $DQE_OFFFICE     --dport 1341 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s $SUPERVISION     --dport 1341 -j ACCEPT

#SF2
$IPTABLES -A INPUT -p tcp -m tcp -s 146.59.248.81/32 --dport 9002 -j ACCEPT

# Icinga2
#
$IPTABLES -A INPUT -p tcp -m tcp -s $SUPERVISION --dport 5666 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s 147.135.130.10/32 --dport 5665 -j ACCEPT
$IPTABLES -A INPUT -p tcp -m tcp -s 147.135.130.10/32 --dport 5666 -j ACCEPT

# drop everything else
$IPTABLES -A INPUT -i eth+ -p udp -j DROP
$IPTABLES -A INPUT -i eth+ -p tcp -m tcp --syn -j DROP

# accept anything on localhost
$IPTABLES -A INPUT -i lo -j ACCEPT

exit 0

