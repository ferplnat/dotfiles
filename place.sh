#!/usr/bin/env bash

set -eux -o pipefail

cp -f "./tmux/.tmux.conf" "$HOME/"
cp -f "./.zshrc" "$HOME/"

mkdir -p "$HOME/.config/ghostty/"
cp -f "./ghostty/config" "$HOME/.config/ghostty/"

mkdir -p "$HOME/.local/bin/scripts"
cp -rf "./scripts" "$HOME/.local/bin"
