DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXECUSIONS := .git ,gitmodules .travis.yml
DOTFILES := $(filter-out $(EXECUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

all:
	## none
list: ## Show dot files in this repo
		@$(foreach file, $(DOTFILES), /bin/ls -dF $(file);)
