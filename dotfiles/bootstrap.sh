#!/usr/bin/env bash

# cd to me
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# test copy
echo "### TEST COPY ###"
rsync \
  --exclude ".git/" \
  --exclude "*~" \
  --exclude "bootstrap.sh" \
  --exclude "README.md" \
  -avhn --no-perms . ~

echo ""
echo "Are you sure to overwrite above dotfiles? (y/N)"
read -r ANSWER

# copy
if [ "${ANSWER}" == "Y" ] || [ "${ANSWER}" == "y" ] ; then
  rsync \
    --exclude ".git/" \
    --exclude "*~" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~
  echo ""
  echo "Done. Please re-source ~/.profile or something."
else
  echo "Aborted."
fi
