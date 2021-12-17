

#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
yum remove -y java
yum install jenkins java-1.8.0-openjdk-devel -y

echo "Install Maven"
yum install -y maven 

echo "Install git"
yum install -y git

amazon-linux-extras install epel
yum update -y
yum install ansible -y
yum install nginx -y
yum install python-pip -y  
yum install awscli 
yum install boto -y 
cd /home 
touch hug.yml 
touch nat.yml 


echo "Install Docker engine"
yum update -y
yum install docker -y
systemctl start docker
systemctl enable docker
systemctl status docker
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on

echo "Install Jenkins"
yum update -y
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum upgrade
yum install jenkins java-1.8.0-openjdk-devel -y
amazon-linux-extras install epel -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
systemctl daemon-reload



