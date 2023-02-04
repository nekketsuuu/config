#!/usr/bin/env zsh

set -o PROMPT_SUBST
setopt hist_ignore_space

color_prompt=
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  export PS1=$'%{\033[01;32m%}%n$(_H "%m")%{\033[00m%}:%{\033[01;34m%}$(_P "$(print -P %~)" 30)%{\033[00m%}%{\033[01;33m%}$(_F)%{\033[00m%}\%# '
else
  export PS1='%n$(_H "%m"):$(_P "$(print -P %~)" 30)$(_F)%# '
fi
unset color_prompt force_color_prompt
