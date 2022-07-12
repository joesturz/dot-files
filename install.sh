#!/bin/sh
echo install the following from the app store
echo AppStore apps
echo Amphetamine
echo AppCleaner
echo DaisyDisk
echo Magnet
echo Meeter
echo Pixelmator Pro

echo install these apps from the following links
# Other Apps
echo "https://github.com/DanielStormApps/Fanny"
echo "https://plexamp.com/#downloads"
echo "https://github.com/MonitorControl/MonitorControl#readme"

echo find you Xcode version here
echo "https://developer.apple.com/download/all/"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp bash_profile ~/.bash_profile
cp Themes/oh_my_zsh/bullet-train-dark-core.zsh-theme ~/.oh-my-zsh/custom/themes/bullet-train-dark-core.zsh-theme
cp Themes/Xcode/NeonNight.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/NeonNight.xccolortheme

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install archey
brew install htop
brew install bat
brew install ffmpeg
brew install tldr
brew install tmux
brew install wget
brew install carthage

# cask install
brew cask install shiftit
brew cask install dozer
brew cask install iina
brew cask install vscodium
brew cask install proxyman
brew cask install sourcetree
brew cask install telegram
brew cask install bitwarden
brew cask install slack
