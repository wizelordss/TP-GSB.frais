apt update -y && apt upgrade -y
apt install apache2 libapache2-mod-php php-mysql -y
apt install mariadb-server -y
mysql_secure_installation
cd /etc/apache2/sites-available/
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/gsbfrais.conf
cd /var/www
wget https://github.com/wizelordss/TP-GSB.frais/raw/main/gsbfrais.tar.gz
tar -xzvf gsbfrais.tar.gz
mysql -e "CREATE DATABASE gsb_frais;"
mysql -e "CREATE USER 'gsb'@'localhost' IDENTIFIED BY 'gsbpass';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'gsb'@'localhost';"
mysql -e "flush privileges;"
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/gsb_frais_structure.sql
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/gsb_frais_insert_tables_statiques.sql
mysql -u root gsb_frais < gsb_frais_structure.sql
mysql -u root gsb_frais < gsb_frais_insert_tables_statiques.sql
cd /etc/apache2/sites-available/
a2dissite 000-default.conf
a2ensite gsbfrais.conf
systemctl restart apache2
