#!/usr/bin/env bash

# Other Settings
#
# git config --global core.filemode false

open () {
  abspath=$(readlink -f "$1");
  wpath=$(/bin/wslpath -w "$abspath");
  powershell.exe -Command Start-Process "$wpath"
}

alias cdw='cd /mnt/c/Users/nek/'
