# This file is manually created.

# Infinite history size
# See http://askubuntu.com/questions/307541/how-to-change-history-size-for-ever
HISTSIZE=-1;
HISTFILESIZE=-1;

#added to enable 'rbenv' shims and autocompletion:
if which rbenv > /dev/null; then 
  eval "$(rbenv init -)"; 
fi

# added to enable configure boot2docker shellinit at terminal startup
$(boot2docker shellinit 2> /dev/null)

# Put the symlinks of apps installed by brew-cask in '/Applications/' instead of
# default location of '~/Applications/'.
# For more info look in 'man brew-cask'.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

source ~/.aliases
source ~/Google\ Drive/dotfiles/brew/homebrew_github_api_token.sh
