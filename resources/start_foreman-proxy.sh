#!/bin/bash

# just in case
if [ -f /etc/foreman-proxy/settings.yml ]; then
  sed -i 's/:daemon: true/:daemon: false/' /etc/foreman-proxy/settings.yml
fi

/usr/bin/ruby /usr/share/foreman-proxy/bin/smart-proxy
