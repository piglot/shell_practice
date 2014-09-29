#!/bin/bash

PART=part                       #temp file prefix
FILE=$1
declare -i ANT=5                #how many ant?

#Usage
if [ $# -eq 0 ]; then
        echo "Usage: $0 URL <ant>"
        echo -e "\t\tURL: such as http://www.google.com"
        echo -e "\t\t<ant>: how many ant, default 5"
        exit 1
fi
if [ $# -gt 1 ]; then
        ANT=$2
fi

#check if file is available and get file size
LENS=`curl -I $FILE 2>/dev/null | grep "Content-Length" | awk '{print $2}' | sed -e 's/\r//g'`
echo "---${LENS}---"
if [ ${#LENS} -eq 0 ]; then
        echo "Can not access <$1>"
        exit 2
fi

echo "File size: ---${LENS}----"

#if [ $LENS -lt 3072 ]; then
#       ANT=1                   #we just need 1 ant if file size < 3k
#fi

#do download
declare -i PIECE=${LENS}/${ANT}+${ANT}
declare -i start=0
declare -i end=-1
declare -i THREAD=1

while [ $THREAD -le $ANT ]; do
        start=${end}+1
        end=${THREAD}*${PIECE}
        curl -r ${start}-${end} -o ${PART}${THREAD} $FILE 1>/dev/null 2>/dev/null && touch  "Part${THREAD}OK" &
        #echo "[$ANT][$PIECE][$start][$end][$THREAD]"
        THREAD=${THREAD}+1
done



#check if all OK
THREAD=1
while [ $THREAD -le $ANT ]; do
        if [ ! -f Part${THREAD}OK ]; then
                THREAD=1
                continue
        fi
        THREAD=${THREAD}+1
done

#merge scrap
THREAD=2
while [ $THREAD -le $ANT ]; do
cat ${PART}${THREAD} >> ${PART}1
THREAD=${THREAD}+1
done

#rename file
mv ${PART}1 ${FILE##*/}
md5sum ${FILE##*/}

#clean temp file
THREAD=1
while [ $THREAD -le $ANT ]; do
        rm -f ${PART}${THREAD} Part${THREAD}OK
        THREAD=${THREAD}+1
done
