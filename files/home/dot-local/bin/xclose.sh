#!/bin/sh

normalkill() {
    exec xdotool getactivewindow windowkill
}

WINID=$(xdotool getactivewindow)
WINPROP=$(xprop -id "$WINID")
WINNAME=$(echo "$WINPROP" | grep '_NET_WM_NAME' | sed -nE 's/.*"(.+)"$/\1/p')
[ "$WINNAME" != 'st' ] && normalkill
WINPID=$(echo "$WINPROP" | grep '_NET_WM_PID' | grep -Eo '[0-9]+$')
TMUXPID=$(pgrep -P "$WINPID")
[ -z "$TMUXPID" ] && normalkill
TMUXSESSION=$(tmux list-clients -F '#S' -f "#{==:#{client_pid},$TMUXPID}")
[ -z "$TMUXSESSION" ] && normalkill
ALLTMUXWINS=$(tmux lsw -a -F '#S:#I:#{?window_active,y,}' -f '#{&&:#{==:#{session_group},main},#{?session_attached,y,}}')
TMUXWIN=$(echo "$ALLTMUXWINS" | sed -nE "s/$TMUXSESSION:(.):y/\1/p")
ATLEASTTWOWINS=$(echo "$ALLTMUXWINS" | grep -E ":$TMUXWIN:y" | sed -n '2p')
[ -n "$TMUXWIN" ] && [ -z "$ATLEASTTWOWINS" ] && tmux kill-window -t "$TMUXSESSION:$TMUXWIN" \; kill-session -t "$TMUXSESSION" && exit 0
tmux kill-session -t "$TMUXSESSION"
