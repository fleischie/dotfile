#!/bin/sh
################################################################################
#### Part of sway config (to be used with special media-keys).
#
# This script handles simple interaction with cmus.
#
# Dependencies:
# - cmus
# - libnotify
# - adwaita-icon-theme
# - ripgrep
#
# @author: Karl Fleischmann
# @name: whats_playing_cmus.sh
# @contact: fleischmann |dot| karl |at| gmail |dot| com
#
# Usage:
#     whats_playing_cmus.sh [OPERATION]
#
#     OPERATION:
#         next      play the next track in queue
#         prev      play the previous track in queue
#         toggle    toggle between playing and pausing
#                   defaults to displaying the currently running track
#
#
################################## Change Log ##################################
# 1.5 / 2020-06-09
#   * update comments
#   * replace `grep` with `rg`
# 1.4 / 2019-12-26
#   * update icon paths
# 1.3 / 2018-08-13
#   * update icons
# 1.2 / 2017-01-16
#   * replace icons
#   * add information to header comment
# 1.1 / 2015-12-16
#   * Add album to output.
# 1.0.1 / 2015-11-23
#   * Fix queries to only result intended lines.
# 1.0 / 2015-11-19
#   * first draft
################################################################################

# setup base command (to be current if called)
CMD="cmus-remote --query 2>/dev/null"
eval $CMD >& /dev/null
STATUS_EXIT=$?

# setup exit status
EXIT_USAGE=1
EXIT_NOT_RUNNING=2

# setup ICONs to display
ICON_STOP=/usr/share/icons/Adwaita/32x32/actions/media-playback-stop-symbolic.symbolic.png
ICON_PAUSE=/usr/share/icons/Adwaita/32x32/actions/media-playback-pause-symbolic.symbolic.png
ICON_PLAY=/usr/share/icons/Adwaita/32x32/actions/media-playback-start-symbolic.symbolic.png
ICON_NEXT=/usr/share/icons/Adwaita/32x32/actions/media-skip-forward-symbolic.symbolic.png
ICON_PREV=/usr/share/icons/Adwaita/32x32/actions/media-skip-backward-symbolic.symbolic.png
ICON_PLAYER=/usr/share/icons/Adwaita/32x32/devices/media-tape-symbolic.symbolic.png


##
# send_notification - send notification via notify_send
#
# @param string summary to send
# @param string body to send
# @param string path to icon to display if any
##
send_notification() {
	# handle parameters
	local summary=$1; shift
	local body=$1; shift

	# default icon to "" if empty, else set it to "-i <icon>"
	local icon=""
	if [[ -n $1 ]]
	then
		icon="-i $1"
	fi

	# call notify-send to display information
	{
		notify-send -u low ${icon} "${summary}" "${body}"
	} >& /dev/null
}


##
# exit early if cmus is not running
##
if [[ $STATUS_EXIT -ne 0 ]]
then
	send_notification "cmus is not running" "" ${ICON_STOP}
	exit ${EXIT_NOT_RUNNING}
fi


##
# use last passed parameter to determine operation to use
#
# @param string operation to handle
##
if [[ $1 == 'next' || $1 == 'prev' || $1 == 'toggle' ]]
then
	# if opreational parameter, take it
	OPERATION=$1
fi


##
# handle pause/stop operations
##
PLAY_STATUS=$(eval $CMD | rg "status" | cut -d" " -f2)
SUMMARY=""
if [[ $PLAY_STATUS == 'stopped' ]]
then
	# set title to stopped status
	TITLE="Nothing is playing!"
else
	# get artist and title by id3tag
	TITLE=$(eval $CMD | rg "tag title " | cut -d" " -f3-)
	ARTIST=$(eval $CMD | rg "tag artist " | cut -d" " -f3-)
	ALBUM=$(eval $CMD | rg "tag album " | cut -d" " -f3-)

	# build summary from retrieved data
	if [[ -n ${ARTIST} ]]
	then
		SUMMARY="${ARTIST}"
	fi

	if [[ -n ${ALBUM} ]]
	then
		if [[ -n ${SUMMARY} ]]
		then
			SUMMARY="${SUMMARY} - ${ALBUM}"
		else
			SUMMARY="${ALBUM}"
		fi
	fi
fi


##
# setup icon depending on operation, fallback is multimedia-player
##
if [[ -z $OPERATION ]]
then
	if [[ $PLAY_STATUS == 'stopped' ]]
	then
		ICON=${ICON_STOP}
	elif [[ $PLAY_STATUS == 'paused' ]]
	then
		ICON=${ICON_PAUSE}
	else
		ICON=${ICON_PLAY}
	fi
else
	if [[ $OPERATION == 'next' ]]
	then
		ICON=${ICON_NEXT}
	elif [[ $OPERATION == 'prev' ]]
	then
		ICON=${ICON_PREV}
	else
		ICON=${ICON_PLAYER}
	fi
fi


##
# handle empty title
##
if [[ -z $TITLE ]]
then
	FILE_NAME=$(eval $CMD | rg "^file" | cut -d" " -f2-)

	if [[ -n ${FILE_NAME} ]]
	then
		TITLE=$FILE_NAME
	fi
fi


##
# display results
##
send_notification "${TITLE}" "${SUMMARY}" ${ICON}
