# Init jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH="/usr/local/Cellar/node/9.3.0_1/bin:$PATH"

