#!/bin/bash
set -e
[ -f /etc/openvpn/up.sh ] && /etc/openvpn/up.sh "$@"
if pgrep sockd > /dev/null; then
  echo "An existing sockd process was found. Terminating it."
  pkill sockd
fi
/usr/sbin/sockd -D
