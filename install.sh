#!/usr/bin/bash

# Exit on first failure
set -e

# Prerequisites
sudo apt update
which wget || sudo apt install -y wget
which git || sudo apt install -y git

# Install zsh
which zsh || sudo apt install -y zsh

# Make zsh the default shell
if [ $SHELL != $(which zsh) ]; then chsh -s $(which zsh); fi

# Run oh-my-zsh installation (skip change of shell)
ls $HOME/.oh-my-zsh || echo "n" | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Clone zsh-autosuggestions external plugin
ls $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone zsh-syntx-highlighting external plugin
ls $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ||  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install my zshrc
ln -sf $HOME/.dotfiles/dotfiles/.zshrc $HOME/.zshrc

# Install my zsh theme
ln -sf $HOME/.dotfiles/dotfiles/jameslangley.zsh-theme ${ZSH:-$HOME/.oh-my-zsh}/themes

# Install tmux
which tmux || sudo apt install -y tmux

# Install my tmux conf
ln -sf $HOME/.dotfiles/dotfiles/.tmux.conf $HOME/.tmux.conf

# Install my custom scripts
ln -sf $HOME/.dotfiles/dotfiles/bin $HOME/.bin
