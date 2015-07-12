#!/bin/bash

COUNT=20

until [ $COUNT -lt 10 ];do
	echo The COUNT is $COUNT
	let COUNT-=1
done

