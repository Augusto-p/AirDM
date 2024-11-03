#!/bin/bash

# Simple login manager structure
clear
echo "=== Minimal Login Manager ==="
echo "Welcome! Please log in."

# Input fields
echo -n "Username: "
read USERNAME
echo -n "Password: "
read -s PASSWORD

# Verify credentials (example check)
if [ "$USERNAME" == "your_user" ] && [ "$PASSWORD" == "your_password" ]; then
    echo -e "\nLogin successful!"
    exec awesome  # Start Awesome WM
else
    echo -e "\nLogin failed. Try again."
    sleep 2
    exec $0  # Restart the script
fi
