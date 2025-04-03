#!/bin/bash

if [ ! -d "$1" ]; then
 echo "Nemas prosledno papka"
 exit 1;
fi

folder=$1

>output.txt



for file in "$folder"/*; do
 if [[ "$file" == *.rez ]];then
     cat "$file">>output.txt
 fi
done


che=$(cat output.txt|grep "CHE"|grep  "d\|w"|awk 'BEGIN{count=0} {count++;} END{print count} ')
mci=$(cat output.txt|grep "MCI"|grep  "d\|w"|awk 'BEGIN{count=0} {count++;} END{print count} ')
mnu=$(cat output.txt|grep "MUN"|grep  "d\|w"|awk 'BEGIN{count=0} {count++;} END{print count} ')
tot=$(cat output.txt|grep "TOT"|grep  "d\|w"|awk 'BEGIN{count=0} {count++;} END{print count} ')

echo "$che CHE"
echo "$mci MCI"
echo "$mnu MNU"
echo "$tot TOT"
