#!/bin/bash

cd /etc/openvpn

while true; do
    echo "Setting sockd port to $PORT"
    sed -i -e "s/^internal: eth0 port.*$/internal: eth0 port = $PORT/g" /etc/sockd.conf
    echo "Starting OpenVPN"
    /usr/sbin/openvpn --data-ciphers AES-256-GCM:AES-128-GCM:AES-256-CBC:AES-128-CBC --config *.ovpn --script-security 2 --up /usr/local/bin/sockd.sh || true
    echo "OpenVPN exited. Trying again in 1 second."
    sleep 1
done
