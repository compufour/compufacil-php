FROM php:7.1-alpine
RUN apk upgrade --update \
    && apk add libmcrypt libmcrypt-dev libpng libpng-dev icu-libs icu-dev postgresql-dev
RUN apk add mysql-dev libxml2-dev
RUN apk add sqlite-dev
RUN docker-php-ext-install opcache mcrypt bcmath gd intl json pdo_mysql pdo_pgsql soap zip pdo_sqlite
RUN apk add autoconf
RUN apk add alpine-sdk
RUN apk add libmemcached-dev
RUN apk add cyrus-sasl-dev
RUN pecl install memcached-3.0.2 \
    && docker-php-ext-enable memcached
RUN apk add imagemagick-dev
RUN apk add libtool
RUN pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick


