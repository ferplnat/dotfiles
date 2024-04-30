#!/usr/bin/env bash

# Package installations
## Install i3 repo
/usr/lib/apt/apt-helper download-file https://debian.sur6r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734 &&
sudo apt install ./keyring.deb &&
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list

sudo apt update &&
sudo apt install -y \
    curl \
    git \
    htop \
    jq \
    python3 \
    python3-pip \
    python3-venv \
    ripgrep \
    fd-find \
    tree \
    zsh \
    zsh-syntax-highlighting \
    gh \
    i3

sudo apt autoremove -y
sudo apt remove tmux -y

# Remap caps to ctrl
setxkbmap -option caps:ctrl_modifier

