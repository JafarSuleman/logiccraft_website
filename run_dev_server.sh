#!/bin/bash

echo "LogicCraft Website - Development Server"
echo "---------------------------------"

# Check if flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "Flutter is not installed or not in PATH."
    echo "Please install Flutter from https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "Starting Flutter Web Development Server..."
echo
echo "Your website will be available at: http://localhost:8080"
echo
echo "Press Ctrl+C to stop the server."
echo

flutter run -d web-server --web-port 8080 