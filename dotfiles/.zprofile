# This runs after .zshenv but only in every login shell (subshells not included)
# Appending to environment variables are best done here to avoid duplicates
# Often opening a terminal from a UI terminal application is not considered a login shell. Please find and override this setting
export PATH="/usr/local/bin:$PATH"

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Dotfiles bin
export PATH="$HOME/.bin:$PATH"

# Allow fzf CTRL+T command to include hidden files
export FZF_CTRL_T_COMMAND="find ."

# Rust
if [ -f "$HOME/.cargo/env" ]
then
  . "$HOME/.cargo/env"
fi