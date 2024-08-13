#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then

    sleep 10

    echo "Wordpress configuration..."

    wp core download    --allow-root

    wp config create	--allow-root --dbname=$DATABASE_NAME --dbuser=$USERDB_NAME --dbpass=$USERDB_PASSW --dbhost=mariadb:3306

    wp core install     --allow-root --admin_email=$ADMIN_MAIL --url=$DOMAIN_NAME --title="Inception" --admin_name=$ADMIN_WP --admin_password=$ADMIN_WP_PASSW

    wp user create      --allow-root $USER_WP $USER_MAIL --user_pass="$USER_WP_PASSW"

fi

echo "Wordpress installed"

exec "$@"