## Basic settings
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# beginning of PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:$PATH
# If something doesn't work, return to messy old path
# export PATH=/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/usr/local/node/bin:/usr/local/bin:

## Homebrew
# Set brew bash completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

## Python
# Homebrew's python distro
# export PATH=/usr/local/share/python:$PATH

## Virtualenv Settings
# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
export PIP_VIRTUALENV_BASE=$HOME/Virtualenvs
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=false
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

## for Pyqt
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

## for PostgreSQL
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

## for mysql server 

## Node/NPM
# Node
export PATH=$HOME/local/node/bin:$PATH
# So node knows where to look for modules:
export NODE_PATH="/usr/local/lib/node_modules"
# NPM
export PATH=/usr/local/share/npm/bin:$PATH
# Add bash completion for npm
source /usr/local/lib/node_modules/npm/lib/utils/completion.sh

## RVM Settings
# Add RVM to PATH for scripting
#export PATH=$HOME/.rvm/bin:$PATH
# Load RVM into a shell session *as a function*
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

## Environment customizations
# Add Sublime Text 2 as default editor
export EDITOR="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" 

## Add support for UTF-8
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=

## Alias cd up-level
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

## PS1 Prompt customizations:
function parse_git_branch() {
  x=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`
  if [[ "$x" == "" ]]; then
    echo ""
  else
    echo "$x "
  fi
}

export PROMPT_COMMAND='export OLD_STATUS=$?'

export PS1='\[\033[1;35m\]\h \[\033[0;30m\]\d \[\033[0;30m\]\A \[\033[1;30m\]\W \[\033[0;30m\]`parse_git_branch` \[\033[0;30m\]`if [ $OLD_STATUS = 0 ]; then echo \♡; else echo \♥; fi` \[\033[1;33m\]\$ \[\033[0m\]'

#export PS1="\u@\h:\W #\! \A \`if [ \$? == 0 ]; then echo 💔\: ; else echo 😱\\: ; fi\` "

## Bashrc
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc 

# Chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
