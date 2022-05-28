#!/usr/bin/env bash

# TODO:
#  1. docker run -v ${PWD}:/app builder build --quiet
#  2. docker run -it -v ${PWD}:/app builder bash

if [[ $# == 0 ]]; then
  echo 'ERROR: specify command'
  echo 'available commands:'
  echo '    build - install and build'
  echo '    other (like bash)'
  exit 1
fi

case "$1" in
build)
  # TODO other params
  GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o linux-server.bin ./cmd
  ;;
*)
  exec "$@"
  ;;
esac