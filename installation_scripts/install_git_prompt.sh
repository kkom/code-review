#!/usr/bin/env bash

# Fail the entire script if any of the commands fails
set -e

BASH_PROFILE="$HOME/.bash_profile"
GIT_PROMPT_ABSOLUTE="$HOME/.git-prompt.sh"
GIT_PROMPT_RELATIVE="~/.git-prompt.sh"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
    --output $GIT_PROMPT_ABSOLUTE

if grep $GIT_PROMPT_RELATIVE $BASH_PROFILE
then
    echo "I'm guessing that $GIT_PROMPT_RELATIVE has been already added to $BASH_PROFILE..."
else
    echo "Adding $GIT_PROMPT_RELATIVE to $BASH_PROFILE..."

    echo "" >> $BASH_PROFILE
    echo "# The next lines allow you to see repository status in your prompt" >> $BASH_PROFILE
    echo "source $GIT_PROMPT_RELATIVE" >> $BASH_PROFILE
    echo "export PROMPT_COMMAND='__git_ps1 \"\h:\W \u\" \"\\\$ \"'" >> $BASH_PROFILE
    echo "export GIT_PS1_SHOWCOLORHINTS=1" >> $BASH_PROFILE
fi
