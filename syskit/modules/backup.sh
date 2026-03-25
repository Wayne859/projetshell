#!/bin/bash

dossier="$1"

if test "$dossier" = ""
then
echo "Erreur : veuillez donner un dossier"
exit 1
fi

if test ! -d "$dossier" 
then
echo "Erreur : dossier inexistant"
exit 1
fi

date=$(date +%Y-%m-%d)
nom=$(basename "$dossier")
mkdir -p backup
archive="backup/${nom}_${date}.tar"

tar -cvf "$archive" "$dossier"

echo "Sauvegarde créée : $archive"

echo "$archive" >> logs/backup.log
