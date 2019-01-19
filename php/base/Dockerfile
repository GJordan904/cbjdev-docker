FROM php:7-fpm-alpine

COPY php.ini /usr/local/etc/php

RUN apk upgrade -U \
  ## Instal Build Dependencies
  && apk add -U --virtual .build-deps \
    build-base \
    freetype-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    libxml2-dev \
    libzip-dev \
    zlib-dev \
    autoconf \
    imagemagick-dev \
  ## Install and Configure PHP
  && apk add -U \
    imagemagick \
    libzip \
    zlib \
    freetype \
    libpng \
    libjpeg-turbo \
  && docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/  \
  && docker-php-ext-install \
    gd \
    mysqli \
    mbstring \
    pdo \
    pdo_mysql \
    tokenizer \
    xml \
    zip \
  ## PECL Installs
  && pecl channel-update pecl.php.net \
  && pecl config-set php_ini /usr/local/etc/php/php.ini \
  && pecl install redis imagick \
  && docker-php-ext-enable redis imagick \
  # Cleanup
  && apk del .build-deps \
  && rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000