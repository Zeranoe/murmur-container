# Murmur Container

A Podman based Murmur server that runs without root.

This project was started due to limitations with running Murmur on CentOS/RHEL: 

* The latest static distribution uses outdated packages and only targets x86
* Copying static package components into system folders is not ideal
* Podman is preferred on RHEL/CentOS and Fedora, so existing Docker
  images will not work
* The server does not require elevation with a 64738 port

This image will work on any distribution with Podman available, which includes
Ubuntu/Debian, Raspbian, and many more.

## Building

```
podman build -t murmur .
```

## Starting

```
podman run -d --name murmur --uidmap 0:1:102 --uidmap 102:0:1 \
-v ./mumble-server.ini:/etc/mumble-server.ini:z \
-v ./database:/var/lib/mumble-server:z -p 64738:64738 -p 64738:64738/udp murmur
```

## Stopping

```
podman kill murmur
```

## License

Copyright (c) Kyle Schwarz. All rights reserved.

Licensed under the [MIT](LICENSE.txt) license.
