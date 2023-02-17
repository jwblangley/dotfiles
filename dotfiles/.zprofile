# This runs after .zshenv but only in every login shell (subshells not included)
# Appending to environment variables are best done here to avoid duplicates
# Often opening a terminal from a UI terminal application is not considered a login shell. Please find and override this setting
export PATH="/usr/local/bin:$PATH"

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Personal bin
export PATH="$HOME/.bin:$PATH"

# Rust
. "$HOME/.cargo/env"
