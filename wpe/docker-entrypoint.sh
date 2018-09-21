#!/bin/sh

uuid=$(ip link show eth0 | awk '/ether/ {print $2}' | sha256sum | cut -d " " -f 1)
register_url=http://192.168.86.25:3000/displays

export WPE_URL=$register_url/$uuid

curl -XPUT $WPE_URL

exec $@
