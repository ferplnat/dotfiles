#!/usr/bin/env bash

cd /usr/local || exit

if [ -d /usr/local/go ]; then
    rm -rf /usr/local/go
fi

sudo curl -LO "https://go.dev/dl/go1.22.2.linux-amd64.tar.gz" &&
sudo tar -xf "go1.22.2.linux-amd64.tar.gz" &&
sudo rm "go1.22.2.linux-amd64.tar.gz"
