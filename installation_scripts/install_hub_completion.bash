#!/usr/bin/env bash
# set strict mode
set -euo pipefail

BASH_PROFILE="$HOME/.bash_profile"
HUB_COMPLETION_ABSOLUTE="$HOME/.hub.bash_completion.sh"
HUB_COMPLETION_RELATIVE="~/.hub.bash_completion.sh"

curl https://raw.githubusercontent.com/github/hub/1e5bb959dcc11f515d8865ece27c5fc9dd3b2d39/etc/hub.bash_completion.sh \
    --output $HUB_COMPLETION_ABSOLUTE

if grep "$HUB_COMPLETION_RELATIVE" $BASH_PROFILE
then
    echo "I'm guessing that $HUB_COMPLETION_RELATIVE has already been added to $BASH_PROFILE. Not changing it."
else
    echo "Adding $HUB_COMPLETION_RELATIVE to $BASH_PROFILE..."

    echo "" >> $BASH_PROFILE
    echo "# The next line allows you to complete GitHub hub subcommands in your prompt" >> $BASH_PROFILE
    echo "source $HUB_COMPLETION_RELATIVE" >> $BASH_PROFILE
fi
