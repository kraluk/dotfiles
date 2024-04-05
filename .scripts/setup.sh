#!/usr/bin/env bash

# homebrew installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# sdkman
sh -c "$(curl -s https://get.sdkman.io)"

# homebrew packages
## core tools
brew install coreutils gawk gettext grep htop midnight-commander p7zip readline \
  rsync tree wget xz zsh zsh-completions vim gnu-getopt gnu-indent gnu-sed gnu-tar \
  rlwrap jq trash

## development tools
brew install git docker docker-completion colima k9s helm kubernetes-cli

## casks
brew install itsycal keepassxc keepingyouawake mos rectangle textmate iterm2 the-unarchiver
brew install font-fira-code font-jetbrains-mono
brew install calibre libreoffice bruno obsidian visualvm vlc drawio

# sdkman
sdk i java 21.0.2-tem
sdk i gradle
sdk i maven
