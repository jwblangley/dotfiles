# Runs for any interactive shell and should only contain config for this.
# Runs after .zprofile for interactive shells

# oh-my-zsh settings
ZSH_THEME="jameslangley"
CASE_SENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  zoxide
  fzf
  zsh-autosuggestions
  fzf-tab # Put last to allow previous bindings to also work
  zsh-syntax-highlighting # Put last so colour escape sequences are not messed up
)

source $ZSH/oh-my-zsh.sh

# Shell options
unsetopt autopushd
unsetopt autocd
setopt shwordsplit # Use bash-like word splitting for consistency
stty -ixon # Disable terminal control flow

# Load aliases
source "$HOME/.zsh_aliases"

# Load custom functions
ls "$HOME/.func" | while read func
do
  source "$HOME/.func/$func"
done
