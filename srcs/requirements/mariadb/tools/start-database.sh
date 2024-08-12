#!/bin/bash

service mariadb start

mariadb -u root -p$MARIADB_ROOT_PASSW -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

mariadb -u root -p$MARIADB_ROOT_PASSW -e "CREATE USER IF NOT EXISTS '$USERDB_NAME'@'%' IDENTIFIED BY '$USERDB_PASSW'; "

mariadb -u root -p$MARIADB_ROOT_PASSW -e "ALTER USER '$USERDB_NAME'@'%' IDENTIFIED BY '$USERDB_PASSW';"

mariadb -u root -p$MARIADB_ROOT_PASSW -e "GRANT ALL ON $DATABASE_NAME.* TO '$USERDB_NAME'@'%' IDENTIFIED BY '$USERDB_PASSW';"

mariadb -u root -p$MARIADB_ROOT_PASSW -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MARIADB_ROOT_PASSW');"

mariadb -u root -p$MARIADB_ROOT_PASSW -e "FLUSH PRIVILEGES;"

echo "MariaDB OK"

mysqladmin -u root -p$MARIADB_ROOT_PASSW shutdown

exec "$@"