[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

wal -R
(sleep 1s && nitrogen --restore) &
xset +fp /home/zach/.fonts
xset fp rehash
blueberry-tray &
picom &
$HOME/.config/dunst/launchdunst.sh
fcitx &
guake &
guake --restore-preferences ~/.config/guake/prefs
exec i3
