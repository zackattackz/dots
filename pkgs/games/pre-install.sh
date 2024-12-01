#!/bin/sh

[ -n "$CFG_WINE" ] && PKG_TO_INSTALL="$PKG_TO_INSTALL wine wine-common wine-mono winetricks wine-32bit"
[ -n "$CFG_LUTRIS" ] && PKG_TO_INSTALL="$PKG_TO_INSTALL lutris"
[ -n "$CFG_STEAM" ] && PKG_TO_INSTALL="$PKG_TO_INSTALL steam steam-udev-rules"
true
