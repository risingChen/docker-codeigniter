FROM buildpack-deps:jessie-curl

MAINTAINER qychen

RUN apt-get update && apt-get -y install supervisor php5-fpm php5-mysql memcached php5 php5-memcache mysql-client php5-memcached php5-curl

RUN apt-get -y install php5-gd php-apc php5-mcrypt

RUN apt-get -y install nginx

WORKDIR /usr/share/nginx/html/

COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY ./codeigniter /usr/share/nginx/html/codeigniter

RUN rm /etc/nginx/nginx.conf

COPY ./config/nginx.conf /etc/nginx/

RUN rm /etc/php5/fpm/php-fpm.conf

COPY ./config/php-fpm.conf /etc/php5/fpm/

CMD /sbin/entrypoint.sh    