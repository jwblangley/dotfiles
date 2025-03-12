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
test -d "$HOME/.oh-my-zsh" || sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" "" --unattended

# Clone zsh-autosuggestions external plugin
test -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" || git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# Clone zsh-syntx-highlighting external plugin
test -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ||  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Clone fzf-tab external plugin
test -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab" ||  git clone https://github.com/Aloxaf/fzf-tab.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab"


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

# Install my tmux conf
ln -sf {"$HOME/.dotfiles/dotfiles","$HOME"}"/.tmux.conf"

# Install micro text editor
if ! command -v micro &>/dev/null
then
    echo "micro is not instaled >&2"
    # See the following for instructions
    # https://github.com/zyedidia/micro#installation
    # Note that micro is packaged with ubuntu, but with 20.04 contains a bug
    # In later versions of ubuntu this could be replaced with an install from apt
fi

# Install micro settings
mkdir -p "$HOME/.config/micro"
ln -sf "$HOME/.dotfiles/dotfiles/micro_settings.json" "$HOME/.config/micro/settings.json"

# Install vscode configurations N.B: vscode installed separately
test -d "$HOME/.config/Code/User" || mkdir -p "$HOME/.config/Code/User"
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
