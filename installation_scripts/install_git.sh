#!/usr/bin/env bash
# set strict mode
set -euo pipefail

# Ensure that brew is up to date
brew update
brew upgrade

# Install git
brew install git
