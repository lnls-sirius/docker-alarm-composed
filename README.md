# Docker BEAST Alarm Server Composed

Docker compose files for alarm server containers.

### Executing `docker-compose.yml`

Clone and change your working directory to the project folder. Then, execute `docker-compose up -d` to deploy all containers and `docker-compose down` to stop them. 

### Setting `systemd` services up

Execute `make install` with `root` rights in order to copy all required files and start systemd service.
