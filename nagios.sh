sudo apt-get update -y
sudo apt-get install nagios-plugins nagios-nrpe-server -y
#### Add the private IP address of your Nagios server
sed -i 's/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1,13.232.131.53/g' /etc/nagios/nrpe.cfg
#### Enter private IP address of this host(Node Machine)
sed -i 's/#server_address=127.0.0.1/server_address=172.31.28.172/g' /etc/nagios/nrpe.cfg
sudo service nagios-nrpe-server restart
