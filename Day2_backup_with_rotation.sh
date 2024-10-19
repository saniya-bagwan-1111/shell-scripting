#!/bin/bash
<<comment
Your task is to create a bash script that takes a directory path as a command-line argument and performs a backup of the directory. The script should create timestamped backup folders and copy all the files from the specified directory into the backup folder.

Additionally, the script should implement a rotation mechanism to keep only the last 3 backups. This means that if there are more than 3 backup folders, the oldest backup folders should be removed to ensure only the most recent backups are retained.
comment

echo "-----BACKUP WITH ROTATION-------"
take_backup()
{

        #read -p "Please Enter the input patha which required backup" input_dir

        backup_dir="$(date '+%Y-%m-%d_%H-%M-%S')_backup_dir.zip"
        #zip -r $backup_dir $input_dir
        zip -r $backup_dir $1
        echo "Backup Completed in function"
}
take_backup_for_last3_files()
{
        echo "------last 3 files---"
        echo "used cmd ls-tr here last modified file is sh file also not showing that file so added *.zip after ls cmd :"
        ls -tr *.zip| tail -n 3
        echo "ls-lrt cmd: "
        ls -lrt *.zip | tail -n 3ubuntu@ip-172-31-28-99:~/scripts$ ./backup_with_rotation.sh /home/ubuntu/scripts
-----BACKUP WITH ROTATION-------
-----Start BACKUP WITH ROTATION-------
  adding: home/ubuntu/scripts/ (stored 0%)
  adding: home/ubuntu/scripts/install_package.sh (deflated 54%)
  adding: home/ubuntu/scripts/2024-10-19_17-00-30_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/2024-10-19_16-57-20_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/2024-10-19_16-48-12_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/2024-10-18_11-34-34_backup.zip (stored 0%)
  adding: home/ubuntu/scripts/.install_nginx.sh.swp (deflated 96%)
  adding: home/ubuntu/scripts/backup.zip (stored 0%)
  adding: home/ubuntu/scripts/shole_daligoue.sh (deflated 33%)
  adding: home/ubuntu/scripts/backup_with_rotation.sh (deflated 50%)
  adding: home/ubuntu/scripts/backup.sh (deflated 36%)
  adding: home/ubuntu/scripts/2024-10-19_17-04-45_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/.backup_script.sh.swp (deflated 98%)
  adding: home/ubuntu/scripts/2024-10-19_17-01-19_backup_dir.zip (stored 0%)
Backup Completed in function
------last 3 files---
2024-10-19_17-01-19_backup_dir.zip
2024-10-19_17-04-45_backup_dir.zip
2024-10-19_17-07-03_backup_dir.zip
ls-lrt cmd: 
-rw-rw-r-- 1 ubuntu ubuntu  87972 Oct 19 17:01 2024-10-19_17-01-19_backup_dir.zip
-rw-rw-r-- 1 ubuntu ubuntu 176197 Oct 19 17:04 2024-10-19_17-04-45_backup_dir.zip
-rw-rw-r-- 1 ubuntu ubuntu 352635 Oct 19 17:07 2024-10-19_17-07-03_backup_dir.zip
---Backup Completed-----
}

echo "-----Start BACKUP WITH ROTATION-------"
take_backup $1
take_backup_for_last3_files
echo "---Backup Completed-----"
<<Output

Output
