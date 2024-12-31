#!/bin/sh

[ -z "$CFG_AUTORANDR" ] && return

autorandr_pfx="out/home/dot-config/autorandr"

PKG_TO_INSTALL="$PKG_TO_INSTALL autorandr"
[ -n "$CFG_OKAMI" ] && default_autorandr_profile="okami-main" autorandr_pactl_postswitch_profiles="okami-main okami-tv" DOTS="$DOTS $autorandr_pfx/okami-main/config $autorandr_pfx/okami-main/setup $autorandr_pfx/okami-tv/config $autorandr_pfx/okami-tv/setup"
[ -n "$default_autorandr_profile" ] && [ ! -e "$HOME/.config/autorandr/DEFAULT" ] && $DRY ln -s "$HOME/.config/autorandr/$default_autorandr_profile" "$HOME/.config/autorandr/DEFAULT"
if [ -n "$autorandr_pactl_postswitch_profiles" ]; then
	for profile in $autorandr_pactl_postswitch_profiles; do
		$DRY cp pkgs/autorandr/postswitch_pactl_profile.sh "$HOME/.config/autorandr/$profile/postswitch"
	done
fi
true
