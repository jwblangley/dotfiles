# This runs after .zshenv but only in every login shell (subshells not included)
# Appending to environment variables are best done here to avoid duplicates
# Often opening a terminal from a UI terminal application is not considered a login shell. Please find and override this setting

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Dotfiles bin
export PATH="$HOME/.bin:$PATH"

# Additional personal bin
export PATH="$HOME/.opt:$PATH"

# Snap bin
export PATH="/snap/bin:$PATH"

# Pipx bin
export PATH="$PATH:/home/james/.local/bin"


# Source shell setup for tools
for f in "$HOME"/.zprofile.d/*
do
    source "$f"
done

