#!/bin/bash
apt-get install curl

# Download and import Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add a Jenkins apt repository entry
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update your local package index, then finally install Jenkins
apt-get update
apt-get install fontconfig
apt-get install openjdk-11-jre
apt-get install -y jenkins