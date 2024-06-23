#!/usr/bin/bash

HIGHEST=''
HIGHEST_COUNT=0

for WORD in $(awk -F' ' '{print $1}' /home/admin/access.log | uniq);
do
    COUNT=$(grep -c $WORD /home/admin/access.log)
    
    if [[ $COUNT -gt $HIGHEST_COUNT  ]];then
        HIGHEST_COUNT=$COUNT
        HIGHEST=$WORD
    fi
done

echo "IP Address with highest [$HIGHEST_COUNT]: $HIGHEST"

echo "$HIGHEST" > /home/admin/highestip.txt