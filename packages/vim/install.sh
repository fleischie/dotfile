#!/usr/bin/env bash

echo "# Installing :: vim"

# create appropriate config dir
echo "## Creating necessary directories"
TARGET="${HOME}/.config/nvim"
PLUGIN_PARENT="${HOME}/.local/share/nvim/site"
mkdir -vp "${TARGET}"
mkdir -vp "${PLUGIN_PARENT}"

# symlink config file to home's config files
echo "## Symlinking vim files to home directories"
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

ln -vsf "${SCRIPT_DIR}/vimrc" "${TARGET}/init.vim"
ln -vsf "${SCRIPT_DIR}/plugin" "${PLUGIN_PARENT}"
ln -vsf "${TARGET}" "${HOME}/.vim"
ln -vsf "${TARGET}/init.vim" "${HOME}/.vimrc"

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
