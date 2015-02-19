HOME:= $(shell cd ~; pwd)
UNAME_S := $(shell uname -s)

.PHONY: all
all:

.PHONY: install
install: ${HOME}/.bashrc ${HOME}/.bash_profile ${HOME}/.gitconfig

${HOME}/.bashrc: bashrc
	-@cp bashrc $@

${HOME}/.bash_profile: bash_profile
	@if [[ "$(UNAME_S)" == 'Darwin' ]]; then cp bash_profile $@; fi

${HOME}/.gitconfig: gitconfig_mac gitconfig_linux
	@if [[ "$(UNAME_S)" == 'Darwin' ]]; then cp gitconfig_mac $@;else cp gitconfig_linux $@; fi

.PHONY: uninstall
uninstall:
	@if [ -a $(HOME)/.bashrc ]; then rm $(HOME)/.bashrc; fi
	@if [ -a $(HOME)/.bash_profile ]; then rm $(HOME)/.bash_profile; fi
	@if [ -a $(HOME)/.gitconfig ]; then rm $(HOME)/.gitconfig; fi
