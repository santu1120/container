FROM ubuntu:14.04
MAINTAINER Username "santu"
RUN apt-get update && \
apt-get -y install apache2 \
php5 \
php5-mysql \
mysql-client \
mysql-server \
wget
RUN wget http:// wordpress.org/latest.tar.gz && \
tar -xvf latest.tar.gz && \
cp -R ./wordpress/* /var/www/html && \
rm /var/www/html/html.index
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80
ENTRYPOINT /bin/bash
VOLUME /var/lib/mysql
