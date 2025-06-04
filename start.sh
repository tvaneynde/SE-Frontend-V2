#!/bin/bash

echo "=== Cleaning up old deployment files ==="

# Example: delete old deployment files if any
# You can adjust the folder list as needed
DEPLOY_PATH="/home/site"

# Clean old deployments, keeping current `wwwroot`
rm -rf "$DEPLOY_PATH/deployments"/*
rm -rf "$DEPLOY_PATH/repository"/*
rm -rf "$DEPLOY_PATH/build"/*

echo "=== Starting the server ==="
exec node /home/site/wwwroot/standalone/server.js
