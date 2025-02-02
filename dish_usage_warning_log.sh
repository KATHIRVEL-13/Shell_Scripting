#!/bin/bash

THRESHOLD=5
EMAIL="kathirnithish13199@gmail.com"

df -h | awk 'NR>1 {print $5 "" $6}' | while read output; do
    use=$(echo $output | awk '{print $1}' | sed 's/%//')
    partition=$(echo $output | awk '{print $2}')

    if [ "$use" -ge "$THRESHOLD" ]; then 
        echo "Warning: High disk usage on $partition ($use%)" >> /home/ubuntu/disk_alerts.log 
    fi
done
#this will check the disk usage and updates in the log file in dedicated location. automate with crontab.
