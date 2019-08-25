#!/usr/bin/env bash
# set strict mode
set -euo pipefail

# sclone: "smart" clones a repository, passing a number of sane parameters and performing setup
git config --global alias.sclone "!f() { \
    git clone \$1 --recurse-submodules; \
    cd \$(basename \$1 .git); \
    if [[ -e \".pre-commit-config.yaml\" ]]; then \
        pre-commit install; \
    fi; \
}; f"

# feature: creates a new feature branch tracking origin/master
git config --global alias.feature "!git checkout master && git branch \$1 && git branch --set-upstream-to=origin/master \$1 && git checkout \$1 #"

# prom: robustly rebases changes against remote master
git config --global alias.prom "pull --rebase origin master"

# purge: prunes all local branches corresponding to deleted remote branches
git config --global alias.purge "!f() { \
    git checkout master; \
    git fetch --all --prune; \
    git branch -vv | grep \": gone]\" | awk '{ print \$1 }' | xargs -n 1 git branch -D; \
}; f"

# slog: "smart log" command which prints a more readable repository history
git config --global alias.slog "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
