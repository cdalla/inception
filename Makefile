NAME = inception

SRCS = ./srcs

COMPOSE = ${SRCS}/docker-compose.yml 

include srcs/.env

all: dir build

dir:
	mkdir -p ${WORDPRESS_VOLUME} ${MARIADB_VOLUME}

build:
	docker compose -f  ${COMPOSE} build

down:
	docker compose -f ${COMPOSE} down

start:
	docker compose -f ${COMPOSE} start

stop:
	docker compose -f ${COMPOSE} stop

clean: down
	docker container prune -f
	docker volume rm wordpress mariadb
	docker image prune -af

fclean: clean
	sudo rm -rf ${MARIADB_VOLUME} ${WORDPRESS_VOLUME} ${VOLUMES}

re: fclean all

.PHONY: all dir build down start stop clean fclean re