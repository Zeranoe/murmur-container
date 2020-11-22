FROM fedora:latest

RUN dnf install -y murmur

USER mumble-server

ENTRYPOINT ["/usr/sbin/murmurd", "-v", "-fg", "-ini", "/etc/murmur/murmur.ini"]
