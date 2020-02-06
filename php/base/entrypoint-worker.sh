#!/bin/sh
set -e

echo 'Init supervisor'
supervisord -c /etc/supervisord.conf
supervisorctl -c /etc/supervisord.conf
supervisorctl reread
supervisorctl update
supervisorctl start laravel-worker:*
echo 'Done setting up'
php-fpm
