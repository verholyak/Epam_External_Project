#!/bin/bash
yum -y update
yum -y install httpd


myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Simple Web Page</title>
</head>
<body>
<font color="black">Made by Vova Verholyak<br><br>
<font color="black">Name Server: <font color="red">Staging<br>
<font color="black">PrivateIP: <font color="red">$myip<br>
<font color="magenta">Version 3.0<br>
<font color="black">
<h1 align="center">Hello World!</h1>
<p align="center">This is my web page</p>
</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on

sudo amazon-linux-extras install docker -y
sudo service docker start
sudo useradd -u 12345 -G docker,systemd-journal,wheel,adm  -d /home/ansadmin -s /bin/bash -p $(echo pr0t3ct | openssl passwd -1 -stdin) ansadmin
sudo su root
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo su ansadmin
docker run -d --name play-devops-container -p 8081:8080 verholyak/play-devops-image:latest
sudo mkdir /home/ansadmin/.ssh && ssh-keygen -t rsa -f /home/ansadmin/.ssh/id_rsa -q -P ""