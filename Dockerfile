FROM ubuntu:18.04
MAINTAINER Username "santu"
RUN apt-get update && \
apt-get -y install apache2 \
mysql-client \
mysql-server 
# Install apache and write hello world message
RUN echo 'Hello World! 66666666666666666666666666666666666666666666' > /var/www/html/index.html
# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 chmod 755 /root/run_apache.sh
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
EXPOSE 80
CMD /root/run_apache.sh
