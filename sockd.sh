#!/bin/bash
set -e
[ -f /etc/openvpn/up.sh ] && /etc/openvpn/up.sh "$@"
pkill sockd || true # Kill exising sockd if any
/usr/sbin/sockd -D
