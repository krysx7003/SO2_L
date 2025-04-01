#!/bin/bash  

DIRECTORY_NAME=$1  
FILE_SOURCE=$2

echo "Folder: $DIRECTORY_NAME" 
echo "Plik tekstowy: $FILE_SOURCE"  

FILE_NAMES=$( cat "$FILE_SOURCE" ) 
cd $DIRECTORY_NAME 

for FILE_NAME in $FILE_NAMES; do 
    echo $FILE_NAME 
    touch $FILE_NAME 
done 

echo "Files created"