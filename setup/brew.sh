#!/usr/bin/env bash
command -v brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/dupes
brew tap thoughtbot/formulae
brew tap railwaycat/emacsmacport
brew update

brew install ack
brew install autoconf
brew install autojump
brew install automake
brew install bash
brew install bash-completion
brew install brew-cask
brew install ctags
brew install direnv
brew install docker
brew install gist
brew install git
brew install gnu-sed
brew install hub
brew install imagemagick
brew install jpeg
brew install libevent
brew install libtiff
brew install memcached
brew install pcre
brew install phantomjs
brew install pick
brew install postgresql
brew install python
brew install qt
brew install readline
brew install reattach-to-user-namespace
brew install ssh-copy-id
brew install the_silver_searcher
brew install tmux
brew install tree
brew install urlview
brew install wget
brew install zsh

brew install emacs-mac --with-spacemacs-icon
brew install macvim --with-cscope --with-luajit
brew install michaeldfallen/formula/git-radar

brew cask install java
brew install maven
brew install neo4j

brew linkapps

export HOMEBREW_CASK_OPTS='--appdir=/Applications'
brew cask install atom
brew cask install caffeine
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install google-drive
brew cask install intellij-idea-ce
brew cask install iterm2
brew cask install mattr-slate
brew cask install p4merge
brew cask install sketch
brew cask install slack
