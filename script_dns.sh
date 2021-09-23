apt update -y
apt install bind9 -y
cd /etc
rm host.conf
rm resolv.conf
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/host.conf
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/resolv.conf
cd bind/
rm named.conf.local
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/db.gsb.lan
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/db.gsb.lan.rev
wget https://raw.githubusercontent.com/wizelordss/TP-GSB.frais/main/named.conf.local
systemctl restart bind9
