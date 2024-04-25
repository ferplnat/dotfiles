#!/usr/bin/env bash

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az extension add --name azure-devops
wget -qO- https://aka.ms/install-artifacts-credprovider.sh | bash
