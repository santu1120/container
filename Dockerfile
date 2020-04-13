FROM centos
MAINTAINER Username "santu"
RUN yum update -y
RUN  yum install httpd -y
RUN service start httpd
RUN echo 'Hello World! Santu 0000000000000000' > /var/www/html/index.html
EXPOSE 80
ENTRYPOINT /bin/bash
