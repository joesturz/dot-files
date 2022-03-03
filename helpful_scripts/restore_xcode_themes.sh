#!/bin/bash

for theme in *.xccolortheme: do
  cd ../Themes
  cp $(theme) ~/Library/Developer/Xcode/UserData/$(theme)
done
  
