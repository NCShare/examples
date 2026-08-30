#!/bin/bash
#SBATCH -J openai-gateway-demo
#SBATCH -p common
#SBATCH -t 00:05:00
#SBATCH --mem=2G
#SBATCH -c 4
#SBATCH -o openai-gateway-demo-%j.out

cd $SLURM_SUBMIT_DIR

# conda activate is undefined in a batch shell until conda.sh has been sourced
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate openai-gateway

./openai_example.py "Why is the sky blue?"
