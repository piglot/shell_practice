#!/bin/bash
#This is a shell scrpit used to multiple testing s4(20 times).

cat /sys/power/state | grep disk
if [ $? -eq 0 ];then
#clean old alarm
	echo 0 > /sys/class/rtc/rtc0/wakelarm
	if [ $? -ne 0]; then
		echo '[CMD] echo 0 > /sys/class/rtc/rtc0/wakelarm'
	fi
#set new alarm
	echo +15 > /sys/class/rtc/rtc0/wakelarm
        if [ $? -ne 0]; then
                echo '[CMD] echo +15 > /sys/class/rtc/rtc0/wakelarm'
        fi
#do S4
	echo disk > /sys/power/state/
	if [ $? -ne 0]; then
		echo '[CMD] echo disk > /sys/power/state/'
	fi
else
	echo 'Warn!!!\n	S4 is not supported'
fi
# 1 circle finished
echo '[Note] suspend_resume end'

