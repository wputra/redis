#!/bin/bash
set -e

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	sysctl -p
	chown -R redis .
	exec gosu redis "$BASH_SOURCE" "$@"
fi

exec "$@"
