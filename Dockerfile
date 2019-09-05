FROM ubuntu:bionic
MAINTAINER James Anglin

# avoid timezone prompt
ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && DEBIAN_FRONTEND=noninteractive && apt-get install -y -q git php7.2 php7.2-dev php7.2-cli php7.2-mysql php-pear phpunit zlib1g-dev vim

RUN cd /usr/local/bin && curl -sS https://getcomposer.org/installer | php
RUN cd /usr/local/bin && mv composer.phar composer

RUN pecl install grpc
RUN echo "extension=grpc.so" > /etc/php/7.2/cli/conf.d/30-grpc.ini