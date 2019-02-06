#!/usr/bin/env bash
# set strict mode
set -euo pipefail

# Ensure that brew is up to date
brew update
brew upgrade

# Install git-toolbelet and its dependency
brew install moreutils
brew tap nvie/tap
brew install nvie/tap/git-toolbelt
