#!/usr/bin/env bash
# set strict mode
set -euo pipefail

# See: https://randyfay.com/content/simpler-rebasing-avoiding-unintentional-merge-commits
git config --global branch.autosetuprebase always
