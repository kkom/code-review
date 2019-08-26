#!/usr/bin/env bash
# set strict mode
set -euo pipefail

# This script installs tools which enable more efficient code review using the
# git source control system.

# Install the brew package manager if it is not installed yet
if ! [ -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all individual tools
cd installation_scripts
brew update
bash install_git.bash # install git first, as all other tools depend on it
for install_script in install_*.bash; do
    bash "$install_script"
done
