#!/bin/bash

# Initialize the gir repo
git init
# Add all files in the snapshot
git add -A
# Commit all the files
git commit -m "INIT - Setup Git-To-ClearCase"

# Make the bare repo one level above
name=${PWD##*/}
mkdir "../$name.git" && cd "../$name.git"
git init --bare
# Sore path to this folder for remote
fullpath="$PWD"
# Set up post-update
wget -qP hooks "https://raw.githubusercontent.com/CodeCorrupt/Git-To-ClearCase/master/post-update"

# Set up the bare repo as the remote
cd "../$name"
git remote add origin "file://$fullpath"
git push -u origin master

# instruct the user
echo "You're all set, Simply run the following command where you want the project folder"
echo "git clone $fullpath <<your task name>>"
