FROM debian:oldstable



COPY tools/start-database.sh /home/start-database.sh

COPY tools/start.sql /home/start.sql

RUN apt-get -y update && apt-get upgrade
RUN apt install -y mariadb-server gettext-base
RUN chmod +x /home/start-database.sh /home/start.sql
RUN    mkdir -p /var/run/mysqld
RUN    chmod 777 /var/run/mysqld /var/lib/mysql

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf



EXPOSE 3306

ENTRYPOINT ["/home/start-database.sh"]