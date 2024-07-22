#! /bin/bash
echo "Start backup"
sudo  mysqldump -u alex -pAm3ric@ Homework > /opt/mysql_backup/dumpSQL_$(date +"%Y-%m-%d_%H:%M").sql
echo "backup ready"
