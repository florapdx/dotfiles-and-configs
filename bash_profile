# beginning of PATH
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin

# Bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Add Homebrew to path
eval "$(/opt/homebrew/bin/brew shellenv)"
# Homebrew completion
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# Sublime Text
export EDITOR="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Golang
export GOPATH=$HOME/go-workspace
export GOROOT=/opt/homebrew/Cellar/go/1.17.2/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

## Python
export PYTHON=/usr/bin/python

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

## Virtualenv Settings
# virtualenv should use Distribute instead of legacy setuptools
#export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
#export PIP_VIRTUALENV_BASE=$HOME/Virtualenvs
# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
#export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Postgres
#alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
#alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

## Add support for UTF-8
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=

# one for aliasing `cd` commands to move up the tree:
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# a function to add the current git branch to my prompt:
## Show current git branch
function parse_git_branch() {
  x=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
  if [[ "$x" == "" ]]; then
    echo ""
  else
    echo "$x "
  fi
}

## Show cmd failed state
# Checks status to see whether last command returned a true or false:
export PROMPT_COMMAND='export OLD_STATUS=$?'

function show_cmd_failed() {
  if [[ $OLD_STATUS == 0 ]]; then 
    echo "♡"
  else 
    echo "♥"
  fi
}

# and one that customizes the prompt itself:
# you may want to change this to fit your needs -- important part is the `parse git branch` stanza 
# if you want the current branch name to show in your prompt
#export PS1="\[\033[0;030m\]\u \[\033[0;030m\]\d \[\033[0;30m\]\t \[\033[1;30m\]\W \[\033[0;30m\]`parse_git_branch` \[\033[0;30m\] \[\033[1;33m\]$ \e[m"
export PS1="\[\033[1;35m\]\h \[\033[0;30m\]\d \[\033[0;30m\]\A \[\033[1;30m\]\W \[\033[0;30m\]\$(parse_git_branch) \[\033[0;30m\]\$(show_cmd_failed) \[\033[1;33m\]\$ \e[m"

## Bashrc
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
