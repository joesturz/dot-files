#!/bin/sh
DIRECTORY=~/.oh-my-zsh
if [ ! -d "$DIRECTORY" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "initial setup requires installation of oh my zsh"
    echo "run this script again to install remaining apps and configurations"
    echo "press return to continue"
    read temp 
    echo "oh my zsh is already installed"
fi