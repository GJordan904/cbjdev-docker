
### [Docker Hub Repositories](https://hub.docker.com/u/cbjdev)

## Running a Laravel App in Development
In the environment/laravel directory are the required files to get started.

1. Copy the docker directory and the docker-compose.yml file into the root 
of the app.
2. Add variables from the .env file to your .env file. Change
these as necessary to fit your needs. Some variables that may need changed are mentioned below.

### .env Variables
 * **DB_DUMP_DIR & DB_DUMP_FILE**: These point to a .sql file to create and
 populate a db
 * **HTTP_PORT_HOST & DB_HOST_PORT & REDIS_PORT**: These map the ports on the host to the nginx and mysql 
 containers. The defaults are fine if nothing is already using them

