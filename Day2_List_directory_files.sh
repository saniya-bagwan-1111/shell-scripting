
#!/bin/bash
echo ""
# Display directories separately with their sizes
echo "Directories in the" $PWD " current directory with their sizes:"
for dir in */; do
    du -sh "$dir"  # Correct command to show directory sizes in human-readable format
done

# Display files separately with their sizes
echo "Files in the"$PWD" current directory with their sizes:"
for file in *; do
    if [ -f "$file" ]; then
        du -sh "$file"  # Correct command to show file sizes in human-readable format
    fi
done
echo "------------------------List of files absed on inputs---------------------"
while true; do
        # Display directories separately with their sizes
        echo "Directories in the current directory with their sizes:"
        for dir in */; do
                echo "$dir"  # Correct command to show directory sizes in human-readable format
        done

        # Display files separately with their sizes
        echo "Files in the current directory with their sizes:"
        for file in *; do
                if [ -f "$file" ]; then
                echo "$file"  # Correct command to show file sizes in human-readable format
                fi
        done
        echo "Accept input from user (yes/no)"
        read -p "Enter input" user_input
        if [[ "$user_input" == "no" ]]; then
                echo "Exsting from"
                break
        fi

        echo " "
done
echo "Thanks!!!!"
