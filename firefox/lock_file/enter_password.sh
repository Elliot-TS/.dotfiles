#!/bin/bash

script_file=$(readlink -f "./lock_file.sh")
password_file=$(readlink -f "./password_hash.txt")

function run_script(){
    echo "Restarting lock script"
    $script_file & disown
}

echo "Please enter the password: "
read -s password
if [[ $(echo $password | shasum | cut -d ' ' -f 1) == $(cat "$password_file") ]]
then
    echo "Password is Correct.  Please select one of the following options:"

    select option in Unblock_File Stop_Lock_Script Change_Password
    do
        case $option in
            Unblock_File)
                trap run_script SIGINT
                echo $password > input.txt
                echo "Press enter to exit and resume the lock file script"
                read
                run_script
                exit;;
            Stop_Lock_Script)
                echo $password > input.txt
                echo "Script is stopped.  Press enter to exit."
                read
                exit;;
            Change_Password)
                trap run_script SIGINT
                echo $password > input.txt

                echo "Please enter your new password"
                read new_password
                echo $new_password | shasum | cut -d ' ' -f 1 > $password_file

                echo "Password changed successfully.  Press enter to exit and result the lock file script."
                read
                run_script
                exit;;
            *)
                echo "Invalid Option";;
        esac
    done
else
    echo "Incorrect password"
fi
