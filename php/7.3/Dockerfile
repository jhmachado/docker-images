FROM alpine:3.8

LABEL maintainer="Jhonatan Machado <jh.machado12@gmail.com>"

ENV FRAMEWORK=laravel \
    OPCACHE_MODE="normal" \
    PHP_MEMORY_LIMIT=256M \
    XDEBUG_ENABLED=false \
    COMPOSER_PROCESS_TIMEOUT=1200

RUN echo "---> Enabling PHP-Alpine" && \
    apk add --update wget && \
    wget -O /etc/apk/keys/php-alpine.rsa.pub http://php.codecasts.rocks/php-alpine.rsa.pub && \
    echo "@php http://php.codecasts.rocks/v3.8/php-7.3" >> /etc/apk/repositories && \
    apk add --update \
    curl \
    bash \
    wget \
    make \
    sudo && \
    echo "---> Preparing and Installing PHP" && \
    apk add --update \
    php7@php \
    php7-apcu@php \
    php7-bcmath@php \
    php7-bz2@php \
    php7-calendar@php \
    php7-curl@php \
    php7-ctype@php \
    php7-exif@php \
    php7-fpm@php \
    php7-gd@php \
    php7-gmp@php \
    php7-iconv@php \
    php7-imagick@php \
    php7-imap@php \
    php7-intl@php \
    php7-json@php \
    php7-mbstring@php \
    php7-mysqlnd@php \
    php7-pdo_mysql@php \
    php7-mongodb@php \
    php7-opcache@php \
    php7-pdo_pgsql@php \
    php7-pgsql@php \
    php7-posix@php \
    php7-redis@php \
    php7-soap@php \
    php7-sodium@php \
    php7-sqlite3@php \
    php7-pdo_sqlite@php \
    php7-xdebug@php \
    php7-xml@php \
    php7-xmlreader@php \
    php7-openssl@php \
    php7-phar@php \
    php7-xsl@php \
    php7-zip@php \
    php7-zlib@php \
    php7-pcntl@php \
    php7-cgi@php \
    php7-phpdbg@php && \
    echo "---> Preparing and Installing Composer" && \
    sudo ln -s /usr/bin/php7 /usr/bin/php && \
    sudo ln -s /usr/bin/php-cgi7 /usr/bin/php-cgi && \
    sudo ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    echo "---> Cleaning up" && \
    rm -rf /tmp/* && \
    adduser -D -u 1000 jhonatan && \
    mkdir -p /var/www/app && \
    chown -R jhonatan:jhonatan /var/www && \
    echo "---> Configuring PHP" && \
    echo "jhonatan  ALL = ( ALL ) NOPASSWD: ALL" >> /etc/sudoers && \
    sed -i "/user = .*/c\user = jhonatan" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/^group = .*/c\group = jhonatan" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/listen.owner = .*/c\listen.owner = jhonatan" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/listen.group = .*/c\listen.group = jhonatan" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/listen = .*/c\listen = [::]:9000" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/;access.log = .*/c\access.log = /proc/self/fd/2" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/;clear_env = .*/c\clear_env = no" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/;catch_workers_output = .*/c\catch_workers_output = yes" /etc/php7/php-fpm.d/www.conf && \
    sed -i "/pid = .*/c\;pid = /run/php/php7.1-fpm.pid" /etc/php7/php-fpm.conf && \
    sed -i "/;daemonize = .*/c\daemonize = yes" /etc/php7/php-fpm.conf && \
    sed -i "/error_log = .*/c\error_log = /proc/self/fd/2" /etc/php7/php-fpm.conf && \
    sed -i "/post_max_size = .*/c\post_max_size = 1000M" /etc/php7/php.ini && \
    sed -i "/upload_max_filesize = .*/c\upload_max_filesize = 1000M" /etc/php7/php.ini && \
    chown -R jhonatan:jhonatan /home/jhonatan && \
    rm -rf /tmp/*

USER jhonatan

WORKDIR "/var/www/app"

ENV PATH=/home/jhonatan/.composer/vendor/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/bash"]