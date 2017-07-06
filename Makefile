PREFIX ?= /usr/local

# Docker files
SRC_DOCKER_COMPOSE_FILE = docker-compose.yml
SERVICE_NAME = lnls-beast-server
DOCKER_FILES_DEST = ${PREFIX}/etc/${SERVICE_NAME}

# Service files
SRC_SERVICE_FILE = ${SERVICE_NAME}.service
SERVICE_FILE_DEST = /etc/systemd/system

SYSTEMCTL := systemctl

.PHONY: all install uninstall

all:

install:
	mkdir -p ${DOCKER_FILES_DEST}
	mkdir -p ${SERVICE_FILE_DEST}/${SRC_SERVICE_FILE}.d/
	cp --preserve=mode ${SRC_DOCKER_COMPOSE_FILE} ${DOCKER_FILES_DEST}
	cp --preserve=mode ${SRC_SERVICE_FILE} ${SERVICE_FILE_DEST}
	cp --preserve=mode ${SERVICE_NAME}.env ${SERVICE_FILE_DEST}/${SRC_SERVICE_FILE}.d/
	systemctl daemon-reload
	systemctl stop ${SERVICE_NAME}
	systemctl start ${SERVICE_NAME}

uninstall:
	systemctl stop ${SERVICE_NAME}
	rm -f ${SERVICE_FILE_DEST}/${SRC_SERVICE_FILE}
	rm -f -R ${DOCKER_FILES_DEST}
	rm -f -r ${SERVICE_FILE_DEST}/${SRC_SERVICE_FILE}.d/
	systemctl daemon-reload

