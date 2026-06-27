# Deploy and Host

Deploy Gotify, a self-hosted push notification server, on Railway in minutes. Send messages to your devices from any application, script, or service using a simple REST API.

## About Hosting

Gotify runs as a single Docker container on Railway. The template uses the official gotify/server:2.9.1 image, configured with sensible defaults. Health checks monitor the `/health` endpoint automatically. Data is stored via SQLite in an ephemeral volume — for production workloads, connect a Railway Postgres plugin for durable storage. Railway handles SSL/TLS certificates, domain management, and automatic restarts.

## Why Deploy

- **Push notifications for anything** — send alerts from scripts, cron jobs, CI/CD pipelines, or monitoring tools
- **Lightweight** — single ~12MB Go binary, no external database required for basic use
- **Privacy-first** — self-hosted, all data stays on your infrastructure
- **Multi-platform** — Android app, WebSocket, and CLI clients available
- **Simple REST API** — post messages with a single curl command
- **Production-ready** — built-in health checks, graceful shutdown, configurable logging

## Common Use Cases

- Application monitoring alerts and uptime notifications
- CI/CD pipeline status notifications
- Cron job and scheduled task completion alerts
- Server health and system monitoring pings
- Home automation event notifications
- Custom webhook receiver for any service

## Dependencies for Gotify

### Deployment Dependencies

- Railway account (free tier works)
- (Optional) Railway Postgres plugin for production database storage
