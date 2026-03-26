#!/bin/bash

# Script principal de SysKit
# Permet d'exécuter différentes commandes selon l'argument
commande="$1"

if test "$commande" = ""
then
echo "Erreur : aucune commande donnée"
echo "Usage : ./syskit.sh {inventory|backup|cleanup|report}"
exit 1
fi

case "$commande" in

inventory)
bash modules/inventory.sh
;;

backup)
bash modules/backup.sh "$2"
;;

cleanup)
bash modules/cleanup.sh "$2"
;;

report)
bash modules/report.sh
;;

*)
echo "Commande inconnue"
;;

esac
