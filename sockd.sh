#!/bin/bash
set -e
[ -f /etc/openvpn/up.sh ] && /etc/openvpn/up.sh "$@"
if pgrep -f /usr/sbin/sockd > /dev/null; then
    echo "An existing /usr/sbin/sockd process was found. Terminating it."
    # Use the -f flag here as well to be specific
    pkill -f /usr/sbin/sockd
    # Give it a moment to release resources
    sleep 1
fi

echo "Starting new sockd daemon in the background..."
/usr/sbin/sockd -D

echo "OpenVPN up script completed successfully."
exit 0
