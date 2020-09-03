FROM httpd:latest
LABEL maintainer="Daniel Nicolas Gisolfi"

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
RUN mkdir -p /usr/local/apache2/conf/sites/
COPY ./index.html /var/www/index.html
RUN echo "127.0.0.1 SERVER.HOSTNAME" >> /etc/hosts

EXPOSE 80
EXPOSE 443
CMD ["httpd", "-D", "FOREGROUND"]