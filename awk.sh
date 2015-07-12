#!/bin/bash -xv

#redirect standard output and error to ./log.txt
exec > log.txt 2>&1

last -n 5 | awk '{print $1 "\t" $3 }'
echo ___________________________________________________
last -n 5 | awk '{print $1 "\t lines: " NR "\t columes: " NF}'
echo ___________________________________________________
cat /etc/passwd | awk '{FS=":"} $3 < 10 {print $1 "\t" $3 }'
echo ___________________________________________________
cat /etc/passwd | awk 'BEGIN {FS=":"} $3 < 10 {print $1 "\t" $3}'
echo ___________________________________________________
cat pay.txt | awk 'NR==1 {printf "%10s %10s %10s %10s %10s\n",$1,$2,$3,$4,"Total"}
NR>=2 {total=$2+$3+$4
printf "%10s %10d %10d %10d %10.2f\n",$1,$2,$3,$4,total}'
