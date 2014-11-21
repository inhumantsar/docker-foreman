FROM devopsil/puppet:3.7.0
MAINTAINER inhumantsar

EXPOSE 443

RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install http://yum.theforeman.org/releases/1.6/el6/x86_64/foreman-release.rpm
RUN yum -y install foreman-installer

# reset installer config, so the hostname is properly set at runtime
COPY foreman-installer-answers.yaml /etc/foreman/

# run setup on startup with current hostname
CMD puppet cert generate `hostname -f` && foreman-installer -v && tail -f /var/log/foreman/production.log
