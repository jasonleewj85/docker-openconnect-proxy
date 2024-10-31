#!/bin/sh

function startsockd() {
    while [ 1 ]; do
        ip add show tun0 2>/dev/null && sockd
        sleep 1
    done
}

# FIXME: move to s6?
startsockd &

printf "$PIN$TOKEN\n$PASSWORD\ny" | openconnect "$@"
