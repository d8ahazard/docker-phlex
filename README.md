
## Usage

```
docker create \
  --name=FlexTV \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e TZ=<timezone> \
  -p 5666:80 -p 5667:443 \
  digitalhigh/phlex
```

## Parameters

By default, Flex TV is set to listen on ports 5666 and 5667 - these can be modified by editing the file /config/

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 

* `-v /config` - Where Flex TV should store its files
* `-e TZ` for timezone setting (optional), uses Linux Default convention - eg Europe/London
* `-e PGID` (optional) System GID to run the container as.
* `-e PUID` (optional) System UID to run the container as.

### Ports
5666 and 5667 are the default ports for Flex TV, but you can map them to whatever you want.
5666 is for http, 5667 for https. If you wanted to map them to 4333 and 4334 instead, creatiion params would be

```
-p 4333:80 -p 4334:443 \
```

## Setting up the application

Find the web interface at `<your-ip>:5666`, set apps you wish to use with Phlex via the webui.

For SSL certs, you can create a certificate for your server and place it in /config/keys,
replacing the self-signed cert.crt and cert.key files.

## Info

* Shell access whilst the container is running: `docker exec -it FlexTV /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f FlexTV`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' FlexTV`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' d8ahazard/FlexTV`

## Versions

+ **21.05.18:** Update for V2.
+ **20.03.17:** Initial release date.
