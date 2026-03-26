#!/bin/bash

# Script pour afficher les informations du système
show_os() {
echo "Système d'exploitation :"
uname -o
}

show_kernel() {
echo "Version du noyau :"
uname -r
}

show_cpu() {
echo "Processeur :"
lscpu | grep "Model name"
}

show_ram() {
echo "Mémoire RAM :"
free -h
}

show_disk() {
echo "Espace disque :"
df -h
}

show_ip() {
echo "Adresse IP :"
hostname -I
}

echo "===== INVENTORY ====="

show_os
show_kernel
show_cpu
show_ram
show_disk
show_ip
