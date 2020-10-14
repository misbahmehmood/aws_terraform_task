#!/bin/bash

# update and install nginx
sudo apt update -y
sudo apt install nginx -y

# changing permissions to only allow owner read write permissions to default html file
chmod 644 /var/www/html/index.nginx-debian.html
cat > /var/www/html/index.nginx-debian.html << EOF
<!DOCTYPE html>
<html>

<head>
    <title>Static Web Page</title>
</head>

<style>
    div {
        width: 100%;
        height: 200px;
        display: flex;
        justify-content: center;
        align-items: center;
        background: grey;
        }
</style>

<body>
        <div>
                <h1>Web Page hosted on NGINX</h1>
        </div>
</body>

</html>

EOF
systemctl enable nginx
systemctl start nginx