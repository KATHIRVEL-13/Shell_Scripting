#!/bin/bash
FILE="kathir.txt"

SOURCE="/home/redhat/$FILE"

mkdir -p "/home/redhat/backup_kathir"

DESTINATION="/home/redhat/backup_kathir"

DATE=$(date +%Y-%m-%d_%H-%M-%S)  

cp -r "$SOURCE" "$DESTINATION/$FILE-$DATE" 

echo "Backup completed as $FILE-$DATE"
# it creates backup file this - "kathir.txt-2025-02-02_17-42-12" 
#if you need to schedule this backup then use crontab -e like this - * * * * * /home/redhat/./backup.sh  note: don't use quotes in crontab -e
