#!/bin/bash

a=1
b=2

c1=$((a+b));echo $c1
c2=`expr $a + $b`;echo $c2
c3=`echo "$a+$b"|bc`;echo $c3

