#!/usr/bin/env bash

# Fail the entire script if any of the commands fails
set -e

BASH_PROFILE="$HOME/.bash_profile"
GIT_COMPLETION_ABSOLUTE="$HOME/.git-completion.bash"
GIT_COMPLETION_RELATIVE="~/.git-completion.bash"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
    --output $GIT_COMPLETION_ABSOLUTE

if grep $GIT_COMPLETION_RELATIVE $BASH_PROFILE
then
    echo "I'm guessing that $GIT_COMPLETION_RELATIVE has already been added to $BASH_PROFILE. Not changing it."
else
    echo "Adding $GIT_COMPLETION_RELATIVE to $BASH_PROFILE..."

    echo "" >> $BASH_PROFILE
    echo "# The next lines allow you to complete common git objects and subcommands in your prompt" >> $BASH_PROFILE
    echo "source $GIT_COMPLETION_RELATIVE" >> $BASH_PROFILE
fi
