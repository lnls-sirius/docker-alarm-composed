# This Makefile is based on the version available at lnls-sirius/docker-ccdb-composed 
# repository and written by @lerwys

PREFIX ?= /usr/local

CMDSEP = ;

PWD = 		$(shell pwd)
MKDIR =     mkdir
RMDIR =     rmdir
CP =        cp
INSTALL =   install
RM =        rm

# Docker files
SRC_DOCKER_COMPOSE_FILE = docker-compose.yml
SERVICE_NAME = alarm-server-composed
DOCKER_FILES_DEST = ${PREFIX}/etc/${SERVICE_NAME}

# Service files
SRC_SERVICE_FILE = ${SERVICE_NAME}.service
SERVICE_FILE_DEST = /etc/systemd/system

SYSTEMCTL := systemctl

.PHONY: all install uninstall

all:

install:
	${MKDIR} -p ${DOCKER_FILES_DEST}
	${CP} --preserve=mode ${SRC_DOCKER_COMPOSE_FILE} ${DOCKER_FILES_DEST}
	${CP} --preserve=mode ${SRC_SERVICE_FILE} ${SERVICE_FILE_DEST}
	${SYSTEMCTL} daemon-reload
	-${SYSTEMCTL} start ${SERVICE_NAME}

uninstall:
	${SYSTEMCTL} stop ${SERVICE_NAME}
	${RM} -f ${SERVICE_FILE_DEST}/${SRC_SERVICE_FILE}
	${RM} -R ${DOCKER_FILES_DEST}


