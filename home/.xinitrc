[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

detect_and_set_xrandr_modes
srandrd display_handler
wal -R
(sleep 1s && nitrogen --restore) &
xset +fp /home/zach/.fonts
xset fp rehash
mopidy &
nvidia-settings --load-config-only
fcitx &
if [[ "$SESSION_TYPE" == "i3" ]]; then
	picom &
	blueberry-tray &
	$HOME/.config/dunst/launchdunst.sh
	nm-applet &
	exec i3
elif [[ "$SESSION_TYPE" == "gnome" ]]; then
	export XDG_SESSION_TYPE=x11
	export GDK_BACKEND=x11
	exec gnome-session
fi
