#!/usr/bin/env bash
# set strict mode
set -euo pipefail

source update_brew.bash

brew install fzf moreutils
brew tap nvie/tap
brew install nvie/tap/git-toolbelt
