#!/usr/bin/env bash
# set strict mode
set -euo pipefail

# new-feature: creates a new feature branch tracking origin/master
git config --global alias.new-feature "!git branch --set-upstream-to=origin/master \$1 #"

# slog: "smart log" command which prints a more readable repository history
git config --global alias.slog "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
