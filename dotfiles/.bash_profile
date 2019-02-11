# Init jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 " {%s}")\[\033[00m\]\$ '

export PATH="/usr/local/Cellar/node/9.3.0_1/bin:$PATH"

# maven path
export M2_HOME=/usr/local/apache-maven/apache-maven-3.5.2
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
