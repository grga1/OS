$ ls -l|grep "^-"|awk '{print $9}'|grep "^[0-9][a-z][a-z]*\.out"
