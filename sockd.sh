#!/bin/bash
set -e
[ -f /etc/openvpn/up.sh ] && /etc/openvpn/up.sh "$@"
if pgrep sockd > /dev/null; then
  echo "An existing sockd process was found. Terminating it."
  pkill sockd
else
  echo "No existing sockd process found. Starting a new one."
fi
/usr/sbin/sockd -D
