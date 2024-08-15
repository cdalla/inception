NAME = inception

SRCS = ./srcs

COMPOSE = ${SRCS}/docker-compose.yml

VOL_DIR = ${HOME}/data

include srcs/.env

all: build up

dir:
	mkdir ${HOME}/data
	mkdir ${VOL_DIR}/${MARIADB_VOLUME} ${VOL_DIR}/${WORDPRESS_VOLUME}

build: dir
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
	sudo rm -rf ${VOL_DIR}/${MARIADB_VOLUME} ${VOL_DIR}/${WORDPRESS_VOLUME} ${HOME}/data

re: fclean all

.PHONY: all dir build down start stop prune clean fclean re