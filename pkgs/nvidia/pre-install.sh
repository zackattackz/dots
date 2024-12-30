#!/bin/sh

[ -z "$CFG_NVIDIA" ] && return

PKG_TO_INSTALL="$PKG_TO_INSTALL nvidia nvidia-libs-32bit"

DOTS="$DOTS out/system/etc/modprobe.d/10-nouveau_blacklist.conf"
