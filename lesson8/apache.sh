#! /bin/bash
sudo apt update && apt -y upgrade
sudo apt install -y apache2
sudo systemctl start apache2 && systemctl enable apache2
sudo a2enmod rewrite
sudo mkdir -p /var/www/alex/html
sudo chown -R $USER:$USER /var/www/alex
a2enmod ssl
sudo chmod 644 /home/vagrant/index.html
sudo chmod 644 /home/vagrant/domain.crt
sudo chmod 644 /home/vagrant/domain.key
sudo chmod 644 /home/vagrant/alex.conf
sudo cp /home/vagrant/index.html /var/www/alex/html/index.html
sudo cp /home/vagrant/domain.crt /etc/ssl/certs/domain.crt
sudo cp /home/vagrant/domain.key /etc/ssl/private/domain.key
sudo cp /home/vagrant/alex.conf /etc/apache2/sites-available/alex.conf
sudo echo 'NameVirtualHost *:443' >> /etc/apache2/apache2.conf
sudo touch  /etc/apache2/conf-available/alex.conf
sudo echo 'ServerName alex.ru' >> /etc/apache2/conf-available/alex.conf
sudo touch ./.htaccess
sudo echo "RewriteEngine On" >> ./.htaccess
sudo echo "RewriteCond %{HTTPS} !=on" >> ./.htaccess
sudo echo "RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]" >> ./.htaccess
a2ensite alex.conf 
a2enconf alex 
a2dissite 000-default.conf
sudo systemctl restart apache2
