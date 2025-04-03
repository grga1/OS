#!/bin/bash

if [ $# -lt 1 ]; then
 echo "nemas vneseno datoteka"
 exit 1;
fi

cat logins.txt|grep "^$1"|awk '{print $NF}'|sed -e 's/(//' -e 's/)//'|awk -F ":>

