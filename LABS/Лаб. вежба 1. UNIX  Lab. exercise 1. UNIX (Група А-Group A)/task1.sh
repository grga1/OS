# Креирајте директориуми со име directory1 и directory2 и во првиот директориум додади датотека со име file123. / Create directories with names directory1 and directory2 and in the first directory add a file named file123.
# Напишете команда со која ќе ја прочитате помошната документација за командата ls. / Write a command to read the manual for the command ls.
# Променете ги пермисиите на фајлот file123 така што истиот може да го читаат и извршуваат само корисникот и неговата група. / Change the file permissions for the file named file123 so that it can be read and executed by the user and the group.
# Направете го претходното барање на друг начин. / Do the previous request in another way.
# Напишете команда со која ќе добиете информација кој сé е тековно најавен на системот./ Write a command to get the info about the users which are currently logged in on the system.
# Премести ја креираната датотека од directory1 во directory2 при што ќе го смените името на датотеката во file234 / Move the created file from directory1 to directory2 and change the name of the file to file234
# Избришете го директориумот directory1 кој го креиравте во рамки на оваа вежба заедно со целосната негова содржина. / Delete directory1 created in this exercise together with its content.

1. 231008@os2:~$ mkdir directory1 directory2

   231008@os2:~$ cd directory1

   231008@os2:~/directory1$ touch file123



2. 231008@os2:~$ ls --help

    Usage: ls [OPTION]... [FILE]...

    List information about the FILEs (the current directory by default).



3. 231008@os2:~/directory1$ chmod ug=rx file123

   231008@os2:~/directory1$ ls -l file123

    -r-xr-xr-- 1 231008 domain users 0 Mar  12 13:24 file123



4. 231008@os2:~/directory1$ chmod u=rx file123 && chmod g=rx file123

   231008@os2:~/directory1$ ls -l file123

    -r-xr-xr-- 1 231008 domain users 0 Mar  12 13:24 file123



5. 231008@os2:~$ users // moze i so w za povekje info za tekovno najavenite korisnici

    204002 221082 221082 223043 223286 223286 231018 231036 231049 231082 231140 231140 231140 231140 231173 231192 231236231254          232004 233051 233090 233131 233141 236044 236044 236044



6. 231008@os2:~$ mv directory1/file123 directory2/file234

   231008@os2:~$ ls directory1

   231008@os2:~$ ls directory2

    file234



7. 231008@os2:~$ rm -r directory1

   231008@os2:~$ ls

    directory2
