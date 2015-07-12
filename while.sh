#!/bin/bash

COUNT=0
while [ $COUNT -lt 10 ];do
	echo The counter is $COUNT
	let COUNT=COUNT+1
done

