debconf-set-selections <<< 'mysql-server mysql-server/root_password password qwer1350'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password qwer1350'
apt-get install mysql-server -y
mysql -u root -pqwer1350  -e 'drop database IF EXISTS emmaus;'
mysql -u root -pqwer1350  -e 'CREATE DATABASE emmaus;'
mysql -u root -pqwer1350  -e 'FLUSH PRIVILEGES;'
#mysql -u root -pqwer1350 emmaus < dbecsdev.sql

