FROM centos:7
LABEL Author = "ToiTL"
LABEL Description = "DOCKERFILE : Allows the creation of a Container with a Centreon distribution installed via packages"

MAINTAINER toitl@rikkeisoft.com
ENV DEBIAN_FRONTEND noninteractive
ENV http_proxy 'http://192.168.1.2:3128'
ENV https_proxy 'https://192.168.1.2:3128'

ENV container docker

# normal updates
RUN yum -y update

# nano
RUN yum -y install nano

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# php
RUN yum -y install php72w php72w-opcache php72w-cli php72w-common php72w-gd php72w-intl php72w-mbstring php72w-mcrypt php72w-mysql php72w-mssql php72w-pdo php72w-pear php72w-soap php72w-xml php72w-xmlrpc

# apache
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
  systemd-tmpfiles-setup.service ] || rm -f $i; done); \
  rm -f /lib/systemd/system/multi-user.target.wants/*;\
  rm -f /etc/systemd/system/*.wants/*;\
  rm -f /lib/systemd/system/local-fs.target.wants/*; \
  rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
  rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
  rm -f /lib/systemd/system/basic.target.wants/*;\
  rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
RUN yum -y install httpd

# tools cron
RUN yum -y install epel-release iproute at curl crontabs git

# pagespeed
RUN curl -O https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_x86_64.rpm \
 && rpm -U mod-pagespeed-*.rpm \
 && yum clean all \
 && rm -rf /etc/localtime \
 && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# we want some config changes
COPY config/php_settings.ini /etc/php.d/
COPY config/v-host.conf /etc/httpd/conf.d/

# create webserver-default directory
RUN mkdir -p /var/www/html
RUN curl https://get.fuelphp.com/oil | sh
WORKDIR /var/www/html/

EXPOSE 80

RUN systemctl enable httpd.service

CMD ["/usr/sbin/init"]