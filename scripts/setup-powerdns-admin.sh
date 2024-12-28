#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../"

CONTAINER_NAME=$(docker compose ps -q powerdns_admin)

docker cp "provisioning/configure_powerdns_admin.py" "$CONTAINER_NAME:/app/configure_powerdns_admin.py"

docker compose exec powerdns_admin /app/configure_powerdns_admin.py
