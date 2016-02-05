
# Note:
# From http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html :
#   Unlike *nix system's bash, which loads .bash_profile for login shell, and
#   .bashrc for non-login shell(new terminal window), Mac OS X’s Terminal.app
#   runs a login shell by default for both login shell and non-login shell(new
#   terminal window), calling .bash_profile instead of .bashrc.

# Shoutouts:
# -https://github.com/paulirish/dotfiles

source ~/.aliases
source ~/.bashrc
source ~/.bash_prompt
source ~/Google\ Drive/dotfiles/brew/homebrew_github_api_token.sh

# generic colouriser
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
then
  alias colourify="$GRC -es --colour=auto"
  alias configure='colourify ./configure'
  for app in {diff,make,gcc,g++,ping,traceroute}; do
    alias "$app"='colourify '$app
  done
fi

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

##
## gotta tune that bash_history…
##

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL=ignoredups:erasedups         # no duplicate entries
export HISTSIZE=100000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
which shopt > /dev/null && shopt -s histappend  # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# ^ the only downside with this is [up] on the readline will go over all history not just this bash session.

#added to enable 'rbenv' shims and autocompletion:
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# added for bash-completion to work well
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Put the symlinks of apps installed by brew-cask in '/Applications/' instead of
# default location of '~/Applications/'.
# For more info look in 'man brew-cask'.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
