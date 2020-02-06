FROM php:7-fpm-alpine

## Install deps and config PHP
RUN apk upgrade -U \
  ## Instal Build Dependencies
  && apk add -U --no-cache --virtual .build-deps \
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
  && apk add -U --no-cache \
    poppler-utils \
    imagemagick \
    libzip \
    zlib \
    freetype \
    libpng \
    libjpeg-turbo \
    supervisor \
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
    exif \
    pcntl \
  ## PECL Installs
  && pecl channel-update pecl.php.net \
  && pecl config-set php_ini /usr/local/etc/php/php.ini \
  && pecl install redis imagick \
  && docker-php-ext-enable redis imagick \
  # Cleanup
  && apk del .build-deps \
  && rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

## Remove default configs
RUN rm /usr/local/etc/php-fpm.d/*
## Copy our configs & entrypoints
COPY entrypoint-app.sh entrypoint-worker.sh /usr/local/bin/
COPY php.ini /usr/local/etc/php/
COPY php-fpm.conf /usr/local/etc/
COPY www.conf  /usr/local/etc/php-fpm.d/
COPY supervisor/laravel-worker.conf /etc/supervisord.conf
## Set execution perms on entry scripts
RUN chmod +x /usr/local/bin/entrypoint-app.sh /usr/local/bin/entrypoint-worker.sh

WORKDIR /var/www
ENTRYPOINT /usr/local/bin/entrypoint-app.sh

EXPOSE 9000
