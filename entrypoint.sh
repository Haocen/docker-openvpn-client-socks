#!/bin/bash

cd /etc/openvpn

while true; do
    echo "Starting OpenVPN"
    /usr/sbin/openvpn --config *.conf --script-security 2 --up /usr/local/bin/sockd.sh || true
    echo "OpenVPN exited. Trying again in 1 second."
    sleep 1
done
