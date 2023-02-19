#!/usr/bin/env bash

# local softwares
alias dynamodb-local='docker run --rm -p 8000:8000 amazon/dynamodb-local'
alias open='gnome-open'
alias v='gh repo view -w'

# Utilities
alias ls='ls -G'
alias la='ls -aG'
alias l='ls -CFG'
alias grep='grep --color=auto'
alias cdb='cd "$(ghq root)/bitbucket.org/"'
alias cdbn='cd "$(ghq root)/bitbucket.org/nekketsuuu/"'
alias cdg='cd "$(ghq root)/github.com/"'
alias cdgn='cd "$(ghq root)/github.com/nekketsuuu/"'
alias g='cd "$(ghq root)/$(ghq list | peco)"'
alias quit='exit'
alias rm='rm -i'
alias untar='tar xvf'

# Emacs
alias emacsclient='TERM=xterm emacsclient' # to modify color (default: xterm-256color)
alias e='emacsclient -nw -a ""'
alias emacs='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'

# Programming
alias ghc='stack ghc'
alias ghci='stack ghci'
alias ocaml='rlwrap ocaml'
alias runghc='stack runghc'
alias runhaskell='stack runhaskell'
