#!/usr/bin/env bash

# Fail the entire script if any of the commands fails
set -e

# Ensure that brew is up to date
brew update
brew upgrade

# Install git
brew install git
