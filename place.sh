#!/usr/bin/env bash

cp ./tmux/.tmux.conf ~/
cp ./.zshrc ~/

mkdir -p ~/.local/bin/scripts
cp -rf ./scripts ~/.local/bin/scripts
