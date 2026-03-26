#!/bin/bash

rapport="reports/report.txt"

echo "===== RAPPORT SYSKIT =====" > "$rapport"
echo "Date : $(date)" >> "$rapport"
echo "" >> "$rapport"
mkdir -p reports
echo "===== INFORMATIONS SYSTEME =====" >> "$rapport"
uname -a >> "$rapport"
echo "" >> "$rapport"

echo "===== SAUVEGARDES REALISEES =====" >> "$rapport"

if test -f logs/backup.log 
then
    cat logs/backup.log >> "$rapport"
else
    echo "Aucune sauvegarde" >> "$rapport"
fi

echo "" >> "$rapport"

echo "===== NETTOYAGE =====" >> "$rapport"

if test -f logs/cleanup.log 
then
    cat logs/cleanup.log >> "$rapport"
else
    echo "Aucun nettoyage effectué" >> "$rapport"
fi

echo "" >> "$rapport"
echo "Rapport généré dans $rapport"
