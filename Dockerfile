FROM gotify/server:2.9.1

# Configure Gotify to listen on 8080 (Railway's expected port)
ENV GOTIFY_SERVER_PORT=8080
ENV GOTIFY_SERVER_BINDADDRESS=0.0.0.0
ENV GOTIFY_DEFAULTUSER_NAME=admin
ENV GOTIFY_DEFAULTUSER_PASS=admin
ENV GOTIFY_DATABASE_DIALECT=sqlite3
ENV GOTIFY_DATABASE_CONNECTION=data/gotify.db
ENV GOTIFY_REGISTRATION=false
ENV GOTIFY_UPLOADEDIMAGES_DIR=data/images
ENV GOTIFY_FILE_SIZE=20
ENV GOTIFY_SERVER_LOG_LEVEL=info

EXPOSE 8080

# Health check on the configured port
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
    CMD wget -qO- http://localhost:${GOTIFY_SERVER_PORT}/health || exit 1

# Create data directory writable by non-root user before dropping privileges
RUN mkdir -p /app/data && chown -R 1000:1000 /app/data

# Gotify server runs as UID 1000 (non-root) in the base image
USER 1000

# Logging goes to stdout/stderr by default in Gotify