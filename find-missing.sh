#!/bin/sh

xbps-query -m | awk -F'-' '{for (i=1; i<NF-1; i++) printf("%s-", $i)} {printf($i"\n")}' | while read r; do res=$(grep -rn "$r" pkgs/); [ -z "$res" ] && echo "$r"; done
