#!/usr/bin/env bash

if ! [ -d "/tmp/install-scripts" ]; then
    mkdir /tmp/install-scripts
fi

sudo apt install libevent-dev ncurses-dev build-essential bison pkg-config -y

cd /tmp/install-scripts || exit

curl -LO "https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz"
tar -xf ./*.tar.gz
rm ./*.tar.gz

cd tmux* || exit
./configure && make
sudo make install

echo "tmux has been installed"
sudo rm -rf /tmp/install-scripts/*
