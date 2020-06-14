FROM php:7.4.7-apache-buster

LABEL maintainer="Jhonatan Machado <jh.machado12@gmail.com>"

RUN echo "---> Installing Environmental Dependencies"

COPY scripts/install-dependencies.sh /
RUN chmod o+x /install-dependencies.sh
RUN /install-dependencies.sh

RUN echo "---> Installing Composer" && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --allow-root && \
    echo "---> Cleaning up" && \
    rm -rf /tmp/*

RUN echo "---> Installing 'Wait for it'"
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/db049716e42767d39961e95dd9696103dca813f1/wait-for-it.sh /usr/bin/
RUN chmod +x /usr/bin/wait-for-it.sh

RUN mkdir /app
RUN chown www-data:www-data /app
COPY configs/host.conf /etc/apache2/sites-enabled/000-default.conf

COPY scripts/entrypoint.sh /
RUN chmod o+x /entrypoint.sh

WORKDIR /app
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
