#!/usr/bin/env bash

# local softwares
alias dynamodb-local='docker run --rm -p 8000:8000 amazon/dynamodb-local'
alias open='gnome-open'
alias v='gh repo view -w'

# Utilities
alias cdb='cd "$(ghq root)/dev/src/bitbucket.org/"'
alias cdbn='cd "$(ghq root)/dev/src/bitbucket.org/nekketsuuu/"'
alias cdg='cd "$(ghq root)/dev/src/github.com/"'
alias cdgn='cd "$(ghq root)/dev/src/github.com/nekketsuuu/"'
alias g='cd "$(ghq root)/$(ghq list | peco)"'
alias quit='exit'
alias rm='rm -I'
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
