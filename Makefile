# Function: Docker Rebuild
# [execute: down, remove, pull, build, up]
# $(call docker_rebuild,"stack_name","path/of/docker-compose-yml"
define docker_rebuild
	docker compose -p $(1) -f $(2)/docker-compose.yml down && \
	docker compose -p $(1) -f $(2)/docker-compose.yml rm -f && \
	docker compose -p $(1) -f $(2)/docker-compose.yml pull && \
	docker compose -p $(1) -f $(2)/docker-compose.yml build --no-cache && \
	docker compose -p $(1) -f $(2)/docker-compose.yml up -d
endef
# Initialization
init:
	docker network create --driver bridge reverse-proxy
# Portainer
portainer:
	docker volume create portainer_data
	$(call docker_rebuild,"portainer","docker/portainer")
# Nginx Proxy Manager
nginxpm:
	docker volume create nginxpm_data
	docker volume create nginxpm_letsencrypt
	$(call docker_rebuild,"nginxpm","docker/nginxpm")
# Gotify
gotify:
	docker volume create gotify_data
	$(call docker_rebuild,"gotify","docker/gotify")
#Watchtower
watchtower:
	$(call docker_rebuild,"watchtower","docker/watchtower")
#Minecraft server
crafty:
	$(call docker_rebuild,"crafty","docker/crafty")
#WebServer
webserver-php:
	$(call docker_rebuild,"crafty","docker/php")
webserver-nginx:
	$(call docker_rebuild,"crafty","docker/nginx")
#Ollama
ollama:
	$(call docker_rebuild,"ollama","docker/ollama")
#N8N
n8n:
	$(call docker_rebuild,"n8n","docker/n8n")
#Home Assistant
hassio:
	$(call docker_rebuild,"homeassistant","docker/homeassistant")
#Penpot
penpot:
	$(call docker_rebuild,"penpot","docker/penpot")
