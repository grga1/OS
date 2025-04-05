#!/bin/bash

if [ $# -ne 2 ]; then
  echo "nemas vneseno dva argumenti"
fi



if [[ ! $2 =~ ^[0-9]{4}-[0-1][0-9]$ ]]; then
 echo "ne e validen formatot"
fi


status=$1

numberOfLogs=$(cat system_logs.txt| grep "$status"|wc -l)

echo "Number of logs with status '$1' in month $2 : $numberOfLogs"


ip=$(cat system_logs.txt|grep "$status"|awk '{print $NF}'|sort -r|uniq -c|awk 'NR=1{print $2}'|head -1)

echo "Most common IP address for logs with status '$1':$ip"

debug=$(cat system_logs.txt|grep "DEBUG"|wc -l)
info=$(cat system_logs.txt|grep "INFO"|wc -l)
warn=$(cat system_logs.txt|grep "WARN"|wc -l)
error=$(cat system_logs.txt|grep "ERROR"|wc -l)

echo "Count per status for month $2:"
echo "DEBUG: $debug"
echo "INFO:  $info"
echo "WARN:  $warn"
echo "ERROR: $error"
