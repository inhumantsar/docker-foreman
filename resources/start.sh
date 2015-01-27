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

# install docker plugin for foreman
# relax, you don't have to use it if you don't want it.
if [ ! `dpkg -l | grep -E '^ii' | grep ruby-foreman-docker` ]; then
  apt-get install -y ruby-foreman-docker
fi

# normal startup
/usr/local/bin/supervisord --nodaemon -c /etc/supervisord.conf
