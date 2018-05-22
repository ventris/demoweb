From debian:stretch

RUN DEBIAN_FRONTEND=noninteractive apt-get update; \
	   DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 dumb-init

ADD index.html /var/www/html/index.html

ENV APACHE_RUN_DIR /etc/apache2
ENV APACHE_PID_FILE /etc/apache2/apache2.pid
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
