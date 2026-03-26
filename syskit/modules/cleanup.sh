#!/bin/bash

chemin="$1"
count=0

if test "$chemin" = ""
then
echo "Erreur : chemin manquant"
exit 1
fi

if test ! -d "$chemin" 
then
echo "Erreur : dossier invalide"
exit 1
fi

for fichier in "$chemin"/*
do

if [[ "$fichier" == *.tmp || "$fichier" == *.log  ]]
then

rm "$fichier"
echo "Supprimé : $fichier"

count=$((count+1))

fi

done

echo "$count fichiers supprimés"

echo "$count fichiers supprimé
mkdir -p logs
le $(date)" >> logs/cleanup.log
