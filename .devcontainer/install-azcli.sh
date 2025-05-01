#!/bin/bash
set -e

# Only install if az is missing
if ! command -v az &> /dev/null
then
  echo "Installing Azure CLI..."
  sudo apt update
  sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg
  curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  rm microsoft.gpg
  AZ_DISTRO=$(lsb_release -cs)
  echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_DISTRO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
  sudo apt update
  sudo apt install -y azure-cli
else
  echo "Azure CLI already installed"
fi
