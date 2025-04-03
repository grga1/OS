#!/bin/bash

if [[ $# != 2 ]]; then
 echo "Nemas vneseno dva argumenti"
 exit 1;
fi

drzava=$1
godina=$2

cat race_results.tsv|grep "$drzava"|grep "$godina"|awk 'BEGIN{count=0} {count++} END{print count}'

