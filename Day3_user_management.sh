#!/bin/bash
<<Comment
Creating user account based on user input and options are -c or --create to create account
Comment

display_option()
{
        echo "What Activity do you want?"
        echo "Create user (-c or --create)"
        echo "Delete User (-d or --delete)"
        echo "Password Reset (-r or --reset"
        echo "List Users (-l or --list)"
}

create_user()
{
        if grep -q "^$1:" /etc/passwd; then
                echo "$1 already exists in system"
        else
                sudo useradd -m -s /bin/bash  $1
                sudo passwd $1
                echo "USer created successfully $1"
        fi
}
delete_user()
{
        if id "$1" &>/dev/null; then
                sudo userdel -r "$1"
                echo "USer $1 deleted Successfully"
        else
                echo "User not present"
        fi
}
reset_pass()
{
        if id "$1" &>/dev/null; then
                read -p "Please enter password" pass
                echo "$1:$pass" | sudo chpasswd
                echo "$1 User Password reseted successfully"
        else
                echo "User $1 does not exist"
        fi
}

if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
       display_option
       exit 0
fi       

while [ $# -gt 0 ]; do
        case "$1" in
                -c | --create) 
                        read -p  "Please Enter name of User " user
                        create_user $user
                ;;
                -d | --delete)
                        read -p "Which user do u want delete " del_user
                        delete_user $del_user
                ;;
                -r | --reset)
                        read -p "Which user password do u want to reSet " reset_user
                        reset_pass $reset_user
                ;;
                -l | --list)
                        awk -F: '{print $1}' /etc/passwd
                ;;
                *)
                        echo "Please enter valid input. Use --help or -h to see avilable options"
                        exit 1
                ;;

        esac
        shift
done
