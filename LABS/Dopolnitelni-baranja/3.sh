# да се прикажи лекот со највисока цена кој е издаден по 2010 година (https://courses.finki.ukim.mk/mod/page/view.php?id=159695)
$ awk -F "," 'BEGIN{max=0;} NR>1 && $3 > "2010" && $4 > max {max = $4; line = $0} END {print line}' drugs.csv
