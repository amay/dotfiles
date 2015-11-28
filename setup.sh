#!/bin/sh

cd `dirname $0`

./setup/link-dotfiles.sh
./setup/brew.sh
./setup/mac-defaults.sh

[[ -d ~/.vim ]] || ( \
  echo Installing vim && \
  git clone git@github.com:amay/vimfiles.git ~/.vim && \
  ~/.vim/setup.sh )

[[ -d ~/.atom ]] || ( \
  echo Installing atom && \
  git clone git@github.com:substantial/atomfiles.git ~/.atom && \
  cd ~/.atom && bin/update-packages )
