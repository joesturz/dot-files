#!/bin/bash
now=$(date +"%m_%d_%Y")
{ find '/Volumes/Movies/Movies' -name '*.m4v' -print0 -o -name '*.mp4' -print0 -o -name '*.mov' -print0 -o -name '*.mkv' -print0 -o -name '*.avi' -type f | xargs -0 basename -a; find '/Volumes/Movies/R Rated Movies/Movies' -name '*.m4v' -print0 -o -name '*.mp4' -print0 -o -name '*.mov' -print0 -o -name '*.mkv' -print0 -o -name '*.avi' -type f | xargs -0 basename -a;} | sort > ~/Desktop/list_of_movies_${now}.txt
