#!/bin/bash

########################
# Author : Niwantha Wickramasingha
# Date : 2024-04-27
# Version : V1.0
# Purpose :  For the install Azure Cli in Debian (Ubuntu)
# ######################

echo "Hello.... Start Processing!!!"

sleep 2

apt update -y

sleep 2

echo "System update Done!!"

sleep 2

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_DIST=$(lsb_release -cs)
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

sudo apt-get update
sudo apt-get install azure-cli

echo "############################"
echo "############################"
echo "#### Azure cli Install Done!!"
echo "############################"
echo "############################"
