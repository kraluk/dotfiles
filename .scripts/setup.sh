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
  rsync tree wget xz zsh zsh-completions vim gnu-getopt gnu-indent gnu-sed gnu-tar

## development tools
brew install jq git docker docker-completion colima

## casks
brew install itsycal keepassxc keepingyouawake mos rectangle textmate iterm2
brew install font-fira-code
brew install calibre libreoffice brunoobsidian visualvm

# sdkman
sdk i java 21.0.2-tem
sdk i gradle
sdk i maven
