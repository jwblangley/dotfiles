# This runs after .zshenv but only in every login shell (subshells not included)
# Appending to environment variables are best done here to avoid duplicates
# Often opening a terminal from a UI terminal application is not considered a login shell. Please find and override this setting
export PATH="/usr/local/bin:$PATH"

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Dotfiles bin
export PATH="$HOME/.bin:$PATH"

# Snap bin
export PATH="/snap/bin:$PATH"

# Use custom input for fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --ignore-file $HOME/.rgignore"
export FZF_CTRL_T_COMMAND="rg --files --hidden --ignore-file $HOME/.rgignore"

# Use custom parameters for rg
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Source shell setup for tools
for f in "$HOME"/.zprofile.d/*
do
    source "$f"
done
