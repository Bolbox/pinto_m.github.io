#!/bin/bash

echo -n "Entrez votre nom : \n"
read user_name

if [ ! -f "$user_name"".log" ]
then
    echo "Creation of your log file..."
    touch "$user_name"".log"
else
    echo "Votre fichier log est maintenant cree !"
fi

echo -n "Entrez votre lien git (qui contient le dossier) : \n"
read github_site

git clone github_site https://github.com/Bolbox/pinto_m.github.io.git

echo -n "Votre fichier a ete cloner (y/n) : \n"
read answ

if [answ == "y"]
then
    echo "Enter folder's name : \n"
    read folder_name
else
    echo -n "Enter your github link : \n"
    read github_site
    echo "Enter folder's name : \n"
    read folder_name
fi

ok = 0

while [ ! -d "$folder_name" ]
do
    echo "This folder doesn't exist here !"
    echo "(if no folder have been created there is a mistake in your github link so answer "glink")"
    read ans
    if [ans == "glink"]
	then
	echo -n "Enter your github link : \n"
	read github_site
	fi
    echo "Enter folder's name : \n"
    read folder_name
done

echo "Ok, the folder is linked to your log file"


done

c_ls = grep -w "ls" "$user_name"".log" | cut -d " " -f3
c_commit = grep -w "commit" "$user_name"".log" | cut -d " " -f3
c_mkdir = grep -w "mkdir" "$user_name"".log" | cut -d " " -f3
c_cd = grep -w "cd" "$user_name"".log" | cut -d " " -f3
c_mv = grep -w "mv" "$user_name"".log" | cut -d " " -f3
c_clone = grep -w "clone" "$user_name"".log" | cut -d " " -f3
c_emacs = grep -w "emacs" "$user_name"".log" | cut -d " " -f3
c_rm = grep -w "rm" "$user_name"".log" | cut -d " " -f3
c_clean = grep -w "clean" "$user_name"".log" | cut -d " " -f3
c_svn = grep -w "svn" "$user_name"".log" | cut -d " " -f3

 if [ c_ls >= 1 ]
 then
 sed -i 's/"ls" class="grey"/"ls" class="completed"/g' "$folder_name"/index.html
 fi
 if [ c_commit >= 1 ]
 then
 sed -i 's/"commit" class="grey"/"commit" class="completed"/g' "$folder_name"/index.html
 fi
 if [ c_mkdir >= 1 ]
 then
 sed -i 's/"mkdir" class="grey"/"mkdir" class="completed"/g' "$folder_name"/index.html
 fi
 if [ c_cd >= 1 ]
 then
 sed -i 's/"cd" class="grey"/"cd" class="completed"/g' "$folder_name"/index.html
 fi
 if [ c_mv >= 1 ]
 then
 sed -i 's/"mv" class="grey"/"mv" class="completed"/g' "$folder_name"/index.html
 fi
 if [ c_clone >= 1 ]
 then
 sed -i 's/"clone" class="grey"/"clone" class="completed"/g' "$folder_name"/index.html
 fi
 if [ c_emacs >= 1 ]
 then
 sed -i 's/"emacs" class="grey"/"emacs" class="completed"/g' "$folder_name"/index.html
 fi
 if [ c_rm >= 1 ]
 then
 sed -i 's/"rm" class="grey"/"rm" class="completed"/g' "$folder_name"/index.html
 fi
 if [ c_clean >= 1 ]
 then
 sed -i 's/"clean" class="grey"/"clean" class="completed"/g' "$folder_name"/index.html
 fi
if [ c_svn >= 1 ]
then
sed -i 's/"svn" class="red"/"svn" class="completed"/g' "$folder_name"/index.html
fi
