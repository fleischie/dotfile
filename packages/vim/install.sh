#!/usr/bin/env bash

echo "# Installing :: vim"

# symlink config file to home's config files
echo "## Symlinking vim files to home directories"
SOURCE_DIR="$(dirname "$(readlink -f "$0")")"

ln -vsf "${SOURCE_DIR}/vimrc" "${HOME}/.config/nvim/init.vim"
ln -vsf "${HOME}/.config/nvim" "${HOME}/.vim"
ln -vsf "${HOME}/.config/nvim/init.vim" "${HOME}/.vimrc"

# install vim-plug & plugins
VIM_PLUG_PATH="${HOME}/.local/share/nvim/site/autoload/plug.vim"
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

if [[ ! -f ${VIM_PLUG_PATH} ]]
then
  echo "## Installing vim-plug to ${VIM_PLUG_PATH}"
  curl -fLo ${VIM_PLUG_PATH} --create-dirs ${VIM_PLUG_URL}

  echo "## Installing vim plugins"
  vim +PlugInstall +qall
fi

echo "# Installing :: vim - completed"
