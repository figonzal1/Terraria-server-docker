# Terraria-server-docker
Docker image with which you can easily lift a terraria server

# Requirements
* Docker on your host operating system

# Build image
To build the server image, please enter the following command:
```sh
$ docker build -t terraria .
```

# Run container
To run container with recently builded image of terraria, please enter the following command:

* I recommend running docker with data persistence, we will use volumes `--volume`
* Default port 7777
```sh
$ docker run -it --name terraria -p 7777:7777 --volume terraria-vol:/root/.local/share/Terraria/Worlds terraria
```
With this ... you will enter the already known server menu
```sh
Error Logging Enabled.
Terraria Server v1.4.0.5

n               New World
d <number>      Delete World

Choose World:
```

## Procedure to restart container
If for some reason you must stop the docker container, I recommend the following procedure to turn on:
```sh
$ docker start terraria
```

```sh
$ docker exec -it terraria /bin/bash
$ ./startserver.sh
```

# Add existing world to container
To add an existing terraria world to the new container, I recommend copying the .wld files:

````sh
$ docker cp <MyWorldfilename>.wld terraria:/root/.local/share/Terraria/Worlds
$ docker cp <MyWorldfilename>.wld.bak terraria:/root/.local/share/Terraria/Worlds
````
Then continue with the restart procedure mentioned above