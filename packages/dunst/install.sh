#!/usr/bin/env bash

TARGET_PATH="${HOME}/.config/dunst/"

echo "# Installing :: dunstrc"

# symlink config file to home config dir
echo "## Symlinking dunstrc files to ~/.config/dunst"
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

mkdir -p "${TARGET_PATH}"
ln -vsf "${SCRIPT_DIR}/dunstrc" "${TARGET_PATH}"

echo "# Installing :: dunstrc - completed"
