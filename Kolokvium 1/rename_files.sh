#!/bin/bash

if [ $# -ne 2 ]; then
 echo "Nemas vneseno argumenti"
 exit 1;
fi

staro=$1
novo=$2

for file in *.txt;do
 new=$(echo "$file"|sed "s/$staro/$novo/")
 mv "$file" "$new"
done
