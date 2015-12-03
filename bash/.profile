# This is manually created by sarojk.
# This file is similar to .bashrc in linux.

alias open_links="~/Google\ Drive/Code/python/scripts/open_links.py"
alias gt_code_folder="cd ~/Google\ Drive/Code/"

# Put the symlinks of apps installed by brew-cask in '/Applications/' instead of
# default location of '~/Applications/'.
# For more info look in 'man brew-cask'.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#added by sarojk to enable 'rbenv' shims and autocompletion:
if which rbenv > /dev/null; then 
  eval "$(rbenv init -)"; 
fi

# added by sarojk to enable configure boot2docker shellinit at terminal startup
$(boot2docker shellinit 2> /dev/null)

# added by sarojk such that github doesn't limit the number of requests made by
# homebrew to its server
export HOMEBREW_GITHUB_API_TOKEN=ea3936dad7209b13b7940f6fdff7eec52539d2bb

