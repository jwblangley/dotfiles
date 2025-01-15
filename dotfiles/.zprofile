# This runs after .zshenv but only in every login shell (subshells not included)
# Appending to environment variables are best done here to avoid duplicates
# Often opening a terminal from a UI terminal application is not considered a login shell. Please find and override this setting
export PATH="/usr/local/bin:$PATH"

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Dotfiles bin
export PATH="$HOME/.bin:$PATH"

# Use custom input for fzf
export FZF_DEFAULT_COMMAND="tree-ignore $HOME/.fzfignore"
export FZF_CTRL_T_COMMAND="tree-ignore $HOME/.fzfignore"

# Rust
if [[ -f "$HOME/.cargo/env" ]]
then
  source "$HOME/.cargo/env"
fi

# Pyenv
if [[ -d "$HOME/.pyenv" ]]
then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# Node

if [[ -d "$HOME/.nvm" ]]
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi
