#!/bin/bash

# Cleanup old deployments except recently updated ones
echo "Cleaning up old deployments..."

# Deletes deployment folders older than 1 hour
find /home/site/deployments -mindepth 1 -maxdepth 1 -type d -not -newermt '-1 hour' -exec rm -rf {} \;

echo "Old deployments cleaned."

# Start the app
echo "Starting the app..."
node /home/site/wwwroot/standalone/server.js
