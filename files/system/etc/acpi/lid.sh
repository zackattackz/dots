#!/bin/sh
case "$1" in
    button/lid)
        case "$3" in
            close)
                # TODO: make generic for user(s)?
                su -c - z 'export DISPLAY=$(cat /home/z/.config/service-env/DISPLAY); xautolock -locknow' && sleep 2 && zzz
                ;;
        esac
        ;;
esac
