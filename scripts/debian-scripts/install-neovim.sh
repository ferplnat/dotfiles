#!/usr/bin/env bash

echo "Installing neovim nightly from Github..."

cd /opt || exit

sudo curl -LO "https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz" &&
sudo tar -xf ./*.tar.gz &&
sudo rm ./*.tar.gz &&
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

echo "Installing node (dependency)"
sudo curl -LO "https://nodejs.org/dist/v20.12.1/node-v20.12.1-linux-x64.tar.xz" &&
sudo tar -xf ./*.tar.xz &&
sudo rm ./*.tar.xz &&
sudo ln -s "/opt/node-v20.12.1-linux-x64/bin/corepack" "/usr/local/bin/corepack" &&
sudo ln -s "/opt/node-v20.12.1-linux-x64/bin/npm" "/usr/local/bin/npm" &&
sudo ln -s "/opt/node-v20.12.1-linux-x64/bin/npx" "/usr/local/bin/npx" &&
sudo ln -s "/opt/node-v20.12.1-linux-x64/bin/node" "/usr/local/bin/node"

echo "Installing unzip"
sudo apt install unzip

echo "Installing rg and fd"
sudo apt install ripgrep

sudo apt install fd-find
if [ -z "$(which fd)" ]; then
    echo "fd not found, creating symlink..."
    sudo ln -s "$(which fdfind)" "/usr/local/bin/fd"
fi
