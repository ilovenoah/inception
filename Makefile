.PHONY: setup up down build ps

COMPOSE_FILE := srcs/docker-compose.yml

setup:
	@make up
	@make ps
down:
	docker compose -f $(COMPOSE_FILE) down
up:
	docker compose -f $(COMPOSE_FILE) up -d
ps:
	docker compose -f $(COMPOSE_FILE) ps
build:
	docker compose -f $(COMPOSE_FILE) build
