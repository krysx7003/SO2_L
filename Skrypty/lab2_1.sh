#!/bin/bash 

args=("$@") 

DIRECTORY_NAME=$args 

if [ ! -d "$DIRECTORY_NAME" ]; then 
    echo "Directory $DIRECTORY_NAME not exist"       
    echo "Terminating program..." 
    exit 1 
else
    echo "Start loop" 
    cd $DIRECTORY_NAME 
    
    touch elo4 
    touch elo3 
    chmod 777 elo3 
    chmod 777 elo4 

    echo "All fies: " 
    ls -all 

    for FILE in $PWD/*; do 
        if [ `stat -c %A $FILE | sed 's/...\(.\).\+/\1/'` == "x" ]; then 
            echo "Executable file: $FILE" 
            rm $FILE 
            echo "Deleting file..." 
        else 
            echo "Not executable file: $FILE" 
        fi 
    done 
    echo "All files after deleting: " 
    ls -all 
fi 
exit 0 