# да се сумираат цените на лаптопите според производител на графичка картичка (Nvidia, AMD)
# со една команда (https://courses.finki.ukim.mk/pluginfile.php/275408/mod_resource/content/1/laptops.csv)
$ awk -F "," 'BEGIN{count1=0;count2=0;sum1=0;sum2=0} $5~/Nvidia/{count1++;sum1+=$7;} $5~/AMD/{count2++;sum2+=$7} END{print "Nvidia",sum1/count1; print "AMD",sum2/count2}' laptops.csv
