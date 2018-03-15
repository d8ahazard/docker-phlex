
## Usage

```
docker create \
  --name=phlex \
  --net=host \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e TZ=<timezone> \
  -p 5666:5666 -p 5667:5667 \
  -e HTTPPORT=5666 \
  -e HTTPSPORT=5667 \
  -e FASTCGIPORT=9000 \
  -e BRANCH=master \
  --privileged \
  digitalhigh/phlex
```

## Parameters

By default, Phlex is set to listen on ports 5666 and 5667 - these can be modified by editing the file /config/

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 

* `-v /config` - Where phlex should store its files
* `-e HTTPPORT` (optional) Port to serve http web traffic from. (default is 5666)
* `-e HTTPSPORT` (optional) Port to serve https traffic from. (default is 5667)
* `-e FASTCGIPORT` (optional) Port to use for cast traffic (default is 9000)
* `-e BRANCH` (optional) Set to 'beta' to play with the new hotness!
* `-e TZ` for timezone setting (optional), eg Europe/London


It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it phlex /bin/bash`.

## Setting up the application

Find the web interface at `<your-ip>:5666`, set apps you wish to use with Phlex via the webui.

## Info

* Shell access whilst the container is running: `docker exec -it Phlex /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f Phlex`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' Phlex`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' d8ahazard/Phlex`

## Versions

+ **20.03.17:** Initial release date.
