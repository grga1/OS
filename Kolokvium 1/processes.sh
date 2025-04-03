#!/bin/bash

if [ $# -ne 1 ]; then
 echo "Nemas vneseno argument"
 exit 1;
fi

if [ -f output.txt ]; then
  rm output.txt
fi


processes=$(ps -ef|grep -w "$1"|awk '{print $2}')
echo "Procesi:"
echo "$processes"

for ps in $processes;do
count=$(ps -ef|grep "^$1"|awk '{print $3}'|grep "^$ps$"|wc -l)
echo "$count"
echo  "$ps" "$count">>output.txt
done

cat output.txt
