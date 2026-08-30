#!/bin/bash
#SBATCH -J ollama_batch_job
#SBATCH -p gpu
#SBATCH --gres=gpu:h200:1
#SBATCH --mem=300G
#SBATCH -t 00:30:00

cd $SLURM_SUBMIT_DIR

# Start the server
./ollama_server_apptainer.sh > server.log

# Extract the connection details printed by the server
eval "$(grep '^export OLLAMA_HOST=' server.log)"

# Run inference
./ollama_client.py > output.txt

# Stop the server
apptainer instance stop ollama-$USER
