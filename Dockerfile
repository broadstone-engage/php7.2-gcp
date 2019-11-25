FROM php:7.2

# Initial update
RUN apt-get clean && apt-get update

# Container deps
RUN apt-get install -y aptitude
RUN aptitude install -y git libmcrypt-dev libpq-dev libcurl4-gnutls-dev libcurl4-openssl-dev libicu-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev

# Docker Deps
RUN docker-php-ext-install curl xml tidy gd gettext exif mbstring json intl xml zip bz2 opcache mysqli pdo_mysql

# GCP
RUN aptitude update && aptitude install -y wget gnupg
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb http://packages.cloud.google.com/apt cloud-sdk-stretch main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list
RUN aptitude update && aptitude install -y google-cloud-sdk

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- s--install-dir=/usr/local/bin --filename=composer

# RUN composer install