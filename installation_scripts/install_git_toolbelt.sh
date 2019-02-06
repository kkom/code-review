#!/usr/bin/env bash

# Fail the entire script if any of the commands fails
set -e

# Ensure that brew is up to date
brew update
brew upgrade

# Install git-toolbelet and its dependency
brew install moreutils
brew tap nvie/tap
brew install nvie/tap/git-toolbelt
