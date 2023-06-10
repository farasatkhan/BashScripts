# BashScripts
The Github repository is a collection of Bash scripts designed to automate the installation of various popular tools on Linux-based operating systems.

Upon completion of the Jenkins_Installation.sh script, follow these steps to configure it:

1.  Start the Jenkins service if not running already by running the following command:

```
sudo systemctl start jenkins
```
2.  Retrieve the initial admin password by running the following command:
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
3.  Finally, open Jenkins in your browser by visiting the following URL:
```
http://localhost:8080
```
4. Enter the Password Obtained in Step 4, and Click on Install Plugins.
