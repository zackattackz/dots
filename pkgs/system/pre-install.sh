#!/bin/sh

PKG_TO_INSTALL="$PKG_TO_INSTALL dbus acpid turnstile seatd pipewire feh netcat void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree systemd-boot bluez libspa-bluetooth"
[ -n "$CFG_INTEL" ] && PKG_TO_INSTALL="$PKG_TO_INSTALL intel-ucode"
DOTS="$DOTS out/home/dot-config/service/turnstile-ready/conf out/home/dot-local/bin/usv out/system/etc/acpi/lid.sh out/system/etc/acpi/events/lid out/system/usr/share/icons/default/index.theme out/system/etc/default/systemd-boot"
SV_TO_ENABLE="$SV_TO_ENABLE dbus acpid turnstiled seatd"
USR_SV_TO_ENABLE="$USR_SV_TO_ENABLE dbus pipewire wireplumber pipewire-pulse xautolock lockscreen"
USR_SV_DOWN="$USR_SV_DOWN pipewire xautolock lockscreen"
[ -f /etc/acpi/events/anything ] && sudo mv /etc/acpi/events/anything /etc/acpi/events/.anything
true
