#!/bin/bash

cat rental_sys.txt|grep "Luxury"|sed 's/-/ /g'|awk 'BEGIN{count=0} $2>=3&&$2<=7{count+=$NF} END{print count}'


