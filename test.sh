#!/bin/bash
#test uno of uno

receipient="your-email"
body="Hey there, am testing sending mail from bash script"

echo "$body"| ssmtp  $receipient
