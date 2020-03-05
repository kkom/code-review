.PHONY: all install-git-aliases install-git-configs install-git-toolbelt install-hub install-brew

all: install-git-aliases install-git-configs install-git-toolbelt install-hub

install-git-aliases:
	# sclone: "smart" clones a repository, passing a number of sane parameters and performing setup
	git config --global alias.sclone "!f() { \
		git clone \$$1 --recurse-submodules; \
		cd \$$(basename \$$1 .git); \
		if [[ -e \".pre-commit-config.yaml\" ]]; then \
			pre-commit install; \
		fi; \
	}; f"

	# feature: creates a new feature branch tracking origin/master
	git config --global alias.feature "!f() { \
		git checkout master; \
		git branch \$$1; \
		git branch --set-upstream-to=origin/master \$$1; \
		git checkout \$$1; \
	}; f"

	# prom: robustly rebases changes against remote master
	git config --global alias.prom "pull --rebase origin master"

	# purge: prunes all local branches corresponding to deleted remote branches
	git config --global alias.purge "!f() { \
		git checkout master; \
		git fetch --all --prune; \
		git branch -vv | grep \": gone]\" | awk '{ print \$$1 }' | xargs -n 1 git branch -D; \
	}; f"

	# slog: "smart log" command which prints a more readable repository history
	git config --global alias.slog "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

install-git-configs:
	# See: https://randyfay.com/content/simpler-rebasing-avoiding-unintentional-merge-commits
	git config --global branch.autosetuprebase always

install-git-toolbelt: install-brew
	brew install fzf moreutils
	brew tap nvie/tap
	brew install nvie/tap/git-toolbelt

install-hub: install-brew
	brew install hub

install-brew:
ifeq (, $(shell which brew))
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
endif
	brew update
