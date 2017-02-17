FROM php:7.1-alpine
ENV PHP_EXTRA_CONFIGURE_ARGS=" --enable-phpdbg --with-gettext"
RUN apk upgrade --update \
    && apk add libmcrypt libmcrypt-dev libpng libpng-dev icu-libs icu-dev \
        postgresql-dev mysql-dev libxml2-dev sqlite-dev autoconf alpine-sdk libmemcached-dev cyrus-sasl-dev \
        imagemagick-dev libtool busybox bash gettext \
    && docker-php-ext-install opcache mcrypt bcmath gd intl json pdo_mysql pdo_pgsql soap zip pdo_sqlite pcntl \
    && pecl install memcached-3.0.2 \
    && docker-php-ext-enable memcached \
    && pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick
