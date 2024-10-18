#!/bin/bash
<<note
This script takes backup of any destination path given in args
./backup.sh /home/ubuntu/scripts
note
echo "Formatted Date : $(date '+%Y-%m-%d_%H-%M-%S')"
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
backup_dir="${timestamp}_backup.zip"
echo "Your backup Directory : $backup_dir"
zip -r $backup_dir $1
echo "Backup completed"

<<output
ubuntu@ip-172-31-28-99:~/scripts$ bash backup.sh /home/ubuntu/scripts
Formatted Date : 2024-10-18_11-34-34
Your backup Directory : 2024-10-18_11-34-34_backup.zip
  adding: home/ubuntu/scripts/ (stored 0%)
  adding: home/ubuntu/scripts/install_package.sh (deflated 54%)
  adding: home/ubuntu/scripts/.install_nginx.sh.swp (deflated 96%)
  adding: home/ubuntu/scripts/backup.zip (stored 0%)
  adding: home/ubuntu/scripts/shole_daligoue.sh (deflated 33%)
  adding: home/ubuntu/scripts/backup.sh (deflated 36%)
  adding: home/ubuntu/scripts/.backup_script.sh.swp (deflated 98%)
Backup completed
ubuntu@ip-172-31-28-99:~/scripts$ ls
2024-10-18_11-34-34_backup.zip  backup.sh  backup.zip  install_package.sh  shole_daligoue.sh
output
