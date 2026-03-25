#!/bin/bash

chemin="$1"
count=0

# Vérification
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

                echo "Nettoyage en cours..."

                # =====================================================
                # 1. FICHIERS DU DOSSIER PRINCIPAL
                # =====================================================
                for fichier in "$chemin"/*
                do
                    if test -f "$fichier"
                        then

                                case "$fichier" in

                                            *.tmp)
                                                            echo "Supprimé : $fichier"
                                                                            rm "$fichier"
                                                                                            count=$((count+1))
                                                                                                        ;;

                    *.log)
                                                                                                                                modif=$(stat -c %Y "$fichier")
                                                                                                                                                    now=$(date +%s)                                                                                                      diff=$(( (now - modif) / 60 ))


                           if test "$diff" -gt 3
                                                                                                                                                   then
                                                                                                                                            echo "Supprimé (ancien log) : $fichier"
                                                                                                                                 rm "$fichier"
                                                                                                                                                                                                                                                                count=$((count+1))
                                                                                                                                                                                                                                                         fi
                                                                                                                                                                                                                                                      ;;

                                                                                                                                                                                                                                                             esac
                                                                                                                                                                                                                                                        fi
                                                                                                                                                                                                                                                    done
  																														    # =====================================================
                                                                                                                                                                                                                                                 # 2. FICHIERS DANS logs/
                                                                                                                                                                                                                                                    # =====================================================

                                                                                                                                                                                                                                                  if test -d "$chemin/logs"
                                                                                                                                                                                                                                                  then
      																														  for fichier in "$chemin/logs"/*
                                                                                                                                                                                                                                                  do
                                                                                                                                                                                                                                                   if test -f "$fichier"
                                                                                                                                                                                                                                                    then

                                                                                                                                                                                                                                                    case "$fichier" in
                                                                                                                                                                                                                                                   *.log)

                                                                                                                                                                                                                                                                                                                                                                               modif=$(stat -c %Y "$fichier")
                                                                                                                                                                                                                                                                                                                                                                               now=$(date +%s)
                                                                                                                                                                                                                                                                                                                                                                               diff=$(( (now - modif) / 60 ))

                                                                                                                                                                                                                                                                                                                                                                                if test "$diff" -gt 3
																																													then
																																														echo "Supprimé (log ancien - logs/) : $fichier"
																																														rm "$fichier
			"																																											count=$((count+1))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  fi
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ;;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              esac  fi
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     done
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            fi
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     echo "Total : $count fichiers supprimés"
