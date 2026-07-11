#!/bin/sh
# Entrypoint wrapper: Railway injects $PORT at runtime. Gotify needs
# GOTIFY_SERVER_PORT set to the same value for the listener and healthcheck.
export GOTIFY_SERVER_PORT=${PORT:-8080}
exec /app/gotify-app "$@"
