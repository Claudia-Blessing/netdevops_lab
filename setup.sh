#!/bin/bash

# ce script est utilisé pour mettre à jour et installer les paquets essentiels

set -e

echo "Début de l'exécution du script"

# Mise à jour
echo "Update & Upgrade"
sudo apt update -y
sudo apt upgrade -y

# Installation des paquets
echo "Installation des paquets essentiels"
packages=(
    git
    curl
    wget
    vim
    net-tools
    iproute2
    ca-certificates
    gnupg
    lsb-release
)

for pkg in "${packages[@]}"; do
    echo "Installation de $pkg"
    sudo apt install -y "$pkg"
done

echo " Installation du setup terminé avec succès !"