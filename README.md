# BashScripts
The Github repository is a collection of Bash scripts designed to automate the installation of various popular tools on Linux-based operating systems.

Once Jenkins_Installation.sh is completed

# Edit and Add Services to Jenkins
systemctl edit jenkins

## Add the following between the two comments
[Service]
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Djava.io.tmpdir=/var/cache/jenkins/tmp/ -Dorg.apache.commons.jelly.tags.fmt.timeZone=Asia/Karachi -Duser.timezone=Asia/Karachi"
Environment="JENKINS_OPTS=--pluginroot=/var/cache/jenkins/plugins"

systemctl start jenkins

# Enter the Following Command to View the initial Admin Password
cat /var/lib/jenkins/secrets/initialAdminPassword

Open Jenkin in Browser
http://localhost:8080
