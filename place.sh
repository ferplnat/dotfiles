#!/usr/bin/env bash

set -eux -o pipefail

cp -f "./tmux/.tmux.conf" "$HOME/"
cp -f "./.zshrc" "$HOME/"
cp -f "./.ripgreprc" "$HOME/"

mkdir -p "$HOME/.config/ghostty/"
cp -f "./ghostty/config" "$HOME/.config/ghostty/"

cp -rf "./scripts/." "$HOME/.local/bin"
