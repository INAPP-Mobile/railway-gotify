FROM gotify/server:2.9.1

EXPOSE 8080

# Health check - Gotify serves /health at port 8080
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
    CMD wget -qO- http://localhost:8080/health || exit 1

# Gotify runs as non-root user (UID 1000) by default in the official image
# No additional configuration needed - all settings via environment variables

# Run as non-root user (already configured in base image)
USER 1000

# Logging goes to stdout/stderr by default in Gotify
