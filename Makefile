NAME = inception

SRCS = ./srcs

COMPOSE = ${SRCS}/docker-compose.yml 

include srcs/.env

all: dir build up

dir:
	mkdir ${MARIADB_VOLUME} ${WORDPRESS_VOLUME}

build:
	docker compose -f  ${COMPOSE} build

up:
	docker compose -f ${COMPOSE} up -d

down:
	docker compose -f ${COMPOSE} down

start:
	docker compose -f ${COMPOSE} start

stop:
	docker compose -f ${COMPOSE} stop

clean:
	docker compose -f ${COMPOSE} down -v --rmi all

prune:
	docker system prune

fclean: clean prune
	sudo rm -rf ${MARIADB_VOLUME} ${WORDPRESS_VOLUME}

re: fclean all

.PHONY: all dir build down start stop prune clean fclean re