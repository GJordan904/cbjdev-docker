FROM ppimarketing/base:php

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh \
  && apk add --update --no-cache \
    curl \
    bash \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

ENTRYPOINT /usr/local/bin/entrypoint.sh

EXPOSE 9000