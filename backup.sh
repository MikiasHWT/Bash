#! /usr/bin/bash

# Check to make sure the user has enetered exactly two arguments. 
if [ $# -ne 2 ]
then 
    echo "Usage: backup.sh <source_directory> <target_directory>"
    echo "Please try again"
    exit 1
fi

# Check to see if rsync is installed
if ! command -v rsync > /dev/null 2>&1 # checking for rscync and sending standard error and standard output to oblivion
then 
    echo "This script requires rsync to be installed"
    echo "Please use your distribution's package manager to install it and try again"
    exit 2 # Different exit codes for different regions is good practice. 
fi

# Capture the current date, and time and store in the format YYYY-MM-DD
current_date=$(date +%Y-%m-%d)

rsync_options="-avb --backup-dir $2/$current_date --delete --dry-run" 
# a = archive mode
# v = verbose
# b = dont replace files in target
# --backup-dir = similar t ob
# $2/$current_date = backups are created in a directory of specific date
# --delete = ensures target directory is clone of source directory
# --dry-run = IMPORTANT = creates a similulation. 

$(which rsync) $rsync_options $1 $2/current >> backup_$current_date.log 
# Subshel provides full qualified path to rsync command
# apply rsync_options from dir 1 to dir 2, and save target files with date.

