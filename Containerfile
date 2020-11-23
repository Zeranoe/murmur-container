FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive 

RUN VC=$(awk -F'=' '/VERSION_CODENAME=/{print $2}' /etc/os-release) && \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y gnupg && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 85DECED27F05CF9E && \
    apt-get remove --purge --auto-remove -y gnupg && \
    rm -rf /var/lib/apt/lists/* && \
    echo "deb http://ppa.launchpad.net/mumble/release/ubuntu $VC main" >>/etc/apt/sources.list.d/mumble.list && \
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y mumble-server && \
    apt-get remove --purge --auto-remove -y && \
    rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/mumble.list

USER mumble-server

ENTRYPOINT ["/usr/sbin/murmurd", "-v", "-fg", "-ini", "/etc/mumble-server.ini"]
