FROM gotify/server:2.9.1

# Configure Gotify to listen on 8080 (Railway's expected port)
ENV GOTIFY_SERVER_PORT=8080

EXPOSE 8080

# Health check on the configured port
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
    CMD wget -qO- http://localhost:${GOTIFY_SERVER_PORT}/health || exit 1

# Create data directory writable by non-root user before dropping privileges
RUN mkdir -p /app/data && chown -R 1000:1000 /app/data

# Gotify server runs as UID 1000 (non-root) in the base image
USER 1000

# Logging goes to stdout/stderr by default in Gotify
