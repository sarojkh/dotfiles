
export NPM_PACKAGES="/Users/sarojk/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
 
# Added for atom.io/packages/iterm3 to work well
export PATH="$PATH:$(cat /etc/paths | xargs | tr " " :)"

# Added to get 'z' to work
. `brew --prefix`/etc/profile.d/z.sh

