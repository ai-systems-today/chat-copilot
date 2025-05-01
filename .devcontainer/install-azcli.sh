#!/bin/bash
set -e

echo "Installing Azure CLI..."
sudo apt update
sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_DISTRO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_DISTRO main" |
  sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt update
sudo apt install -y azure-cli
