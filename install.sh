#!/bin/bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp bash_profile ~/.bash_profile
cp bullet-train-dark-core.zsh-theme ~/.oh-my-zsh/custom/themes/bullet-train-dark-core.zsh-theme
cp Themes/NeonNight.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/NeonNight.xccolortheme

brew cask install shiftit
brew install archey
