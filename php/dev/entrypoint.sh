#!/bin/sh
set -e

echo 'Entered entrypoint.sh'
echo 'Setting File Permissions'
chown -R 1000:www-data /var/www
find /var/www -type f -exec chmod 664 {} \;
find /var/www -type d -exec chmod 775 {} \;
chmod -R ug+rwx /var/www/storage /var/www/bootstrap/cache
echo 'Installing Composer Assets'
su-exec 1000:www-data composer install
echo 'Done setting up'
php-fpm