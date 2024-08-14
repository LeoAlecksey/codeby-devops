#!/bin/sh
apt install -y curl
apt install -y nginx
adduser -D -g 'www' www
chown -R www:www /opt/www
chmod -R 755 /opt/www
rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default