#!/bin/sh
# Entrypoint wrapper for Railway. Handles:
# 1. $PORT → GOTIFY_SERVER_PORT mapping (Railway injects $PORT dynamically)
# 2. Volume permissions (Railway mounts /app/data root-owned; Gotify runs as UID 1000)
# 3. Privilege dropping via setpriv

export GOTIFY_SERVER_PORT=${PORT:-8080}

# Railway volume mounts arrive root-owned. Gotify runs as UID 1000 and must
# be able to create data/plugins, data/images, etc.
if [ -d /app/data ]; then
  chown -R 1000:1000 /app/data
fi

exec setpriv --reuid=1000 --regid=1000 --clear-groups /app/gotify-app "$@"
