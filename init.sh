#!/bin/bash
echo "[0/4] Starting Initialization..."

echo "[1/4] Check if requirements are satisfied..."

if [ -e ./out/init.has_been_run ]; then
    echo "Script has already been run"
    exit 0
fi

if [ ! -e ./burp/pkg/burp.jar ]; then
    echo "ERROR: no burp.jar found."
    exit 0
fi

if ! command -v docker &> /dev/null; then
    echo "ERROR: docker is missing."
    exit 0
fi

if grep -q "EDIT HERE" /burp/configuration/burp.config; then
    echo "ERROR: configurations are missing (Did you edit the configuration file '/burp/configuration/burp.config' ?)."
    exit 0
fi

echo "INFO: Requirements satisfied!"

echo "[2/4] Building BurpSuite Collaborator Dockerfile..."

exec docker build /burp/Dockerfile -t BurpsuiteCollaborator

echo "INFO: Dockerfile building done."

echo "[3/4] Run Docker Container..."

exec docker run BurpsuiteCollaborator

echo "Docker Container is running!"

echo "[4/4] Ending with creating init.has_been_run flag"

exec touch /burp/out/init.has_been_run

echo "Creating flag done."