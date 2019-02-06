#!/usr/bin/env bash
# set strict mode
set -euo pipefail

# This script installs tools which enable more efficient code review using the
# git source control system.

cd installation_scripts

for f in install_*.bash; do
  bash $f
done
