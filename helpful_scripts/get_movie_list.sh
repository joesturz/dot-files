#!/bin/bash

{ find '/Volumes/Movies/Movies' -name '*.m4v' -print0 -o -name '*.mp4' -print0 -o -name '*.mov' -print0 -o -name '*.mkv' -print0 -o -name '*.avi' -type f ; find '/Volumes/Movies/R Rated Movies/Movies' -name '*.m4v' -print0 -o -name '*.mp4' -print0 -o -name '*.mov' -print0 -o -name '*.mkv' -print0 -o -name '*.avi' -type f ;} > ~/list_of_movies.txt