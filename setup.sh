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

[[ -d ~/.emacs.d ]] || ( \
  echo Installing spacemacs && \
  git clone --recursive https://github.com/syl20bnr/spacemacs ~/.emacs.d && \
  cd ~/.emacs.d && \
  git checkout --track -B develop origin/develop)

[[ -d ~/.asdf ]] || ( \
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf \
)
[[ -d ~/.asdf/plugins/elixir ]] || ( \
  asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git \
)
[[ -d ~/.asdf/plugins/erlang ]] || ( \
  asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git \
)
[[ -d ~/.asdf/plugins/ruby ]] || ( \
  asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git \
)
[[ -d ~/.asdf/plugins/nodejs ]] || ( \
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git \
)
