#!/usr/bin/env zsh

# -*- mode: sh; sh-shell: zsh; -*-
# vim: ft=zsh

load_if_exists ()
{
  local FILENAME="$1"
  if [ -f "$FILENAME" ]; then
    source "$FILENAME"
  fi
}

load_if_exists ~/.shellrc_common.bash
load_if_exists ~/.shellrc_zsh.zsh
load_if_exists ~/.shellrc_adhoc.bash
load_if_exists ~/.shell_aliases.bash
