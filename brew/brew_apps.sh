#!/bin/bash

: '
Author: sarojk
Last modified: Mon Nov  2 14:27:14 NPT 2015
ToDo: 
  -N/A
'

# This is a single line comment

: '
This is a multi-line 
comment.
'

# trap INTerrupt (ctrl-c) and call script_interrupted_by_user()
# syntax: 
#       - trap arg signals
#       -i.e., for trapped signals execute the arg
trap script_interrupted_by_user INT

function script_interrupted_by_user() {
  printf "\n**Trapped CTRL-C!"
  printf "\n**Aborting the script..."
  printf "\n**Incomplete script might cause problems. "
  printf "\n**Consider re-running the script.\n\n"
  exit
}

# Put the symlinks of apps installed by brew-cask in '/Applications/' instead of
# default location of '~/Applications/'.
# For more info look in 'man brew-cask'.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

declare -a brew_apps=(
  'wget'
  'tmux'
  'rbenv'
  'tree'
  'git'
  'macvim --with-override-system-vim'
  'caskroom/cask/brew-cask' 
  'mongodb'
  );

declare -a brew_cask_apps=(
  'iterm2' 
  'atom'
  'google-chrome' 
  'google-drive' 
  'google-photos-backup' 
  'picasa' 
  'flux'
  'filezilla' 
  'etrecheck'
  'yujitach-menumeters' 
  'the-unarchiver' 
  'qbittorrent' 
  'firefox' 
  'skype' 
  'slack' 
  'vlc' 
  'android-file-transfer' 
  'node' 
  'unetbootin'  
  'appcleaner'
  'viber'
  'java' 
  'angry-ip-scanner'
  'teamviewer'
  'virtualbox'
  'microsoft-office'
  );

# Installing 'brew' if not installed already...
if $(which brew > /dev/null 2>&1); #empty string returns false
then
  printf "\n'brew' is already installed."
else
  printf "\n'brew' is not installed."
  printf "\nInstalling 'brew'..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

printf '\nRunning brew doctor...\n'
brew doctor
printf '\nUpdating brew repositories...\n'
brew update 
printf '\nRunning brew cleanup...\n'
brew cleanup 

printf '\nThe script will attempt to install the following brew apps...\n'
for i in "${brew_apps[@]}"
do
  echo $i
done

printf '\nInitiating the installs...\n'
for i in "${brew_apps[@]}"
do
  brew install $i
  printf '\n' 
done


printf '\nUpdating brew cask repositories...\n'
brew upgrade brew-cask 
printf '\nRunning brew cask cleanup...\n'
brew cask cleanup

printf '\nThe script will attempt to install the following brew cask apps...\n'
for i in "${brew_cask_apps[@]}"
do
  echo $i
done

printf '\nInitiating the installs...\n'
for i in "${brew_cask_apps[@]}"
do
  brew cask install $i
  printf '\n' 
done

