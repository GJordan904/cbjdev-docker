FROM cbjdev/php:base

WORKDIR /var/www
ENTRYPOINT /usr/local/bin/entrypoint-worker.sh

EXPOSE 9001