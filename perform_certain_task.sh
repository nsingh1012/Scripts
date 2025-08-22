#!/bin/bash

IP_FILE="/home/ip_addresses.txt"
# Replace with actual username

# Loop through IPs and run commands directly
while IFS= read -r IP; do
    echo "Connecting to $IP..."
    sshpass -f /home/password.txt ssh -o StrictHostKeyChecking=no ccpadmin@"$IP" << 'EOF'
sudo sed -i '\|*.* @Gray_word_want_to_replace|s/^/#/' /etc/rsyslog.conf
sudo zypper -y remove 'package*'
EOF
done < "$IP_FILE"

