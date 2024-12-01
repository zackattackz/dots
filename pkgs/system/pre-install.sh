#!/bin/sh

PKG_TO_INSTALL="$PKG_TO_INSTALL dbus acpid turnstile seatd pipewire feh netcat void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree"
DOTS="$DOTS out/home/dot-config/service/turnstile-ready/conf out/home/dot-local/bin/usv"
SV_TO_ENABLE="$SV_TO_ENABLE dbus acpid turnstiled seatd"
USR_SV_TO_ENABLE="$USR_SV_TO_ENABLE dbus pipewire wireplumber pipewire-pulse xautolock lockscreen"
USR_SV_DOWN="$USR_SV_DOWN pipewire xautolock lockscreen"
