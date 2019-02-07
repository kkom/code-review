#!/usr/bin/env bash
# set strict mode
set -euo pipefail

BASH_PROFILE="$HOME/.bash_profile"
HUB_ALIAS_LINE="eval \"$(hub alias -s)\""

if grep "$HUB_ALIAS_LINE" $BASH_PROFILE
then
    echo "I'm guessing that $HUB_ALIAS_LINE has already been added to $BASH_PROFILE. Not changing it."
else
    echo "Adding $HUB_ALIAS_LINE to $BASH_PROFILE..."

    echo "" >> $BASH_PROFILE
    echo "# The next line wraps GitHub hub commands around git. Unfortunately" >> $BASH_PROFILE
    echo "# GitHub subcommand completion would not work otherwise." >> $BASH_PROFILE
    echo "$HUB_ALIAS_LINE" >> $BASH_PROFILE
fi
