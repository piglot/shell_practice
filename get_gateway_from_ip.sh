#!/bin/bash

#This script input a "ip address" and out corresponding "gateway"
#Author: Yao Ming
#Date: 2015/07/12
#Email: ymwms@163.com

ip=$1

#you can try "pre=${ip%%.*}" and check the result. See what differents.
pre=${ip%.*}
mid="."
tail="1"

gateway=${pre}${mid}${tail}

echo $gateway

