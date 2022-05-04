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
mkdir new_m4a
for audiobook in *.mp3; do
  ffmpeg -i ${audiobook} -c:a aac -c:v copy new_m4a/${audiobook:r}.m4a;
done

