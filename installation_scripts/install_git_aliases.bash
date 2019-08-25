#!/usr/bin/env bash
# set strict mode
set -euo pipefail

# sclone: "smart clone" recursively clones the submodules and installs the pre-commit framework
git config --global alias.sclone "!f() { \
    git clone \$1 --recurse-submodules; \
    cd \$(basename \$1 .git); \
    pre-commit install; \
}; f"

# feature: creates a new feature branch tracking origin/master
git config --global alias.feature "!git checkout master && git branch \$1 && git branch --set-upstream-to=origin/master \$1 && git checkout \$1 #"

# prom: robustly rebases changes against remote master
git config --global alias.prom "pull --rebase origin master"

# purge: prunes all local branches corresponding to deleted remote branches
git config --global alias.purge "!git checkout master && git fetch --all -p; git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -D"

# slog: "smart log" command which prints a more readable repository history
git config --global alias.slog "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
