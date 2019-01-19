#!/bin/sh

if [[ -f /app/package.json ]]
then
    cd /app
    npm i
    exec npm run start "$@"
fi

exec "$@"