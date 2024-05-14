
#!/bin/sh

set -e
set -u


if [ $# -ne 2 ]
then
	echo "Two parameters needed first is directory path including filename and second is string, usage : finder.sh /tmp/aesd/assignment1 linux "
	exit 1	
else
	FILE=$1
	STR=$2
fi

# Extract directory path from the file path
dirpath=$(dirname "$FILE")

# Check if the directory exists, create it if it doesn't
if [ ! -d "$dirpath" ]; then
    echo "Creating directory '$dirpath'..."
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Directory '$dirpath' could not be created."
        exit 1
    fi
fi

# Create the file with the specified content
echo "$STR" > "$FILE"

# Check if the file creation was successful
if [ $? -eq 0 ]; then
    echo "File '$FILE' created successfully."
else
    echo "Error: File '$FILE' could not be created."
    exit 1
fi