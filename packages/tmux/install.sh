#!/usr/bin/env bash

echo "# Installing :: tmux"

# symlink config file to home's root
echo "## Symlinking tmux files to home"
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

ln -vsf "${SCRIPT_DIR}/tmux.conf" "${HOME}/.tmux.conf"

echo "# Installing :: tmux - completed"
