#!/bin/bash

echo "Starting cleanup..."

# Folder where Azure keeps uploaded ZIP packages
DEPLOY_ZIP_DIR="/home/data/SitePackages"

# If there are ZIPs there, delete all but the newest one
if ls "$DEPLOY_ZIP_DIR"/*.zip 1> /dev/null 2>&1; then
  # List them by newest first; skip the first (newest); delete the rest
  ls -1t "$DEPLOY_ZIP_DIR"/*.zip | tail -n +2 | while read -r oldzip; do
    echo "Removing old zip: $oldzip"
    rm -f "$oldzip"
  done
else
  echo "No zip files found in $DEPLOY_ZIP_DIR"
fi

echo "Cleanup completed. Starting the app..."

# Now start your Next.js standalone server
exec node /home/site/wwwroot/standalone/server.js
