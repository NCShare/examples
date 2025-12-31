#!/bin/bash
#SBATCH -J python-example           # Job name
#SBATCH -p gpu                   # Partition name
#SBATCH --gres=gpu:h200:1        # Number of GPUs
#SBATCH --mem=20G                # Memory per node
#SBATCH -t 2:00:00               # Time limit

cd $SLURM_SUBMIT_DIR
apptainer exec --nv jupyter-lab.sif python <your_python_script.py>
