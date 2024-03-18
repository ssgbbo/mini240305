#!/bin/bash
# NFS Backup file name env
BACKUP_FILE="backup_$(date +'%Y%m%d_%H%M' -d '+9 hours').sql"

# path setting
cd ~/mini

# Perform database Auto Backup crontab -e
# * * * * * sudo docker exec -i db1 /usr/bin/mariadb-dump -u admin -padmin mydb > ~/mini/backup.sql  2>&1  | tee logfile.txt

# copy to NFS server
expect autoInput.sh "$BACKUP_FILE"

# delete backup.sql file
# sudo rm ~/mini/$BACKUP_FILE

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup completed successfully."
else
    echo "Database backup failed."
    exit 1
fi

