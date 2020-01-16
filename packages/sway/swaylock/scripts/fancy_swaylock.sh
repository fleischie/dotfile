#!/usr/bin/env sh

SCROT_PATH=/tmp/swaylock.png

# produce blured screenshot of current desktop
grim ${SCROT_PATH}
convert ${SCROT_PATH} -blur 0x7 ${SCROT_PATH}

if [[ -f ${SCROT_PATH} ]]
then
  # show blured screenshot if it exists
  swaylock -i ${SCROT_PATH}
  rm -f ${SCROT_PATH}
else
  # fallback to image setup in $XDG_CONFIG_HOME/swaylock/config
  # or white background if screenshot couldn't be retrieved
  swaylock
fi
