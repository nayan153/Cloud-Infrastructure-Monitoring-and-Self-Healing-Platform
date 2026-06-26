#!/bin/bash

# Project paths
LOG_DIR="/home/nayan/projects/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/logs"
BACKUP_DIR="/home/nayan/projects/Cloud-Infrastructure-Monitoring-and-Self-Healing-Platform/log-backups"

# Backup directory create if not exists
mkdir -p "$BACKUP_DIR"

# Current timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Check all .log files
for LOG_FILE in "$LOG_DIR"/*.log
do
    # Skip if no log files exist
    [ -f "$LOG_FILE" ] || continue

    FILE_SIZE=$(stat -c%s "$LOG_FILE")

    # 1 MB = 10240 bytes
    if [ "$FILE_SIZE" -gt 10240 ]
    then
        FILE_NAME=$(basename "$LOG_FILE")

        echo "$(date) | Backing up $FILE_NAME"

        # Create compressed backup
        gzip -c "$LOG_FILE" > "$BACKUP_DIR/${FILE_NAME}_${TIMESTAMP}.gz"

        # Empty original log file
        truncate -s 0 "$LOG_FILE"

        echo "$(date) | Backup completed for $FILE_NAME"
    fi
done

# Delete backups older than 7 days
find "$BACKUP_DIR" -type f -name "*.gz" -mtime +7 -delete
