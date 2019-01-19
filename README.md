
### [Docker Hub Repositories](https://hub.docker.com/u/cbjdev)

## Running a Laravel App in Development
In the **environment/laravel** directory are the required files to get started.

1. Copy the docker directory and the docker-compose.yml file into the root 
of the app.
2. Add variables from the .env file to your .env file. Change
these as necessary to fit your needs. Some variables that may need changed are mentioned below.
3. Run `docker-compose up` from the root of the project and you are ready to start development.

## .env Variables
 * **DB_DUMP_DIR & DB_DUMP_FILE**: These point to a .sql file to create and
 populate a db
 * **HTTP_PORT_HOST & DB_HOST_PORT & REDIS_PORT**: These map the ports on the host to the nginx and mysql 
 containers. The defaults are fine if nothing is already using them
 
 ## Running artisan commands and interacting with the database
 If you need to give artisan commands, issue those inside the php container. You can gain access to the container by executing
 the following command: `docker-compose exec -u $(id -u) php bash`. This will open a bash session at the root of the project,  inside the php container. Mind the `-u $(id -u)` portion as this sets the user in the container to match the host, preventing file permission issues. 
 
 Similarly, to connect to the database container, use: `docker-compose exec mysql bash`. This will open a bash session as root. Additionally, one can connect to the container using MySQL Workbench and the credentials defined in the docker-compose file.

