#!/bin/bash 

fichier=0 

while IFS=, read -r col1 col2 col3 col4 col5 do
 username="$col2_$col3"
 mdp="$col4"
 role="$col5"
 echo "Création de l'user $username"

 if [ $username != "Nom" ]; then
   sudo useradd -m $username && sudo usermod -p $mdp $username;
   echo $mdp | ftpasswd --stdin --passwd --file=/etc/proftpd/ftp.passwd --name=$username --uid=60
   --gid=60 --home=/home/$username/ --shell=/bin/false
 fi

 if [ $role=="Admin" ]; then
    sudo usermod -aG sudo $username
 fi


done < $fichier
