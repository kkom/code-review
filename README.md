# Purpose

This repository contains a set of guidelines for a simple code review flow centred around a GitHub repository.

# Tools

## Installation

The `installation_scripts` directory contains installation scripts for the tools mentioned below.

**Note:** Most scripts currently assume that they are run on a Mac OS machine.

## Always know where you are

`./install_git_prompt.sh` modifies your command line prompt to show the current git branch (if you are inside a git repository).

## Install handy git shortcuts

`./install_git_toolbelt.sh` installs `git-toolbelt` - a set of excellent git commands which automate common workflows.

**Note:** The installation script assumes that you have the `brew` package manager installed.

# Workflow

## Create a new branch for your Pull Request

Your pull request should be limited in scope to a single feature, a single bug-fix or a small set of changes of the same nature (for example updating formatting in a few files).

The following command creates your branch:

```
git branch my-feature
```

## Periodically ensure that you're working

# Useful resources

* https://github.com/git/git/tree/master/contrib/completion
* https://github.com/github/hub
* https://github.com/nvie/git-toolbelt
