#!/usr/bin/env bash

# Exit on first failure
set -e

# Prerequisites
sudo apt update -y
command -v git || sudo apt install -y git
command -v curl || sudo apt install -y curl
command -v wget || sudo apt install -y wget

# git aliases
git config --global alias.logdog "log --decorate --oneline --graph"
git config --global alias.root "rev-parse --show-toplevel"

# Install zsh
command -v zsh || sudo apt install -y zsh

# Make zsh the default shell
if [ "$SHELL" != "$(command -v zsh)" ]
then
    chsh -s "$(command -v zsh)"
fi

# Run oh-my-zsh installation (skip change of shell)
ls "$HOME/.oh-my-zsh" || echo "n" | sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Clone zsh-autosuggestions external plugin
ls "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" || git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Clone zsh-syntx-highlighting external plugin
ls "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ||  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Install my zshrc
ln -sf "$HOME/.dotfiles/dotfiles/.zshrc" "$HOME/.zshrc"

# Install my zsh theme
ln -sf "$HOME/.dotfiles/dotfiles/jameslangley.zsh-theme" "${ZSH:-$HOME/.oh-my-zsh}/themes"

# Install tmux
command -v tmux || sudo apt install -y tmux

# Install my tmux conf
ln -sf "$HOME/.dotfiles/dotfiles/.tmux.conf" "$HOME/.tmux.conf"

# Install ncdu
command -v ncdu || sudo apt install -y ncdu

# Install micro text editor
if ! command -v micro
then
    pushd /tmp
    curl https://getmic.ro | bash
    sudo mv -n micro /usr/local/bin/micro
    popd
fi

# Install micro settings
mkdir -p "$HOME/.config/micro"
ln -sf "$HOME/.dotfiles/dotfiles/micro_settings.json" "$HOME/.config/micro/settings.json"

# Install xclip
command -v xclip || sudo apt install -y xclip

# Install vscode configurations N.B: vscode installed separately
ls "$HOME/.config/Code/User" || mkdir -p "$HOME/.config/Code/User"
ln -sf "$HOME/.dotfiles/dotfiles/vscode_keybindings.json" "$HOME/.config/Code/User/keybindings.json"
ln -sf "$HOME/.dotfiles/dotfiles/vscode_settings.json" "$HOME/.config/Code/User/settings.json"

# Install my custom scripts
ln -sfn "$HOME/.dotfiles/dotfiles/bin" "$HOME/.bin"

# All done!
echo -e "\n\nAll completed successfully!\nYou may need to restart the terminal once for everything to take effect"
