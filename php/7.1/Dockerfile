FROM alpine:3.7

LABEL maintainer="Jhonatan Machado <jh.machado12@gmail.com>"

# Set uid/gid correctly
RUN adduser -D -u 1000 -g 1000 -s /bin/sh php

RUN apk update && \
    apk add curl git zip

# Install PHP7
RUN echo "---> Preparing and Installing PHP" && \
    apk add --no-cache --update \
    tini \
    php7 \
    php7-fpm \
    php7-apcu \
    php7-pdo \
    php7-pdo_mysql \
    php7-ctype \
    php7-xml \
    php7-simplexml \
    php7-gd \
    php7-zlib \
    php7-bz2 \
    php7-zip \
    php7-openssl \
    php7-curl \
    php7-opcache \
    php7-json \
    php7-dom \
    php7-fileinfo \
    php7-iconv \
    php7-ftp \
    php7-mbstring \
    php7-iconv \
    php7-bcmath \
    php7-session \
    php7-pcntl \
    php7-xmlwriter \
    php7-tokenizer \
    php7-redis \
    php7-oauth \
    php7-zmq \
    php7-phar

RUN echo "---> Preparing and Installing Composer" && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    echo "---> Cleaning up" && \
    rm -rf /tmp/* && \
    mkdir -p /code && \
    chown -R php:php /code && \
    echo "---> Configuring PHP" && \
    echo "php  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i "/user = .*/c\user = php" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/^group = .*/c\group = php" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/listen.owner = .*/c\listen.owner = php" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/listen.group = .*/c\listen.group = php" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/listen = .*/c\listen = [::]:9000" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/;access.log = .*/c\access.log = /proc/self/fd/2" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/;clear_env = .*/c\clear_env = no" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/;catch_workers_output = .*/c\catch_workers_output = yes" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/pid = .*/c\;pid = /run/php/php7.1-fpm.pid" /etc/php7/php-fpm.conf && \
    sed -i "/;daemonize = .*/c\daemonize = yes" /etc/php7/php-fpm.conf && \
    sed -i "/error_log = .*/c\error_log = /proc/self/fd/2" /etc/php7/php-fpm.conf && \
    sed -i "/post_max_size = .*/c\post_max_size = 1000M" /etc/php7/php.ini && \
    sed -i "/upload_max_filesize = .*/c\upload_max_filesize = 1000M" /etc/php7/php.ini && \
    chown -R php:php /home/php && \
    rm -rf /tmp/*

#ADD start.sh /scripts/start.sh
#RUN chmod +x /scripts/start.sh

ADD custom.ini /etc/php7/conf.d/zz_custom.ini
ADD www.conf /etc/php7/php-fpm.d/www.conf

USER php

WORKDIR "/code"

#ENTRYPOINT ["/scripts/start.sh"]

CMD ["php-fpm7"]

EXPOSE 9000

#CMD ["/bin/bash"]
