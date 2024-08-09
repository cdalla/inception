#!/bin/bash

#set -e

service mariadb start && mariadb -u root < /home/start.sql






#if the dir does not exist, database is not initialized
#if [ ! -d "var/lib/mysql/$DATABASE_NAME" ]; then

#    echo "Initialize Mariadb"; 
#    < /home/start.sql
#mariadb -u root -p $MARIADB_ROOT_PASSW -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSW'; FLUSH PRIVILEGES;"
#mariadb -u root -p $MARIADB_ROOT_PASSW -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
#mariadb -u root -p $MARIADB_ROOT_PASSW -e "GRANT ALL ON $DATABASE_NAME.* TO '$USERDB_NAME'@'localhost' IDENTIFIED BY '$USERDB_PASSW';"
#mariadb -u root -p $MARIADB_ROOT_PASSW -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSW';"
#mariadb -u root -p $MARIADB_ROOT_PASSW -e "FLUSH PRIVILEGES;"
#mysqladmin -u root -p $MARIADB_ROOT_PASSW shutdown

#else

#    echo "Mariadb already initialized";

#fi

echo "MariaDB OK"

mysqladmin -u root -p$MARIADB_ROOT_PASSW shutdown

exec "$@"