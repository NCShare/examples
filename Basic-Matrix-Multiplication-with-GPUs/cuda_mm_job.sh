#!/bin/bash
#SBATCH -J matrix-multiplication    # Job name
#SBATCH -p gpu                      # Partition name
#SBATCH --gres=gpu:h200:1           # Number of GPUs
#SBATCH --mem=20G                   # Memory per node

source ~/.bashrc
conda activate <env_name_with_pytorch>

cd $SLURM_SUBMIT_DIR
chmod +x cuda_mm.py
./cuda_mm.py > cuda_mm.log 2>&1
