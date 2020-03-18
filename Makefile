.PHONY: all
all:  ## installs the bin and the dotfiles.
	bin setup dotfiles

.PHONY: bin
bin: ## install the bin directory files
	for file in $(shell find $(CURDIR)/bin -type f -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$ff; \
	done

.PHONY: setup
setup: ## setup homebrew, oh-my-zsh & vim

	# install homebrew & homebrew packages
	(sudo xcode-select --install && \
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" && \
	brew bundle)

	# install vimrc & vim-airline
	(git clone --depth=1 https://github.com/amix/vimrc.git $(HOME)/.vim_runtime && \
	git clone https://github.com/vim-airline/vim-airline.git $(HOME)/.vim_runtime/my_plugins/vim_airline && \
	sh $(HOME)/.vim_runtime/install_awesome_vimrc.sh)

	# install oh-my-zsh & spaceship-promp
	(sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
	ln -s $(HOME)/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme $(HOME)/.oh-my-zsh/custom/themes/spaceship.zsh-theme)

.PHONY: dotfiles
dotfiles: ## install the dotfiles
	for file in $(shell find $(CURDIR) -name "*." -not -name ".git" -not -name ".github" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done; \

	ln -fn $(CURDIR)/gitignore $(HOME)/.gitignore;
	git update-index --skip-worktree $(CURDIR)/.gitconfig;

help:   ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'



