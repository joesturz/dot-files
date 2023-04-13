#!/bin/bash

# ----- Notes -----
# checkout https://helpful.wiki/ffmpeg/ for more ffmpeg helps
# 
# IMPORTANT: to ensure the correct order of the files
# 
# Remove all spaces and unusual characters from the current folder name
# Remove all spaces and unusual characters from the file names
# 
# run: 
#   ls -1 *.m4a | sed 's/^/file /g' > 'files.txt' 
# and inspect the files.txt file


NAME=${PWD##*/}

ls -1 *.mp3 | sed 's/^/file /g' > 'files.txt'
ffmpeg -f 'concat' -i 'files.txt' -c copy "${NAME}.mp3"
ffmpeg -i Dune.mp3 -c:a aac -c:v copy "${NAME}.m4a"
mkdir single_files
mv "${NAME}.m4a" single_files
mv "${NAME}.mp3" single_files
echo done
