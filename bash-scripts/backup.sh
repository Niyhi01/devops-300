#!/bin/bash
Timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
Folder=$(basename "$1")


if [ -z "$1" ]; then
	echo "pls pass a folder/directory"
	exit 1
elif [ -d "$1" ]; then
	mkdir -p ~/backups
	

	tar -czf "$HOME/backups/$Folder-backup_$Timestamp.tar.gz" "$1"
	echo "Backup of '$1' created at ~/backups/$Folder-backup_$Timestamp.tar.gz"

	exit 0
else
	echo "invalid! pls input a valid directory/folder"
	exit 1
fi




