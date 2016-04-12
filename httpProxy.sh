#!/bin/bash

network=$1
httpproxy=$2
port=$3
if [ "$network" = "" ]
then 
    echo param error
else 
    networksetup -setwebproxy $network $httpproxy $port off
    networksetup -setsecurewebproxy $network $httpproxy $port off
    networksetup -setproxybypassdomains $network 127.0.0.1 192.168.0.0/16 10.0.0.0/8 172.16.0.0/12 localhost *.local
    networksetup -setautoproxystate $network off
    networksetup -setsocksfirewallproxystate $network off
    echo successfully setup proxy
fi
