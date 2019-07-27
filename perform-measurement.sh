#!/bin/bash
#Yash Baldawa
#Assignment 3 Part 1

if [ $# -ne 1 ]; then
        echo "Incorrect number of arguments. Usage: ./perform-measurement.sh URL"
        exit 1
fi

url=$1
tempFile=`mktemp -p '/tmp' 2> /dev/null`  # redirect the err to dev/null

wget -o /dev/null -O "$tempFile" "$url" || { echo '0'; rm '$tempFile' 2> /dev/null; exit 0; }

# Now count the number of words in the downloaded file
wc -c < "$tempFile" || { echo '0' ; rm "$tempFile" 2> /dev/null ; exit 0; }

# Cleanup
rm "$tempFile" 2> /dev/null

exit 0

