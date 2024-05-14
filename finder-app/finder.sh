
#!/bin/sh

set -e
set -u


if [ $# -lt 2 ]
then
	echo "Two parameters needed first is directory path and second is string, usage : finder.sh /tmp/aesd/assignment1 linux "
	exit 1	
else
	FILESDIR=$1
	SEARCHSTR=$2
fi

# Check if the directory exists
if [ ! -d "$FILESDIR" ]; then
    echo "Error: Directory '$FILESDIR' not found."
    exit 1
fi

# Using 'grep' to search for the string in files and count the matches
matches=$(grep -r "$SEARCHSTR" "$FILESDIR" | wc -l)
filecount=$(find "$FILESDIR" -type f | wc -l)

echo "The number of files are $filecount and the number of matching lines are $matches."


# Check if grep command was successful
if [ $matches -gt 0 ]; then
    echo "Search completed successfully."
else
    echo "No matches found for '$searchstr'."
fi