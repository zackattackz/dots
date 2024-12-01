#!/bin/sh
set -e

. lib/vars.sh

FILE="$1"
VARFILE="$2"
OUTFILE="$3"
process_var () {
  PROCESSOUT=$(echo "s/{{$1}}/$2" | awk '{printf "%s\\\n", $0}' | head -c -2)
  printf '%s/g\n' "$PROCESSOUT"
}
export VARSMODE='t'
VARS=$(sh "$VARFILE")
SEDSCRIPT=$(mktemp)
process_vars "process_var" "$VARS" > "$SEDSCRIPT"
sed -f "$SEDSCRIPT" -e 's/{{\S\+}}//g' "$FILE" > "$OUTFILE"
rm "$SEDSCRIPT"
