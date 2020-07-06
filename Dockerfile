# Alpine image
FROM php:7.2-fpm-alpine

# Docker Deps
RUN apk add --update
RUN apk add --update --no-cache bash python3 curl which \
    composer libxslt-dev icu-dev libpng-dev php-tidy gettext-dev \
    libjpeg-turbo-dev bzip2-dev

RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install xml gd gettext exif mbstring json intl xml zip bz2 opcache mysqli pdo_mysql

# Install GCP SDK
RUN curl -sSL https://sdk.cloud.google.com | bash

ENV PATH $PATH:/root/google-cloud-sdk/bin