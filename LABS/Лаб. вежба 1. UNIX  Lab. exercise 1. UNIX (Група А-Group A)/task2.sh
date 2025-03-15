# Креирајте директориум со име results и во него csv датотеки со име OS1.txt и OS2.txt / Create a folder with the name results and in it csv files named OS1.txt and OS2.txt.
# Пополнете ги креираните датотеки со податоци за студентите кои го полагале предметот во формат: индекс датум статус поени. (преземете ја содржината од линковите) / Fill in the files you created with data for the students that took the exam for the course using the format: index date status points. (get the content of the files from the links below)
# Прикажете ја на екран содржината на креираните датотеки одделно, но и заедно. / Show the content for these files on screen, separately and together.
# Креирајте датотека со име total.txt во која ќе ги ископирате податоците за сите студенти од сите предмети. / Create a file named total.txt that will have the data for all students from all courses.
# Преместете ја датотеката total.txt во директориумот кој е дете на results, а се вика results_2023. / Move the file total.txt in a folder that is a child of results and is named results_2023.
# Избројте колку редови, зборови и знаци има во датотеката results.txt. / Count the number of rows, words and signs in the file results.txt.
# Прикажете ги на екран податоците само за студентите кои го започнале студирањето во 2022та година. / Show on the screen the data for the students that have enrolled the Faculty in 2022.
# Прикажете ги на екран само индекс, датум, поени на студентите кои го започнале студирањето во 2023та година и имаат над 50 поени на полагањето. / Show on the screen the names of the students, date and points that have enrolled the Faculty in 2023 and have more than 50 points.
# Пребројте колку студенти го немаат завршено квизот од 14.03.2024 (статус in_progress). / Count how many students have not finished the quiz on 14.03.2024 with status in_progress

# Содржина на фајл OS1.txt / Contents of file OS1.txt - https://courses.finki.ukim.mk/pluginfile.php/269875/question/questiontext/710305/2/982584/OS1.txt?time=1710500609977
# Содржина на фајл OS2.txt / Contents of file OS2.txt - https://courses.finki.ukim.mk/pluginfile.php/269875/question/questiontext/710305/2/982584/OS2.txt?time=1710500632665

1.  231008@os2:~$ mkdir results

    231008@os2:~$ cd results

    231008@os2:~/results$ touch OS1.txt OS2.txt

    231008@os2:~/results$ ls

    OS1.txt  OS2.txt



2.  231008@os2:~/results$ vi OS1.txt

    231008@os2:~/results$ vi OS2.txt // so vi pristapuvam do datotekite i vo niv ja pastiram sodrzinata



3.  231008@os2:~/results$ cat OS1.txt

    231008@os2:~/results$ cat OS2.txt

    231008@os2:~/results$ cat OS1.txt OS2.txt



4.  231008@os2:~/results$ awk 'FNR==1 && NR!=1 {next} 1' *.txt > total.txt // za da go procita headerot na prvata datoteka i da go ignorira na posledovatelnite

    231008@os2:~/results$ cat total.txt



5.  231008@os2:~/results$ mkdir results_2023

    231008@os2:~/results$ mv total.txt results_2023/total.txt

    231008@os2:~/results$ ls

    OS1.txt  OS2.txt  results_2023

    231008@os2:~/results$ cd results_2023

    231008@os2:~/results/results_2023$ ls

    total.txt



6. 231008@os2:~/results/results_2023$ wc -lwm total.txt

    255 1000 9255 total.txt



7. 231008@os2:~/results/results_2023$ awk '$1 ~ /^22/ {print $1, $2, $3, $4}' total.txt

    228451 15.03.2024 finished 22.7

    229794 12.03.2024 finished 65.9

    229837 14.03.2024 finished 61.7

    .    .    .



8. 231008@os2:~/results/results_2023$ awk '$1 ~ /^23/ && $4 > 50 {print $1, $2, $3, $4}' total.txt

    237641 14.03.2024 in_progress 74.5

    239768 13.03.2024 in_progress 79.6

    238229 11.03.2024 in_progress 82.9

    .     .     .



9. 231008@os2:~/results/results_2023$ awk 'BEGIN {count=0} $2=="14.03.2024" && $3=="in_progress" {count++} END {

print count}' total.txt

   13
