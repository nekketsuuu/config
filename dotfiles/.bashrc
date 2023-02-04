#!/usr/bin/env bash

# -*- mode: sh -*-
# vim: ft=sh

load_if_exists ()
{
  local FILENAME="$1"
  if [ -f "$FILENAME" ]; then
    source "$FILENAME"
  fi
}

load_if_exists ~/.shellrc_common.bash
load_if_exists ~/.shellrc_bash.bash
load_if_exists ~/.shellrc_adhoc.bash
load_if_exists ~/.shell_aliases.bash
