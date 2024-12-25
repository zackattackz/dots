#!/bin/sh
$DRY git config --global user.email "z@zmhanham.com"
$DRY git config --global user.name "Zachary Hanham"
$DRY git config --global init.defaultBranch "main"
$DRY git config --global alias.s status
$DRY git config --global alias.a add
$DRY git config --global alias.aa 'add .'
$DRY git config --global alias.d diff
$DRY git config --global alias.ds 'diff --staged'
$DRY git config --global alias.c commit
$DRY git config --global alias.cm 'commit -m'
$DRY git config --global alias.ca 'commit --amend'
$DRY git config --global alias.can 'commit --amend --no-edit'
$DRY git config --global alias.ls ls-files
$DRY git config --global alias.p push
$DRY git config --global alias.f fetch
$DRY git config --global alias.l pull
$DRY git config --global core.excludesfile "$HOME/.config/git/ignore"
