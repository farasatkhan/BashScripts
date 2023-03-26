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

# Stop the Jenkins service
systemctl stop jenkins

# Define the content to be added
service_OPTS="[Service]\nEnvironment=\"JAVA_OPTS=-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Djava.io.tmpdir=/var/cache/jenkins/tmp/ -Dorg.apache.commons.jelly.tags.fmt.timeZone=Asia/Karachi -Duser.timezone=Asia/Karachi\"\nEnvironment=\"JENKINS_OPTS=--pluginroot=/var/cache/jenkins/plugins\""

# Use sed to add the content to the file
sudo sed -i '3i\'"$service_OPTS"'' /etc/systemd/system/jenkins.service.d/override.conf

# Reload the systemd configuration
sudo systemctl daemon-reload

# Restart Jenkins service to apply the changes
# sudo systemctl restart jenkins.service

mkdir -p /var/cache/jenkins/tmp

chown -R jenkins:jenkins /var/cache/jenkins/tmp

# Check the status of the Jenkins service
# systemctl --full status jenkins

systemctl start jenkins

# Initial Admin Password
cat /var/lib/jenkins/secrets/initialAdminPassword

# Open Jenkins in Browser
xdg-open "http://jenkins:8080"



# Edit and Add Services to Jenkins
# systemctl edit jenkins

# [Service]
# Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Djava.io.tmpdir=/var/cache/jenkins/tmp/ -Dorg.apache.commons.jelly.tags.fmt.timeZone=Asia/Karachi -Duser.timezone=Asia/Karachi"
# Environment="JENKINS_OPTS=--pluginroot=/var/cache/jenkins/plugins"