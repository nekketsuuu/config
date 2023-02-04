#!/usr/bin/env bash

export PROMPT_COMMAND='history -a'

# Go
export GOPATH="$HOME/dev"
export PATH="$GOPATH/bin:$PATH"

# OCaml
eval "$(opam env)"

# PROMPT
_P () {
  local PRE=""
  local NAME="$1"
  local LENGTH="$2"
  if [[ ${#NAME} -gt $LENGTH ]]; then
    PRE="${NAME:0:8}";
    NAME="...${NAME:$((${#NAME}-LENGTH+12))}";
  fi
  echo "$PRE$NAME"
}
_H () {
	local HOST="$1"
  local DEFAULT_HOST_NAME="nek"
	if [[ "x$HOST" != "x${DEFAULT_HOST_NAME}" ]]; then
		echo "@$HOST"
	fi
}
_F () {
  local RESULT=""
  if [[ -n "${NEK_AWS_ROLE}" ]]; then
    RESULT="${RESULT} (${NEK_AWS_ROLE})"
  fi
  echo "${RESULT}"
}
