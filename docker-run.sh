#!/bin/bash
# Example run configuration for Docker or Podman
if ! type "$podman" > /dev/null; then
  # Docker
  docker run -it --rm \
  -v config/:/app/config \
  -v server.properties:/app/server.properties \
  -p 25565:25565/tcp \
  gtnh-server
else
  # Podman
  podman run -it --rm \
  -v config/:/app/config \
  -v server.properties:/app/server.properties \
  -p 25565:25565/tcp \
  gtnh-server
fi