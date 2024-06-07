if ! [[ -f "/var/www/wp-config.php" ]]; then

echo "Wordepress configuration..."

wp core download    --allow-root

wp config create	--allow-root \
					--dbname=$DATABASE_NAME \
					--dbuser=$USERDB_NAME \
					--dbpass=$USERDB_PASSW \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'

sleep 5

wp core install     --allow-root \
                    --skip-email \
                    --url="$DOMAIN_NAME" \
                    --title="Inception" \
                    --admin_name ="$ADMIN_WP" \
                    --admin_password="$ADMIN_WP_PASSW"

wp user create      --allow-root \
                    "$USER_WP" \
                    --skip-email \
                    --user_pass="$USER_WP_PASSW"

fi

echo "Wordpress installed"

exec ${@}