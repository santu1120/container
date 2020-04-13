FROM richxsl/rhel7
MAINTAINER Username "santu"
RUN yum update && \
yum -y install apache2 \
php5 \
php5-mysql \
mysql-client \
mysql-server \
wget
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
ADD server-status.conf /etc/apache2/sites-available/
RUN a2ensite server-status.conf
RUN service apache2 start && \
service mysql start
RUN echo 'Hello World!' > /var/www/html/index.html
# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 chmod 755 /root/run_apache.sh
RUN chmod 755 /root/run_apache.sh 
CMD /root/run_apache.sh
EXPOSE 80
ENTRYPOINT /bin/bash
VOLUME /var/lib/mysql
