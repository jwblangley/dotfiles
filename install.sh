#!/usr/bin/env bash

# Exit on first failure
set -e

# Install packages
function filter_has_apt() {
    function _has_apt() {
        if apt-cache show "$1" &>/dev/null
        then
            echo "$1"
        else
            echo "Could not find $1 to install with apt-get" >&2
        fi
    }

    export -f _has_apt
    # shellcheck disable=SC2016 # "$1" should be passed as a raw string to "bash -c" to evaluate
    xargs -P 0 -I {} bash -c '_has_apt "$1"' _ {}
}


filter_has_apt <"$(dirname "$0")/apt-installs.txt" | xargs sudo apt-get install --yes

# Make zsh the default shell
if [ "$SHELL" != "$(command -v zsh)" ]
then
    chsh -s "$(command -v zsh)"
fi

# Run oh-my-zsh installation
if [ -f "$HOME/.zshrc" ]
then
	_had_zshrc_before_omz_install="true"
fi
test -d "$HOME/.oh-my-zsh" || ./install-ohmyzsh.sh --unattended
# OMZ install will create a default zshrc which will clash with stow later
if [ -z "$_had_zshrc_before_omz_install" ]
then
	rm "$HOME/.zshrc"
fi


# Clone zsh-autosuggestions external plugin
test -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" || git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Clone zsh-syntx-highlighting external plugin
test -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ||  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Clone fzf-tab external plugin
test -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab" ||  git clone https://github.com/Aloxaf/fzf-tab.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab"


# Install dotfiles with stow
# N.B. The default stow directory is the current directory and the default target directory is its parent

# Custom scripts and functions
stow custom

stow --no-folding zsh
stow nvim
stow git
stow rg
stow tmux
stow --no-folding micro
stow --no-folding vscode


# All done!
echo -e "\n\nAll completed successfully!\nYou may need to restart the terminal once for everything to take effect"
