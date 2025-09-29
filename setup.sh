#!/bin/bash

# ============================================
# Automatyczna aktualizacja i instalacja narzędzi
# ============================================

set -e

echo "--------------------------------------------"
echo "Aktualizacja listy pakietów oraz systemu..."
echo "--------------------------------------------"
sudo apt clean
sudo apt update && sudo apt upgrade -y

echo "--------------------------------------------"
echo "Instalacja wybranych narzędzi:"
echo "  - git"
echo "  - curl"
echo "  - wget"
echo "  - unzip"
echo "  - htop"
echo "  - tree"
echo "  - jq"
echo "--------------------------------------------"
sudo apt install -y \
    git \
    curl \
    wget \
    unzip \
    htop \
    tree \
    jq

echo "--------------------------------------------"
echo "Instalacja Dockera..."
echo "--------------------------------------------"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
rm get-docker.sh

echo "--------------------------------------------"
echo "Konfiguracja GIT..."
echo "--------------------------------------------"
git config --global user.name "Szymon"
git config --global user.email "larctorn@gmail.com"
git config --global alias.s "status -s"
git config --global alias.lg "log --oneline --graph --decorate"
git config --global alias.amend "commit --amend --no-edit"
git config --global alias.undo "reset HEAD~1 --mixed"

echo "--------------------------------------------"
echo "Instalacja zakończona sukcesem!"
echo "--------------------------------------------"
sudo reboot
