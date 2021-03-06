#!/bin/bash
AllPinned=`cat AllPinned.txt`
while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ $AllPinned = *$line* ]]; then
        ipfs pin rm $line
    fi
done < $1.txt
rm $1.txt
ipfs pin ls -t recursive > AllPinned.txt