DOCKER_COMPOSE := docker-compose
SERVICE_NAME := web
OS := $(shell uname)
build:
ifeq ($(OS),Linux)
        @echo "Build for Linux"
        $(DOCKER_COMPOSE) build
endif

run:
ifeq ($(OS),Linux)
        @echo "Running on Linux"
        $(DOCKER_COMPOSE) up -d
endif

stop:
ifeq ($(OS),Linux)
        @echo "Stopping on Linux"
        $(DOCKER_COMPOSE) down
endif

clean:
        $(DOCKER_COMPOSE) rm -f
