FROM cbjdev/php:base

WORKDIR /var/www
ENTRYPOINT /usr/local/bin/entrypoint-app.sh

EXPOSE 9000