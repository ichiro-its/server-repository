#!/bin/bash

DOMAIN="$2"
BASE_DIR="$1"

cat > "/home/$USER/nginx.conf" <<EOL
server {
 listen 80;
 listen [::]:80;

 server_name $DOMAIN www.$DOMAIN;

 location / {
   root /usr/share/nginx/html;
   autoindex on;
 }
}
EOL

docker run --name webs -p 80:80 -v $BASE_DIR:/usr/share/nginx/html:ro -v /home/$USER/nginx.conf:/etc/nginx/conf.d/default.conf:ro -d nginx
