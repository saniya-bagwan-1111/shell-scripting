#!/bin/bash
<<note
This script is basically accepting input from user and counting charaters from that string

note
echo "List files and directories from urrent directory : " $PWD
for dir in */; do
        echo "$dir"
done
for file in *; do
        if [ -f $file ]; then
                echo "$file"
        fi
done

while true; do
        read -p "Enter Line of text" text

        if [[ -z "$text" ]]; then
                echo "Bad user input, Nothing Entered"
                break
        fi

        count=$(echo -n "$text" | wc -c)
        echo "Count of charaters in text $test: " $count

        #if[[ "$text"=='entry'
done
