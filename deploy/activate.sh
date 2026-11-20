#!/usr/bin/env bash
set -euo pipefail



APP_DIR=/var/www/car-booking-app
SHARED_DIR="$APP_DIR/shared"

# Throw error is .env is missing
[ -f "$SHARED_DIR/.env" ] || { echo "Missing $SHARED_DIR/.env" >&2; exit 1; }

# Saves logical path of car-booking-app/releases/RELEASE/deploy
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
RELEASE_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd -P)"

#
ln -sfn "$SHARED_DIR/.env" "$RELEASE_DIR/.env"

# Creates soft link
ln -sfn "$RELEASE_DIR" APP_DIR/current.tmp
mv -T "$APP_DIR/current.tmp" "$APP_DIR/current"

# Restart pm2 with new program
cd "$APP_DIR/current"
pm2 startOrReload ecosystem.config.js --update-env