# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# autoenv
export AUTOENV_ENV_FILENAME='.autoenv'
export AUTOENV_ENV_LEAVE_FILENAME='.autoenv.leave'
export AUTOENV_ENABLE_LEAVE='enabled'
source "$HOME/.autoenv/activate.sh"

