#!/bin/sh
regex='(http|https)://[a-zA-Z0-9./?=_-]*'
urls=$(grep -Eo "$regex" | sort -u)
[ -z "$urls" ] && exit
urlcount=$(echo "$urls" | wc -l)
url=$(echo "$urls" | dmenu -p "Go:" -w "$WINDOWID" -l "$urlcount") || exit
$BROWSER "$url" >/dev/null 2>&1 &
