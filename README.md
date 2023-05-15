# BashScripts
The Github repository is a collection of Bash scripts designed to automate the installation of various popular tools on Linux-based operating systems.

Upon completion of the Jenkins_Installation.sh script, follow these steps to edit and add services to Jenkins:

1.  Edit the Jenkins service by running the following command:
```
sudo systemctl edit jenkins
```
2.  Add the following lines between the two comments:
```
[Service]
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Djava.io.tmpdir=/var/cache/jenkins/tmp/ -Dorg.apache.commons.jelly.tags.fmt.timeZone=Asia/Karachi -Duser.timezone=Asia/Karachi"
Environment="JENKINS_OPTS=--pluginroot=/var/cache/jenkins/plugins"
```
3.  Start the Jenkins service by running the following command:

```
sudo systemctl start jenkins
```
4.  Retrieve the initial admin password by running the following command:
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
5.  Finally, open Jenkins in your browser by visiting the following URL:
```
http://localhost:8080
```
6. Enter the Password Obtained in Step 4, and Click on Install Plugins.
