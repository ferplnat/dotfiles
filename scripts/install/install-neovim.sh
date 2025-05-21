#!/bin/bash

set -eux -o pipefail

downloadUri="https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
packageManager=""
installDir="/opt/nvim"

if type -P "sw_vers" > /dev/null 2>&1; then
    downloadUri="https://github.com/neovim/neovim/releases/download/stable/nvim-macos-arm64.tar.gz"
    packageManager="brew"
fi

if [ "$packageManager" == "" ] || ! type -P $packageManager > /dev/null 2>&1; then
    echo "Package manager not found: $packageManager"
    exit 1
fi

if ! type -P "go" > /dev/null 2>&1; then
    $packageManager install golang -y
fi

mkdir -p "$installDir"

curl -L "$downloadUri" | tar xvzf - --strip-components=1 -C "$installDir"

if ! [ -d "/usr/local/bin" ]; then
    mkdir -p "/usr/local/bin"
fi

if ! type -P "nvim" > /dev/null 2>&1; then
    ln -s "$installDir/bin/nvim" "/usr/local/bin/nvim"
fi
