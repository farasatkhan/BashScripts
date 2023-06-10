#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run with root privileges."
  exit 1
fi

apt-get install curl

# Download and import Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add a Jenkins apt repository entry
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update your local package index, then finally install Jenkins
apt-get update
apt-get install -y fontconfig
apt-get install -y openjdk-11-jre
apt-get install -y jenkins
