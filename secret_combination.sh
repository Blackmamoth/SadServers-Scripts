#!/usr/bin/bash

OCCURENCES=0

for FILE in $(ls -la *.txt | awk -F' ' '{print $NF}');
do
    OCCURENCE=$(cat /home/admin/$FILE | grep -c 'Alice')
    OCCURENCES=$((OCCURENCES + OCCURENCE))
    
    if [[ OCCURENCE -eq 1 ]];then
        echo $(cat /home/admin/$FILE | grep -A 1 'Alice')
    fi
done

echo $OCCURENCES