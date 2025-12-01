#!/bin/bash
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "<h1>Deployed from Terraform - Day 3</h1>" > /var/www/html/index.html
