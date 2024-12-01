#!/bin/sh
set -e

install_pkgs() {
  set -f
  $DRY $PKG_INSTALL_CMD $PKG_TO_INSTALL > /dev/null
  set +f
}

make_dots() {
  set -f
  make -s $DOTS
  set +f
}

make_links() {
  find "out/$1" -type f | while read -r DOTFILE; do
    awk 'NF {exit 1}' "$DOTFILE" && continue #skip empty files
    RELFILE=$(echo "$DOTFILE" | sed 's|dot-|\.|g' | cut -d/ -f3-)
    LINKNAME="${2}${RELFILE}"
    TARGET=$(realpath "$DOTFILE")
    set +e
    $3 [ -f "$LINKNAME" ] && $3 diff "$TARGET" "$LINKNAME" > /dev/null 2>&1
    ARESAME="$?"
    set -e
    if $3 [ -f "$LINKNAME" ] && [ "$ARESAME" != 0 ]; then
      BACKUPFILEDIR="$BACKUPDIR/oldfiles/$(dirname "$LINKNAME")"
      $DRY mkdir -p "$BACKUPFILEDIR"
      $DRY $3 cp "$LINKNAME" "$BACKUPFILEDIR"
    fi
    [ "$ARESAME" != 0 ] && $DRY $3 mkdir -p "$(dirname "$LINKNAME")" && $DRY $3 cp "$TARGET" "$LINKNAME"
    VARSFILE="vars/$1/$RELFILE"
    if [ -f "$VARSFILE" ]; then
      export VARSMODE='perms'
      PERMS=$(sh "$VARSFILE")
      CHOWNARG=$(echo "$PERMS" | cut -d';' -f1)
      CHMODARG=$(echo "$PERMS" | cut -d';' -f2)
      $DRY $3 chown "$CHOWNARG" "$LINKNAME"
      $DRY $3 chmod "$CHMODARG" "$LINKNAME"
    fi
  done
}

enable_svs() {
  for SV_NAME in $SV_TO_ENABLE; do
    $DRY sudo ln -sf "/etc/sv/$SV_NAME" /var/service
  done
}

add_usr_svs_dots() {
  for SV_NAME in $USR_SV_TO_ENABLE; do
    DOTS="$DOTS out/home/dot-local/share/sv/$SV_NAME/run"
  done
}

enable_usr_svs() {
  for SV_NAME in $USR_SV_TO_ENABLE; do
    $DRY ln -sf "$HOME/.local/share/sv/$SV_NAME" "$HOME/.config/service"
  done
  for SV_NAME in $USR_SV_DOWN; do
    $DRY touch "$HOME/.config/service/$SV_NAME/down"
  done
}
BACKUPDIR="$HOME/.local/share/dots-backup/$(date -u +%Y-%m-%dT%H:%M:%S%Z)"
. "$1"
for PKGSCRIPT in pkgs/*/pre-install.sh; do
  . "$PKGSCRIPT"
done
install_pkgs
add_usr_svs_dots
make_dots
make_links 'home' "$HOME/"
make_links 'system' '/' 'sudo'
enable_svs
enable_usr_svs
