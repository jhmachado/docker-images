FROM php:7.4.2-cli

RUN apt-get update && apt-get install vim -y && \
    apt-get install openssl -y && \
    apt-get install libssl-dev -y && \
    apt-get install wget -y && \
    apt-get install git -y && \
    apt-get install procps -y && \
    apt-get install htop -y

RUN cd /tmp && git clone https://github.com/swoole/swoole-src.git && \
    cd swoole-src && \
    git checkout v4.4.15 && \
    phpize  && \
    ./configure  --enable-openssl && \
    make && make install

RUN touch /usr/local/etc/php/conf.d/swoole.ini && \
    echo 'extension=swoole.so' > /usr/local/etc/php/conf.d/swoole.ini

RUN apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
