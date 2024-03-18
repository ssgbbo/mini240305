#!/usr/bin/expect

# Set timeout to wait for a response
set timeout -1

set PASSWORD "ubuntu"

set BACKUP_FILE [lindex $argv 0]

spawn sudo -S scp backup.sql router@192.168.1.100:/db/backup/$BACKUP_FILE
expect {
    "for docker: " {
        send "$PASSWORD\r"
        exp_continue
    }
    timeout {
        # Handle timeout if necessary
        exit 1
    }
    "password:" {
        send "$PASSWORD\r"
    }
    timeout {
        # Handle timeout if necessary
        exit 1
    }
}

# Wait for the transfer to complete
expect eof