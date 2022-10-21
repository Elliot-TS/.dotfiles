#!/bin/bash

#############
# Main
#############

file="$(readlink -f ../policies/policies.json)"
source_file="$(echo $0 | xargs -0 readlink -f)"
password_file="$(readlink -f ./password_hash.txt)"
input_file="$(readlink -f ./input.txt)"
echo "-$file-"
echo "-$source_file-"
echo "-$password_file-"

# Create hashes of file and script and store data in memory
file_dir="$(eval dirname \"$file\")"
file_data=$(cat "$file")

script_dir="$(eval dirname \"$source_file\")"
script_data=$(cat "$source_file")

password_dir="$(eval dirname \"$password_file\")"
password_hash=$(cat "$password_file")

unblock_file="$(readlink -f ./enter_password.sh)"
unblock_dir="$(eval dirname \"$unblock_file\")"
unblock_data=$(cat "$unblock_file")

# Whether or not to block each file
file_lock=1
script_lock=1
password_lock=1

echo "$file"
echo "$file_dir"

while true;
do
    file_deleted=false

    # If any of the files were deleted
    if [[ file_lock -eq 1 && ! -f "$file" ]]
    then
        echo "Restoring original file after deletion"
        mkdir -p "$file_dir"
        echo "$file_data" > "$file"
        file_deleted=true
    fi

    if [[ script_lock -eq 1 && ! -f "$source_file" ]]
    then
        echo "Restoring script file after deletion"
        mkdir -p "$script_dir"
        echo "$script_data" > "$source_file"
        chmod +x "$source_file"
        file_deleted=true
    fi

    if [[ password_lock -eq 1 && ! -f "$password_file" ]]
    then
        echo "Restoring password hash file after deletion"
        mkdir -p "$password_dir"
        echo "$pasword_hash" > "$password_file"
        file_deleted=true
    fi

    if [[ ! -f "$unblock_file" ]]
    then
        echo "Restoring unblock script file after deletion"
        mkdir -p "$unblock_dir"
        echo "$unblock_data" > "$unblock_file"
        chmod +x "$unblock_file"
        file_deleted=true
    fi


    # If we fixed a deleted file, skip the hash stuff
    if [ file_deleted == true ]
    then
        continue;
    fi

    # If any of the files were changed
    if [[ $file_lock -eq 1 && ! $(cat "$file") == "$file_data" ]]
    then
        echo "Restoring original file after change"
        echo "$file_data" > "$file"
    fi

    if [[ $script_lock -eq 1 && ! $(cat "$source_file") == "$script_data" ]]
    then
        echo "Restoring script file after change"
        diff <(echo "$script_data") <(cat $source_file)
        echo "$script_data" > "$source_file"
        chmod +x "$source_file"
    fi
    
    if [[ $password_lock -eq 1 && ! $(cat "$password_file") == "$password_hash" ]]
    then
        echo "Restoring original password hash file after change"
        echo "$password_hash" > "$password_file"
    fi

    # Check if the user "inputs" the correct password to the input file
    if [[ -f "$input_file" && $(cat "$input_file" | sed -n '1p' | shasum | cut -d ' ' -f 1) == "$password_hash" ]]
    then
        echo "Correct password!"

        #option=$(cat "$input_file" | sed -n '2p')
        #case $option in
            #1) # Edit file
                #echo "Unblocking file"
                #file_lock=0;;
            #2) # Stop Script
                #echo "Exiting Script"
                #rm "$input_file"
                #exit;;
            #3) # Change Password
                #new_pass=$(cat "$input_file" | sed -n '3p')
                #if [[ $new_pass == '' ]]
                #then
                    #echo "No new password"
                    #echo $new_pass
                #else
                    #echo $new_pass | shasum | cut -d ' ' -f 1 > "$password_file"
                    #password_file_hash=$(md5sum "$password_file" | cut -d ' ' -f 1)
                    #password_hash=$(cat "$password_file")
                    #echo "New password set"
                #fi;;
            #*)
                #echo "Option not recognised";;
        #esac
        
        rm "$input_file"
        exit
    elif [[ -f "$input_file" ]]
    then
        echo "Incorrect Password"
    fi

    sleep 2
done
