FROM debian:oldstable


COPY tools/start-database.sh /home/start-database.sh

RUN apt update && apt upgrade &&\
    apt install -y mariadb-server && \
    chmod +x /home/start-database.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT ["/home/start-database.sh"]

CMD ["mysqld"]