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
        ls -lrt *.zip | tail -n 3
}

echo "-----Start BACKUP WITH ROTATION-------"
#take_backup $1
#take_backup_for_last3_files
#echo "---Backup Completed-----"

function remove_backup
{
        echo "Removing first 3 files"
        ls -rt *.zip | head -n 3 |xargs rm -f
        echo "Remove complted"
}
#remove_backup
echo "Which activity do you want pre 1- taking backup 2- Display lastest 3 files 3-  removing firt 3 files"
read input
case "$input" in 
        "1") echo "Taking backup started"
               take_backup $1
               ;;
        "2") echo "Display last 3 files backup"
                take_backup_for_last3_files
        ;;
        "3") echo "Remove first 3 files"
                remove_backup
        ;;
esac

<<Output
ubuntu@ip-172-31-28-99:~/scripts$ ./backup_with_rotation.sh /home/ubuntu/scripts
-----BACKUP WITH ROTATION-------
-----Start BACKUP WITH ROTATION-------
Which activity do you want pre 1- taking backup 2- Display lastest 3 files 3-  removing firt 3 files
3
Remove first 3 files
Removing first 3 files
Remove complted

-rw-rw-r-- 1 ubuntu ubuntu  43868 Oct 19 17:00 2024-10-19_17-00-30_backup_dir.zip
-rw-rw-r-- 1 ubuntu ubuntu  87972 Oct 19 17:01 2024-10-19_17-01-19_backup_dir.zip
-rw-rw-r-- 1 ubuntu ubuntu 176403 Oct 19 17:47 2024-10-19_17-47-21_backup_dir.zip
-rw-rw-r-- 1 ubuntu ubuntu 353042 Oct 19 17:48 2024-10-19_17-48-30_backup_dir.zip
-rwxrw-r-- 1 ubuntu ubuntu   1681 Oct 19 17:53 backup_with_rotation.sh
-rw-rw-r-- 1 ubuntu ubuntu 706347 Oct 19 17:53 2024-10-19_17-53-30_backup_dir.zip
ubuntu@ip-172-31-28-99:~/scripts$ ./backup_with_rotation.sh /home/ubuntu/scripts
-----BACKUP WITH ROTATION-------
-----Start BACKUP WITH ROTATION-------
Which activity do you want pre 1- taking backup 2- Display lastest 3 files 3-  removing firt 3 files
2
Display last 3 files backup
------last 3 files---
used cmd ls-tr here last modified file is sh file also not showing that file so added *.zip after ls cmd :
2024-10-19_17-47-21_backup_dir.zip
2024-10-19_17-48-30_backup_dir.zip
2024-10-19_17-53-30_backup_dir.zip
ls-lrt cmd: 
-rw-rw-r-- 1 ubuntu ubuntu 176403 Oct 19 17:47 2024-10-19_17-47-21_backup_dir.zip
-rw-rw-r-- 1 ubuntu ubuntu 353042 Oct 19 17:48 2024-10-19_17-48-30_backup_dir.zip
-rw-rw-r-- 1 ubuntu ubuntu 706347 Oct 19 17:53 2024-10-19_17-53-30_backup_dir.zip


ubuntu@ip-172-31-28-99:~/scripts$ ./backup_with_rotation.sh /home/ubuntu/scripts
-----BACKUP WITH ROTATION-------
-----Start BACKUP WITH ROTATION-------
Which activity do you want pre 1- taking backup 2- Display lastest 3 files 3-  removing firt 3 files
1
Taking backup started
  adding: home/ubuntu/scripts/ (stored 0%)
  adding: home/ubuntu/scripts/install_package.sh (deflated 54%)
  adding: home/ubuntu/scripts/2024-10-19_17-00-30_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/2024-10-19_16-57-20_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/2024-10-19_17-48-30_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/2024-10-19_17-47-21_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/2024-10-19_16-48-12_backup_dir.zip (stored 0%)
  adding: home/ubuntu/scripts/2024-10-18_11-34-34_backup.zip (stored 0%)
  adding: home/ubuntu/scripts/.install_nginx.sh.swp (deflated 96%)
  adding: home/ubuntu/scripts/backup.zip (stored 0%)
  adding: home/ubuntu/scripts/shole_daligoue.sh (deflated 33%)
  adding: home/ubuntu/scripts/backup_with_rotation.sh (deflated 54%)
  adding: home/ubuntu/scripts/backup.sh (deflated 36%)
  adding: home/ubuntu/scripts/.backup_script.sh.swp (deflated 98%)
  adding: home/ubuntu/scripts/2024-10-19_17-01-19_backup_dir.zip (stored 0%)
Backup Completed in function
Output
