#!/bin/bash

# no foreman install log? run forman installer
if [ ! -f /var/log/foreman-install.log ]; then 
  if [ -f /etc/foreman/foreman-installer.yaml ]; then
    echo 'Answers found, starting quiet foreman installer'
    foreman-installer -v
    if [ $? -ne 0 ]; then exit $?; fi
  else
    echo 'Starting interactive installer'
    foreman-installer -iv
  fi
fi

# normal startup
/usr/local/bin/supervisord --nodaemon -c /etc/supervisord.conf
