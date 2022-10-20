#!/bin/bash
sudo apt install -y proftpd-*;
service proftpd start;
sed -i -r '164,203s/^#//' /etc/proftpd/proftpd.conf;
chmod 777 -R /home;
sed -i -r '143s/^#//' /etc/proftpd/proftpd.conf;
sed -i -r '10,12s/^#//' /etc/proftpd/tls.conf;
sed -i -r '49,50s/^#//' /etc/proftpd/tls.conf;
sed -i -r '27,280s/^#//' /etc/proftpd/tls.conf;
sed -i -r '45s/^#//' /etc/proftpd/tls.conf;
openssl genrsa -out /etc/ssl/private/proftpd.key 1024;
openssl req -new -x509 -days 3650 -key /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt
service proftpd restart;
