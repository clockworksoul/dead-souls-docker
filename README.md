# Dead Souls: The Docker Image (aka, Mud-in-a-can)

This is an image wrapping a basic installation of the Dead Souls LPMud. See http://dead-souls.net

## Deployment

1. Make sure that you have [Docker](https://docs.docker.com/engine/installation/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.
2. Download the Compose file: `wget https://raw.githubusercontent.com/ClockworkSoul/dead-souls-docker/master/docker-compose.yml`
3. Deploy the MUD: `docker-compose up -d`
4. Connect to your MUD: `telnet localhost 6666`

This will create a 'lib' directory in the working directory that contains all of your mudlib files. It will persist throughout deployments, and will even survive complete destruction and re-creation of the MUD container.


