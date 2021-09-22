apt update -y
apt install apache2 libapache2-mod-php -y
apt install mariadb-server -y
mysql_secure_installation
cd /etc/apache2/sites-available/
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/gsbfrais.conf
cd /var/www
wget https://github.com/wizelordss/TP-GSB.frais/raw/main/gsbfrais.tar.gz
tar -xzvf gsb_frais.tar.gz
mysql -u root -p
CREATE DATABASE gsb_frais;
CREATE USER 'gsb'@'localhost' IDENTIFIED BY 'gsbpass';
GRANT ALL PRIVILEGES ON . TO 'gsb'@'localhost';
flush privileges;
exit
mysql -u root -p gsb_frais < /home/damien/gsb_frais_structure.sql
mysql -u root -p gsb_frais < /home/damien/gsb_frais_insert_tables_statiques.sql
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/gsb_frais_structure.sql
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/gsb_frais_insert_tables_statiques.sql
cd /etc/apache2/sites-available/
a2dissite 000-default.conf
a2ensite gsb_frais.conf
sytemctl restart apache2
