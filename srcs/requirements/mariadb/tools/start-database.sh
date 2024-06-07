#!/bin/bash

#if the dir does not exist, database is not initialized
if ! [ -d "var/lib/mysql/$DATABASE_NAME" ]; then

service start mariadb
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSW'; FLUSH PRIVILEGES;"
mariadb -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
mariadb -e "GRANT ALL ON $DATABASE_NAME.* TO '$USERDB_NAME'@'localhost' IDENTIFIED BY '$USERDB_PASSW';"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSW';"
mariadb -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p $MARIADB_ROOT_PASSW shutdown

fi

echo "MariaDB OK"

exec ${@}