#!/bin/sh

cd `dirname $0`

./setup/link-dotfiles.sh
./setup/mac-defaults.sh
./setup/brew.sh

[[ -d ~/.asdf ]] || ( \
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf \
)
[[ -d ~/.asdf/plugins/nodejs ]] || ( \
  asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git \
)

[[ -d ~/.oh-my-zsh ]] || ( \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
)

