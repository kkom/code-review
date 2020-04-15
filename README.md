# Purpose

This guide describes a simple code review workflow centred around a GitHub repository.

# Prerequisites

The `Makefile` contains installation scripts for all command tools used in the workflow. Run `make` in the repository root directory to install them.

**Note:** The scripts were written for Mac OS. They also assume that you are using the `brew` package manager, which gets installed if it's originally missing.

# Workflow

1. Your Pull Request should be limited in scope to a single feature, bug fix, or a small set of changes of the same nature (for example updating formatting in a few files).
2. Every Pull Request should consist of a single git commit, which is continuously amended based on code review feedback.
3. The Pull Request commit should be stored in its own branch, clearly named after what the Pull Request is meant to achieve.

## Step-by-step creation of a Pull Request

### Create a new branch for your Pull Request

`git feature <feature_name>` alias creates a new branch and sets it to track `origin/master`.

### Checkout your branch

`git checkout <feature_name>` changes your working directory to the feature branch. Remember to `git prom` as soon as you're on your branch.

### Commit changes to your branch

`git add .` and `git commit -m "<your commit message>"`

### Create a GitHub pull request

`gh pr create` creates a GitHub Pull Request based on your branch.

### Incorporate changes from review

`git add .` to add the extra files, `git fixup` to amend your commit, `git push -f` to sent it to GitHub again.

### Merge the Pull Request

Once the GitHub Pull Request is accepted, squash and merge it using the web UI and then delete the remote branch.

### Clean up obsolete local branches

`git purge` command deletes all local branches corresponding to deleted remote branches.

## Tips and tricks

### Rebase on origin master frequently

`git prom` alias incorporates changes from tracking upstream branch into your feature branch.

Once your Pull Request is accepted, it will be merged on top of `HEAD` of the `origin/master` branch. You need to frequently pull your feature branch to avoid a surprise when your Pull Request is about to be merged. As a rule, do it:

1. whenever you get back to work
2. just before you publish your code as a Pull Request (some aliases will conveniently do it for you)
3. about every 30 minutes while working on your feature

### Figure out where you are

If you feel lost anywhere in the process, these commands will help you figure out what's going on:

* `git diff <optional_file(s)_specifier>` shows the difference between your working directory and staged files (i.e. what can be staged for commit or amend)
* `git diff HEAD <optional_file(s)_specifier>` shows the difference between your working directory and committed files (i.e. what can be committed or amended, once you stage these files)
* `git show` shows the latest commit (if you've already committed something on your feature branch, it is what will be included in the Pull Request -- otherwise it's usually the latest commit from master)
* `git slog` (smart `log`) alias shows a nicely formatted graph of recent commits
* `git status` shows the state of the working directory (which files are staged to be committed, which have been modified/added/removed, etc.)

### Fix your repository

Sometimes your local copy of the repository will get into a bad state. These commands will help you fix it:

* I accidentally committed to master: **TODO**
