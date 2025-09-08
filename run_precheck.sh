#! /bin/bash 

file="IP_addresses.txt"

precheck_output_file="Output.txt"

read -p "Enter username: " username
read -p "Enter password: " password
echo 

> "$precheck_output_file"

if [ ! -f "$file" ]; then 
	echo "$file is not found"
	exit 1
fi 

while read LINE; do
	echo "Connecting $LINE this server for the precheck" >> "$precheck_output_file"
	sshpass -p $password ssh -o StrictHostKeyChecking=no $username@$LINE
	echo "....................................................................." >> "$precheck_output_file"
	"bash /home/ccpadmin/precheck.sh" >> "$precheck_output_file" 2>&1

	if [ $? -eq 0 ]; then
		echo "Preformed prechecks in this $LINE server " >> "$precheck_output_file"

	else 
		echo "Prechecks failed in this $LINE server " >> "$precheck_output_file"
	fi
done < "$file"

echo "Find the precheck file $precheck_output_file here"


