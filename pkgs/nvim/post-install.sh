#!/bin/sh

[ -e "$HOME/.config/nvim" ] || $DRY git clone git@github.com:zackattackz/nvim.git "$HOME/.config/nvim"
true
