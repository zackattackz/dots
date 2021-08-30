[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#test
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

detect_and_set_xrandr_modes
srandrd display_handler
wal -R
(sleep 1s && nitrogen --restore) &
xset +fp /home/zach/.fonts
xset fp rehash
blueberry-tray &
picom &
dunst &
fcitx &
nvidia-settings --load-config-only
exec i3
