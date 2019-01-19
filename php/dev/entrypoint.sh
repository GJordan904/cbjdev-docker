#!/bin/sh
set -e

echo 'Entered entrypoint.sh' && \
chgrp -R www-data /var/www && \
find /var/www -type f -exec chmod 664 {} \; && \
find /var/www -type d -exec chmod 775 {} \; && \
chmod -R ug+rwx /var/www/storage /var/www/bootstrap/cache && \
echo 'Done setting up Laravel' && \
php-fpm