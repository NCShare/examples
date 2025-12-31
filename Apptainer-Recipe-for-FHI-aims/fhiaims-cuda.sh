#!/bin/bash
#SBATCH -J FHI-aims-cuda     # Job name
#SBATCH -p gpu               # Partition name
#SBATCH --gres=gpu:h200:1    # Request 1 GPU
#SBATCH --account=duke       # Account name
#SBATCH --mem=10G            # Memory per node
#SBATCH -N 1                 # Total no. of nodes
#SBATCH --ntasks-per-node 96 # Tasks per node

cd $SLURM_SUBMIT_DIR
apptainer exec --nv fhiaims-cuda.sif mpirun -n $SLURM_NTASKS aims.x > aims.out 2> aims.err
