FROM devopsil/puppet:3.6.2
MAINTAINER inhumantsar

### Sets up Foreman 1.7 with a clean database and a whole bunch of plugins
### Useful for testing, could also be suitable for production if you like to live dangerously.
### Run for testing: 
#     docker build -t foreman:1.7 . && docker run -it -p 8443:443 foreman:1.7
### Run for production: 
#     docker build -t foreman:1.7 . && docker run -d -p 443:443 --name foreman-1.7 foreman:1.7

EXPOSE 443

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install http://yum.theforeman.org/releases/1.7/el6/x86_64/foreman-release.rpm
RUN yum -y install foreman-installer

# reset installer config, so the hostname is properly set at runtime
COPY foreman-installer-answers.yaml /etc/foreman/

# run setup on startup with current hostname
CMD puppet cert generate `hostname -f` && foreman-installer -v && tail -f /var/log/foreman/production.log
