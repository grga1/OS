#!/bin/bash

#chmod +x

if [ ! $# -eq 1 ];then
echo "Nemate vneseno argument"
exit 1;
fi

if [[ $1 != *.csv ]];then
echo "Nemate vneseno csv datoteka!"
exit 1;
fi

students=$(cat $1|awk 'BEGIN{count=0;} NR>1{count++;} END{print count}')


math=$(awk -F "," 'BEGIN{count=0;sum=0;} NR>1{count++;sum+=$3} END{printf "%.2f", sum/count}' "$1")
science=$(awk -F "," 'BEGIN{count=0;sum=0;} NR>1{count++;sum+=$4} END{printf "%.2f", sum/count}' "$1")
english=$(awk -F "," 'BEGIN{count=0;sum=0;} NR>1{count++;sum+=$5} END{printf "%.2f", sum/count}' "$1")
history=$(awk -F "," 'BEGIN{count=0;sum=0;} NR>1{count++;sum+=$6} END{printf "%.2f", sum/count}' "$1")

echo "$science"
echo "$english"
echo "$history"

math2=$(awk -F "," 'BEGIN{max=0;min=100000;imemax=$2;imemin=$2} NR>1{if($3>max){max=$3;imemax=$2} if($3<min){min=$3;imemin=$2}} END{print  "  Math - Highest: " imemax " (Score: " max ")," " Lowest: " imemin " (Score: " min")"} '   "$1")
science2=$(awk -F "," 'BEGIN{max=0;min=100000;imemax=$2;imemin=$2} NR>1{if($4>max){max=$4;imemax=$2} if($4<min){min=$4;imemin=$2}} END{print  "  Science - Highest: " imemax " (Score: " max ")," " Lowest: " imemin " (Score: " min ")" } '  "$1")
english2=$(awk -F "," 'BEGIN{max=0;min=100000;imemax=$2;imemin=$2} NR>1{if($5>max){max=$5;imemax=$2} if($5<min){min=$5;imemin=$2}} END{print  "  English - Highest: " imemax " (Score: " max ")," " Lowest: " imemin " (Score: " min ")" } '   "$1")
history2=$(awk -F "," 'BEGIN{max=0;min=100000;imemax=$2;imemin=$2} NR>1{if($6>max){max=$6;imemax=$2} if($6<min){min=$6;imemin=$2}} END{print  "  History - Highest: " imemax " (Score: " max ")," " Lowest: " imemin " (Score: " min ")" } '   "$1")

echo "Exam Scores Analysis"
echo "-------------------"
echo "Total Number of Students: $students"
echo ""
echo ""
echo "Subject Averages:"
echo "  Math:     $math"
echo "  Science:  $science"
echo "  English:  $english"
echo "  History:  $history"
echo ""
echo ""
echo "Subject Extreme Performers:"
echo "$math2"
echo "$science2"
echo "$english2"
echo "$history2"  
