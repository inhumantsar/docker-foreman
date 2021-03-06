docker-foreman
==============

A specific hostname should be passed as the default hostname won't match facter's fqdn. Otherwise, this image will start you off with the Foreman Installer defaults and install away. For most purposes, the defaults will do. If you want something other than the defaults, use an answers file. An answers file can be provided by running the image with `docker run -it ... -v /path/to/answers:/etc/foreman/foreman-installer-answers.yaml inhumantsar/foreman /usr/sbin/foreman-installer -i`

*TL;DR: Love the defaults or else use an answers file.* 

Some things you'll probably want to think about changing:
  - `foreman-proxy / daemon`: Even if you don't set this to false, the start script will attempt to itself anyway.

Puppet is installed from the latest stable versions from the Puppet Labs apt repo. Should install 3.7.3 at time of writing. The [Docker Foreman plugin](https://github.com/theforeman/foreman-docker) is installed post-setup before the first launch.

Note that the database is stored within the container so do not remove the container unless you don't mind losing your DB! If you want to use an external DB, provide an answer file DB connection details.


# Run commands

`docker run -it -h foreman.test.lan -p 443:443 -p 80:80 -p 8443:8443 -p 8140:8140 inhumantsar/foreman`

## Optional volumes

 - `-v /path/to/answers.yaml:/etc/foreman/foreman-installer-answers.yaml`
 - `-v /path/to/etc/foreman:/etc/foreman`
 - `-v /path/to/etc/foreman-proxy:/etc/foreman-proxy`
 - `-v /path/to/etc/puppet:/etc/puppet`

# Tags Available
    
 - `latest`, `1.7` -- latest stable
 - `1.6` -- available but not supported
