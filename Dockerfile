FROM centos:centos7

LABEL maintainer="Vincent BESANCON <besancon.vincent@gmail.com>"

ARG PUPPET_VERSION=3.6.2

RUN set -ex \
      && yum install -y http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm \
      && yum install -y epel-release \
      && yum clean all

RUN set -ex \
      && yum install -y puppet-$PUPPET_VERSION \
      && yum install -y puppet-server-$PUPPET_VERSION \
      && yum clean all

ADD puppet.conf /etc/puppet/puppet.conf
ADD hiera.yaml /etc/puppet/hiera.yaml

VOLUME ["/etc/puppet", "/var/lib/puppet"]

EXPOSE 8140

ENTRYPOINT [ "/usr/bin/puppet", "master", "--no-daemonize", "--verbose" ]
