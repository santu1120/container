FROM ubuntu:14.04
MAINTAINER Username "santu"
RUN apt-get update && \
apt-get -y install apache2 \
php5 \
php5-mysql \
mysql-client \
mysql-server \
wget
RUN service apache2 start && \
service mysql start
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
EXPOSE 80
ENTRYPOINT /bin/bash
VOLUME /var/lib/mysql
