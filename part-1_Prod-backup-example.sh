#!/bin/bash

#====== CONFIG ======
SOURCE_DIR="/var/www/data"                                           # Source directory: the folder where your data currently lives
BACKUP_BASE="/home/ubuntu/linux-backup-project/backup"               # Base directory: where all backups will be stored
LOG_FILE="/home/ubuntu/lnux-backup-project/logs/backup.log"          # Log file: records the progress and results of each backup

#====== TIMESTAMP ======
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")                                  # Generate a timestamp (date + time) to create a unique backup folder
DEST_DIR="$BACKUP_BASE/$TIMESTAMP"

#====== LOG START ======
echo "[$(date)] Backup Started " >> "$LOG_FILE"                      # Write a log entry that the backup process has started

#====== CREATE BACKUP DIR ======
mkdir -p "$DEST_DIR"                                                 # Create the destination backup directory (if it doesn’t already exist)

#====== RUN BACKUP ======
rsync -av --delete "$SOURCE_DIR/" "$DEST_DIR/" >> "$LOG_FILE" 2>&1   # Use rsync to copy files from source to destination, -a : archive mode, -v : verbose output, 
                                                                     # --delete : remove files in destination that no longer exist in source, Redirect output and errors to the log file
STATUS=$?                                                            # Save the exit status of the rsync command

#====== CHECK RESULT ======
if [ $STATUS -eq 0 ]; then                                           # If rsync finished successfully (exit status 0), log success
  echo "[$(date)] Backup SUCCESS" >> "$LOG_FILE"
else                                                                 # Otherwise, log failure with the error code
  echo "[$(date)] Backup FAILED with status $STATUS" >> "$LOG_FILE"
fi 
