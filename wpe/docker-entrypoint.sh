#!/bin/bash

url="file:///var/www/index.html"

if [[ -n $DISPLAYS_SERVER_HOST ]]; then
  uuid=$(ip link show eth0 | awk '/ether/ {print $2}' | sha256sum | cut -c1-8)
  url=${DISPLAYS_SERVER_HOST}/displays/$uuid

  curl "$url"
fi

webkitbrowser_config_path="/etc/WPEFramework/plugins/WebKitBrowser.json"
config=$(cat $webkitbrowser_config_path)
echo -n $config | jq ".configuration.url = \"$url\"" > $webkitbrowser_config_path

udevd &
udevadm trigger

fbcp &

exec "$@"
