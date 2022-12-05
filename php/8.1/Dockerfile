FROM php:8.1.0-fpm AS base

LABEL maintainer="Jhonatan Machado <jh.machado12@gmail.com>"

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#
# Test stage
# Runs all the tests using composer
#
FROM base AS test

CMD ["make test"]

#
# App stage
# Runs the fpm engine so the app can work
#
FROM base AS app

CMD ["php-fpm"]