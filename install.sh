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

echo "find you Xcode version here or use xcodes(see below)"
echo "https://developer.apple.com/download/all/"

echo install these apps for working with video files

echo "https://handbrake.fr"
echo "https://www.makemkv.com/download/"
echo "MakeMKV beta key: https://forum.makemkv.com/forum/viewtopic.php?t=1053"
echo "https://subler.org"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp bash_profile ~/.bash_profile
cp Themes/oh_my_zsh/bullet-train-dark-core.zsh-theme ~/.oh-my-zsh/custom/themes/bullet-train-dark-core.zsh-theme
cp Themes/Xcode/NeonNight.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/NeonNight.xccolortheme
cp Themes/Xcode/NeonNight_UHD_16.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/NeonNight_UHD_16.xccolortheme
cp Themes/Xcode/NeonNight_UHD_20.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/NeonNight_UHD_20.xccolortheme

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install archey4
brew install htop
brew install bat
brew install ffmpeg
brew install tmux
brew install wget
brew install carthage
#these both do similar things, cheat is more cusomizable, tldr highlights better
brew install cheat
brew install tldr
brew install xcodesorg/made/xcodes
brew install aria2  #for faster downloads with xcodes
brew install youtube-dl
brew install speedtest_cli
brew install tree
brew install miller #parsing and creating data files(json, csv, tsv)

# cask install
brew install --cask shiftit
brew install --cask dozer
brew install --cask iina
brew install --cask vlc
brew install --cask vscodium
brew install --cask proxyman
brew install --cask sourcetree
brew install --cask telegram
brew install --cask bitwarden
brew install --cask slack
brew install --cask monitorcontrol
brew install --cask appcleaner
brew install --cask mactracker
brew install --cask fanny
brew install --cask qmk-toolbox
