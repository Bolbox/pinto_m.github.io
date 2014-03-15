#!/bin/bash

echo "Entrez votre nom :"
read user_name

if [ ! -f "$user_name"".log" ]
then
	echo "Votre fichier log se cree ..."
	touch "$user_name"".log"
else
	echo "Votre fichier est cree !"
fi

echo "Entrez votre lien github (qui contient le dossier) :"
read github_site

git clone "$github_site" #https://github.com/ShellAchievements/ShellAchievements.github.io

echo -n "Le dossier a bien ete cree ! \n"
read answ

if [ "$answ" == "y" ]
then
	echo "Entrez le nom du dossier :"
	read folder_name
else
	echo -n "Entrez votre lien github :"
	read github_site
	echo "Entrez le nom du dossier : \n"
	read folder_name
fi

while [ ! -d "$folder_name" ]
do
	echo "Dossier non existant !"
	echo "(Si le dossier n'est pas cree, lien incorrect "glink")"
	read ans
	if [ "$ans" == "glink" ]
	then
		echo -n "Entrez votre lien github : \n"
		read github_site
	fi
	echo "Entrez le nom du dossier : \n"
	read folder_name
done

echo "Le dossier est lie au log !"

declare c_ls=`grep -w "ls" "$user_name"".log" | cut -d " " -f3`
declare c_commit=`grep -w "commit" "$user_name"".log" | cut -d " " -f3`
declare c_mkdir=`grep -w "mkdir" "$user_name"".log" | cut -d " " -f3`
declare c_cd=`grep -w "cd" "$user_name"".log" | cut -d " " -f3`
declare c_mv=`grep -w "mv" "$user_name"".log" | cut -d " " -f3`
declare c_clone=`grep -w "clone" "$user_name"".log" | cut -d " " -f3`
declare c_emacs=`grep -w "emacs" "$user_name"".log" | cut -d " " -f3`
declare c_rm=`grep -w "rm" "$user_name"".log" | cut -d " " -f3`
declare c_clean=`grep -w "clean" "$user_name"".log" | cut -d " " -f3`
declare c_svn=`grep -w "svn" "$user_name"".log" | cut -d " " -f3`

 if [[ c_ls -le 10 ]]; then
 sed -i s/\"ls\"\ \class=\"red\"/\"ls\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

 if [[ c_commit -le 10 ]]; then
 sed -i s/\"commit\"\ \class=\"red\"/\"commit\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

 if [[ c_mkdir -le 10 ]]; then
 sed -i s/\"mkdir\"\ \class=\"red\"/\"mkdir\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

 if [[ c_cd -le 10 ]]; then
 sed -i s/\"cd\"\ \class=\"red\"/\"cd\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

 if [[ c_mv -le 10 ]]; then
 sed -i s/\"mv\"\ \class=\"red\"/\"mv\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

 if [[ c_clone -le 10 ]]; then
 sed -i s/\"clone\"\ \class=\"red\"/\"clone\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

if [[ c_emacs -le 10 ]]; then
 sed -i s/\"emacs\"\ \class=\"red\"/\"emacs\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

 if [[ c_rm -le 10 ]]; then
 sed -i s/\"rm\"\ \class=\"red\"/\"rm\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

 if [[ c_clean -le 10 ]]; then
 sed -i s/\"clean\"\ \class=\"red\"/\"clean\"\ \class=\"completed\"/g "$folder_name"/index.html
 fi

if [[ c_svn -le 10 ]]; then
sed -i s/\"svn\"\ \class=\"red\"/\"svn\"\ \class=\"completed\"/g "$folder_name"/index.html
fi
