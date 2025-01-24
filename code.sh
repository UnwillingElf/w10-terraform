#!/bin/bash
sudo su
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<html><head><style>body { background-color: purple; color: white; }</style></head><body><h1><p> Hey baby!.<br> You are so so beautiful ${HOSTNAME} Love you!.</p></h1></body></html>" > /var/www/html/index.html