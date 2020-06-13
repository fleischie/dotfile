#!/usr/bin/env bash

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

echo "# Installing :: sway configuration"

# symlink config file to home config dir
echo "## Symlinking sway config files to ${CONFIG_DIR}"
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

mkdir -p "${CONFIG_DIR}/mako"
ln -vsf "${SCRIPT_DIR}/mako/config" "${CONFIG_DIR}/mako/"

mkdir -p "${CONFIG_DIR}/sway"
ln -vsf "${SCRIPT_DIR}/sway/config" "${CONFIG_DIR}/sway/"
ln -vsf "${SCRIPT_DIR}/sway/input.conf" "${CONFIG_DIR}/sway/"
ln -vsf "${SCRIPT_DIR}/sway/scripts" "${CONFIG_DIR}/sway/"

mkdir -p "${CONFIG_DIR}/swaylock/scripts"
ln -vsf "${SCRIPT_DIR}/swaylock/config" "${CONFIG_DIR}/swaylock/"
ln -vsf \
  "${SCRIPT_DIR}/swaylock/scripts/fancy_swaylock.sh" \
  "${CONFIG_DIR}/swaylock/scripts/"

mkdir -p "${CONFIG_DIR}/waybar/scripts"
ln -vsf "${SCRIPT_DIR}/waybar/config" "${CONFIG_DIR}/waybar/"
ln -vsf "${SCRIPT_DIR}/waybar/style.css" "${CONFIG_DIR}/waybar/"

mkdir -p "${CONFIG_DIR}/wofi"
ln -vsf "${SCRIPT_DIR}/wofi/config" "${CONFIG_DIR}/wofi/"
ln -vsf "${SCRIPT_DIR}/wofi/style.css" "${CONFIG_DIR}/wofi/"

echo -e "\n# Note:"
echo    "## Make sure to create an \`output.conf\` file to setup the background of sway."
echo -e "## Make sure you install all custom scripts to waybar.\n"

echo "# Installing :: sway configuration - completed"
