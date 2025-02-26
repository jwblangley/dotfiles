#!/usr/bin/env bash

# Exit on first failure
set -e

# Prerequisites
sudo apt update -y
command -v git || sudo apt install -y git
command -v curl || sudo apt install -y curl
command -v wget || sudo apt install -y wget

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
ls "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" || git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Clone zsh-syntx-highlighting external plugin
ls "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ||  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Clone fzf-tab external plugin
ls "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab" ||  git clone https://github.com/Aloxaf/fzf-tab.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab"

# Install my zshenv
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.zshenv"

# Install my zprofile
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.zprofile"

# Install my zshrc
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.zshrc"

# Install my zlogin
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.zlogin"

# Install my zlogout
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.zlogout"

# Install my aliases
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.zsh_aliases"

# Install my zsh theme
ln -sf {"$HOME/.dotfiles/dotfiles","${ZSH:-$HOME/.oh-my-zsh}/themes"}"/jameslangley.zsh-theme"

# Install my global git config
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.gitconfig"

# Install my fzfignore
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.fzfignore"

# Install tmux
command -v tmux || sudo apt install -y tmux

# Install my tmux conf
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.tmux.conf"

# Install fzf
command -v fzf || sudo apt install -y fzf

# Install ncdu
command -v ncdu || sudo apt install -y ncdu

# Install bat
command -v batcat || sudo apt install -y bat

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
rm -rf "$HOME/.config/Code/User/snippets"
ln -sf "$HOME/.dotfiles/dotfiles/vscode_snippets" "$HOME/.config/Code/User/snippets"

# Install my custom scripts
ln -sfn "$HOME/.dotfiles/dotfiles/bin" "$HOME/.bin"

# Install my custom functions
ln -sfn "$HOME/.dotfiles/dotfiles/func" "$HOME/.func"

# All done!
echo -e "\n\nAll completed successfully!\nYou may need to restart the terminal once for everything to take effect"
