#!/bin/bash

read -r -p "Voulez vous installer le service FTP ? [O/n]" ynftp
case $ynftp in 
    [Oo])sudo apt install  proftpd && sudo service proftpd start;;
    [Nn]) exit;; 
    *) echo "reponse non valide" 
esac
    

read -r -p  "Mettre en place l'utilisateur anonyme ? [O/n]" reponse
case $reponse in
    [Oo])echo "modification de proftpd.conf"; sed -i -r '164,203s/^#//' /etc/proftpd/proftpd.conf; chmod 777 -R /home;; 
    [Nn]) echo "Pas de config pour utilisateur anonyme installé";;
     *) echo "réponse invalide";;
esac


read -r -p "Mettre en place TLS/SSL ?  [O/n]" On
case $On in 
    [Oo]) echo "modification de proftpd.conf";
	    sed -i -r '143s/^#//' /etc/proftpd/proftpd.conf;
	    echo "modification de tls.conf";
            sed -i -r '10,12s/^#//' /etc/proftpd/tls.conf;
            sed -i -r '49,50s/^#//' /etc/proftpd/tls.conf;
            sed -i -r '27,280s/^#//' /etc/proftpd/tls.conf;
            sed -i -r '45s/^#//' /etc/proftpd/tls.conf;
	    echo "génération des clés" 
            openssl genrsa -out /etc/ssl/private/proftpd.key 1024;
            openssl req -new -x509 -days 3650 -key /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt;
          sudo  service proftpd restart;;
     [Nn]) echo "Pas d'installation des configuration FTPS";;
      *) echo "réponse invalide";;
esac


