#!/bin/sh

REPOS_TO_CLONE="git@github.com:zackattackz/st.git git@github.com:zackattackz/dwm.git git://git.suckless.org/dmenu"
for REPO_REMOTE in $REPOS_TO_CLONE; do
  REPO_NAME=$(basename "$REPO_REMOTE" | cut -d'.' -f1)
  [ -e "$SRC_DIR/$REPO_NAME" ] && continue
  $DRY git clone "$REPO_REMOTE" "$SRC_DIR/$REPO_NAME"
done
