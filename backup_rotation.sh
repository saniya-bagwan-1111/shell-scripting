#!/bin/bash
<< steps
backup and Rotation
1. check arguments by user wile running the script
2. take the back for source folder and save it into destination
3. remove the older backup files and keep only 5(rotation)

usage:
./backup_ration.sh source destination
steps

source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$2
function display_usage()
{
    echo "Usage : ./backup.sh <path of source> <path of detination>"
}

take_backup()
{
    zip -r "${backup_dir}/backup_${timestamp}.zip" "${source_dir}" >/dev/null #what ever ouput will generate that will store into the device which is null
    if [ $? -eq 0 ]; then 
        echo "Backup generated successfully"
    fi
}
perform_rotation()
{
    
    backups=($(ls -t "${backup_dir}/backup_"*.zip 2>/dev/null)) #2>/dev/null - discard the standard error
    echo "All files present in backup: ${backups[@]}" # printing the name of filed stored in array

    if [ "${#backups[@]}" -gt 5 ]; then #--#sign wll show the lenth of array
        echo "Performing rotation for 5 days"
        backup_to_remove=("${backups[@]:5}")
        echo "Old files present in backup: ${backup_to_remove}" # printing the old file path and name
    
        # Delete the older files and keep latest 5, using slice
        for backup in "${backup_to_remove[@]}";
        do 
            rm -f ${backup}
        done
    fi  
}
if [ $# -eq 0 ]; then # $# shows the no of argument
    display_usage
fi
take_backup
perform_rotation
