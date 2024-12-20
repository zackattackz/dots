#!/bin/sh

PKG_TO_INSTALL="$PKG_TO_INSTALL xorg-minimal xclip xorg-fonts xrandr xsetroot font-iosevka liberation-fonts-ttf mesa-dri vulkan-loader picom firefox chromium chromium-widevine tmux zip unzip hstr xset herbe xautolock slock alttab Fonts-TLWG font-sarasa-gothic xprop xdotool xdg-utils xz nerd-fonts-symbols-ttf fd fzf ripgrep zstd bash-language-server lua-language-server patch pyright tree weechat zathura zathura-pdf-mupdf ctags texinfo"
DOTS="$DOTS out/home/dot-xinitrc out/home/dot-config/picom/picom.conf out/home/dot-local/bin/xsetstatus out/home/dot-config/tmux/tmux.conf out/home/dot-config/tmux/theme.conf out/home/dot-local/bin/linkmenu.sh out/home/dot-local/bin/stclose.sh out/home/dot-local/bin/tmenu out/home/dot-local/bin/tpain"

[ -n "$CFG_INTEL" ] && PKG_TO_INSTALL="$PKG_TO_INSTALL intel-video-accel mesa-vulkan-intel mesa-32bit mesa-vulkan-intel-32bit vulkan-loader-32bit"
if [ -n "$CFG_LAPTOP" ]; then
  PKG_TO_INSTALL="$PKG_TO_INSTALL acpilight"
  DOTS="$DOTS out/system/etc/udev/rules.d/backlight.rules out/system/etc/X11/xorg.conf.d/10-touchpad.conf"
fi
true
