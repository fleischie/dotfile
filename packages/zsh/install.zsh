#!/usr/bin/env zsh

# define colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

PREZTO_URL="https://github.com/sorin-ionescu/prezto.git"
PREZTO_DIR="${ZDOTDIR:-$HOME}/.zprezto"

echo "# Installing :: zsh extensions"

# clone prezto repo and symlink extensions, if this didn't already happen
if [[ ! -d "${PREZTO_DIR}" ]]
then
  echo "## Initialize prezto"

  # first check, whether this script was run with zsh
  if [[ $SHELL != "/bin/zsh" ]]
  then
    printf "${RED}You must run this script from withing zsh...${NC}\n"
    exit 1
  fi

  # clone repo
  git clone --recursive "${PREZTO_URL}" "${PREZTO_DIR}"

  # symlink extensions
  setopt EXTENDED_GLOB
  for rcfile in "${PREZTO_DIR}/runcoms/"^README.md(.N)
  do
    ln -vsf "${rcfile}" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi

echo "## Symlinking custom configuration"

# create directory to paste config into
EXTENSION_DIR="${HOME}/.config/zsh"
mkdir -p ${EXTENSION_DIR}

# symlink config file to extension directory
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

ln -vsf "${SCRIPT_DIR}/zshrc" "${EXTENSION_DIR}/zshrc"

# apply custom patch to zsh
PATCH_PATH="${SCRIPT_DIR}/zsh.diff"

## go to prezto dir (and save current dir on stack)
## discard output of `dirs`
pushd "${PREZTO_DIR}/runcoms" > /dev/null

## check, whether patch can be applied
## - warn, if not (maybe patch was already applied)
## - apply, if so
git apply --check "${PATCH_PATH}" &> /dev/null
if [[ $? -ne 0 ]]
then
  printf "${YELLOW}Error applying the patch...${NC} "
  echo "(Maybe it was already applied)"
else
  git apply "${PATCH_PATH}"
fi

## go back to previous directory
## discard output of `dirs`
popd > /dev/null

echo "# Installing :: zsh extensions - completed"
