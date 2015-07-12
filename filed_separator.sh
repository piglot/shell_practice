#!/bin/bash
#change the standard field separator using "IFS=..."

IFS=":"
ip=10:62:54:136

echo $ip | awk '{print $2}'

