# OpenVPN client + SOCKS proxy
# Usage:
# Create configuration (.ovpn), mount it in a volume
# docker run --volume=something.ovpn:/ovpn.conf:ro --device=/dev/net/tun --cap-add=NET_ADMIN
# Connect to (container):1080
# Note that the config must have embedded certs
# See `start` in same repo for more ideas

FROM alpine

LABEL org.opencontainers.image.source="https://github.com/Haocen/docker-openvpn-client-socks"

COPY sockd.sh /usr/local/bin/
COPY entrypoint.sh /

RUN true \
    && apk add --update-cache dante-server openvpn bash openresolv openrc sed \
    && rm -rf /var/cache/apk/* \
    && chmod a+x /usr/local/bin/sockd.sh \
    && true

COPY sockd.conf /etc/

ENV PORT=1080

ENTRYPOINT [ "/entrypoint.sh" ]
