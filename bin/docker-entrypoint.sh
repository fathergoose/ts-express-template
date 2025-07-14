#!/usr/bin/env bash

if [ "$1" = 'run' ]; then
  exec node build/index.js
elif [ "$1" = 'dev' ]; then
  exec ./node_modules/.bin/tsx watch src
fi

exec "$@"
