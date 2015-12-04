# This file is manually created.

#added to enable 'rbenv' shims and autocompletion:
if which rbenv > /dev/null; then 
  eval "$(rbenv init -)"; 
fi

# added to enable configure boot2docker shellinit at terminal startup
$(boot2docker shellinit 2> /dev/null)

source ~/.aliases
source ~/Google\ Drive/dotfiles/brew/homebrew_github_api_token.sh
