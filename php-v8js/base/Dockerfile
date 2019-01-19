## First Step Build V8
FROM debian:stretch-slim as V8

ENV V8_VERSION=7.1.302.28
ENV V8_OUTPUT_DIR=/usr/local/v8

# install dependencies
RUN apt-get update \
  && apt-get -y install \
    autoconf \
    build-essential \
    libglib2.0-dev \
    git \
    subversion \
    make \
    g++ \
    python \
    curl \
    patchelf \
  && apt-get clean \
  && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git /tmp/depot_tools \
  && PATH=$PATH:/tmp/depot_tools \
# install v8
  && cd /tmp \
  && fetch v8 \
  && cd /tmp/v8 \
  && git checkout $V8_VERSION \
  && gclient sync \
  && tools/dev/v8gen.py -vv x64.release -- is_component_build=true \
  && ninja -C out.gn/x64.release/ \
  && mkdir -p $V8_OUTPUT_DIR/lib \
  && mkdir -p $V8_OUTPUT_DIR/include \
  && cp out.gn/x64.release/lib*.so out.gn/x64.release/*_blob.bin out.gn/x64.release/icudtl.dat \
    $V8_OUTPUT_DIR/lib \
  && cp -R include/* $V8_OUTPUT_DIR/include/ \
  && for A in $V8_OUTPUT_DIR/lib/*.so; do patchelf --set-rpath '$ORIGIN' $A; done \
  && apt-get remove --purge -y \
    autoconf \
    build-essential \
    libglib2.0-dev \
    git \
    subversion \
    make \
    g++ \
    python \
    curl \
    patchelf \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf tmp/* /var/lib/apt/lists/*

## Final Step
FROM php:7-fpm

ENV V8_OUTPUT_DIR=/usr/local/v8

COPY --from=V8 $V8_OUTPUT_DIR /usr/local/

# Install Dependencies
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apt-utils \
    imagemagick \
    ## Build Dependencies
    build-essential \
    libmagickwand-dev \
    libglib2.0-dev \
    git \
    curl \
    python \
  ## Get & Compile V8JS
  && cd /tmp \
  && git clone https://github.com/phpv8/v8js.git \
  && cd v8js \
  && phpize \
  && ./configure --with-v8js=$V8_OUTPUT_DIR LDFLAGS="-lstdc++" \
  && make \
  && make test \
  && make install \
# PECL Installs & PHP Extensions
  && pecl channel-update pecl.php.net \
  && pecl config-set php_ini /usr/local/etc/php/php.ini \
  && pecl install redis imagick \
  ## Setup PHP Extensions
  && docker-php-ext-install \
    mysqli \
    mbstring \
    pdo \
    pdo_mysql \
    tokenizer \
    xml \
  && docker-php-ext-enable \
    redis \
    imagick \
    v8js \
 # Cleanup
  && apt-get remove --purge -y \
    build-essential \
    libmagickwand-dev \
    libglib2.0-dev \
    git \
    curl \
    python \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf tmp/* /var/lib/apt/lists/*

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000