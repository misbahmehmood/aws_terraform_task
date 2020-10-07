#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
echo "<h1> Static Web Server! </h1>" >> /usr/share/nginx/html/index.html
systemctl start nginx