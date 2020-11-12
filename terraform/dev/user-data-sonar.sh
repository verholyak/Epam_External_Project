#!/bin/bash
yum -y update
yum -y install httpd

myip=`ipaddr=$(hostname -I)`

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Simple Web Page</title>
</head>
<body>
<font color="black">Made by Vova Verholyak<br><br>
<font color="black">Name Server: <font color="red">Development (test)<br>
<font color="black">PrivateIP: <font color="red">$myip<br>
<font color="magenta">Version 1.0<br>
<font color="black">
<h1 align="center">Hello World!</h1>
<p align="center">This is my TEST web page</p>
</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on

sudo yum install -y yum-utils
sudo wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"
sudo yum -y localinstall jdk-8u131-linux-x64.rpm
sudo rpm -Uvh https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
sudo yum -y install postgresql96-server postgresql96-contrib
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-6.4.zip
sudo yum -y install unzip
sudo unzip sonarqube-6.4.zip -d /opt
sudo mv /opt/sonarqube-6.4 /opt/sonarqube
sudo useradd -u 12345 -G docker,google-sudoers,adm,video  -d /home/ansadmin -s /bin/bash -p $(echo pr0t3ct | openssl passwd -1 -stdin) ansadmin
sudo su root
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo su ansadmin
docker run -d --name play-devops-container -p 8081:8080 verholyak/play-devops-image:latest
sudo mkdir /home/ansadmin/.ssh 
sudo ssh-keygen -t rsa -f /home/ansadmin/.ssh/id_rsa -q -P ""