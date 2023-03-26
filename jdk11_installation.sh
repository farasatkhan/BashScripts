#!/bin/bash

# Ensure the necessary packages are present
apt install -y wget apt-transport-https

# Download the Eclipse Adoptium GPG key
mkdir -p /etc/apt/keyrings
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc

# Configure the Eclipse Adoptium apt repository
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list

# Install the Temurin version you require
apt update
apt install -y temurin-11-jdk