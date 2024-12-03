#!/bin/sh

do_diffs() {
    for f in $($3 find out/"$1" -type f); do
        RELFILE=$(echo "$f" | sed 's|dot-|\.|g' | cut -d/ -f3-)
        DIFFRES=$($3 diff "$f" "$2/$RELFILE")
        [ $? = 1 ] && echo "$RELFILE" && echo "$DIFFRES"
    done
}

make dots > /dev/null
do_diffs home /home/z
do_diffs system '' sudo
make clean > /dev/null
