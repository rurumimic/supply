# ohmyzsh.git/templates/zshrc.zsh-template

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/ohmyzsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# typewritten: https://typewritten.dev
ZSH_THEME="typewritten/typewritten"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
# PLUGINS_BEGIN ANSIBLE MANAGED BLOCK
# PLUGINS_END ANSIBLE MANAGED BLOCK
)

source $ZSH/oh-my-zsh.sh

setopt null_glob
for RC in "$HOME/.config/rc.d/"*.{sh,zsh}; do
  source "${RC}"
done
unsetopt null_glob

