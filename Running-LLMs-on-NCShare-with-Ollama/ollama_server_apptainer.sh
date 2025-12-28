#!/bin/bash

# Configuration
CONTAINER_IMAGE="/opt/apps/containers/users/ollama.sif"
INSTANCE_NAME="ollama-$USER"
MODEL_PATH="/work/uherathmudiyanselage1/ollama/models"
PORT=11434

# Unset variables to avoid conflicts
unset ROCR_VISIBLE_DEVICES

# Start Apptainer instance with GPU and writable tempfs
apptainer instance start \
  --nv \
  --writable-tmpfs \
  --bind "$MODEL_PATH" \
  "$CONTAINER_IMAGE" "$INSTANCE_NAME"

# Start Ollama serve inside the container in the background
apptainer exec \
  --env OLLAMA_MODELS="$MODEL_PATH" \
  --env OLLAMA_HOST="0.0.0.0:$PORT" \
  instance://$INSTANCE_NAME \
  ollama serve &

echo "🦙 Ollama is now serving at http://$(hostname -f):$PORT"
