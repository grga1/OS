# Напишете командна процедура која ќе прима произволен број на влезни аргументи кои означуваат времиња на извршување на програма изразени во минути.

# пример - bash script.sh 5 7 15 8 22 6 

# Потребно е процедурата да пресмета и испечати просечно времетраење на програмата според првите три извршувања (5, 7, 15 во примерот) претставено во секунди, како и бројот на извршувања на програмата (број на направени/внесени мерења).

# Доколку бројот на влезни аргументи е поголем или еднаков на 5, потребно е да се испечати 'The testing is done', додека доколку е помал од 5 - 'More testing is needed'.

# Излезот на примерот треба да биде следниот:
# Average execution time: 540
# Count of executions: 6
# The testing is done

# ------------------------------------------------------------------------------------------------------------------------------
# ------------------------------------------------------------------------------------------------------------------------------

# Write a command procedure that will receive an arbitrary number of input arguments representing execution times of a program expressed in minutes.

# Example - bash script.sh 5 7 15 8 22 6 

# The procedure should calculate and print the average duration of the program according to the first three executions (5, 7, 15 in the example) represented in seconds, as well as the number of program executions (the number of measurements made/entered).

# If the number of input arguments is grater than or equal to 5, it should print 'The testing is done', while if it is less than 5, it should print 'More testing is needed'.

# The output of the example should be as follows:
# Average execution time: 540
# Count of executions: 6
# The testing is done


231008@os2:~$ touch script.sh

231008@os2:~$ vi script.sh



#!/usr/bin/env bash



count=$#

sum=0



for i in {1..3} ;

do sum=$((sum+$i))

done



avg=$(( (($1+$2+$3)*60) / 3 ))



if [ $count -lt 5 ] ;

then

        status="More testing is needed"

else

        status="The testing is done"

fi



echo "Average execution time: $avg"

echo "Count of executions: $count"

echo "$status"



231008@os2:~$ bash script.sh 5 7 15 8 22 6

Average execution time: 540

Count of executions: 6

The testing is done



231008@os2:~$ bash script.sh 4 4 3

Average execution time: 220

Count of executions: 3

More testing is needed
