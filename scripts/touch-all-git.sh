#!/bin/bash

# Function to decode escaped filenames and remove extra quotes
unescape_filename() {
    # Use printf to decode the filename and remove extra quotes
    printf "%b" "$1" | sed 's/^"//; s/"$//'
}

# Iterate over all files in the current Git repository
git ls-tree -r HEAD --name-only | while IFS= read -r file; do
    # Unescape the filename
    unescaped_file=$(unescape_filename "$file")
    
    # Get the last commit timestamp for the file
    timestamp=$(git log -1 --format="%at" -- "$unescaped_file")
    
    # Check if the timestamp was retrieved successfully
    if [[ -n "$timestamp" ]]; then
        # Convert the timestamp to the correct format and update the file's modification time
        touch -d "@$timestamp" "$unescaped_file"
    else
        echo "Could not retrieve timestamp for \"$unescaped_file\""
    fi
done
