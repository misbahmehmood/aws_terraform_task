#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo cat > /var/www/html/index.nginx-debian.html << EOF
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