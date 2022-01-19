#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
sudo yum remove -y java
sudo yum install jenkins java-1.8.0-openjdk-devel -y

echo "Install Maven"
sudo yum install -y maven 

echo "Install git"
sudo yum install -y git

sudo sudo amazon-linux-extras install epel
sudo yum update -y
sudo yum install ansible -y
sudo yum install nginx -y
sudo yum install python-pip -y  
sudo yum install awscli 
sudo yum install boto -y 
sudo cd /home 
sudo touch hug.yml 
sudo touch nat.yml 

echo " Install Terraform"
sudo yum install update -y 
sudo wget https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_amd64.zip 
sudo unzip terraform_1.1.2_linux_amd64.zip
sudo mv terraform /usr/bin/
terraform --version


echo "Install Docker engine"
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo usermod -a -G docker jenkins
sudo service docker start
sudo chkconfig docker on

echo "Install Jenkins"
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
yum install jenkins java-1.8.0-openjdk-devel -y
amazon-linux-extras install epel -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
systemctl daemon-reload



