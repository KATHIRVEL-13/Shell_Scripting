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

*********************** backup with compression *********************
#!/bin/bash

FILE="test.csv"
SOURCE=/home/ubuntu/${FILE}
BACKUP_DIR=/home/ubuntu/backup_folder
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKIUP_FILE="${FILE}-${DATE}.tar.gz"

mkdir -p "${BACKUP_DIR}"

if [[ -f ${SOURCE} ]]; then
    tar -czvf "$BACKUP_DIR/$BACKIUP_FILE" "$SOURCE"
    if [ $? -eq 0 ]; then
        echo "The backup has been completed successfully."
    else
        echo "The backup failed."
    fi
else
    echo "The backup failed. Source file not found."
fi
