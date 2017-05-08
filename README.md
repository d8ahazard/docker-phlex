
## Usage

```
docker create --privileged \
  --name=Phlex \
  --net=host \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e TZ=<timezone> \
  -p 5666:5666 -p 5667:5667 \
  digitalhigh/phlex
  
```

## Parameters

By default, Phlex is set to listen on ports 5666 and 5667 - these can be modified by editing the file /config/

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 


* `-v /config` - Where muximux should store its files
* `-e PGID` for GroupID (optional) - see below for explanation
* `-e PUID` for UserID (optional) - see below for explanation
* `-e TZ` for timezone setting (optional), eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it muximux /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

Find the web interface at `<your-ip>:5666`, set apps you wish to use with Phlex via the webui.


## Info

* Shell access whilst the container is running: `docker exec -it Phlex /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f phlex`

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' Phlex`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' d8ahazard/Phlex`

## Versions

+ **20.03.17:** Initial release date.
