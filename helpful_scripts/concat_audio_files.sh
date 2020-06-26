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

for audiobook in *.mp3; do
  ffmpeg -i ${audiobook} -c:a aac -c:v copy ${audiobook:r}.m4a;
done
mkdir mp3
mv *.mp3 mp3
ls -1 *.m4a | sed 's/^/file /g' > 'files.txt'

ffmpeg -f 'concat' -i 'files.txt' -c copy "${NAME}.m4a"
mkdir m4a
mv *.mp3.m4a m4a
