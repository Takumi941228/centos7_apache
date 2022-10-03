FROM centos:7

EXPOSE 80

RUN yum -y install epel-release
RUN yum -y install firewalld
RUN yum -y install httpd mod_pearl

ADD index.html /var/www/html/index.html

CMD [ "/sbin/init" ]