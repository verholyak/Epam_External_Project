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

sudo rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-agent-5.0.0-1.el7.x86_64.rpm
sudo yum install -y zabbix-agent
sudo useradd -u 12345 -G docker,google-sudoers,adm,video  -d /home/ansadmin -s /bin/bash -p $(echo pr0t3ct | openssl passwd -1 -stdin) ansadmin
sudo su root
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sudo su ansadmin
sudo mkdir /home/ansadmin/.ssh 
sudo ssh-keygen -t rsa -f /home/ansadmin/.ssh/id_rsa -q -P ""