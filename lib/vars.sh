#!/bin/sh

process_vars() {
  printf '%s' "$2" | sed ':a;N;$!ba;s/\n/\\n/g' | awk 'BEGIN {RS="\\\\n:====:\\\\n";FS="\\\\n:----:\\\\n";} {print $1"\n"$2}' | while read -r VAR && read -r VAL; do
    PROCESSED=$("$1" "$VAR" "$VAL")
    echo "$PROCESSED"
  done
}
