#!/bin/sh

cd `dirname $0`

./setup/link-dotfiles.sh
./setup/brew.sh

[[ -d ~/.vim ]] || \
  git clone git@github.com:amay/vimfiles.git ~/.vim && \
  ~/.vim/setup.sh

[[ -d ~/.atom ]] || \
  git clone git@github.com:substantial/atomfiles.git ~/.atom && \
  cd ~/.atom && bin/update-packages
