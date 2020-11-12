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
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo service docker start
sudo useradd -u 12345 -G docker,google-sudoers,adm,video  -d /home/ansadmin -s /bin/bash -p $(echo pr0t3ct | openssl passwd -1 -stdin) ansadmin
sudo su root
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo su ansadmin
docker run -d --name play-devops-container -p 8081:8080 verholyak/play-devops-image:latest
sudo mkdir /home/ansadmin/.ssh 
sudo ssh-keygen -t rsa -f /home/ansadmin/.ssh/id_rsa -q -P ""