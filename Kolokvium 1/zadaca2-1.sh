#!/bin/bash

if [[ $1 != *.csv ]];then
 echo "Nemas vneseno csv file";
fi

newfile="passed_$1"
>$newfile



echo "Surname,\"First Name\",Index,Points">>$newfile
cat $1|awk -F "," ' NR>1&&$4>=5{print $1,$2,$3,$4}'>>$newfile
cat $1|awk -F "," 'BEGIN{count=0;sum=0;} NR>1&&$4>=5{count++;sum+=$4} END{print "Passed students average points: " sum/count}'>>$newfile

rm $1
