BREW_APPNAME = $(notdir $(shell pwd))
BREW_TAPNAME ?= tap

ifeq '$(findstring ;,$(PATH))' ';'
	detected_OS := Windows
else
	detected_OS := $(shell uname 2>/dev/null || echo Unknown)
	detected_OS := $(patsubst CYGWIN%,Cygwin,$(detected_OS))
	detected_OS := $(patsubst MSYS%,MSYS,$(detected_OS))
	detected_OS := $(patsubst MINGW%,MSYS,$(detected_OS))
endif

# OSX Specific targets
ifeq ($(detected_OS),Darwin)

/usr/local/bin/brew:
	bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew analytics off

## install homebrew and execute Brewfile
brew: /usr/local/bin/brew
	[ -d Brewfile ] && brew bundle --file=Brewfile/Darwin || brew bundle
.PHONY: brew

endif

# Linux Specific targets
ifeq ($(detected_OS),Linux)

/home/linuxbrew/.linuxbrew/bin/brew:
	bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	grep -qF -- 'eval $$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' ~/.bashrc || echo 'eval $$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> ~/.bashrc
	eval $$(/home/linuxbrew/.linuxbrew/bin/brew shellenv); brew analytics off

## install homebrew and execute Brewfile
brew: /home/linuxbrew/.linuxbrew/bin/brew
	eval $$(/home/linuxbrew/.linuxbrew/bin/brew shellenv); [ -d Brewfile ] && brew bundle --file=Brewfile/Linux || brew bundle
.PHONY: brew

endif

## brew install $(PROJNAME)
brew/install:
	brew install $(BUILD_HARNESS_ORG)/$(BREW_TAPNAME)/$(BREW_APPNAME)

## brew remove $(PROJNAME)
brew/remove:
	brew remove $(BUILD_HARNESS_ORG)/$(BREW_TAPNAME)/$(BREW_APPNAME)

brew/update:
	brew cask upgrade; brew upgrade
