#!/bin/bash

# Function to prompt user for recipient's email address
get_recipient_email() {
    read -p "Enter recipient's email address: " recipient
    # Validate email address (you can add more comprehensive validation if needed)
    if [[ ! $recipient =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$ ]]; then
        echo "Invalid email address. Please enter a valid email address."
        get_recipient_email  # Prompt again recursively
    fi
}

# Function to handle cleanup
cleanup() {
    echo "Interrupted. Exiting script."
    exit 1
}

# Trap SIGINT signal (Ctrl+C) and call the cleanup function
trap cleanup SIGINT

# Call the function to get recipient's email address
get_recipient_email

body="Hey there, am testing sending mail from bash script test dos of dos"

# Prompt user to confirm before sending email
read -p "Press Enter to send the email. Press Ctrl+C to cancel." input

# Send email and capture the exit status
if [ ! -z "$input" ]; then
    echo "Email sending cancelled."
    exit 1
fi

ssmtp "$recipient" <<< "$body"
exit_status=$?

# Check the exit status and handle errors
if [ $exit_status -eq 0 ]; then
    echo "Email sent successfully"
else
    echo "Failed to send email. Exit status: $exit_status"
fi
