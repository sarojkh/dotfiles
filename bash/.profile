# This file is manually created.
# This file is similar to .bashrc in linux.

#added to enable 'rbenv' shims and autocompletion:
if which rbenv > /dev/null; then 
  eval "$(rbenv init -)"; 
fi

# added to enable configure boot2docker shellinit at terminal startup
$(boot2docker shellinit 2> /dev/null)


