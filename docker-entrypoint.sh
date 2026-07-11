#!/bin/sh
# Entrypoint wrapper for Railway. Handles:
# 1. $PORT → GOTIFY_SERVER_PORT mapping (Railway injects $PORT dynamically)
# 2. Volume permissions (mount may be root-owned; Gotify runs as UID 1000)
# 3. Privilege dropping via setpriv

export GOTIFY_SERVER_PORT=${PORT:-8080}

# Railway volume mounts may arrive root-owned. Gotify runs as UID 1000 and must
# be able to create data/plugins, data/images, etc.
for d in /app/data /app/data/plugins /app/data/images; do
  if [ ! -d "$d" ]; then
    mkdir -p "$d" 2>/dev/null || true
  fi
  chmod 777 "$d" 2>/dev/null || chown -R 1000:1000 "$d" 2>/dev/null || true
done

exec setpriv --reuid=1000 --regid=1000 --clear-groups /app/gotify-app "$@"
