#!/bin/bash

apt-get install curl

# Jenkins Debian Packages -- Installation
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add a Jenkins apt repository entry
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update your local package index, then finally install Jenkins
apt-get update
apt-get install fontconfig
apt-get install -y jenkins

# Update the default editor to vim
apt-get install -y vim

update-alternatives --set editor /usr/bin/vim.basic

# Restart Jenkins service to apply the changes
# sudo systemctl restart jenkins.service
mkdir -p /var/cache/jenkins/tmp
chown -R jenkins:jenkins /var/cache/jenkins/tmp

# Stop the Jenkins service
systemctl stop jenkins

# Check the status of the Jenkins service
# systemctl --full status jenkins