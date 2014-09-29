#!/bin/bash
#Filename : ip.sh


ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g' | sed 's/Bcast.*//g'
