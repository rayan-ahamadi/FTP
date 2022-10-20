#!/bin/bash 

date=$(date +%d-%m-%Y-%H:%M)

mkdir /home/rayan/script/Backup/save_systems;
rsync -av /home /home/rayan/script/Backup/save_systems;
tar -czf /home/rayan/script/Backup/backup_$date.tar /home/rayan/script/Backup/save_systems &&
rm -r /home/rayan/script/Backup/save_systems;
sudo chmod 777 -R /home/rayan/script/Backup/backup_$date.tar
sshpass -f "/home/rayan/script/Backup/pswd_rayan.txt" scp -r -p /home/rayan/script/Backup/backup_$date.tar rayan@192.168.44.128:/home/rayan/Documents/backup_str_ftp ;


