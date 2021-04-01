#!/bin/bash

set -e

sudo apt-get update && sudo apt-get install git vim zsh -y

export RUNZSH=false
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

zsh -c "
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
"

curl "https://raw.githubusercontent.com/pkarolyi/dotfiles/master/zshrc" -o ~/.zshrc
curl "https://raw.githubusercontent.com/pkarolyi/dotfiles/master/vimrc" -o ~/.vimrc

chsh -s "/usr/bin/zsh"

echo "Reboot to finish"
