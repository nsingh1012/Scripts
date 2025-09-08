#! /bin/bash 

file="logfile.txt"

Error_output="Error_output.txt"

> "$Error_output"

while read Line; do 
	if [[ "$Line" == *"ERROR"* ]]; then 
		echo "$Line" >> "$Error_output"
	fi
done < "$file"


